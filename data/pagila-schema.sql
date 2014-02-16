--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- Name: actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE actor_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.actor_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: films_actor; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE films_actor (
    id integer DEFAULT nextval('actor_id_seq'::regclass) NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.films_actor OWNER TO postgres;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE category_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- Name: films_category; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE films_category (
    id integer DEFAULT nextval('category_id_seq'::regclass) NOT NULL,
    name character varying(25) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.films_category OWNER TO postgres;

--
-- Name: film_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE film_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.film_id_seq OWNER TO postgres;

--
-- Name: films_film; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE films_film (
    id integer DEFAULT nextval('film_id_seq'::regclass) NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    release_year integer,
    language_id smallint NOT NULL,
    original_language_id smallint,
    rental_duration smallint DEFAULT 3 NOT NULL,
    rental_rate numeric(4,2) DEFAULT 4.99 NOT NULL,
    length smallint,
    replacement_cost numeric(5,2) DEFAULT 19.99 NOT NULL,
    rating character varying(5) DEFAULT 'G',
    last_update timestamp without time zone DEFAULT now() NOT NULL,
    special_features text[]
);


ALTER TABLE public.films_film OWNER TO postgres;

--
-- Name: film_actors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE film_actors_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.film_actors_id_seq OWNER TO postgres;

--
-- Name: films_film_actors; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE films_film_actors (
    id integer DEFAULT nextval('film_actors_id_seq'::regclass) NOT NULL,
    film_id smallint NOT NULL,
    actor_id smallint NOT NULL
);


ALTER TABLE public.films_film_actors OWNER TO postgres;

--
-- Name: film_categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE film_categories_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.film_categories_id_seq OWNER TO postgres;

--
-- Name: films_film_categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE films_film_categories (
    id integer DEFAULT nextval('film_categories_id_seq'::regclass) NOT NULL,
    film_id smallint NOT NULL,
    category_id smallint NOT NULL
);


ALTER TABLE public.films_film_categories OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE address_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.address_id_seq OWNER TO postgres;

--
-- Name: address; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE store_address (
    id integer DEFAULT nextval('address_id_seq'::regclass) NOT NULL,
    address character varying(50) NOT NULL,
    address2 character varying(50),
    district character varying(20) NOT NULL,
    city_id smallint NOT NULL,
    postal_code character varying(10),
    phone character varying(20) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.store_address OWNER TO postgres;

--
-- Name: city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE city_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.city_id_seq OWNER TO postgres;

--
-- Name: city; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE store_city (
    id integer DEFAULT nextval('city_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    country_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.store_city OWNER TO postgres;

--
-- Name: country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE country_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.country_id_seq OWNER TO postgres;

--
-- Name: country; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE store_country (
    id integer DEFAULT nextval('country_id_seq'::regclass) NOT NULL,
    name character varying(50) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.store_country OWNER TO postgres;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE customer_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO postgres;

--
-- Name: customer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE store_customer (
    id integer DEFAULT nextval('customer_id_seq'::regclass) NOT NULL,
    store_id smallint NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    email character varying(50),
    address_id smallint NOT NULL,
    activebool boolean DEFAULT true NOT NULL,
    create_date date DEFAULT ('now'::text)::date NOT NULL,
    last_update timestamp without time zone DEFAULT now(),
    active integer
);


ALTER TABLE public.store_customer OWNER TO postgres;

--
-- Name: inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE inventory_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.inventory_id_seq OWNER TO postgres;

--
-- Name: inventory; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE store_inventory (
    id integer DEFAULT nextval('inventory_id_seq'::regclass) NOT NULL,
    film_id smallint NOT NULL,
    store_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.store_inventory OWNER TO postgres;

--
-- Name: language_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE language_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.language_id_seq OWNER TO postgres;

--
-- Name: language; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE films_language (
    id integer DEFAULT nextval('language_id_seq'::regclass) NOT NULL,
    name character(20) NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.films_language OWNER TO postgres;

--
-- Name: payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE payment_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.payment_id_seq OWNER TO postgres;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE store_payment (
    id integer DEFAULT nextval('payment_id_seq'::regclass) NOT NULL,
    customer_id smallint NOT NULL,
    staff_id smallint NOT NULL,
    rental_id integer NOT NULL,
    amount numeric(5,2) NOT NULL,
    payment_date timestamp without time zone NOT NULL
);


ALTER TABLE public.store_payment OWNER TO postgres;

--
-- Name: rental_rental_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE rental_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.rental_id_seq OWNER TO postgres;

--
-- Name: rental; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE store_rental (
    id integer DEFAULT nextval('rental_id_seq'::regclass) NOT NULL,
    rental_date timestamp without time zone NOT NULL,
    inventory_id integer NOT NULL,
    customer_id smallint NOT NULL,
    return_date timestamp without time zone,
    staff_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.store_rental OWNER TO postgres;

--
-- Name: staff_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE staff_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.staff_id_seq OWNER TO postgres;

--
-- Name: staff; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE store_staff (
    id integer DEFAULT nextval('staff_id_seq'::regclass) NOT NULL,
    first_name character varying(45) NOT NULL,
    last_name character varying(45) NOT NULL,
    address_id smallint NOT NULL,
    email character varying(50),
    store_id smallint NOT NULL,
    active boolean DEFAULT true NOT NULL,
    username character varying(16) NOT NULL,
    password character varying(40),
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.store_staff OWNER TO postgres;

--
-- Name: store_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE store_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.store_id_seq OWNER TO postgres;

--
-- Name: store; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE store_store (
    id integer DEFAULT nextval('store_id_seq'::regclass) NOT NULL,
    manager_staff_id smallint NOT NULL,
    address_id smallint NOT NULL,
    last_update timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.store_store OWNER TO postgres;

--
-- Name: actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY films_actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (id);


--
-- Name: address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY store_address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY films_category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: city_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY store_city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);


--
-- Name: country_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY store_country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);


--
-- Name: customer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY store_customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: film_actors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY films_film_actors
    ADD CONSTRAINT film_actors_pkey PRIMARY KEY (film_id, actor_id);


--
-- Name: film_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY films_film_categories
    ADD CONSTRAINT film_categories_pkey PRIMARY KEY (film_id, category_id);


--
-- Name: film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY films_film
    ADD CONSTRAINT film_pkey PRIMARY KEY (id);


--
-- Name: inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY store_inventory
    ADD CONSTRAINT inventory_pkey PRIMARY KEY (id);


--
-- Name: language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY films_language
    ADD CONSTRAINT language_pkey PRIMARY KEY (id);


--
-- Name: payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY store_payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (id);


--
-- Name: rental_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY store_rental
    ADD CONSTRAINT rental_pkey PRIMARY KEY (id);


--
-- Name: staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY store_staff
    ADD CONSTRAINT staff_pkey PRIMARY KEY (id);


--
-- Name: store_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY store_store
    ADD CONSTRAINT store_pkey PRIMARY KEY (id);


--
-- Name: idx_actor_last_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_actor_last_name ON films_actor USING btree (last_name);


--
-- Name: idx_fk_address_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_fk_address_id ON store_customer USING btree (address_id);


--
-- Name: idx_fk_city_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_fk_city_id ON store_address USING btree (city_id);


--
-- Name: idx_fk_country_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_fk_country_id ON store_city USING btree (country_id);


--
-- Name: idx_fk_customer_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_fk_customer_id ON store_payment USING btree (customer_id);


--
-- Name: idx_fk_film_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_fk_film_id ON films_film_actors USING btree (film_id);


--
-- Name: idx_fk_inventory_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_fk_inventory_id ON store_rental USING btree (inventory_id);


--
-- Name: idx_fk_language_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_fk_language_id ON films_film USING btree (language_id);


--
-- Name: idx_fk_original_language_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_fk_original_language_id ON films_film USING btree (original_language_id);


--
-- Name: idx_fk_staff_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_fk_staff_id ON store_payment USING btree (staff_id);


--
-- Name: idx_fk_store_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_fk_store_id ON store_customer USING btree (store_id);


--
-- Name: idx_last_name; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_last_name ON store_customer USING btree (last_name);


--
-- Name: idx_store_id_film_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_store_id_film_id ON store_inventory USING btree (store_id, film_id);


--
-- Name: idx_title; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_title ON films_film USING btree (title);


--
-- Name: idx_unq_manager_staff_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX idx_unq_manager_staff_id ON store_store USING btree (manager_staff_id);


--
-- Name: idx_unq_rental_rental_date_inventory_id_customer_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX idx_unq_rental_rental_date_inventory_id_customer_id ON store_rental USING btree (rental_date, inventory_id, customer_id);


--
-- Name: address_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY store_address
    ADD CONSTRAINT address_city_id_fkey FOREIGN KEY (city_id) REFERENCES store_city(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: city_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY store_city
    ADD CONSTRAINT city_country_id_fkey FOREIGN KEY (country_id) REFERENCES store_country(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: customer_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY store_customer
    ADD CONSTRAINT customer_address_id_fkey FOREIGN KEY (address_id) REFERENCES store_address(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: customer_store_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY store_customer
    ADD CONSTRAINT customer_store_id_fkey FOREIGN KEY (store_id) REFERENCES store_store(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: film_actors_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films_film_actors
    ADD CONSTRAINT film_actors_id_fkey FOREIGN KEY (actor_id) REFERENCES films_actor(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: film_actors_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films_film_actors
    ADD CONSTRAINT film_actors_film_id_fkey FOREIGN KEY (film_id) REFERENCES films_film(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: film_categories_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films_film_categories
    ADD CONSTRAINT film_categories_id_fkey FOREIGN KEY (category_id) REFERENCES films_category(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: film_categories_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films_film_categories
    ADD CONSTRAINT film_categories_film_id_fkey FOREIGN KEY (film_id) REFERENCES films_film(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: film_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films_film
    ADD CONSTRAINT film_language_id_fkey FOREIGN KEY (language_id) REFERENCES films_language(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: film_original_language_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY films_film
    ADD CONSTRAINT film_original_language_id_fkey FOREIGN KEY (original_language_id) REFERENCES films_language(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: inventory_film_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY store_inventory
    ADD CONSTRAINT inventory_film_id_fkey FOREIGN KEY (film_id) REFERENCES films_film(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: inventory_store_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY store_inventory
    ADD CONSTRAINT inventory_store_id_fkey FOREIGN KEY (store_id) REFERENCES store_store(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: payment_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY store_payment
    ADD CONSTRAINT payment_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES store_customer(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: payment_rental_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY store_payment
    ADD CONSTRAINT payment_rental_id_fkey FOREIGN KEY (rental_id) REFERENCES store_rental(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: payment_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY store_payment
    ADD CONSTRAINT payment_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES store_staff(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: rental_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY store_rental
    ADD CONSTRAINT rental_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES store_customer(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: rental_inventory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY store_rental
    ADD CONSTRAINT rental_inventory_id_fkey FOREIGN KEY (inventory_id) REFERENCES store_inventory(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: rental_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY store_rental
    ADD CONSTRAINT rental_staff_id_fkey FOREIGN KEY (staff_id) REFERENCES store_staff(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: staff_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY store_staff
    ADD CONSTRAINT staff_address_id_fkey FOREIGN KEY (address_id) REFERENCES store_address(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: staff_store_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY store_staff
    ADD CONSTRAINT staff_store_id_fkey FOREIGN KEY (store_id) REFERENCES store_store(id);


--
-- Name: store_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY store_store
    ADD CONSTRAINT store_address_id_fkey FOREIGN KEY (address_id) REFERENCES store_address(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: store_manager_staff_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY store_store
    ADD CONSTRAINT store_manager_staff_id_fkey FOREIGN KEY (manager_staff_id) REFERENCES store_staff(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

