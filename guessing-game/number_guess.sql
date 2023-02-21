--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    username character varying(22),
    score integer,
    r integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.games.game_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (3512, 'user_1676956460764', 860, 859);
INSERT INTO public.games VALUES (3517, 'user_1676956460764', 123, 122);
INSERT INTO public.games VALUES (3500, 'user_1676956247248', 504, 503);
INSERT INTO public.games VALUES (3505, 'user_1676956305646', 622, 621);
INSERT INTO public.games VALUES (3510, 'user_1676956305646', 247, 246);
INSERT INTO public.games VALUES (3513, 'user_1676956460764', 894, 893);
INSERT INTO public.games VALUES (3518, 'user_1676956460764', 742, 741);
INSERT INTO public.games VALUES (3501, 'user_1676956247248', 119, 118);
INSERT INTO public.games VALUES (3506, 'user_1676956305646', 457, 456);
INSERT INTO public.games VALUES (3511, 'user_1676956305646', 323, 322);
INSERT INTO public.games VALUES (3514, 'user_1676956460763', 302, 301);
INSERT INTO public.games VALUES (3502, 'user_1676956247249', 402, 399);
INSERT INTO public.games VALUES (3507, 'user_1676956305645', 358, 357);
INSERT INTO public.games VALUES (3515, 'user_1676956460763', 35, 34);
INSERT INTO public.games VALUES (3498, 'user_1676956247249', 740, 739);
INSERT INTO public.games VALUES (3503, 'user_1676956247249', 843, 842);
INSERT INTO public.games VALUES (3508, 'user_1676956305645', 879, 878);
INSERT INTO public.games VALUES (3516, 'user_1676956460764', 879, 876);
INSERT INTO public.games VALUES (3499, 'user_1676956247249', 111, 110);
INSERT INTO public.games VALUES (3504, 'user_1676956247249', 744, 743);
INSERT INTO public.games VALUES (3509, 'user_1676956305646', 307, 304);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 3518, true);


--
-- Name: games users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT users_pkey PRIMARY KEY (game_id);


--
-- PostgreSQL database dump complete
--

