--ѕростые запросы

SELECT * FROM consellations ORDER BY square;

--сортирует строки в таблице consellations по возрастанию площади (показаний в столбце square)

SELECT name FROM founders WHERE country = СDenmarkТ; 

--выводит в таблице founders имена первооткрывателей из ƒании

SELECT semisphere FROM area GROUP BY semisphere;

--группирует в таблице area значени€ из столбца semisphere

SELECT name, (max_right_ascension Ц min_right_ascension) AS right_ascension_diam, (max_declination Ц min_declination) AS declination_diam FROM families;

--создает новые выражени€ из существующих в столбце 


--—редние запросы

SELECT latin_name, square, name FROM consellations INNER JOIN area  ON (id_area = area.id);

--выводит столбцы с названи€ми созвездий и их площад€ми из таблицы consellations и столбцы с названи€ми областей из таблицы area

SELECT area.name, id_family FROM areas__families LEFT OUTER JOIN area ON (area.id = id_area) ORDER BY id_family;

--выводит записи из столбца id_family таблицы areas__families и соответствующие им названи€ областей из таблицы area, отсортированные по id_family

SELECT families.name, id_area FROM families RIGHT OUTER JOIN areas__families ON (families.id = id_family);

--выводит записи из столбца id_area таблицы areas__families и соответствующие им названи€ семейств из таблицы families