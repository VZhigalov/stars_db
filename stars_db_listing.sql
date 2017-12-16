DROP DATABASE IF EXISTS stars_db;
CREATE DATABASE stars_db;
GRANT ALL PRIVILEGES ON DATABASE stars_db TO postgres;
\connect stars_db;


CREATE TABLE area (
    id serial primary key,
    name varchar(30),
    semisphere varchar(5),
    max_right_ascension real,
    min_right_ascension real,
    max_declination real,
    min_declination real
);


CREATE TABLE areas__families (
    id_area int,
    id_family int,
    id serial primary key
);


CREATE TABLE constellations (
    id serial primary key,
    latin_name varchar(30),
    genitive_latin_name varchar(35),
    shortening varchar(3),
    quantity_of_visible_stars int,
    brightest_star varchar(30),
    square real,
    id_area int,
    id_family int
);


CREATE TABLE constellations__founders (
    id_constellation int,
    id_founder int,
    id serial primary key
);


CREATE TABLE families (
    id serial primary key,
    name varchar(30),
    max_right_ascension real,
    min_right_ascension real,
    max_declination real,
    min_declination real
);


CREATE TABLE founders (
    id serial primary key,
    name varchar(30),
    country varchar(15),
    date_of_birth int,
    date_of_death int NULL
);


INSERT INTO area (name, semisphere, max_right_ascension, min_right_ascension, max_declination, min_declination) VALUES
('NQ1', 'North', 5.5999999, 0.5, 37.4000015, 5.94999981),
('NQ2', 'North', 11, 4.5999999, 55.5, 0),
('NQ3', 'North', 21, 9.19999981, 86, 4),
('NQ4', 'North', 60, 1.5, 24, 19.1000004),
('SQ1', 'South', 6.5999999, 0, 10.1000004, -70.0999985),
('SQ2', 'South', 11.6000004, 6, 6.0999999, -70.0999985),
('SQ3', 'South', 15.1000004, 10, 6.30000019, -63.2999992),
('SQ4', 'South', 22.1000004, 18.2000008, -3.29999995, -75.3000031);


INSERT INTO areas__families (id_area, id_family) VALUES
(1, 1),
(1, 2),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 5),
(3, 3),
(3, 4),
(4, 2),
(4, 4),
(4, 6),
(5, 2),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(7, 1),
(7, 4),
(7, 7),
(7, 8),
(8, 1),
(8, 4),
(8, 6),
(8, 7),
(8, 8);


INSERT INTO constellations (latin_name, genitive_latin_name, shortening, quantity_of_visible_stars, brightest_star, square, id_area, id_family) VALUES
('Hydra', 'Hydrae', 'Hya', 130, 'Alphard', 1303, 6, 4),
('Puppis', 'Puppis', 'Pup', 140, 'Naos', 673, 6, 6),
('Canis Major', 'Canis Majoris', 'CMA', 80, 'Sirius', 380, 6, 5),
('Antlia', 'Antliae', 'Ant', 42, 'Alpha Ant', 239, 6, 8),
('Volans', 'Volantis', 'Vol', 31, 'Beta Vol', 141, 6, 7),
('Reticulum', 'Reticuli', 'Ret', 22, 'Alpha Ret', 114, 5, 8),
('Dorado', 'Doradus', 'Dor', 32, 'Alpha Dor', 179, 5, 7),
('Columba', 'Columbae', 'Col', 71, 'Fact', 270, 5, 6),
('Lepus', 'Leporis', 'Lep', 72, 'Arneb', 290, 5, 5),
('Cetus', 'Ceti', 'Cet', 100, 'Diphda', 1231, 5, 2),
('Virgo', 'Virginis', 'Vir', 5, 'Spica', 1294, 7, 1),
('Centaurus', 'Centauri', 'Cen', 150, 'Alpha Centauri', 1060, 7, 4),
('Apus', 'Apodis', 'Apo', 20, 'Alpha Aps', 206, 7, 7),
('Norma', 'Normae', 'Nor', 42, 'Gamma Nor', 165, 7, 8),
('Scutum', 'Scuti', 'Sct', 28, 'Alpha Scuti', 109, 8, 4),
('Microscopium', 'Microscopii', 'Mic', 37, 'Gamma Mic', 210, 8, 8),
('Piscis Austrinus', 'Piscis Austrini', 'PsA', 43, 'Fomalhaut', 245, 8, 6),
('Indus', 'Indi', 'Ind', 38, 'Alpha Ind', 294, 8, 7),
('Capricornus', 'Capricorni', 'Cap', 50, 'Deneb Algiedi', 414, 8, 1),
('Pisces', 'Piscium', 'Psc', 75, 'Eta Rsc', 889, 1, 1),
('Andromeda', 'Andromaedae', 'And', 100, 'Alpheratz', 722, 1, 2),
('Orion', 'Orionis', 'Ori', 120, 'Rigel', 594, 1, 5),
('Canis Minor', 'Canis Minoris', 'CMi', 20, 'Procyon', 183, 2, 5),
('Leo Minor', 'Leonis Minoris', 'LMi', 34, 'Proecypya', 232, 2, 3),
('Cancer', 'Cancri', 'Cnc', 60, 'Al Tarf', 506, 2, 1),
('Auriga', 'Aurigae', 'Aur', 90, 'Capella', 657, 2, 2),
('Hercules', 'Herculis', 'Her', 235, 'Rasalgethi', 1225, 3, 4),
('Draco', 'Draconis', 'Dra', 80, 'Eltanin', 1083, 3, 3),
('Pegasus', 'Pegasi', 'Peg', 166, 'Enif', 1121, 4, 2),
('Cygnus', 'Cygni', 'Cyg', 150, 'Deneb', 804, 4, 4),
('Delphinus', 'Delphini', 'Del', 30, 'Beta Del', 189, 4, 6);


INSERT INTO constellations__founders (id_constellation, id_founder) VALUES
(1, 1),
(3, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(17, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(18, 2),
(13, 2),
(5, 2),
(7, 2),
(5, 3),
(7, 3),
(13, 3),
(18, 3),
(8, 4),
(15, 5),
(24, 5),
(4, 6),
(6, 6),
(14, 6),
(16, 6),
(2, 6);

INSERT INTO families (name, max_right_ascension, min_right_ascension, max_declination, min_declination) VALUES
('Zodiac', 24, 0, 36, -45),
('Perceus_famili', 24, 19, 87.5, -25),
('Ursa_Major_family', 24, 0, 90, 7.5),
('Hercules_family', 22, 8.10000038, 60, -70.5),
('Orion_family', 8.10000038, 4.5999999, 23.2999992, -32),
('Heavenly_Waters', 23, 1.39999998, 20, -74),
('Bayer', 24, 0, -37, -82),
('La Caille', 24, 0, -24, -90);


INSERT INTO founders (name, country, date_of_birth, date_of_death) VALUES
('Ptolemy', 'Greece', 100, 170),
('Pieter Dickszoon Keyser', 'Denmark', 1540, 1596),
('Frederick de Houtman', 'Denmark', 1571, 1627),
('Petrus Plancius', 'Denmark', 1552, 1622),
('Jovannes Hevelius', 'Poland', 1611, 1687),
('Nicolas Louis de Lacaille', 'France', 1613, 1662);


ALTER TABLE area
ADD CHECK (max_right_ascension > 0),
ADD UNIQUE (name),
ALTER COLUMN name SET NOT NULL,
ALTER COLUMN semisphere SET NOT NULL,
ALTER COLUMN max_right_ascension SET NOT NULL,
ALTER COLUMN min_right_ascension SET NOT NULL,
ALTER COLUMN max_declination SET NOT NULL,
ALTER COLUMN min_declination SET NOT NULL;


ALTER TABLE areas__families
ADD FOREIGN KEY (id_area) REFERENCES area (id),
ADD FOREIGN KEY (id_family) REFERENCES families (id),
ADD UNIQUE (id_family, id_area),
ALTER COLUMN id_family SET NOT NULL,
ALTER COLUMN id_area SET NOT NULL;


ALTER TABLE families
ADD UNIQUE (name),
ADD CHECK (max_right_ascension > 0),
ALTER COLUMN name SET NOT NULL,
ALTER COLUMN max_right_ascension SET NOT NULL,
ALTER COLUMN min_right_ascension SET NOT NULL,
ALTER COLUMN max_declination SET NOT NULL,
ALTER COLUMN min_declination SET NOT NULL;


ALTER TABLE constellations 
ADD UNIQUE (latin_name),
ADD UNIQUE (genitive_latin_name),
ADD UNIQUE (shortening),
ADD UNIQUE (brightest_star),
ADD CHECK (quantity_of_visible_stars > 0), 
ADD CHECK (square > 0),
ADD FOREIGN KEY (id_area) REFERENCES area (id),
ADD FOREIGN KEY (id_family) REFERENCES families(id), 
ALTER COLUMN latin_name SET NOT NULL,
ALTER COLUMN genitive_latin_name SET NOT NULL,
ALTER COLUMN shortening SET NOT NULL,
ALTER COLUMN quantity_of_visible_stars SET NOT NULL,
ALTER COLUMN square SET NOT NULL,
ALTER COLUMN id_area SET NOT NULL;


ALTER TABLE constellations__founders
ADD FOREIGN KEY (id_constellation) REFERENCES constellations (id),
ADD FOREIGN KEY (id_founder) REFERENCES founders (id),
ADD UNIQUE (id_constellation, id_founder),
ALTER COLUMN id_constellation SET NOT NULL,
ALTER COLUMN id_founder SET NOT NULL;


ALTER TABLE founders 
ADD UNIQUE (name),
ADD CHECK (date_of_birth > 0),
ADD CHECK (date_of_death > date_of_birth),
ALTER COLUMN name SET NOT NULL,
ALTER COLUMN country SET NOT NULL,
ALTER COLUMN date_of_birth SET NOT NULL;