--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 10.6
-- Dumped by pg_dump version 10.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.product DROP CONSTRAINT "Product_pkey";
ALTER TABLE ONLY public.sales DROP CONSTRAINT "Order_line_pkey";
ALTER TABLE ONLY public.customer DROP CONSTRAINT "Customer_pkey";
DROP TABLE public.sales;
DROP TABLE public.product;
DROP TABLE public.customer;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer (
    customer_id character varying(255) NOT NULL,
    customer_name character varying(255),
    segment character varying(255),
    age integer,
    country character varying(255),
    city character varying(255),
    state character varying(255),
    postal_code bigint,
    region character varying(255)
);


ALTER TABLE public.customer OWNER TO postgres;

--
-- Name: product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product (
    product_id character varying(255) NOT NULL,
    category character varying(255),
    sub_category character varying(255),
    product_name character varying(255)
);


ALTER TABLE public.product OWNER TO postgres;

--
-- Name: sales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales (
    order_line integer NOT NULL,
    order_id character varying(255),
    order_date date,
    ship_date date,
    ship_mode character varying(255),
    customer_id character varying(255),
    product_id character varying(255),
    sales double precision,
    quantity integer,
    discount double precision,
    profit double precision
);


ALTER TABLE public.sales OWNER TO postgres;

--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer (customer_id, customer_name, segment, age, country, city, state, postal_code, region) FROM stdin;
\.
COPY public.customer (customer_id, customer_name, segment, age, country, city, state, postal_code, region) FROM '$$PATH$$/2806.dat';

--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product (product_id, category, sub_category, product_name) FROM stdin;
\.
COPY public.product (product_id, category, sub_category, product_name) FROM '$$PATH$$/2807.dat';

--
-- Data for Name: sales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sales (order_line, order_id, order_date, ship_date, ship_mode, customer_id, product_id, sales, quantity, discount, profit) FROM stdin;
\.
COPY public.sales (order_line, order_id, order_date, ship_date, ship_mode, customer_id, product_id, sales, quantity, discount, profit) FROM '$$PATH$$/2808.dat';

--
-- Name: customer Customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT "Customer_pkey" PRIMARY KEY (customer_id);


--
-- Name: sales Order_line_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales
    ADD CONSTRAINT "Order_line_pkey" PRIMARY KEY (order_line);


--
-- Name: product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (product_id);


--
-- PostgreSQL database dump complete
--

