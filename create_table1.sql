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
kpl_maara VARCHAR (4),
PRIMARY KEY (tilaus_id,rivino),
FOREIGN KEY (tilaus_id) REFERENCES TILAUS(tilaus_id),
FOREIGN KEY (tuote_id) REFERENCES TUOTE(tuote_id));

create table TUOTE
(tuote_id VARCHAR(4) NOT NULL,
tuote_nimi VARCHAR (20),
tuote_hinta VARCHAR (5),
varasto_maara VARCHAR (5),
PRIMARY KEY (tuote_id));