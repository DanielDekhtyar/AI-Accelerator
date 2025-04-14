/**************************** DDL creating the tables ****************************/
-- Create Locations table
CREATE TABLE Locations (
    location_id INT  PRIMARY KEY,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- Create Sensors table
CREATE TABLE Sensors (
    sensor_id INT CONSTRAINT sensors_sensor_id_pk PRIMARY KEY,
    sensor_type VARCHAR(30) NOT NULL 
	/*constraint sen_type_ck CHECK (sensor_type in ('Temperature', 'Humidity')*/,
    location_id INT NOT NULL REFERENCES Locations(location_id)
     
);

-- Create Measurements table
CREATE TABLE Measurements (
    measurement_id INT CONSTRAINT measurements_mesur_id_pk PRIMARY KEY,
    sensor_id INT NOT NULL, --CONSTRAINT measurements_ts_fk REFERENCES Sensors(sensor_id),
    temperature NUMERIC(5, 2)CONSTRAINT measurements_temp_ck CHECK (temperature BETWEEN -50 AND 50),
    humidity NUMERIC(5, 2) CONSTRAINT measurements_hum_ck CHECK (humidity BETWEEN 0 AND 100),
    time_stamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    CONSTRAINT measurements_ts_fk FOREIGN KEY (sensor_id) REFERENCES Sensors(sensor_id)
);


/**************************** DML pouplating the tables: *****************************/
--locations
INSERT INTO Locations 
VALUES (111, 'New York', 'USA');
INSERT INTO Locations (location_id, city, country) 
VALUES (222, 'Berlin', 'Germany');
INSERT INTO Locations 
VALUES (333, 'Kibuts Asisim', 'Israel');

SELECT * FROM locations;

--sensors
INSERT INTO Sensors (sensor_id, sensor_type, location_id) 
VALUES 	(1, 'Temperature', 111), 
		(2, 'Humidity', 111), 
		(3, 'Temperature', 222), 
		(4, 'Humidity', 222);


INSERT INTO Sensors (sensor_id, sensor_type, location_id) 
VALUES (5, 'Temperature', 333), (6, 'Humidity', 333);--fixed to 333

SELECT * 
FROM Sensors JOIN locations USING(location_id)


--Measurements
INSERT INTO Measurements (measurement_id, sensor_id, temperature, humidity) 
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

SELECT * FROM measurements WHERE measurement_id > 12;

--update using INTERVAL '1 month'
UPDATE  measurements 
SET time_stamp = time_stamp - INTERVAL '1 month' 
WHERE  measurement_id BETWEEN 7 AND 12;

UPDATE  measurements 
SET time_stamp = time_stamp-INTERVAL '2 month' 
WHERE  measurement_id > 12;

SELECT sensor_id, temperature, humidity, time_stamp
FROM measurements
ORDER BY sensor_id , time_stamp 

INSERT INTO Measurements (measurement_id, sensor_id, temperature, humidity) 
VALUES (42,5,NULL,57); --fix to 57, no need to change the null

/**************************** Query the database ****************************/
--1
SELECT sensor_id, COUNT(*) AS measurement_count
FROM Measurements
GROUP BY sensor_id
ORDER BY 2 DESC , 1 ASC

--2
SELECT l.city, AVG(m.temperature) AS avg_temperature, 
		AVG(m.humidity) AS avg_humidity
FROM measurements m
JOIN sensors s ON m.sensor_id = s.sensor_id
JOIN locations l ON s.location_id = l.location_id
GROUP BY l.city;	

--better
SELECT l.city, ROUND(AVG(m.temperature),2)||'🌡️' AS avg_temperature, 
	ROUND(AVG(m.humidity))||'% 😓' AS avg_humidity
FROM measurements m
JOIN sensors s ON m.sensor_id = s.sensor_id
JOIN locations l ON s.location_id = l.location_id
GROUP BY l.city;	

--3
SELECT EXTRACT(MONTH FROM time_stamp) AS month, 
       AVG(temperature) AS avg_temperature, 
		AVG(humidity) AS avg_humidity
FROM Measurements
GROUP BY EXTRACT(MONTH FROM time_stamp)
ORDER BY month;
--better 3
SELECT CASE EXTRACT(MONTH FROM time_stamp) 
				WHEN 9 THEN 'SEP'
				WHEN 10 THEN 'OCT'
				WHEN 11 THEN 'NOV' 	END as "Month",
	
       ROUND (AVG(temperature),2) AS avg_temperature, 
		ROUND(AVG(humidity),2)||'%' AS avg_humidity
FROM Measurements
GROUP BY EXTRACT(MONTH FROM time_stamp)
ORDER BY "Month";


--4
SELECT l.city, m.time_stamp, m.temperature
FROM measurements m
JOIN sensors s ON m.sensor_id = s.sensor_id
JOIN locations l ON s.location_id = l.location_id
WHERE m.temperature > (SELECT MAX(temperature)
						FROM measurements m
                        JOIN sensors s ON m.sensor_id = s.sensor_id
                        JOIN locations l ON s.location_id = l.location_id
                        WHERE l.city = 'Berlin') 
						
ORDER BY  m.temperature DESC;
