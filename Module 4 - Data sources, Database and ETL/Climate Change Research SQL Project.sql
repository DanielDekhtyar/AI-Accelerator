/*
SQL Project
Climate Change Research
Daniel Dekhtyar
*/

/*
A.	DDL Create a database with the following 3 tables:
1.	Locations
	location_id (Primary Key, INT)
	city (VARCHAR(50), NOT NULL)
	country (VARCHAR(50), NOT NULL)
2.	Sensors
	sensor_id (Primary Key, INT)
	sensor_type (VARCHAR(30), NOT NULL, e.g., Temperature, Humidity)
	location_id (Foreign Key to Locations, INT, NOT NULL)
3.	Measurements
	measurement_id (Primary Key, INT)
	sensor_id (Foreign Key to Sensors, INT, NOT NULL)
	temperature (NUMERIC(5, 2), CHECK (temperature BETWEEN -50 AND 50))
	humidity (NUMERIC(5, 2), CHECK (humidity BETWEEN 0 AND 100))
	timestamp (DATETIME, NOT NULL), Default value – Currents timpestamp.
Constraints:
	Ensure no duplicate location_id in Locations.
	Ensure no duplicate sensor_id in Sensors.
	Foreign keys should enforce referential integrity.
	Measurements table should ensure:
temperature is valid between -50°C and 50°C.
humidity is valid between 0% and 100%.
*/

CREATE TABLE locations
(
location_id INT CONSTRAINT locations_locationid_pk PRIMARY KEY,
city VARCHAR(50) CONSTRAINT locations_city_nn NOT NULL,
country VARCHAR(50) CONSTRAINT locations_country_nn NOT NULL
);

CREATE TABLE sensors
(
sensor_id INT PRIMARY KEY,
sensor_type VARCHAR(30) NOT NULL,
location_id INT NOT NULL, FOREIGN KEY (location_id) REFERENCES locations(location_id)
);

CREATE TABLE measurements
(
measurement_id INT PRIMARY KEY,
sensor_id INT NOT NULL, FOREIGN KEY (sensor_id) REFERENCES sensors(sensor_id),
temperature NUMERIC(5,2), CHECK (temperature BETWEEN -50 AND 50),
humidity NUMERIC(5,2), CHECK (humidity BETWEEN 0 AND 100),
timestemp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE locations
ADD CONSTRAINT locations_locationid_uq UNIQUE (location_id);

ALTER TABLE sensors
ADD CONSTRAINT sensors_sensorid_uq UNIQUE (sensor_id);


/*
B.DML  Insert the following data into the tables:
1.	Insert this data to the locations table
location_id	 city			 country
111			 New York	 	 USA
222			 Berlin			 Germany
333			 Kibuts Asisim	 Israel
*/

INSERT INTO locations
VALUES(111, 'New York', 'USA');

INSERT INTO locations
VALUES(222, 'Berlin', 'Germany');

INSERT INTO locations
VALUES(333, 'Kibuts Asisim', 'Israel');


/*
2.	run the following command to populate the sensors table
*/

INSERT INTO sensors (sensor_id, sensor_type, location_id) 
VALUES (1, 'Temperature', 111), 
(2, 'Humidity', 111), 
(3, 'Temperature', 222), 
(4, 'Humidity', 222);


/*
3.	Test your foreign key: run the following command to populate the next 2 rows,
if it doesn’t run- fix it so that the sensors would be assigned to Kibutz Asisim.
*/
-- location_id was '3'. To make the query work, I changed it to '333' which is the loaction ID of Kibutz Asisim.
INSERT INTO sensors (sensor_id, sensor_type, location_id) 
VALUES (5, 'Temperature', 333), (6, 'Humidity', 333);


/*
4.	populate the last table with the following command.
*/

INSERT INTO measurements (measurement_id, sensor_id, temperature, humidity) 
VALUES
    (1, 1, 12.5, 60.0),  
    (2, 2, 10.0, 65.0),  
    (3, 3, 10.5, 75.0),  
    (4, 4, 11.0, 80.0),  
    (5, 5, 24.0, 58.0),  
    (6, 6, 26.0, 60.0),  
    (7, 1, 11.5, 55.0),  
    (8, 2, 9.5, 62.0),   
    (9, 3, 9.0, 72.0),   
    (10, 4, 10.0, 75.0), 
    (11, 5, 23.0, 57.0), 
    (12, 6, 25.5, 59.0), 
    (13, 1, 13.0, 60.0), 
    (14, 2, 8.0, 66.0),  
    (15, 3, 8.5, 70.0); 


/*
5.	Check your check constraint, try to insert the next row (this should fail)
*/
INSERT INTO Measurements (measurement_id, sensor_id, temperature, humidity) 
VALUES (42, 5, NULL, 157);

/*
How can you fix it?
I fixed the bug by setting the humidty to 100.
Per the check condition, humidity can't be less the 0% or more then 100%
*/
INSERT INTO Measurements (measurement_id, sensor_id, temperature, humidity) 
VALUES (42, 5, NULL, 100);


/*
6.	Check your measurements table using a SELECT statement, and order the rows by sensor_id.
You will notice that all the rows for each sensor are showing roughly the same timestamp, which is incorrect.
Use the INTERVAL '1 month' to update all measurements with measurement_id between 7 and 12, setting their timestamps to reflect last month.
*/
SELECT * FROM measurements
ORDER BY sensor_id;

UPDATE measurements
SET timestemp = timestemp - INTERVAL '1 month'
WHERE measurement_id BETWEEN 7 AND 12;


/*
7. Update the measurements with measurement_id 13 and higher, setting their timestamps to reflect two months ago.
*/
UPDATE measurements
SET timestemp = timestemp - INTERVAL '2 months'
WHERE measurement_id > 13;


/*
C.	SELECT
1.	How many measurements did each sensor record?
Order your results from the sensor with the most measurements to the one with the least.
If multiple sensors have the same number of measurements, order them by the sensor number in ascending order.
*/
SELECT COUNT(m.measurement_id) AS "Number of measurements", s.sensor_id AS "Sensor ID"
FROM measurements m JOIN sensors s USING(sensor_id)
GROUP BY s.sensor_id
ORDER BY COUNT(m.measurement_id) DESC, s.sensor_id ASC;

/*
2.	Create a report that shows the city name and the average temperature and humidity there.
*/
SELECT l.city, AVG(m.temperature) AS "Average temeprature", AVG(m.humidity) AS "Average humidity"
FROM measurements m
JOIN sensors s ON m.sensor_id = s.sensor_id
JOIN locations l ON s.location_id = l.location_id
GROUP BY l.city;