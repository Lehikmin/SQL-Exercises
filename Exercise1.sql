-- Step 1: Online Bookstore - Create tables
-- Create the tables based on the provided Online Bookstore relational schema in the SWD03 database.
-- Define appropriate data types and specify whether null values are allowed for the attributes.
-- The data types and table structures are based on the given requirements.

-- Tables:
-- 1. CUSTOMER
-- 2. ORDER
-- 3. ORDER_LINE
-- 4. PRODUCT

create table ASIAKAS
(asiakas_id VARCHAR(4) NOT NULL,
as_nimi VARCHAR (30),
as_osoite VARCHAR (50),
as_puh VARCHAR (15),
PRIMARY KEY (asiakas_id));

create table TILAUS
(tilaus_id VARCHAR(4) NOT NULL,
tilaus_pvm VARCHAR (10),
asiakas_id VARCHAR (4),
PRIMARY KEY (tilaus_id),
FOREIGN KEY (asiakas_id) REFERENCES ASIAKAS(asiakas_id));

create table TILAUSRIVI
(tilaus_id VARCHAR(4) NOT NULL,
rivino VARCHAR(100),
tuote_id VARCHAR(4),
kpl_maara INT,
PRIMARY KEY (tilaus_id,rivino),
FOREIGN KEY (tilaus_id) REFERENCES TILAUS(tilaus_id),
FOREIGN KEY (tuote_id) REFERENCES TUOTE(tuote_id));

create table TUOTE
(tuote_id VARCHAR(4) NOT NULL,
tuote_nimi VARCHAR (20),
tuote_hinta DECIMAL(5,2),
varasto_maara INT,
PRIMARY KEY (tuote_id));

-- Step 2: Online Bookstore - Insert data into tables
-- Insert data into the Online Bookstore tables as follows:
-- - Add two book products (e.g., a non-fiction book and a novel)
-- - Add two customers (e.g., yourself and a friend)
-- - Add one order with two books (e.g., Eero's order, which includes a non-fiction book and a novel)

INSERT INTO TUOTE
(tuote_id, tuote_nimi, tuote_hinta, varasto_maara)
VALUES ('T001', 'Tietokirja', 29.95, 15);

INSERT INTO TUOTE
(tuote_id, tuote_nimi, tuote_hinta, varasto_maara)
VALUES ('T002', 'Romaani', 19.95, 25);

INSERT INTO ASIAKAS
(asiakas_id, as_nimi, as_osoite, as_puh)
VALUES ('C001', 'Minna Lehikoinen', 'Kotikatu 3', '0400123456');

INSERT INTO ASIAKAS
(asiakas_id, as_nimi, as_osoite, as_puh)
VALUES ('C002', 'Maija Mehiläinen', 'Pihlajakatu 1', '0400789456');

INSERT INTO ASIAKAS
(asiakas_id, as_nimi, as_osoite, as_puh)
VALUES ('AS03', 'Eero Esimerkki', 'Esimerkkikatu 5', '0400111222');

INSERT INTO TILAUS
(tilaus_id, tilaus_pvm, asiakas_id)
VALUES ('O001', '2024-12-18', 'AS03');

INSERT INTO TILAUSRIVI
(tilaus_id, rivino, tuote_id, kpl_maara)
VALUES ('O001', '1', 'T001', 1);

INSERT INTO TILAUSRIVI
(tilaus_id, rivino, tuote_id, kpl_maara)
VALUES ('O001', '2', 'T002', 1);

-- Step 3: SELECT
-- After inserting the data, check the contents of the Online Bookstore tables using the SELECT command.
-- Use the following command to check the data in each table: SELECT * FROM table_name;

SELECT * FROM TUOTE;
SELECT * FROM ASIAKAS;
SELECT * FROM TILAUS;
SELECT * FROM TILAUSRIVI;

-- Step 4: DROP TABLES
-- Use the DROP TABLE commands to remove all the tables from the database.

DROP TABLE TILAUSRIVI;
DROP TABLE TILAUS;
DROP TABLE TUOTE;
DROP TABLE ASIAKAS;

