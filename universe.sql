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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    constellation character varying(30),
    origin_of_name text,
    notes text
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
    name character varying(30) NOT NULL,
    planet_id integer,
    numeral integer,
    mean_radius_km numeric(7,3)
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
    name character varying(30) NOT NULL,
    star_id integer,
    planet_types_id integer,
    has_moon boolean,
    has_life boolean
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
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_types_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_types_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    distance_ly numeric(6,2),
    type character varying(20),
    planets integer
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
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_types_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Sagittarius', 'The appearance from Earth of the galaxy—a band of light', 'The galaxy containing the Sun and its Solar System, and therefore Earth.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda', 'Andromeda, which is shortened from Andromeda Galaxy, gets its name from the area of the sky in which it appears, the constellation of Andromeda.', 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda.');
INSERT INTO public.galaxy VALUES (3, 'Antennae', 'Corvus', 'Appearance is similar to an insects antennae.', 'Two colliding galaxies');
INSERT INTO public.galaxy VALUES (4, 'Backward', 'Centaurus', 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation.', NULL);
INSERT INTO public.galaxy VALUES (5, 'Bear Paw', 'Lynx', 'It resembles the appearance of a bears claw.', 'Also known as Bear Claw Galaxy');
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'Coma Berenices', 'It has a spectacular dark band of absorbing dust infront of the galaxys bright nucleus.', 'Also known as the Sleeping Beauty Galaxy.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1, 1738.000);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 1, 11.267);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 2, 6.200);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1, 1821.600);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 2, 1560.800);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 3, 2634.100);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4, 2410.300);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 5, 83.500);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 6, 69.800);
INSERT INTO public.moon VALUES (10, 'Elara', 5, 7, 43.000);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 5, 8, 30.000);
INSERT INTO public.moon VALUES (12, 'Sinope', 5, 9, 19.000);
INSERT INTO public.moon VALUES (13, 'Lysithea', 5, 10, 18.000);
INSERT INTO public.moon VALUES (14, 'Carme', 5, 11, 23.000);
INSERT INTO public.moon VALUES (15, 'Ananke', 5, 12, 14.000);
INSERT INTO public.moon VALUES (16, 'Leda', 5, 13, 10.000);
INSERT INTO public.moon VALUES (17, 'Thebe', 5, 14, 49.300);
INSERT INTO public.moon VALUES (18, 'Adrastea', 5, 15, 8.200);
INSERT INTO public.moon VALUES (19, 'Metis', 5, 16, 21.500);
INSERT INTO public.moon VALUES (20, 'Callirrhoe', 5, 17, 4.500);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, 'Venus', 1, 6, false, false);
INSERT INTO public.planet VALUES (1, 'Mercury', 1, 7, false, false);
INSERT INTO public.planet VALUES (10, 'Kepler 1704b', 2, 1, false, false);
INSERT INTO public.planet VALUES (11, 'Kepler 138d', 3, 4, false, false);
INSERT INTO public.planet VALUES (12, 'Kepler 10b', 4, 5, false, false);
INSERT INTO public.planet VALUES (4, 'Mars', 1, NULL, true, false);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 2, true, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, NULL, true, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 3, true, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 3, true, false);
INSERT INTO public.planet VALUES (13, 'HR 8799 e', 5, 1, false, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 6, true, true);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Super-Jupiter', 'An astronomical object thats more massive than the planet Jupiter.');
INSERT INTO public.planet_types VALUES (2, 'Giant Planet', 'A massive planet. They are most commonly composed primarily of gas hydrogen and helium or ices volatiles such as water, methane, and ammonia, but may also be composed primarily of rock, which would make one a Mega Earth. Regardless of their bulk compositions, giant planets normally have thick atmospheres of hydrogen and helium.');
INSERT INTO public.planet_types VALUES (3, 'Neptunian Planet', 'Planets of mass similar to Uranus or Neptune smaller than the gas giants but still much larger than Earth.');
INSERT INTO public.planet_types VALUES (4, 'Mini-Neptune', 'Also known as a gas dwarf or transitional planet. A planet up to 10 Earth masses, but less massive than Uranus and Neptune. Mini-Neptunes have thick hydrogen–helium atmospheres, probably with deep layers of ice, rock or liquid oceans (made of water, ammonia, a mixture of both, or heavier volatiles).');
INSERT INTO public.planet_types VALUES (5, 'Super-Earth', 'An extrasolar planet with a mass higher than Earths, but substantially below the mass of the Solar Systems smaller gas giants Uranus and Neptune, which are 14.5 and 17.1 Earth masses respectively.');
INSERT INTO public.planet_types VALUES (6, 'Earth', 'Earth');
INSERT INTO public.planet_types VALUES (7, 'Sub-Earth', 'A classification of planets "substantially less massive" than Earth and Venus.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 0.00, 'Yellow', 8);
INSERT INTO public.star VALUES (2, 'Kepler 1704', 1, 2792.22, 'Yellow', 1);
INSERT INTO public.star VALUES (3, 'Kepler 138', 1, 219.00, 'Red Dwarf', 3);
INSERT INTO public.star VALUES (4, 'Kepler 10', 1, 607.00, 'Yellow', 3);
INSERT INTO public.star VALUES (5, 'HR 8799', 1, 133.30, 'Main-sequence', 4);
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 1, 4.25, 'Flare', 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planet_types_planet_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_types_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


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
-- Name: planet_types planet_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_name_key UNIQUE (name);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_types_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_types_id_fkey FOREIGN KEY (planet_types_id) REFERENCES public.planet_types(planet_types_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--