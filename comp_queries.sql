--Complicated queries

SELECT name, avg_square FROM
(SELECT a.name, count(a.id) AS quantity, avg(c.square) AS avg_square
FROM consellations AS c
RIGHT JOIN area AS a
ON (a.id = c.id_area)
GROUP BY a.id
ORDER BY avg_square) AS areas
WHERE quantity > 2;

--prints areas, where count of consellations is more then 2, and average squares among consellations in areas, sorted by avg_square


SELECT name FROM
(SELECT f.name, count(f.id) AS quantity
FROM founders AS f
LEFT JOIN consellations__founders AS c_f
ON (f.id = c_f.id_founder)
GROUP BY f.id) AS counts
WHERE quantity = (SELECT max(quantity) FROM
(SELECT f.name, count(f.id) AS quantity
FROM founders AS f
LEFT JOIN consellations__founders AS c_f
ON (f.id = c_f.id_founder)
GROUP BY f.id) AS counts);

--prints scientist, founded the most of consellations


SELECT name, quantity FROM
(SELECT a.name, count(a.id) AS quantity
FROM area AS a
INNER JOIN consellations AS c
ON (a.id = c.id_area AND c.quantity_of_visible_stars > 50)
GROUP BY a.id) AS counts
WHERE quantity != (SELECT min(quantity) FROM
(SELECT a.name, count(a.id) AS quantity
FROM area AS a
INNER JOIN consellations AS c
ON (a.id = c.id_area AND c.quantity_of_visible_stars > 50)
GROUP BY a.id) AS counts);

--prints areas with no-min count of consellations with quantity of visible stars more then 50
