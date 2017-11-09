--Easy queries

SELECT * FROM consellations ORDER BY square;

--prints strings from table consellations sorted by square

SELECT name FROM founders WHERE country = ‘Denmark’; 

--prints names of founders from Denmark

SELECT semisphere FROM area GROUP BY semisphere;

--groups names of semispheres from table area

SELECT name, (max_right_ascension – min_right_ascension) AS right_ascension_diam, (max_declination – min_declination) AS declination_diam FROM families;

--prints names and differences in right ascension and declination of families 


--Medium queries

SELECT latin_name, square, name FROM consellations INNER JOIN area  ON (id_area = area.id);

--prints names and squares from table consellations and names of areas where they are located

SELECT area.name, id_family FROM areas__families LEFT OUTER JOIN area ON (area.id = id_area) ORDER BY id_family;

--prints id of families from table areas__families and appropriate names of areas from table area, sorted by id_family

SELECT families.name, id_area FROM families RIGHT OUTER JOIN areas__families ON (families.id = id_family);

--prints id of areas from table areas__families and appropriate names of families
