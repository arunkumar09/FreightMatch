--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: bookings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bookings (
    booking_id integer NOT NULL,
    booking_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(50) NOT NULL,
    load_id integer,
    carrier_id integer
);


ALTER TABLE public.bookings OWNER TO postgres;

--
-- Name: bookings_booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bookings_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bookings_booking_id_seq OWNER TO postgres;

--
-- Name: bookings_booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bookings_booking_id_seq OWNED BY public.bookings.booking_id;


--
-- Name: brokers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brokers (
    broker_id integer NOT NULL,
    name character varying(100) NOT NULL,
    company_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(15) NOT NULL,
    dot_number character varying(20) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.brokers OWNER TO postgres;

--
-- Name: brokers_broker_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brokers_broker_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brokers_broker_id_seq OWNER TO postgres;

--
-- Name: brokers_broker_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brokers_broker_id_seq OWNED BY public.brokers.broker_id;


--
-- Name: carriers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carriers (
    carrier_id integer NOT NULL,
    name character varying(100) NOT NULL,
    company_name character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(15) NOT NULL,
    mc_number character varying(20) NOT NULL,
    equipment character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.carriers OWNER TO postgres;

--
-- Name: carriers_carrier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carriers_carrier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carriers_carrier_id_seq OWNER TO postgres;

--
-- Name: carriers_carrier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carriers_carrier_id_seq OWNED BY public.carriers.carrier_id;


--
-- Name: loads; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.loads (
    load_id integer NOT NULL,
    pickup_date date NOT NULL,
    delivery_date date NOT NULL,
    weight integer NOT NULL,
    equipment character varying(50) NOT NULL,
    rate numeric(10,2) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    broker_id integer,
    origin_id integer,
    destination_id integer
);


ALTER TABLE public.loads OWNER TO postgres;

--
-- Name: loads_load_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.loads_load_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.loads_load_id_seq OWNER TO postgres;

--
-- Name: loads_load_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.loads_load_id_seq OWNED BY public.loads.load_id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    location_id integer NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100),
    country character varying(100) NOT NULL,
    zip_code character varying(20),
    latitude numeric(9,6),
    longitude numeric(9,6)
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- Name: locations_location_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_location_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_location_id_seq OWNER TO postgres;

--
-- Name: locations_location_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_location_id_seq OWNED BY public.locations.location_id;


--
-- Name: bookings booking_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings ALTER COLUMN booking_id SET DEFAULT nextval('public.bookings_booking_id_seq'::regclass);


--
-- Name: brokers broker_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brokers ALTER COLUMN broker_id SET DEFAULT nextval('public.brokers_broker_id_seq'::regclass);


--
-- Name: carriers carrier_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carriers ALTER COLUMN carrier_id SET DEFAULT nextval('public.carriers_carrier_id_seq'::regclass);


--
-- Name: loads load_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loads ALTER COLUMN load_id SET DEFAULT nextval('public.loads_load_id_seq'::regclass);


--
-- Name: locations location_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN location_id SET DEFAULT nextval('public.locations_location_id_seq'::regclass);


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bookings (booking_id, booking_date, status, load_id, carrier_id) FROM stdin;
\.


--
-- Data for Name: brokers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brokers (broker_id, name, company_name, email, phone, dot_number, created_at) FROM stdin;
\.


--
-- Data for Name: carriers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carriers (carrier_id, name, company_name, email, phone, mc_number, equipment, created_at) FROM stdin;
\.


--
-- Data for Name: loads; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.loads (load_id, pickup_date, delivery_date, weight, equipment, rate, created_at, broker_id, origin_id, destination_id) FROM stdin;
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (location_id, city, state, country, zip_code, latitude, longitude) FROM stdin;
\.


--
-- Name: bookings_booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bookings_booking_id_seq', 1, false);


--
-- Name: brokers_broker_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brokers_broker_id_seq', 1, false);


--
-- Name: carriers_carrier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carriers_carrier_id_seq', 1, false);


--
-- Name: loads_load_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.loads_load_id_seq', 1, false);


--
-- Name: locations_location_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_location_id_seq', 1, false);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (booking_id);


--
-- Name: brokers brokers_dot_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brokers
    ADD CONSTRAINT brokers_dot_number_key UNIQUE (dot_number);


--
-- Name: brokers brokers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brokers
    ADD CONSTRAINT brokers_email_key UNIQUE (email);


--
-- Name: brokers brokers_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brokers
    ADD CONSTRAINT brokers_phone_key UNIQUE (phone);


--
-- Name: brokers brokers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brokers
    ADD CONSTRAINT brokers_pkey PRIMARY KEY (broker_id);


--
-- Name: carriers carriers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carriers
    ADD CONSTRAINT carriers_email_key UNIQUE (email);


--
-- Name: carriers carriers_mc_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carriers
    ADD CONSTRAINT carriers_mc_number_key UNIQUE (mc_number);


--
-- Name: carriers carriers_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carriers
    ADD CONSTRAINT carriers_phone_key UNIQUE (phone);


--
-- Name: carriers carriers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carriers
    ADD CONSTRAINT carriers_pkey PRIMARY KEY (carrier_id);


--
-- Name: loads loads_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loads
    ADD CONSTRAINT loads_pkey PRIMARY KEY (load_id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);


--
-- Name: bookings bookings_carrier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_carrier_id_fkey FOREIGN KEY (carrier_id) REFERENCES public.carriers(carrier_id);


--
-- Name: bookings bookings_load_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_load_id_fkey FOREIGN KEY (load_id) REFERENCES public.loads(load_id);


--
-- Name: loads loads_broker_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loads
    ADD CONSTRAINT loads_broker_id_fkey FOREIGN KEY (broker_id) REFERENCES public.brokers(broker_id);


--
-- Name: loads loads_destination_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loads
    ADD CONSTRAINT loads_destination_id_fkey FOREIGN KEY (destination_id) REFERENCES public.locations(location_id);


--
-- Name: loads loads_origin_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.loads
    ADD CONSTRAINT loads_origin_id_fkey FOREIGN KEY (origin_id) REFERENCES public.locations(location_id);


--
-- PostgreSQL database dump complete
--

