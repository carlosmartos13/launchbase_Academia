--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.18
-- Dumped by pg_dump version 9.2.18
-- Started on 2020-03-09 19:34:15

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11727)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1941 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 170 (class 1259 OID 18215)
-- Name: instructors; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE instructors (
    id integer NOT NULL,
    avatar_url text,
    name text,
    birth timestamp without time zone,
    gender text,
    services text,
    created_at timestamp without time zone
);


ALTER TABLE public.instructors OWNER TO postgres;

--
-- TOC entry 169 (class 1259 OID 18213)
-- Name: instructors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE instructors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.instructors_id_seq OWNER TO postgres;

--
-- TOC entry 1942 (class 0 OID 0)
-- Dependencies: 169
-- Name: instructors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE instructors_id_seq OWNED BY instructors.id;


--
-- TOC entry 172 (class 1259 OID 18226)
-- Name: members; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE members (
    id integer NOT NULL,
    name text,
    avatar_url text,
    email text,
    gender text,
    birth timestamp without time zone,
    blood text,
    weight integer,
    height integer,
    instructor_id integer
);


ALTER TABLE public.members OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 18224)
-- Name: members_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.members_id_seq OWNER TO postgres;

--
-- TOC entry 1943 (class 0 OID 0)
-- Dependencies: 171
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE members_id_seq OWNED BY members.id;


--
-- TOC entry 1818 (class 2604 OID 18218)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY instructors ALTER COLUMN id SET DEFAULT nextval('instructors_id_seq'::regclass);


--
-- TOC entry 1819 (class 2604 OID 18229)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY members ALTER COLUMN id SET DEFAULT nextval('members_id_seq'::regclass);


--
-- TOC entry 1931 (class 0 OID 18215)
-- Dependencies: 170
-- Data for Name: instructors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY instructors (id, avatar_url, name, birth, gender, services, created_at) FROM stdin;
6	https://images.unsplash.com/photo-1530822847156-5df684ec5ee1?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=80&w=500	Luiz	2010-10-10 00:00:00	M	crossfit	2020-03-01 00:00:00
7	https://images.unsplash.com/photo-1530822847156-5df684ec5ee1?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=80&w=500	Larissa	2010-10-10 00:00:00	F	crossfit	2020-03-01 00:00:00
4	https://images.unsplash.com/photo-1497514757083-ab6e9d0785d1?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=80&w=500	Fernanda	2010-10-10 00:00:00	F	Natação, Crossfit	2020-02-29 00:00:00
8	https://images.unsplash.com/photo-1540205597869-814e97c94f25?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=80&w=500	Luiza	2000-10-10 00:00:00	F	Natação	2020-03-01 00:00:00
9	https://images.unsplash.com/photo-1540205597869-814e97c94f25?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=80&w=500	Luiza Frena	2000-10-10 00:00:00	F	Natação	2020-03-01 00:00:00
5	https://images.unsplash.com/photo-1518605191993-3b854854e4ae?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=80&w=500	Fernanda Ferraz	2000-01-01 00:00:00	F	Natação, Crossfit, Natação	2020-02-29 00:00:00
\.


--
-- TOC entry 1944 (class 0 OID 0)
-- Dependencies: 169
-- Name: instructors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('instructors_id_seq', 9, true);


--
-- TOC entry 1933 (class 0 OID 18226)
-- Dependencies: 172
-- Data for Name: members; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY members (id, name, avatar_url, email, gender, birth, blood, weight, height, instructor_id) FROM stdin;
4	Cornelios Venaz	https://images.unsplash.com/photo-1530822847156-5df684ec5ee1?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=500&ixid=eyJhcHBfaWQiOjF9&ixlib=rb-1.2.1&q=80&w=500	cornelios@gmail.com	M	1929-05-10 00:00:00	AB+	190	203	5
2	Mari Lima	https://source.unsplash.com/collection/3465564/500x500	maria@lima.com.br	F	1968-01-27 00:00:00	O+	90	153	5
\.


--
-- TOC entry 1945 (class 0 OID 0)
-- Dependencies: 171
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('members_id_seq', 4, true);


--
-- TOC entry 1821 (class 2606 OID 18220)
-- Name: instructors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY instructors
    ADD CONSTRAINT instructors_pkey PRIMARY KEY (id);


--
-- TOC entry 1823 (class 2606 OID 18231)
-- Name: members_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- TOC entry 1940 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2020-03-09 19:34:15

--
-- PostgreSQL database dump complete
--

