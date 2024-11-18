/*
DDL
Data Definition Language
18.11.2024
Daniel Dekhtyar
*/

-- 1
CREATE TABLE super_heros
(super_id INT, super_name VARCHAR);

-- 2
ALTER TABLE super_heros
ADD civilian_name VARCHAR;

--3
ALTER TABLE super_heros
RENAME COLUMN civilian_name TO real_name;

--4 
INSERT INTO super_heros
VALUES (1, 'Superman', 'Clark Kent');

INSERT INTO super_heros
VALUES (2 ,'Spiderman', 'Peter Parker');

-- 5
CREATE TABLE mugles
(first_name VARCHAR(25), last_name VARCHAR(25), job NUMERIC, m_id NUMERIC(8));

-- 6
ALTER TABLE mugles
ADD sal NUMERIC(9,2);

-- 7
ALTER TABLE mugles
ADD address VARCHAR DEFAULT '4 Privet Drive';

SELECT * FROM mugles;