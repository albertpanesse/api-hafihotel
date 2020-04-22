--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.12 (Ubuntu 10.12-0ubuntu0.18.04.1)

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: hafihotel
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO hafihotel;

--
-- Name: configs; Type: TABLE; Schema: public; Owner: hafihotel
--

CREATE TABLE public.configs (
    id bigint NOT NULL,
    cfg_name character varying NOT NULL,
    cfg_type character varying NOT NULL,
    cfg_value character varying,
    is_del boolean DEFAULT false NOT NULL,
    is_sync boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.configs OWNER TO hafihotel;

--
-- Name: configs_id_seq; Type: SEQUENCE; Schema: public; Owner: hafihotel
--

CREATE SEQUENCE public.configs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configs_id_seq OWNER TO hafihotel;

--
-- Name: configs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hafihotel
--

ALTER SEQUENCE public.configs_id_seq OWNED BY public.configs.id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: hafihotel
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    full_name character varying NOT NULL,
    email character varying NOT NULL,
    phone character varying,
    is_del boolean DEFAULT false NOT NULL,
    is_sync boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.customers OWNER TO hafihotel;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: hafihotel
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO hafihotel;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hafihotel
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: order_details; Type: TABLE; Schema: public; Owner: hafihotel
--

CREATE TABLE public.order_details (
    id bigint NOT NULL,
    is_del boolean DEFAULT false NOT NULL,
    is_sync boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    order_id bigint
);


ALTER TABLE public.order_details OWNER TO hafihotel;

--
-- Name: order_details_id_seq; Type: SEQUENCE; Schema: public; Owner: hafihotel
--

CREATE SEQUENCE public.order_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_details_id_seq OWNER TO hafihotel;

--
-- Name: order_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hafihotel
--

ALTER SEQUENCE public.order_details_id_seq OWNED BY public.order_details.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: hafihotel
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    order_date timestamp without time zone,
    is_del boolean DEFAULT false NOT NULL,
    is_sync boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    customer_id bigint
);


ALTER TABLE public.orders OWNER TO hafihotel;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: hafihotel
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO hafihotel;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hafihotel
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: properties; Type: TABLE; Schema: public; Owner: hafihotel
--

CREATE TABLE public.properties (
    id bigint NOT NULL,
    "roomNum" integer NOT NULL,
    status character varying DEFAULT 'F'::character varying NOT NULL,
    customer_ref integer,
    checkin timestamp without time zone,
    checkout timestamp without time zone,
    is_del boolean DEFAULT false NOT NULL,
    is_sync boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.properties OWNER TO hafihotel;

--
-- Name: properties_id_seq; Type: SEQUENCE; Schema: public; Owner: hafihotel
--

CREATE SEQUENCE public.properties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.properties_id_seq OWNER TO hafihotel;

--
-- Name: properties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hafihotel
--

ALTER SEQUENCE public.properties_id_seq OWNED BY public.properties.id;


--
-- Name: room_categories; Type: TABLE; Schema: public; Owner: hafihotel
--

CREATE TABLE public.room_categories (
    id bigint NOT NULL,
    name character varying NOT NULL,
    "desc" character varying,
    is_del boolean DEFAULT false NOT NULL,
    is_sync boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.room_categories OWNER TO hafihotel;

--
-- Name: room_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: hafihotel
--

CREATE SEQUENCE public.room_categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.room_categories_id_seq OWNER TO hafihotel;

--
-- Name: room_categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hafihotel
--

ALTER SEQUENCE public.room_categories_id_seq OWNED BY public.room_categories.id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: hafihotel
--

CREATE TABLE public.rooms (
    id bigint NOT NULL,
    name character varying NOT NULL,
    dim character varying,
    "desc" character varying,
    cap integer DEFAULT 0 NOT NULL,
    image character varying,
    is_del boolean DEFAULT false NOT NULL,
    is_sync boolean DEFAULT true NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    room_category_id bigint
);


ALTER TABLE public.rooms OWNER TO hafihotel;

--
-- Name: rooms_id_seq; Type: SEQUENCE; Schema: public; Owner: hafihotel
--

CREATE SEQUENCE public.rooms_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rooms_id_seq OWNER TO hafihotel;

--
-- Name: rooms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hafihotel
--

ALTER SEQUENCE public.rooms_id_seq OWNED BY public.rooms.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: hafihotel
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO hafihotel;

--
-- Name: configs id; Type: DEFAULT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.configs ALTER COLUMN id SET DEFAULT nextval('public.configs_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: order_details id; Type: DEFAULT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.order_details ALTER COLUMN id SET DEFAULT nextval('public.order_details_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: properties id; Type: DEFAULT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.properties ALTER COLUMN id SET DEFAULT nextval('public.properties_id_seq'::regclass);


--
-- Name: room_categories id; Type: DEFAULT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.room_categories ALTER COLUMN id SET DEFAULT nextval('public.room_categories_id_seq'::regclass);


--
-- Name: rooms id; Type: DEFAULT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.rooms ALTER COLUMN id SET DEFAULT nextval('public.rooms_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: hafihotel
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2020-04-22 07:56:39.784951	2020-04-22 07:56:39.784951
\.


--
-- Data for Name: configs; Type: TABLE DATA; Schema: public; Owner: hafihotel
--

COPY public.configs (id, cfg_name, cfg_type, cfg_value, is_del, is_sync, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: hafihotel
--

COPY public.customers (id, full_name, email, phone, is_del, is_sync, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: order_details; Type: TABLE DATA; Schema: public; Owner: hafihotel
--

COPY public.order_details (id, is_del, is_sync, created_at, updated_at, order_id) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: hafihotel
--

COPY public.orders (id, order_date, is_del, is_sync, created_at, updated_at, customer_id) FROM stdin;
\.


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: hafihotel
--

COPY public.properties (id, "roomNum", status, customer_ref, checkin, checkout, is_del, is_sync, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: room_categories; Type: TABLE DATA; Schema: public; Owner: hafihotel
--

COPY public.room_categories (id, name, "desc", is_del, is_sync, created_at, updated_at) FROM stdin;
1	Single Bed Room	\N	f	t	2020-04-22 07:57:26.583409	2020-04-22 07:57:26.583409
2	Double Bed Room	\N	f	t	2020-04-22 07:57:32.225988	2020-04-22 07:57:32.225988
3	Twin Single Bed Room	\N	f	t	2020-04-22 07:57:41.379968	2020-04-22 07:57:54.017488
4	Twin Double Bed Room	\N	f	t	2020-04-22 07:57:46.870642	2020-04-22 07:57:59.026345
5	One Double Bed with Three Single Bed Room	\N	f	t	2020-04-22 07:59:14.491893	2020-04-22 07:59:14.491893
6	King Size Bed Room	\N	f	t	2020-04-22 07:59:29.167993	2020-04-22 07:59:29.167993
\.


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: hafihotel
--

COPY public.rooms (id, name, dim, "desc", cap, image, is_del, is_sync, created_at, updated_at, room_category_id) FROM stdin;
1	Standard Single	3 x 4 meters		1	0494736b1cd8c3ac7fe97789c4ad6dcb.jpg	f	t	2020-04-22 07:59:54.619689	2020-04-22 08:03:58.145342	1
2	Standard Double	4 x 5 meters		2	5e0fbb04262af23e00474e71e42bdfbc.jpg	f	t	2020-04-22 08:00:30.047125	2020-04-22 08:04:23.655755	2
3	Deluxe Room	4 x 5 meters		2	d0aa4edb077d2c0b0b0dd3e03b6a8026.jpg	f	t	2020-04-22 08:01:21.292748	2020-04-22 08:04:32.282045	3
4	Super Deluxe Room	5 x 6 meters		4	785952bb086f4a54fd8f680b55e2894a.jpg	f	t	2020-04-22 08:01:42.441232	2020-04-22 08:04:42.63279	4
6	President Suite	6 x 7 meters		4	3b6787df4d8359a6ffdde6d3dd2a4082.jpg	f	t	2020-04-22 08:05:38.860077	2020-04-22 08:05:38.860077	6
5	Family Suite	7 x 8 meters		5	ccafdb2280972b6e8d05e1a5bc40f979.jpg	f	t	2020-04-22 08:05:08.57185	2020-04-22 08:05:47.680664	5
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: hafihotel
--

COPY public.schema_migrations (version) FROM stdin;
20200422023611
20200422023612
20200422023613
20200422023630
20200422023635
20200422023639
20200422023640
20200422031150
20200422031358
20200422035746
\.


--
-- Name: configs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hafihotel
--

SELECT pg_catalog.setval('public.configs_id_seq', 1, false);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hafihotel
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, false);


--
-- Name: order_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hafihotel
--

SELECT pg_catalog.setval('public.order_details_id_seq', 1, false);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hafihotel
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- Name: properties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hafihotel
--

SELECT pg_catalog.setval('public.properties_id_seq', 1, false);


--
-- Name: room_categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hafihotel
--

SELECT pg_catalog.setval('public.room_categories_id_seq', 6, true);


--
-- Name: rooms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hafihotel
--

SELECT pg_catalog.setval('public.rooms_id_seq', 6, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: configs configs_pkey; Type: CONSTRAINT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.configs
    ADD CONSTRAINT configs_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: order_details order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT order_details_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (id);


--
-- Name: room_categories room_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.room_categories
    ADD CONSTRAINT room_categories_pkey PRIMARY KEY (id);


--
-- Name: rooms rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_order_details_on_order_id; Type: INDEX; Schema: public; Owner: hafihotel
--

CREATE INDEX index_order_details_on_order_id ON public.order_details USING btree (order_id);


--
-- Name: index_orders_on_customer_id; Type: INDEX; Schema: public; Owner: hafihotel
--

CREATE INDEX index_orders_on_customer_id ON public.orders USING btree (customer_id);


--
-- Name: index_rooms_on_room_category_id; Type: INDEX; Schema: public; Owner: hafihotel
--

CREATE INDEX index_rooms_on_room_category_id ON public.rooms USING btree (room_category_id);


--
-- Name: rooms fk_rails_1a8f7b0bc9; Type: FK CONSTRAINT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.rooms
    ADD CONSTRAINT fk_rails_1a8f7b0bc9 FOREIGN KEY (room_category_id) REFERENCES public.room_categories(id);


--
-- Name: orders fk_rails_3dad120da9; Type: FK CONSTRAINT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_rails_3dad120da9 FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: order_details fk_rails_e5976611fd; Type: FK CONSTRAINT; Schema: public; Owner: hafihotel
--

ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT fk_rails_e5976611fd FOREIGN KEY (order_id) REFERENCES public.orders(id);


--
-- PostgreSQL database dump complete
--

