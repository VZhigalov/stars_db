--Optimization

SELECT * FROM consellations ORDER BY square;

--before

                                                   QUERY PLAN
-----------------------------------------------------------------------------------------------------------------
 Sort  (cost=2.08..2.16 rows=31 width=276) (actual time=0.135..0.138 rows=31 loops=1)
   Sort Key: square
   Sort Method: quicksort  Memory: 28kB
   ->  Seq Scan on consellations  (cost=0.00..1.31 rows=31 width=276) (actual time=0.030..0.033 rows=31 loops=1)
 Planning time: 0.158 ms
 Execution time: 0.596 ms

CREATE INDEX ON consellations(square);

EXPLAIN (ANALYZE) SELECT * FROM consellations ORDER BY square;

--after

                                                   QUERY PLAN
-----------------------------------------------------------------------------------------------------------------
 Sort  (cost=2.08..2.16 rows=31 width=276) (actual time=0.072..0.074 rows=31 loops=1)
   Sort Key: square
   Sort Method: quicksort  Memory: 28kB
   ->  Seq Scan on consellations  (cost=0.00..1.31 rows=31 width=276) (actual time=0.016..0.019 rows=31 loops=1)
 Planning time: 0.124 ms
 Execution time: 0.123 ms


SELECT name FROM founders WHERE country LIKE 'Denmark';

--before

                                            QUERY PLAN
---------------------------------------------------------------------------------------------------
 Seq Scan on founders  (cost=0.00..1.08 rows=1 width=78) (actual time=1.298..1.300 rows=3 loops=1)
   Filter: ((country)::text ~~ 'Denmark'::text)
   Rows Removed by Filter: 3
 Planning time: 28.211 ms
 Execution time: 1.329 ms

CREATE INDEX ON founders(country);

EXPLAIN (ANALYZE)
SELECT name FROM founders WHERE country LIKE 'Denmark';

--after

                                            QUERY PLAN
---------------------------------------------------------------------------------------------------
 Seq Scan on founders  (cost=0.00..1.08 rows=1 width=78) (actual time=0.059..0.060 rows=3 loops=1)
   Filter: ((country)::text ~~ 'Denmark'::text)
   Rows Removed by Filter: 3
 Planning time: 0.836 ms
 Execution time: 0.108 ms


SELECT semisphere FROM area GROUP BY semisphere;

--before

                                               QUERY PLAN
--------------------------------------------------------------------------------------------------------
 HashAggregate  (cost=27.50..33.10 rows=560 width=6) (actual time=0.032..0.032 rows=2 loops=1)
   Group Key: semisphere
   ->  Seq Scan on area  (cost=0.00..24.00 rows=1400 width=6) (actual time=0.018..0.020 rows=8 loops=1)
 Planning time: 0.130 ms
 Execution time: 0.139 ms

CREATE INDEX ON area(semisphere);

EXPLAIN (ANALYZE) SELECT semisphere FROM area GROUP BY semisphere;

--after


                                             QUERY PLAN
----------------------------------------------------------------------------------------------------
 HashAggregate  (cost=1.10..1.13 rows=3 width=6) (actual time=0.025..0.025 rows=2 loops=1)
   Group Key: semisphere
   ->  Seq Scan on area  (cost=0.00..1.08 rows=8 width=6) (actual time=0.014..0.016 rows=8 loops=1)
 Planning time: 0.684 ms
 Execution time: 0.056 ms


SELECT name, (max_right_ascension - min_right_ascension) AS right_ascension_diam, (max_declination - min_declination) AS declination_diam FROM families;

--before

                                            QUERY PLAN
---------------------------------------------------------------------------------------------------
 Seq Scan on families  (cost=0.00..1.12 rows=8 width=86) (actual time=0.533..0.538 rows=8 loops=1)
 Planning time: 28.840 ms
 Execution time: 0.570 ms

CREATE INDEX ON families(max_right_ascension);

EXPLAIN (ANALYZE) SELECT name, (max_right_ascension - min_right_ascension) AS right_ascension_diam, (max_declination - min_declination) AS declination_diam FROM families;

--after

                                            QUERY PLAN
---------------------------------------------------------------------------------------------------
 Seq Scan on families  (cost=0.00..1.12 rows=8 width=86) (actual time=0.019..0.021 rows=8 loops=1)
 Planning time: 0.891 ms
 Execution time: 0.046 ms


SELECT latin_name, square, name FROM consellations INNER JOIN area  ON (id_area = area.id);

--before

                                                   QUERY PLAN
----------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=1.18..2.69 rows=31 width=86) (actual time=0.048..0.063 rows=31 loops=1)
   Hash Cond: (consellations.id_area = area.id)
   ->  Seq Scan on consellations  (cost=0.00..1.31 rows=31 width=86) (actual time=0.022..0.024 rows=31 loops=1)
   ->  Hash  (cost=1.08..1.08 rows=8 width=8) (actual time=0.014..0.014 rows=8 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  Seq Scan on area  (cost=0.00..1.08 rows=8 width=8) (actual time=0.008..0.009 rows=8 loops=1)
 Planning time: 0.264 ms
 Execution time: 0.155 ms

CREATE INDEX ON area(name);

EXPLAIN (ANALYZE) SELECT latin_name, square, name FROM consellations INNER JOIN area  ON (id_area = area.id);

--after

                                                   QUERY PLAN
----------------------------------------------------------------------------------------------------------------
 Hash Join  (cost=1.18..2.69 rows=31 width=86) (actual time=0.032..0.044 rows=31 loops=1)
   Hash Cond: (consellations.id_area = area.id)
   ->  Seq Scan on consellations  (cost=0.00..1.31 rows=31 width=86) (actual time=0.012..0.013 rows=31 loops=1)
   ->  Hash  (cost=1.08..1.08 rows=8 width=8) (actual time=0.012..0.012 rows=8 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  Seq Scan on area  (cost=0.00..1.08 rows=8 width=8) (actual time=0.006..0.006 rows=8 loops=1)
 Planning time: 11.994 ms
 Execution time: 0.067 ms


SELECT area.name, id_family FROM areas__families LEFT OUTER JOIN area ON (area.id = id_area) ORDER BY id_family;

--before

                                                      QUERY PLAN
-----------------------------------------------------------------------------------------------------------------------
 Sort  (cost=3.45..3.53 rows=31 width=8) (actual time=0.092..0.094 rows=31 loops=1)
   Sort Key: areas__families.id_family
   Sort Method: quicksort  Memory: 26kB
   ->  Hash Left Join  (cost=1.18..2.69 rows=31 width=8) (actual time=0.070..0.080 rows=31 loops=1)
         Hash Cond: (areas__families.id_area = area.id)
         ->  Seq Scan on areas__families  (cost=0.00..1.31 rows=31 width=8) (actual time=0.042..0.044 rows=31 loops=1)
         ->  Hash  (cost=1.08..1.08 rows=8 width=8) (actual time=0.013..0.013 rows=8 loops=1)
               Buckets: 1024  Batches: 1  Memory Usage: 9kB
               ->  Seq Scan on area  (cost=0.00..1.08 rows=8 width=8) (actual time=0.007..0.008 rows=8 loops=1)
 Planning time: 23.435 ms
 Execution time: 0.123 ms

CREATE INDEX ON area(name);

EXPLAIN (ANALYZE) SELECT area.name, id_family FROM areas__families LEFT OUTER JOIN area ON (area.id = id_area) ORDER BY id_family;

--after

                                                      QUERY PLAN
-----------------------------------------------------------------------------------------------------------------------
 Sort  (cost=3.45..3.53 rows=31 width=8) (actual time=0.057..0.060 rows=31 loops=1)
   Sort Key: areas__families.id_family
   Sort Method: quicksort  Memory: 26kB
   ->  Hash Left Join  (cost=1.18..2.69 rows=31 width=8) (actual time=0.033..0.042 rows=31 loops=1)
         Hash Cond: (areas__families.id_area = area.id)
         ->  Seq Scan on areas__families  (cost=0.00..1.31 rows=31 width=8) (actual time=0.009..0.011 rows=31 loops=1)
         ->  Hash  (cost=1.08..1.08 rows=8 width=8) (actual time=0.011..0.011 rows=8 loops=1)
               Buckets: 1024  Batches: 1  Memory Usage: 9kB
               ->  Seq Scan on area  (cost=0.00..1.08 rows=8 width=8) (actual time=0.005..0.006 rows=8 loops=1)
 Planning time: 0.638 ms
 Execution time: 0.089 ms


SELECT families.name, id_area FROM families RIGHT OUTER JOIN areas__families ON (families.id = id_family);

--before

                                                   QUERY PLAN
-----------------------------------------------------------------------------------------------------------------
 Hash Left Join  (cost=1.18..2.69 rows=31 width=82) (actual time=0.173..0.184 rows=31 loops=1)
   Hash Cond: (areas__families.id_family = families.id)
   ->  Seq Scan on areas__families  (cost=0.00..1.31 rows=31 width=8) (actual time=0.031..0.032 rows=31 loops=1)
   ->  Hash  (cost=1.08..1.08 rows=8 width=82) (actual time=0.120..0.120 rows=8 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  Seq Scan on families  (cost=0.00..1.08 rows=8 width=82) (actual time=0.105..0.108 rows=8 loops=1)
 Planning time: 5.653 ms
 Execution time: 0.219 ms

CREATE INDEX ON areas__families(id_area);

EXPLAIN (ANALYZE) SELECT families.name, id_area FROM families RIGHT OUTER JOIN areas__families ON (families.id = id_family);

--after

                                                   QUERY PLAN
-----------------------------------------------------------------------------------------------------------------
 Hash Left Join  (cost=1.18..2.69 rows=31 width=82) (actual time=0.071..0.079 rows=31 loops=1)
   Hash Cond: (areas__families.id_family = families.id)
   ->  Seq Scan on areas__families  (cost=0.00..1.31 rows=31 width=8) (actual time=0.011..0.013 rows=31 loops=1)
   ->  Hash  (cost=1.08..1.08 rows=8 width=82) (actual time=0.033..0.033 rows=8 loops=1)
         Buckets: 1024  Batches: 1  Memory Usage: 9kB
         ->  Seq Scan on families  (cost=0.00..1.08 rows=8 width=82) (actual time=0.017..0.018 rows=8 loops=1)
 Planning time: 0.856 ms
 Execution time: 0.108 ms













