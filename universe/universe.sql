--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: black_hole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.black_hole (
    black_hole_id integer NOT NULL,
    name character varying(255) NOT NULL,
    mass_solar_masses numeric(15,6) NOT NULL,
    event_horizon_radius_km integer NOT NULL,
    type text,
    is_supermassive boolean
);


ALTER TABLE public.black_hole OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.black_hole_black_hole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.black_hole_black_hole_id_seq OWNER TO freecodecamp;

--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.black_hole_black_hole_id_seq OWNED BY public.black_hole.black_hole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    num_stars integer NOT NULL,
    distance_light_years integer NOT NULL,
    redshift numeric(10,6),
    description text,
    has_active_galactic_nucleus boolean,
    is_spiral boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    orbital_period_days integer NOT NULL,
    surface_gravity_g numeric(5,3),
    composition text,
    has_atmosphere boolean,
    is_tidal_locked boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    num_moons integer NOT NULL,
    orbital_period_days integer NOT NULL,
    average_temperature_celsius numeric(6,2),
    description text,
    has_rings boolean,
    is_habitable boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_million_years integer NOT NULL,
    mass_solar_masses numeric(10,4),
    spectral_type text,
    is_main_sequence boolean,
    has_planets boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: black_hole black_hole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole ALTER COLUMN black_hole_id SET DEFAULT nextval('public.black_hole_black_hole_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: black_hole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.black_hole VALUES (1, 'Sgr A*', 4.300000, 12, 'Supermassive', true);
INSERT INTO public.black_hole VALUES (2, 'Cygnus X-1', 21.200000, 62, 'Stellar', false);
INSERT INTO public.black_hole VALUES (3, 'M87*', 6.500000, 19, 'Supermassive', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 200, 0, 0.000000, 'Our home galaxy.', true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 100, 2, 0.000000, 'Closest large galaxy.', true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40, 3, 0.000000, 'A small spiral.', false, true);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 150, 5, 0.010000, 'Giant elliptical galaxy.', true, false);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 70, 2, 0.000000, 'Interacting spiral.', false, true);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 90, 3, 0.000000, 'Unbarred spiral.', true, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, 27, 0.160, 'Rock', false, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, 0, 0.000, 'Rock', false, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, 1, 0.000, 'Rock', false, true);
INSERT INTO public.moon VALUES (4, 'Io', 3, 3643, 2, 0.180, 'Volcanic', true, true);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 3121, 3, 0.130, 'Ice', true, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5262, 7, 0.140, 'Ice/Rock', true, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4821, 16, 0.120, 'Ice/Rock', false, true);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 5149, 15, 0.130, 'Ice/Rock', true, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 1527, 4, 0.020, 'Ice', false, true);
INSERT INTO public.moon VALUES (10, 'Iapetus', 4, 1470, 79, 0.020, 'Ice', false, true);
INSERT INTO public.moon VALUES (11, 'Triton', 5, 2706, 5, 0.070, 'Ice', true, true);
INSERT INTO public.moon VALUES (12, 'Nereid', 5, 357, 360, 0.000, 'Rock', false, false);
INSERT INTO public.moon VALUES (13, 'Mimas', 4, 396, 0, 0.000, 'Ice', false, true);
INSERT INTO public.moon VALUES (14, 'Enceladus', 4, 504, 1, 0.010, 'Ice', true, true);
INSERT INTO public.moon VALUES (15, 'Tethys', 4, 1062, 1, 0.010, 'Ice', false, true);
INSERT INTO public.moon VALUES (16, 'Dione', 4, 1123, 2, 0.020, 'Ice/Rock', false, true);
INSERT INTO public.moon VALUES (17, 'Miranda', 1, 471, 1, 0.000, 'Ice/Rock', false, true);
INSERT INTO public.moon VALUES (18, 'Ariel', 1, 1158, 2, 0.020, 'Ice/Rock', false, true);
INSERT INTO public.moon VALUES (19, 'Umbriel', 1, 1169, 4, 0.020, 'Ice/Rock', false, true);
INSERT INTO public.moon VALUES (20, 'Titania', 1, 1578, 8, 0.030, 'Ice/Rock', false, true);
INSERT INTO public.moon VALUES (21, 'Oberon', 1, 1523, 13, 0.030, 'Ice/Rock', false, true);
INSERT INTO public.moon VALUES (22, 'Charon', 1, 1212, 6, 0.020, 'Ice/Rock', false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 1, 365, 15.00, 'Our home planet.', false, true);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 2, 687, -63.00, 'The Red Planet.', false, false);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 4, 4333, -145.00, 'Largest gas giant.', true, false);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 5, 10759, -178.00, 'Planet with rings.', true, false);
INSERT INTO public.planet VALUES (5, 'Neptune', 1, 2, 60190, -201.00, 'Farthest planet.', false, false);
INSERT INTO public.planet VALUES (6, 'Proxima Centauri b', 2, 0, 11, -39.00, 'Potentially rocky exoplanet.', false, true);
INSERT INTO public.planet VALUES (7, 'Proxima Centauri c', 2, 0, 1900, -230.00, 'Candidate super-Earth.', false, false);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri Bb', 4, 0, 3, 1200.00, 'Very hot exoplanet.', false, false);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 1, 0, 130, -49.00, 'Earth-size habitable zone planet.', false, true);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1e', 1, 0, 6, 15.00, 'Potentially habitable exoplanet.', false, true);
INSERT INTO public.planet VALUES (11, 'WASP-12b', 1, 0, 1, 2200.00, 'Hot Jupiter.', false, false);
INSERT INTO public.planet VALUES (12, 'HD 209458 b', 1, 0, 3, 1000.00, 'First transiting exoplanet.', false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4, 1.0000, 'G2', true, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 5, 0.1000, 'M5', true, true);
INSERT INTO public.star VALUES (3, 'Sirius A', 1, 0, 2.0000, 'A1', true, false);
INSERT INTO public.star VALUES (4, 'Alpha Centauri A', 1, 6, 1.1000, 'G2', true, true);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 1, 0, 11.6000, 'M1', false, false);
INSERT INTO public.star VALUES (6, 'Rigel', 1, 0, 21.0000, 'B8', false, false);
INSERT INTO public.star VALUES (7, 'Alpheratz', 2, 0, 3.8000, 'B8', true, false);
INSERT INTO public.star VALUES (8, 'Mirach', 2, 0, 3.0000, 'B7', true, false);


--
-- Name: black_hole_black_hole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.black_hole_black_hole_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: black_hole black_hole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_name_key UNIQUE (name);


--
-- Name: black_hole black_hole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.black_hole
    ADD CONSTRAINT black_hole_pkey PRIMARY KEY (black_hole_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

