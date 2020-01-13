--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: pokoje; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.pokoje (
    "p.id" integer,
    pietro integer NOT NULL,
    "s.sid" integer NOT NULL,
    dostepnosc boolean NOT NULL
);


ALTER TABLE public.pokoje OWNER TO me;

--
-- Name: rezerwacje; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.rezerwacje (
    r integer,
    imie character varying(30) NOT NULL,
    nazwisko character varying(30) NOT NULL,
    p integer NOT NULL
);


ALTER TABLE public.rezerwacje OWNER TO me;

--
-- Name: standardy; Type: TABLE; Schema: public; Owner: me
--

CREATE TABLE public.standardy (
    "s.sid" integer NOT NULL,
    malzenskie boolean,
    "ilosc lozek pojedynczych" integer NOT NULL,
    "cena/dobe" integer NOT NULL
);


ALTER TABLE public.standardy OWNER TO me;

--
-- Data for Name: pokoje; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.pokoje ("p.id", pietro, "s.sid", dostepnosc) FROM stdin;
\.


--
-- Data for Name: rezerwacje; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.rezerwacje (r, imie, nazwisko, p) FROM stdin;
1	Rozanna	Boczar	210
2	Anna	Wr├│blewska 	34
5	Micha┼ø	Ciborowski	69
9	Kubu┼ø	Cicho┼ä	42
\.


--
-- Data for Name: standardy; Type: TABLE DATA; Schema: public; Owner: me
--

COPY public.standardy ("s.sid", malzenskie, "ilosc lozek pojedynczych", "cena/dobe") FROM stdin;
\.


--
-- Name: pokoje pokoje_p.id_key; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.pokoje
    ADD CONSTRAINT "pokoje_p.id_key" UNIQUE ("p.id");


--
-- Name: rezerwacje rezerwacje_r.id_key; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.rezerwacje
    ADD CONSTRAINT "rezerwacje_r.id_key" UNIQUE (r);


--
-- Name: standardy standardy_s.sid_key; Type: CONSTRAINT; Schema: public; Owner: me
--

ALTER TABLE ONLY public.standardy
    ADD CONSTRAINT "standardy_s.sid_key" UNIQUE ("s.sid");


--
-- PostgreSQL database dump complete
--

