--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: area; Type: TABLE; Schema: public; Owner: tester
--

CREATE TABLE area (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    semisphere character varying(5) NOT NULL,
    max_right_ascension real,
    min_right_ascension real,
    max_declination real,
    min_declination real,
    CONSTRAINT area_id_check CHECK ((id < 9))
);


ALTER TABLE area OWNER TO tester;

--
-- Name: areas__families; Type: TABLE; Schema: public; Owner: tester
--

CREATE TABLE areas__families (
    id_area integer NOT NULL,
    id_family integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE areas__families OWNER TO tester;

--
-- Name: areas__families_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE areas__families_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE areas__families_id_seq OWNER TO tester;

--
-- Name: areas__families_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE areas__families_id_seq OWNED BY areas__families.id;


--
-- Name: consellations; Type: TABLE; Schema: public; Owner: tester
--

CREATE TABLE consellations (
    id integer NOT NULL,
    latin_name character varying(30) NOT NULL,
    genitive_latin_name character varying(35) NOT NULL,
    shortening character varying(3) NOT NULL,
    quantity_of_visible_stars integer,
    brightest_star character varying(30),
    square integer,
    id_area integer
);


ALTER TABLE consellations OWNER TO tester;

--
-- Name: consellations__founders; Type: TABLE; Schema: public; Owner: tester
--

CREATE TABLE consellations__founders (
    id_consellation integer NOT NULL,
    id_founder integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE consellations__founders OWNER TO tester;

--
-- Name: consellations__founders_id_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE consellations__founders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consellations__founders_id_seq OWNER TO tester;

--
-- Name: consellations__founders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tester
--

ALTER SEQUENCE consellations__founders_id_seq OWNED BY consellations__founders.id;


--
-- Name: consellations_seq; Type: SEQUENCE; Schema: public; Owner: tester
--

CREATE SEQUENCE consellations_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE consellations_seq OWNER TO tester;

--
-- Name: families; Type: TABLE; Schema: public; Owner: tester
--

CREATE TABLE families (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    max_right_ascension real,
    min_right_ascension real,
    max_declination real,
    min_declination real,
    CONSTRAINT families_id_check CHECK ((id < 9))
);


ALTER TABLE families OWNER TO tester;

--
-- Name: founders; Type: TABLE; Schema: public; Owner: tester
--

CREATE TABLE founders (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    country character varying(15),
    date_of_birth integer,
    date_of_death integer,
    CONSTRAINT founders_id_check CHECK ((id < 7))
);


ALTER TABLE founders OWNER TO tester;

--
-- Name: areas__families id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY areas__families ALTER COLUMN id SET DEFAULT nextval('areas__families_id_seq'::regclass);


--
-- Name: consellations__founders id; Type: DEFAULT; Schema: public; Owner: tester
--

ALTER TABLE ONLY consellations__founders ALTER COLUMN id SET DEFAULT nextval('consellations__founders_id_seq'::regclass);


--
-- Data for Name: area; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY area (id, name, semisphere, max_right_ascension, min_right_ascension, max_declination, min_declination) FROM stdin;
1	NQ1	North	5.5999999	0.5	37.4000015	5.94999981
2	NQ2	North	11	4.5999999	55.5	0
3	NQ3	North	21	9.19999981	86	4
4	NQ4	North	60	1.5	24	19.1000004
5	SQ1	South	6.5999999	0	10.1000004	-70.0999985
6	SQ2	South	11.6000004	6	6.0999999	-70.0999985
7	SQ3	South	15.1000004	10	6.30000019	-63.2999992
8	SQ4	South	22.1000004	18.2000008	-3.29999995	-75.3000031
\.


--
-- Data for Name: areas__families; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY areas__families (id_area, id_family, id) FROM stdin;
1	1	1
1	2	2
1	5	3
2	1	4
2	2	5
2	3	6
2	5	7
3	3	8
3	4	9
4	2	10
4	4	11
4	6	12
5	2	13
5	5	14
5	6	15
5	7	16
5	8	17
6	4	18
6	5	19
6	6	20
6	7	21
6	8	22
7	1	23
7	4	24
7	7	25
7	8	26
8	1	27
8	4	28
8	6	29
8	7	30
8	8	31
\.


--
-- Name: areas__families_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('areas__families_id_seq', 31, true);


--
-- Data for Name: consellations; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY consellations (id, latin_name, genitive_latin_name, shortening, quantity_of_visible_stars, brightest_star, square, id_area) FROM stdin;
1	Hydra	Hydrae	Hya	130	Alphard	1303	6
2	Puppis	Puppis	Pup	140	Naos	673	6
3	Canis Major	Canis Majoris	CMA	80	Sirius	380	6
4	Antlia	Antliae	Ant	42	Alpha Ant	239	6
5	Volans	Volantis	Vol	31	Beta Vol	141	6
6	Reticulum	Reticuli	Ret	22	Alpha Ret	114	5
7	Dorado	Doradus	Dor	32	Alpha Dor	179	5
8	Columba	Columbae	Col	71	Fact	270	5
9	Lepus	Leporis	Lep	72	Arneb	290	5
10	Cetus	Ceti	Cet	100	Diphda	1231	5
11	Virgo	Virginis	Vir	95	Spica	1294	7
12	Centaurus	Centauri	Cen	150	Alpha Centauri	1060	7
13	Apus	Apodis	Apo	20	Alpha Aps	206	7
14	Norma	Normae	Nor	42	Gamma Nor	165	7
15	Scutum	Scuti	Sct	28	Alpha Scuti	109	8
16	Microscopium	Microscopii	Mic	37	Gamma Mic	210	8
17	Piscis Austrinus	Piscis Austrini	PsA	43	Fomalhaut	245	8
18	Indus	Indi	Ind	38	Alpha Ind	294	8
19	Capricornus	Capricorni	Cap	50	Deneb Algiedi	414	8
20	Pisces	Piscium	Psc	75	Eta Rsc	889	1
21	Andromeda	Andromaedae	And	100	Alpheratz	722	1
22	Orion	Orionis	Ori	120	Rigel	594	1
23	Canis Minor	Canis Minoris	CMi	20	Procyon	183	2
24	Leo Minor	Leonis Minoris	LMi	34	Proecypya	232	2
25	Cancer	Cancri	Cnc	60	Al Tarf	506	2
26	Auriga	Aurigae	Aur	90	Capella	657	2
27	Hercules	Herculis	Her	235	Rasalgethi	1225	3
28	Draco	Draconis	Dra	80	Eltanin	1083	3
29	Pagasus	Pegasi	Peg	166	Enif	1121	4
30	Cygnus	Cygni	Cyg	150	Deneb	804	4
31	Delphinus	Delphini	Del	30	Beta Del	189	4
\.


--
-- Data for Name: consellations__founders; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY consellations__founders (id_consellation, id_founder, id) FROM stdin;
1	1	1
3	1	2
9	1	3
10	1	4
11	1	5
12	1	6
17	1	7
19	1	8
20	1	9
21	1	10
22	1	11
23	1	12
25	1	13
26	1	14
27	1	15
28	1	16
29	1	17
30	1	18
31	1	19
18	2	20
13	2	21
5	2	22
7	2	23
5	3	24
7	3	25
13	3	26
18	3	27
8	4	28
15	5	29
24	5	30
4	6	31
6	6	32
14	6	33
16	6	34
2	6	35
\.


--
-- Name: consellations__founders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('consellations__founders_id_seq', 35, true);


--
-- Name: consellations_seq; Type: SEQUENCE SET; Schema: public; Owner: tester
--

SELECT pg_catalog.setval('consellations_seq', 1, false);


--
-- Data for Name: families; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY families (id, name, max_right_ascension, min_right_ascension, max_declination, min_declination) FROM stdin;
1	Zodiac	24	0	36	-45
2	Perceus_famili	24	19	87.5	-25
3	Ursa_Major_family	24	0	90	7.5
4	Hercules_family	22	8.10000038	60	-70.5
5	Orion_family	8.10000038	4.5999999	23.2999992	-32
6	Heavenly_Waters	23	1.39999998	20	-74
7	Bayer	24	0	-37	-82
8	La Caille	24	0	-24	-90
\.


--
-- Data for Name: founders; Type: TABLE DATA; Schema: public; Owner: tester
--

COPY founders (id, name, country, date_of_birth, date_of_death) FROM stdin;
1	Ptolemy	Greece	100	170
2	Pieter Dickszoon Keyser	Denmark	1540	1596
3	Frederick de Houtman	Denmark	1571	1627
4	Petrus Plancius	Denmark	1552	1622
5	Jovannes Hevelius	Poland	1611	1687
6	Nicolas Louis de Lacaille	France	1613	1662
\.


--
-- Name: areas__families area__fam_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY areas__families
    ADD CONSTRAINT area__fam_pkey PRIMARY KEY (id);


--
-- Name: areas__families area__fam_uni; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY areas__families
    ADD CONSTRAINT area__fam_uni UNIQUE (id_area, id_family);


--
-- Name: area area_name_key; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY area
    ADD CONSTRAINT area_name_key UNIQUE (name);


--
-- Name: area area_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY area
    ADD CONSTRAINT area_pkey PRIMARY KEY (id);


--
-- Name: consellations__founders cons__foun_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY consellations__founders
    ADD CONSTRAINT cons__foun_pkey PRIMARY KEY (id);


--
-- Name: consellations__founders cons__foun_uniq; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY consellations__founders
    ADD CONSTRAINT cons__foun_uniq UNIQUE (id_consellation, id_founder);


--
-- Name: consellations cons_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY consellations
    ADD CONSTRAINT cons_pkey PRIMARY KEY (id);


--
-- Name: consellations consellations_latin_name_key; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY consellations
    ADD CONSTRAINT consellations_latin_name_key UNIQUE (latin_name);


--
-- Name: families families_name_key; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY families
    ADD CONSTRAINT families_name_key UNIQUE (name);


--
-- Name: families families_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY families
    ADD CONSTRAINT families_pkey PRIMARY KEY (id);


--
-- Name: founders founders_name_key; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY founders
    ADD CONSTRAINT founders_name_key UNIQUE (name);


--
-- Name: founders founders_pkey; Type: CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY founders
    ADD CONSTRAINT founders_pkey PRIMARY KEY (id);


--
-- Name: areas__families areas__families_id_area_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY areas__families
    ADD CONSTRAINT areas__families_id_area_fkey FOREIGN KEY (id_area) REFERENCES area(id);


--
-- Name: areas__families areas__families_id_family_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY areas__families
    ADD CONSTRAINT areas__families_id_family_fkey FOREIGN KEY (id_family) REFERENCES families(id);


--
-- Name: consellations__founders consellations__founders_id_consellation_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY consellations__founders
    ADD CONSTRAINT consellations__founders_id_consellation_fkey FOREIGN KEY (id_consellation) REFERENCES consellations(id);


--
-- Name: consellations__founders consellations__founders_id_founder_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY consellations__founders
    ADD CONSTRAINT consellations__founders_id_founder_fkey FOREIGN KEY (id_founder) REFERENCES founders(id);


--
-- Name: consellations consellations_id_area_fkey; Type: FK CONSTRAINT; Schema: public; Owner: tester
--

ALTER TABLE ONLY consellations
    ADD CONSTRAINT consellations_id_area_fkey FOREIGN KEY (id_area) REFERENCES area(id);


--
-- PostgreSQL database dump complete
--

