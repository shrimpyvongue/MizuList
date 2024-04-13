--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

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
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Book" (
    id text NOT NULL,
    pages text,
    chapters text,
    "Description" text,
    "amazonUrl" text,
    authors text,
    "bookID" text,
    "coverUrl" text,
    format text,
    isbn text,
    views integer,
    "englishTitle" text,
    "nativeTitle" text,
    "firstPublished" timestamp(3) without time zone,
    "romanizedTitle" text,
    "ratingCount" integer,
    "publicRating" double precision,
    publisher text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public."Book" OWNER TO postgres;

--
-- Name: BookCategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."BookCategory" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."BookCategory" OWNER TO postgres;

--
-- Name: BookCategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."BookCategory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."BookCategory_id_seq" OWNER TO postgres;

--
-- Name: BookCategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."BookCategory_id_seq" OWNED BY public."BookCategory".id;


--
-- Name: Comment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Comment" (
    id text NOT NULL,
    text text NOT NULL,
    "userID" text NOT NULL,
    "statusId" text,
    "activityId" text,
    "forumThreadId" text
);


ALTER TABLE public."Comment" OWNER TO postgres;

--
-- Name: DisLike; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DisLike" (
    "recommendationId" text,
    id text NOT NULL,
    "userId" text
);


ALTER TABLE public."DisLike" OWNER TO postgres;

--
-- Name: Favorite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Favorite" (
    id text NOT NULL,
    "bookID" text NOT NULL
);


ALTER TABLE public."Favorite" OWNER TO postgres;

--
-- Name: Genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Genres" (
    id integer NOT NULL,
    label text NOT NULL
);


ALTER TABLE public."Genres" OWNER TO postgres;

--
-- Name: Genres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Genres_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Genres_id_seq" OWNER TO postgres;

--
-- Name: Genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Genres_id_seq" OWNED BY public."Genres".id;


--
-- Name: Like; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Like" (
    "statusId" text,
    "activityId" text,
    "recommendationId" text,
    "commentID" text,
    id text NOT NULL,
    "userId" text
);


ALTER TABLE public."Like" OWNER TO postgres;

--
-- Name: Recommendation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Recommendation" (
    id text NOT NULL,
    "book1Id" text NOT NULL,
    "book2Id" text NOT NULL
);


ALTER TABLE public."Recommendation" OWNER TO postgres;

--
-- Name: Roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Roles" (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Roles" OWNER TO postgres;

--
-- Name: Roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Roles_id_seq" OWNER TO postgres;

--
-- Name: Roles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Roles_id_seq" OWNED BY public."Roles".id;


--
-- Name: Series; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Series" (
    id text NOT NULL,
    name text NOT NULL,
    description text
);


ALTER TABLE public."Series" OWNER TO postgres;

--
-- Name: SeriesBook; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SeriesBook" (
    "seriesID" text NOT NULL,
    "bookID" text NOT NULL,
    "order" text
);


ALTER TABLE public."SeriesBook" OWNER TO postgres;

--
-- Name: Tag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Tag" (
    id integer NOT NULL,
    "Tag" text NOT NULL
);


ALTER TABLE public."Tag" OWNER TO postgres;

--
-- Name: Tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Tag_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Tag_id_seq" OWNER TO postgres;

--
-- Name: Tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Tag_id_seq" OWNED BY public."Tag".id;


--
-- Name: Thread; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Thread" (
    id text NOT NULL,
    title text NOT NULL,
    views integer,
    "threadBody" text
);


ALTER TABLE public."Thread" OWNER TO postgres;

--
-- Name: ThreadCategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ThreadCategory" (
    id integer NOT NULL,
    name text,
    color text
);


ALTER TABLE public."ThreadCategory" OWNER TO postgres;

--
-- Name: ThreadCategory_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ThreadCategory_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ThreadCategory_id_seq" OWNER TO postgres;

--
-- Name: ThreadCategory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ThreadCategory_id_seq" OWNED BY public."ThreadCategory".id;


--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    id text NOT NULL,
    username text NOT NULL,
    "passwordHash" text NOT NULL,
    "userAuthToken" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL,
    avatar text,
    bio text,
    "roleID" integer NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: UserBook; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserBook" (
    id text NOT NULL,
    "userID" text NOT NULL,
    "bookID" text NOT NULL,
    rating text,
    rereads integer,
    notes text,
    "startedDate" timestamp(3) without time zone,
    "lastUpdated" timestamp(3) without time zone,
    "completedAt" timestamp(3) without time zone,
    "chaptersRead" text,
    "pagesRead" text
);


ALTER TABLE public."UserBook" OWNER TO postgres;

--
-- Name: _BookCategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_BookCategory" (
    "B" text NOT NULL,
    "A" integer NOT NULL
);


ALTER TABLE public."_BookCategory" OWNER TO postgres;

--
-- Name: _BookToGenres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_BookToGenres" (
    "A" text NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public."_BookToGenres" OWNER TO postgres;

--
-- Name: _BookToTag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_BookToTag" (
    "A" text NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public."_BookToTag" OWNER TO postgres;

--
-- Name: _FavoriteToUser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_FavoriteToUser" (
    "A" text NOT NULL,
    "B" text NOT NULL
);


ALTER TABLE public."_FavoriteToUser" OWNER TO postgres;

--
-- Name: _ThreadToThreadCategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_ThreadToThreadCategory" (
    "A" text NOT NULL,
    "B" integer NOT NULL
);


ALTER TABLE public."_ThreadToThreadCategory" OWNER TO postgres;

--
-- Name: _UserBookCategory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_UserBookCategory" (
    "A" integer NOT NULL,
    "B" text NOT NULL
);


ALTER TABLE public."_UserBookCategory" OWNER TO postgres;

--
-- Name: _UserFollows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_UserFollows" (
    "A" text NOT NULL,
    "B" text NOT NULL
);


ALTER TABLE public."_UserFollows" OWNER TO postgres;

--
-- Name: _bookThread; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."_bookThread" (
    "A" text NOT NULL,
    "B" text NOT NULL
);


ALTER TABLE public."_bookThread" OWNER TO postgres;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- Name: activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity (
    id text NOT NULL,
    "timestamp" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    rating text,
    title text,
    chapter text,
    "userID" text,
    "bookID" text NOT NULL,
    "categoryId" integer,
    pages text
);


ALTER TABLE public.activity OWNER TO postgres;

--
-- Name: review; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.review (
    id text NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    review text NOT NULL,
    recommendation text NOT NULL,
    spoiler text NOT NULL,
    rating text,
    title text,
    "userID" text,
    "bookID" text NOT NULL
);


ALTER TABLE public.review OWNER TO postgres;

--
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id text NOT NULL,
    "timestamp" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    text text,
    "userID" text NOT NULL
);


ALTER TABLE public.status OWNER TO postgres;

--
-- Name: BookCategory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BookCategory" ALTER COLUMN id SET DEFAULT nextval('public."BookCategory_id_seq"'::regclass);


--
-- Name: Genres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Genres" ALTER COLUMN id SET DEFAULT nextval('public."Genres_id_seq"'::regclass);


--
-- Name: Roles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles" ALTER COLUMN id SET DEFAULT nextval('public."Roles_id_seq"'::regclass);


--
-- Name: Tag id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tag" ALTER COLUMN id SET DEFAULT nextval('public."Tag_id_seq"'::regclass);


--
-- Name: ThreadCategory id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ThreadCategory" ALTER COLUMN id SET DEFAULT nextval('public."ThreadCategory_id_seq"'::regclass);


--
-- Data for Name: Book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Book" (id, pages, chapters, "Description", "amazonUrl", authors, "bookID", "coverUrl", format, isbn, views, "englishTitle", "nativeTitle", "firstPublished", "romanizedTitle", "ratingCount", "publicRating", publisher, "createdAt") FROM stdin;
5939008097	337	21	Dune Messiah continues the story of Paul Atreides, better known--and feared--as the man christened Muad'Dib. As Emperor of the Known Universe, he possesses more power than a single man was ever meant to wield. Worshipped as a religious icon by the fanatical Fremens, Paul faces the enmity of the political houses he displaced when he assumed the throne--and a conspiracy conducted within his own sphere of influence.\r\n\r\nAnd even as House Atreides begins to crumble around him from the machinations of his enemies, the true threat to Paul comes to his lover, Chani, and the unborn heir to his family's dynasty...	https://amzn.in/d/cvP0ZMR	Frank Herbert	\N	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1577043824i/44492285.jpg	\N	9780593098233	320	Dune Messiah		1969-07-01 00:00:00		0	0	Ace	2024-04-11 14:52:55.27
3253456370	736	137	When a world, renowned scientist is found brutally murdered in a Swiss research facility, a Harvard professor, Robert Langdon, is summoned to identify the mysterious symbol seared onto the dead man's chest. His baffling conclusion: it is the work of the Illuminati, a secret brotherhood presumed extinct for nearly four hundred years - reborn to continue their bitter vendetta against their sworn enemy, the Catholic church.\r\n\r\nIn Rome, the college of cardinals assembles to elect a new pope. Yet somewhere within the walls of the Vatican, an unstoppable bomb of terrifying power relentlessly counts down to oblivion. While the minutes tick away, Langdon joins forces with Vittoria Vetra, a beautiful and mysterious Italian scientist, to decipher the labyrinthine trail of ancient symbols that snakes across Rome to the long-forgotten Illuminati lair - a secret refuge wherein lies the only hope for the Vatican.\r\n\r\nBut with each revelation comes another twist, another turn in the plot, which leaves Langdon and Vetra reeling and at the mercy of a seemingly invisible enemy...	https://read.amazon.in/kp/embed?asin=B0031RSBPU&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_ZG8VQMNAKQ33RYVPM182	Dan Brown	\N	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1696691404i/960.jpg	\N	9781416524793	164	Angels & Demons		2000-01-05 00:00:00		0	0	Pocket Books	2024-04-11 14:52:55.27
4394390205	182		Combining magic, mysticism, wisdom, and wonder into an inspiring tale of self-discovery, The Alchemist has become a modern classic, selling millions of copies around the world and transforming the lives of countless readers across generations.\r\n\r\nPaulo Coelho's masterpiece tells the mystical story of Santiago, an Andalusian shepherd boy who yearns to travel in search of a worldly treasure. His quest will lead him to riches far differentÔÇöand far more satisfyingÔÇöthan he ever imagined. Santiago's journey teaches us about the essential wisdom of listening to our hearts, recognizing opportunity and learning to read the omens strewn along life's path, and, most importantly, following our dreams.	https://read.amazon.in/kp/embed?asin=B00U6SFUSS&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_5GAV11039C9E8JSCHB6E	Paulo Coelho	\N	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1654371463i/18144590.jpg	\N	9780062315007	28	The Alchemist	\t O Alquimista	1988-01-01 00:00:00		\N	\N	HarperOne	2024-04-11 14:52:55.27
5459837503	298	23	A masterpiece of rebellion and imprisonment where war is peace freedom is slavery and Big Brother is watching Thought Police Big Brother Orwellian These words have entered our vocabulary because of George Orwell s classic dystopian novel 1984 The story of one man s nightmare odyssey as he pursues a forbidden love affair through a world ruled by warring states and a power structure that controls not only information but also individual thought and memory 1984 is a prophetic haunting tale More relevant than ever before 1984 exposes the worst crimes imaginable the destruction of truth freedom and individuality With a foreword by Thomas Pynchon With a foreword by Thomas Pynchon A masterpiece of rebellion and imprisonment where war is peace freedom is slavery and Big Brother is watching View our feature on George Orwell s 1984 Thought Police Big Brother Orwellian These words have entered our vocabulary because of George Orwell s classic dystopian novel 1984 The story of one man s nightmare odyssey as he pursues a forbidden love affair through a world ruled by warring states and a power structure that controls not only information but also individual thought and memory 1984 is a prophetic haunting tale More relevant than ever before 1984 exposes the worst crimes imaginable the destruction of truth freedom and individuality This beautiful paperback edition features deckled edges and french flaps a perfect gift for any occasion	https://amzn.in/d/8IrW8zD	George Orwell	\N	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1657781256i/61439040.jpg	\N	9780452284234	17	1984	Nineteen Eighty-Four	1949-06-08 00:00:00		\N	\N	Plume	2024-04-11 18:07:16.293
1704723372	323		'Shoot all the bluejays you want, if you can hit 'em, but remember it's a sin to kill a mockingbird.'\r\n\r\nA lawyer's advice to his children as he defends the real mockingbird of Harper Lee's classic novel - a black man charged with the rape of a white girl. Through the young eyes of Scout and Jem Finch, Harper Lee explores with exuberant humour the irrationality of adult attitudes to race and class in the Deep South of the 1930s. The conscience of a town steeped in prejudice, violence and hypocrisy is pricked by the stamina of one man's struggle for justice. But the weight of history will only tolerate so much.	https://read.amazon.in/kp/embed?asin=B00K1XOV5G&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_AMB5PYMD5AN3CSN2QVWM	Harper Lee	\N	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1437239655i/22024583.jpg	\N	9780062368683	17	To Kill A Mocking Bird		1960-07-11 00:00:00		\N	\N	Harper Perennial Modern Classics	2024-04-11 18:18:13.289
2653200298	658	22	Set on the desert planet Arrakis, Dune is the story of the boy Paul Atreides, heir to a noble family tasked with ruling an inhospitable world where the only thing of value is the ÔÇ£spiceÔÇØ melange, a drug capable of extending life and enhancing consciousness. Coveted across the known universe, melange is a prize worth killing for...\r\n\r\nWhen House Atreides is betrayed, the destruction of PaulÔÇÖs family will set the boy on a journey toward a destiny greater than he could ever have imagined. And as he evolves into the mysterious man known as MuadÔÇÖDib, he will bring to fruition humankindÔÇÖs most ancient and unattainable dream.	https://amzn.in/d/2RxucBe	Frank Herbert	\N	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1555447414i/44767458.jpg	\N	9780593099322	1318	Dune		1965-06-01 00:00:00		2	9	Ace	2024-04-11 14:52:55.27
7420886488	608	12	The Children of Dune are twin siblings Leto and Ghanima Atreides, whose father, the Emperor Paul Muad'Dib, disappeared in the desert wastelands of Arrakis nine years ago. Like their father, the twins possess supernormal abilities--making them valuable to their manipulative aunt Alia, who rules the Empire in the name of House Atreides.\r\n\r\nFacing treason and rebellion on two fronts, Alia's rule is not absolute. The displaced House Corrino is plotting to regain the throne while the fanatical Fremen are being provoked into open revolt by the enigmatic figure known only as The Preacher. Alia believes that by obtaining the secrets of the twins' prophetic visions, she can maintain control over her dynasty.\r\n\r\nBut Leto and Ghanima have their own plans for their visions--and their destinies....	https://read.amazon.in/kp/embed?asin=B004JHY8OY&preview=newtab&linkCode=kpe&ref_=cm_sw_r_kb_dp_CHHF4RWC43RHC5C8JC2B	Frank Herbert	\N	https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1564783201i/44492286.jpg	\N	9780593098240 	297	Children of Dune		1976-04-01 00:00:00		0	0	Ace	2024-04-11 14:52:55.27
\.


--
-- Data for Name: BookCategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."BookCategory" (id, name) FROM stdin;
1	All
2	Reading
3	Plan to Read
4	Paused
5	Dropped
6	Completed
\.


--
-- Data for Name: Comment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Comment" (id, text, "userID", "statusId", "activityId", "forumThreadId") FROM stdin;
\.


--
-- Data for Name: DisLike; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DisLike" ("recommendationId", id, "userId") FROM stdin;
\.


--
-- Data for Name: Favorite; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Favorite" (id, "bookID") FROM stdin;
b64ed805-b7da-4da9-b88c-36f1ed5cfb80	2653200298
\.


--
-- Data for Name: Genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Genres" (id, label) FROM stdin;
1	Fantasy
2	Action
3	Romance
4	Adventure
5	Comedy
6	Drama
7	Thriller
8	Fiction
9	Nonfiction
10	Sci-Fi
11	Slice of Life
12	Sports
13	Horror
14	Mystery
15	Music
16	Psychology
17	Philosophy
18	Paranormal
19	Self Help
20	Crime
21	Biography
22	History
23	Science
24	Travel
25	Historical
26	Young Adult
27	
\.


--
-- Data for Name: Like; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Like" ("statusId", "activityId", "recommendationId", "commentID", id, "userId") FROM stdin;
\N	\N	\N	\N	cluwzcs4c0006it9gq40hxxww	clugooin6000191e9u439wi11
\.


--
-- Data for Name: Recommendation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Recommendation" (id, "book1Id", "book2Id") FROM stdin;
\.


--
-- Data for Name: Roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Roles" (id, name) FROM stdin;
1	MOD
2	USER
\.


--
-- Data for Name: Series; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Series" (id, name, description) FROM stdin;
8155842729	Harry Potter Series	Orphan Harry learns he is a wizard on his 11th birthday when Hagrid escorts him to magic-teaching Hogwarts School. As a baby, his mother's love protected him and vanquished the villain Voldemort, leaving the child famous as "The Boy who Lived." With his friends Hermione and Ron, Harry has to defeat the returned "He Who Must Not Be Named." 
3842707984	Dune	Also known as Dune Saga.
3406710628	Robert Langdon	The Robert Langdon series is a set of books by Dan Brown, which feature the Harvard professor Robert Langdon, and his unplanned journies in which he uncovers plots, secrets and other historic facts.
1685902809	To Kill a Mockingbird Series	
\.


--
-- Data for Name: SeriesBook; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SeriesBook" ("seriesID", "bookID", "order") FROM stdin;
3842707984	2653200298	1
3842707984	5939008097	2
3842707984	7420886488	3
3406710628	3253456370	1
1685902809	1704723372	1
\.


--
-- Data for Name: Tag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Tag" (id, "Tag") FROM stdin;
\.


--
-- Data for Name: Thread; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Thread" (id, title, views, "threadBody") FROM stdin;
4999286238	test	\N	test
8337639676	test	\N	test
\.


--
-- Data for Name: ThreadCategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ThreadCategory" (id, name, color) FROM stdin;
1	General	\N
2	Question	\N
3	News	\N
4	Recommendation	\N
5	Meme	\N
6	Feedback	\N
7	Bug Report	\N
8	Misc	\N
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" (id, username, "passwordHash", "userAuthToken", "createdAt", "updatedAt", avatar, bio, "roleID") FROM stdin;
cluh0bkhx0000aefeqoq9o24f	sayuj	$2b$10$jbkoUELvN/.Td418oBPmoujV68IJMMxvfmKHPxP.BOogw5wmHR7G6	e9c3b65f-e39e-411c-b340-c1325b9b284f	2024-04-01 13:49:40.859	2024-04-12 18:07:05.549	D:\\Projects\\SvelteKit\\Main Project\\Litlog V2\\static\\uploads\\userAvatars\\cluh0bkhx0000aefeqoq9o24f.png	I like novels	2
cluu0n6zw0008nf22hbzwanrj	arjun	$2b$10$xfUWNfkOyZrsg9xBtpFY9e7ekZGKC71zQr3aU/bEvPgvLFwgX93by	e96b522e-8f83-4a6e-8196-3f69df4f0c6a	2024-04-10 16:19:43.533	2024-04-10 16:19:45.317	\N	\N	2
clugooin6000191e9u439wi11	jerry	$2b$10$rkDkwDa00/lSVwEepqUtTeqs2pDoj8K0NGKWPbUw562Pb1lvl0J0O	1228690f-3fd8-4632-bbb1-f5e677d9fe57	2024-04-01 08:23:49.603	2024-04-13 11:37:15.934	D:\\Projects\\SvelteKit\\Main Project\\Litlog V2\\static\\uploads\\userAvatars\\clugooin6000191e9u439wi11.png	\N	2
\.


--
-- Data for Name: UserBook; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UserBook" (id, "userID", "bookID", rating, rereads, notes, "startedDate", "lastUpdated", "completedAt", "chaptersRead", "pagesRead") FROM stdin;
f8c40f26-5bba-48b6-9441-2f12b2378808	cluh0bkhx0000aefeqoq9o24f	3253456370	\N	\N	\N	\N	2024-04-10 16:04:39.784	\N		
1ed20b6c-ee86-4516-b1b8-a7e2cd936727	cluh0bkhx0000aefeqoq9o24f	2653200298	9	\N	\N	\N	2024-03-10 16:04:51.698	\N		
8967d6aa-7d12-4d05-93ca-23c5262669ed	clugooin6000191e9u439wi11	2653200298	\N	\N	\N	\N	2024-04-10 16:19:20.781	\N		
471b7a29-661f-463e-bf1c-a645f114ea8c	cluu0n6zw0008nf22hbzwanrj	7420886488	\N	\N	\N	\N	2024-04-10 16:20:02.825	\N		
2ae69700-e486-473b-becc-a18334770117	cluu0n6zw0008nf22hbzwanrj	3253456370	\N	\N	\N	\N	2024-04-10 16:20:13.218	\N		
caa460d6-f189-4edf-96ca-d2941170eb38	cluh0bkhx0000aefeqoq9o24f	7420886488	\N	\N	\N	\N	2024-04-10 16:20:49.994	\N		
1f68b64e-7396-41f2-8e0c-e507c4bfa1b7	cluh0bkhx0000aefeqoq9o24f	5939008097	\N	\N	\N	\N	2024-04-10 16:27:06.029	\N		
22218e84-effb-41d6-9b15-d8446f5da4b7	clugooin6000191e9u439wi11	5939008097	\N	\N	\N	\N	2024-04-12 08:33:06.13	\N		
32e5d6cb-cd03-41a8-a539-b7a8182bc79c	clugooin6000191e9u439wi11	7420886488	\N	\N	\N	\N	2024-04-12 10:36:38.084	\N	2	
d4086ef7-1975-4bc2-ab49-a9216b55c3a3	clugooin6000191e9u439wi11	3253456370	\N	\N	\N	\N	2024-04-12 10:40:35.102	\N	1	
\.


--
-- Data for Name: _BookCategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_BookCategory" ("B", "A") FROM stdin;
1ed20b6c-ee86-4516-b1b8-a7e2cd936727	1
1f68b64e-7396-41f2-8e0c-e507c4bfa1b7	1
caa460d6-f189-4edf-96ca-d2941170eb38	1
f8c40f26-5bba-48b6-9441-2f12b2378808	1
f8c40f26-5bba-48b6-9441-2f12b2378808	4
1ed20b6c-ee86-4516-b1b8-a7e2cd936727	6
d4086ef7-1975-4bc2-ab49-a9216b55c3a3	1
8967d6aa-7d12-4d05-93ca-23c5262669ed	1
8967d6aa-7d12-4d05-93ca-23c5262669ed	3
471b7a29-661f-463e-bf1c-a645f114ea8c	1
471b7a29-661f-463e-bf1c-a645f114ea8c	6
2ae69700-e486-473b-becc-a18334770117	1
2ae69700-e486-473b-becc-a18334770117	6
caa460d6-f189-4edf-96ca-d2941170eb38	3
1f68b64e-7396-41f2-8e0c-e507c4bfa1b7	3
22218e84-effb-41d6-9b15-d8446f5da4b7	1
22218e84-effb-41d6-9b15-d8446f5da4b7	3
32e5d6cb-cd03-41a8-a539-b7a8182bc79c	1
32e5d6cb-cd03-41a8-a539-b7a8182bc79c	2
d4086ef7-1975-4bc2-ab49-a9216b55c3a3	2
\.


--
-- Data for Name: _BookToGenres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_BookToGenres" ("A", "B") FROM stdin;
2653200298	1
2653200298	8
2653200298	10
5939008097	1
5939008097	8
5939008097	10
7420886488	1
7420886488	8
7420886488	10
3253456370	4
3253456370	7
3253456370	8
3253456370	14
3253456370	20
4394390205	1
4394390205	4
4394390205	8
4394390205	17
4394390205	19
5459837503	1
5459837503	8
5459837503	10
1704723372	8
1704723372	25
1704723372	26
\.


--
-- Data for Name: _BookToTag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_BookToTag" ("A", "B") FROM stdin;
\.


--
-- Data for Name: _FavoriteToUser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_FavoriteToUser" ("A", "B") FROM stdin;
b64ed805-b7da-4da9-b88c-36f1ed5cfb80	cluh0bkhx0000aefeqoq9o24f
b64ed805-b7da-4da9-b88c-36f1ed5cfb80	clugooin6000191e9u439wi11
\.


--
-- Data for Name: _ThreadToThreadCategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_ThreadToThreadCategory" ("A", "B") FROM stdin;
4999286238	1
8337639676	1
\.


--
-- Data for Name: _UserBookCategory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_UserBookCategory" ("A", "B") FROM stdin;
1	clugooin6000191e9u439wi11
2	clugooin6000191e9u439wi11
3	clugooin6000191e9u439wi11
4	clugooin6000191e9u439wi11
5	clugooin6000191e9u439wi11
6	clugooin6000191e9u439wi11
1	cluh0bkhx0000aefeqoq9o24f
2	cluh0bkhx0000aefeqoq9o24f
3	cluh0bkhx0000aefeqoq9o24f
4	cluh0bkhx0000aefeqoq9o24f
5	cluh0bkhx0000aefeqoq9o24f
6	cluh0bkhx0000aefeqoq9o24f
1	cluu0n6zw0008nf22hbzwanrj
2	cluu0n6zw0008nf22hbzwanrj
3	cluu0n6zw0008nf22hbzwanrj
4	cluu0n6zw0008nf22hbzwanrj
5	cluu0n6zw0008nf22hbzwanrj
6	cluu0n6zw0008nf22hbzwanrj
\.


--
-- Data for Name: _UserFollows; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_UserFollows" ("A", "B") FROM stdin;
cluu0n6zw0008nf22hbzwanrj	clugooin6000191e9u439wi11
cluh0bkhx0000aefeqoq9o24f	clugooin6000191e9u439wi11
\.


--
-- Data for Name: _bookThread; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."_bookThread" ("A", "B") FROM stdin;
2653200298	8337639676
\.


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
44ed8cc8-bf55-43e7-8854-1e962fbb45e7	82c3eb8c79449e0dd8e64e51a3f6372442413f78b8eb8a796f9279eeb1a4bb96	2024-03-30 16:58:07.50793+05:30	20240328055159_v2	\N	\N	2024-03-30 16:58:07.416689+05:30	1
08e1807b-f751-4edd-a159-0ce33e5ce213	b0aeca8649621cd41cf5fd0beb03da1da6117e59bc7c837c1266ca90703a54a1	2024-03-30 16:58:16.452895+05:30	20240330112816_rename_genre_to_label	\N	\N	2024-03-30 16:58:16.377108+05:30	1
2c073d05-06fd-4bf7-a482-5ae20965ce8a	473b719f4b3c8109c0dae09862bc4a0a88ad81c136208fd1114cf82fe308db66	2024-03-30 16:58:53.909783+05:30	20240330112853_rename	\N	\N	2024-03-30 16:58:53.906723+05:30	1
a4069146-ed48-4bfb-9e53-0b5037ee8811	5bd7a5fc7778456895a78e0a6053335648021e1c986a719e4fb3456b73b6227a	2024-03-30 16:59:47.91037+05:30	20240330112947_rename_genre_to_label	\N	\N	2024-03-30 16:59:47.906809+05:30	1
\.


--
-- Data for Name: activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.activity (id, "timestamp", rating, title, chapter, "userID", "bookID", "categoryId", pages) FROM stdin;
cluwj4hnx00053qwkmp3c1cdm	2024-04-12 10:32:35.949	\N	Children of Dune	1	clugooin6000191e9u439wi11	7420886488	2	
cluwj9ohs00073qwkof52dr1f	2024-04-12 10:36:38.081	\N	Children of Dune	2	clugooin6000191e9u439wi11	7420886488	2	
cluwjerdl00093qwkakrkxvhn	2024-04-12 10:40:35.098	\N	Angels & Demons	1	clugooin6000191e9u439wi11	3253456370	2	
\.


--
-- Data for Name: review; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.review (id, date, review, recommendation, spoiler, rating, title, "userID", "bookID") FROM stdin;
9c5c37da-d31e-4237-b301-559d4b269397	2024-04-09 11:42:00.035	In my head, the purpose of this review is very clear. It is to convince YOU to read this book. Yes, you! Waste time no more. Go grab a copy.\r\n\r\nMachiavellian intrigue, mythology, religion, politics, imperialism, environmentalism, the nature of power. All this set in a mind-boggling, frighteningly original world which Herbert ominously terms as an "effort at prediction". Dune had me hooked!\r\n\r\nFirst impression\r\n\r\nThe very first stirring I felt upon opening the yellowed pages of Dune was that of stumbling upon an English translation of an ancient Arabic manuscript of undeniable power and potence which had an epic story to narrate. The tone was umistakably sombre and I realized Herbert was not here to merely entertain me, he was here to make me part of the legend of Muad'Dib. It was intriguing and challenging and heck, since I live for challenges I decided to take this one up too, gladly. The challenge was the complexity and depth of the plot, which left me perplexed, in the beginning. I knew there were dialogues which meant much more than their superficial meaning and was unable to grasp at it. I felt a yawning chasm between Herbert's vision and my limited understanding of it. However, of course, I plodded on and could feel the gap closing in with every page much to my joy and relief.\r\n\r\nThe Foreword\r\n\r\n"To the people whose labours go beyond ideas into the realm of 'real materials'- to the dry-land ecologists, wherever they may be, in whatever time they work, this effort at prediction is dedicated in humility and admiration."\r\n\r\nThe foreword makes it pretty clear that Frank Herbert isn't kidding around. This is a serious effort at predicting how our world is going to look two thousand years from now and by God, it's a bloody good and detailed prediction. However, the real merit in this effort lies in the commentary on our lives in the present.\r\n\r\nWhy Frank Herbert is a genius\r\n\r\nThe setting of the book is arid futuristic. the plot is driven by political mind games reminiscent of The Game of Thrones. The issues he tackles are as modern as the colour television. Herbert's genius manifests itself in his ability to combine the past, the present and the future in one sweeping elegant move called Dune.\r\n\r\nPlot and Setting\r\n\r\nDune is set in a futuristic technologically advanced world which after the Butlerian Jihad (the bloody war between Man and Machines) has eliminated all computers and passed a decree declaring "Thou shalt not make a machine in the likeness of a man's mind". Since there are no computers, the essential working of the galaxy is still medieval and feudal with heavy reliance on men and their dallying around. Lots of thriller potential right there. Men with superhuman analytical abilities called Mentats have taken the place of Computers. On the other hand, we have the Bene Gesserit, an ancient school of mental and physical training for female students (it gives them superhuman intuitive powers) who follow a selective breeding program which makes them feared and mistrusted through the Imperium. Their desired end product of this breeding program is the Kwisatz Haderach, a superman whoÔÇÖll be able to glimpse into the future. How heÔÇÖll be able to do this is rooted in HerbertÔÇÖs idea of determinism: given that one can observe everything and analyze everything, one can effectively glimpse the future in probabilistic terms. Quantum physics anyone? The Kwisatz Haderach is the proposed solution to the male-female dichotomy, between the analytical and intuitive.\r\n\r\nThe plot of Dune is almost wholly set on the desert planet of Arrakis (also referred to as Dune), an arid wasteland where water is so scarce that men have to wear stillsuits which recycle human moisture for further consumption. The source of the galaxyÔÇÖs interest in the planet is Melange, a spice which bestows upon one longevity and prescient powers. Everything on the planet is permeated with the spice, the air, the sand, the food. Everybody on the planet is hopelessly addicted to the spice, their only hope for survival being their continued intake of the spice. The Spacing Guild, the economic and trading monopolistic arm of the Galaxy badly needs the spice for interstellar transport. This is because their frigates travel faster than the speed of light and hence travel backward in time. The spice is the only way they can look into the future and see their way ahead. How cool is that! All the powers on the Galaxy are out to mine the spice, braving the sandworms, their name merely an euphemism, for they are gigantic 200 metre long creatures which always come digging through the sand whenever spice mining is undertook. Always. ThereÔÇÖs also another little glitch. There exist on the planet, the kickass native desert tribal Fremen, whom the foreign powers look down with suspicion and disdain. The Fremen ethos is one of survival and scarcity, driven by tribalism and egalitarianism. Okay, IÔÇÖll stop right there. No more spoilers about this. Except that they value water to the extent that spitting on a person is the highest honour they can bestow upon him.\r\n\r\nOur protagonists are the Atreides family, consisting of the Duke, his Bene Gesserit concubine Jessica and their son Paul, who have been entrusted the stewardship of Arrakis. We discover the alien planet of Arrakis along with them, firstly with fear, suspicion and wonder and ultimately, love and respect. Paul MuadÔÇÖDib, however is no ordinary prince. ThereÔÇÖs a teeny weeny chance he might be the Kwisatz Haderach, something which troubles him constantly and gives us our conflicted hero. The poor chap trips balls over the spice and has visions of black hordes pillaging and murdering around town bearing his flag and sees his dead body multiple times.\r\n\r\nMy favourite character, however has to be the Baron Vladmir Harkonnen, the most evil character IÔÇÖve ever come across in my literary excursions. He is ruddy ruthlessness, he is virile villainy, he is truculent treachery. He executes the inept chess players in his employ which says oodles about his badassery and his fondness for cold-blooded logic. He sees everything in simplistic chess terms. What is my best move? What is my opponentÔÇÖs best move? Is there anything I can do to completely squash his move? Is there a tactic which leads to mate in three?\r\n\r\nThemes\r\n\r\nIn this setting, Herbert does so much, itÔÇÖs unbelievable. Religion, politics, the dynamic nature of power, the effects of colonialism, our blatant destruction of our environment are themes which run parallel to the intensely exciting and labyrinthine plot. He shows the paramount importance of myth making and religion for power to sustain over long periods of time. Man, as a political animal is laid completely bare.\r\n\r\nReal life\r\n\r\nNow these are my thoughts about what Herbert could have meant to be Arrakis-\r\n\r\ndescription\r\n\r\nIt makes perfect sense. Herbert draws heavy inspiration for the religious ideology of MuadÔÇÖDib from Islam. He says ÔÇ£When religion and politics ride in the same cart and that cart is driven by a living Holy man, nothing can stand in the path of such a people.ÔÇØ which is the philosphy of the politics of Islam. Islamism in a nutshell.\r\n\r\nThe spice, much desired by everyone, is the oil. Baron Vladmir Harkonnen is symblomatic of the wily Russians. The Desert foxes Fremen are representative of the native Saudi desert-dwelling Bedouin tribe who have a strongly tribe-oriented culture and undoubtedly value water in equal measure. And the ultimate loser is the environment.\r\n\r\nWhy do good books get over?\r\n\r\nI almost forget this is a science fiction novel, itÔÇÖs that real. It is also scary and prophetic. It is a reading experience that will leave you dreaming of the grave emptiness of Arrakis and make you wish you were there to brave it all in the privileged company of the noble Fremen. Frank Herbert achieves the pinnacle of what a sci-fi author aspires to rise to; authentic world building.	Recommended	false	9	\N	clugooin6000191e9u439wi11	2653200298
\.


--
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.status (id, "timestamp", text, "userID") FROM stdin;
1c013f77-e031-4e90-a51e-3c76e59aa4a1	2024-04-12 10:57:12.92	Hello	clugooin6000191e9u439wi11
\.


--
-- Name: BookCategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."BookCategory_id_seq"', 6, true);


--
-- Name: Genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Genres_id_seq"', 27, true);


--
-- Name: Roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Roles_id_seq"', 2, true);


--
-- Name: Tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Tag_id_seq"', 1, false);


--
-- Name: ThreadCategory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ThreadCategory_id_seq"', 8, true);


--
-- Name: BookCategory BookCategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."BookCategory"
    ADD CONSTRAINT "BookCategory_pkey" PRIMARY KEY (id);


--
-- Name: Book Book_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Book"
    ADD CONSTRAINT "Book_pkey" PRIMARY KEY (id);


--
-- Name: Comment Comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "Comment_pkey" PRIMARY KEY (id);


--
-- Name: DisLike DisLike_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DisLike"
    ADD CONSTRAINT "DisLike_pkey" PRIMARY KEY (id);


--
-- Name: Favorite Favorite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Favorite"
    ADD CONSTRAINT "Favorite_pkey" PRIMARY KEY (id);


--
-- Name: Genres Genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Genres"
    ADD CONSTRAINT "Genres_pkey" PRIMARY KEY (id);


--
-- Name: Like Like_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Like"
    ADD CONSTRAINT "Like_pkey" PRIMARY KEY (id);


--
-- Name: Recommendation Recommendation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recommendation"
    ADD CONSTRAINT "Recommendation_pkey" PRIMARY KEY (id);


--
-- Name: Roles Roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);


--
-- Name: SeriesBook SeriesBook_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SeriesBook"
    ADD CONSTRAINT "SeriesBook_pkey" PRIMARY KEY ("bookID", "seriesID");


--
-- Name: Series Series_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Series"
    ADD CONSTRAINT "Series_pkey" PRIMARY KEY (id);


--
-- Name: Tag Tag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Tag"
    ADD CONSTRAINT "Tag_pkey" PRIMARY KEY (id);


--
-- Name: ThreadCategory ThreadCategory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ThreadCategory"
    ADD CONSTRAINT "ThreadCategory_pkey" PRIMARY KEY (id);


--
-- Name: Thread Thread_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Thread"
    ADD CONSTRAINT "Thread_pkey" PRIMARY KEY (id);


--
-- Name: UserBook UserBook_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserBook"
    ADD CONSTRAINT "UserBook_pkey" PRIMARY KEY (id);


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: activity activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_pkey PRIMARY KEY (id);


--
-- Name: review review_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT review_pkey PRIMARY KEY (id);


--
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- Name: BookCategory_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "BookCategory_name_key" ON public."BookCategory" USING btree (name);


--
-- Name: Roles_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Roles_name_key" ON public."Roles" USING btree (name);


--
-- Name: Series_name_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "Series_name_key" ON public."Series" USING btree (name);


--
-- Name: UserBook_userID_bookID_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "UserBook_userID_bookID_key" ON public."UserBook" USING btree ("userID", "bookID");


--
-- Name: User_userAuthToken_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_userAuthToken_key" ON public."User" USING btree ("userAuthToken");


--
-- Name: User_username_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "User_username_key" ON public."User" USING btree (username);


--
-- Name: _BookCategory_AB_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "_BookCategory_AB_unique" ON public."_BookCategory" USING btree ("A", "B");


--
-- Name: _BookCategory_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_BookCategory_B_index" ON public."_BookCategory" USING btree ("B");


--
-- Name: _BookToGenres_AB_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "_BookToGenres_AB_unique" ON public."_BookToGenres" USING btree ("A", "B");


--
-- Name: _BookToGenres_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_BookToGenres_B_index" ON public."_BookToGenres" USING btree ("B");


--
-- Name: _BookToTag_AB_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "_BookToTag_AB_unique" ON public."_BookToTag" USING btree ("A", "B");


--
-- Name: _BookToTag_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_BookToTag_B_index" ON public."_BookToTag" USING btree ("B");


--
-- Name: _FavoriteToUser_AB_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "_FavoriteToUser_AB_unique" ON public."_FavoriteToUser" USING btree ("A", "B");


--
-- Name: _FavoriteToUser_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_FavoriteToUser_B_index" ON public."_FavoriteToUser" USING btree ("B");


--
-- Name: _ThreadToThreadCategory_AB_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "_ThreadToThreadCategory_AB_unique" ON public."_ThreadToThreadCategory" USING btree ("A", "B");


--
-- Name: _ThreadToThreadCategory_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_ThreadToThreadCategory_B_index" ON public."_ThreadToThreadCategory" USING btree ("B");


--
-- Name: _UserBookCategory_AB_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "_UserBookCategory_AB_unique" ON public."_UserBookCategory" USING btree ("A", "B");


--
-- Name: _UserBookCategory_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_UserBookCategory_B_index" ON public."_UserBookCategory" USING btree ("B");


--
-- Name: _UserFollows_AB_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "_UserFollows_AB_unique" ON public."_UserFollows" USING btree ("A", "B");


--
-- Name: _UserFollows_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_UserFollows_B_index" ON public."_UserFollows" USING btree ("B");


--
-- Name: _bookThread_AB_unique; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "_bookThread_AB_unique" ON public."_bookThread" USING btree ("A", "B");


--
-- Name: _bookThread_B_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "_bookThread_B_index" ON public."_bookThread" USING btree ("B");


--
-- Name: Comment Comment_activityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "Comment_activityId_fkey" FOREIGN KEY ("activityId") REFERENCES public.activity(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Comment Comment_forumThreadId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "Comment_forumThreadId_fkey" FOREIGN KEY ("forumThreadId") REFERENCES public."Thread"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Comment Comment_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "Comment_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public.status(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Comment Comment_userID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Comment"
    ADD CONSTRAINT "Comment_userID_fkey" FOREIGN KEY ("userID") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: DisLike DisLike_recommendationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DisLike"
    ADD CONSTRAINT "DisLike_recommendationId_fkey" FOREIGN KEY ("recommendationId") REFERENCES public."Recommendation"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: DisLike DisLike_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DisLike"
    ADD CONSTRAINT "DisLike_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Favorite Favorite_bookID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Favorite"
    ADD CONSTRAINT "Favorite_bookID_fkey" FOREIGN KEY ("bookID") REFERENCES public."Book"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: Like Like_activityId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Like"
    ADD CONSTRAINT "Like_activityId_fkey" FOREIGN KEY ("activityId") REFERENCES public.activity(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Like Like_commentID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Like"
    ADD CONSTRAINT "Like_commentID_fkey" FOREIGN KEY ("commentID") REFERENCES public."Comment"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Like Like_recommendationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Like"
    ADD CONSTRAINT "Like_recommendationId_fkey" FOREIGN KEY ("recommendationId") REFERENCES public."Recommendation"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Like Like_statusId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Like"
    ADD CONSTRAINT "Like_statusId_fkey" FOREIGN KEY ("statusId") REFERENCES public.status(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Like Like_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Like"
    ADD CONSTRAINT "Like_userId_fkey" FOREIGN KEY ("userId") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: Recommendation Recommendation_book1Id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recommendation"
    ADD CONSTRAINT "Recommendation_book1Id_fkey" FOREIGN KEY ("book1Id") REFERENCES public."Book"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: Recommendation Recommendation_book2Id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Recommendation"
    ADD CONSTRAINT "Recommendation_book2Id_fkey" FOREIGN KEY ("book2Id") REFERENCES public."Book"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SeriesBook SeriesBook_bookID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SeriesBook"
    ADD CONSTRAINT "SeriesBook_bookID_fkey" FOREIGN KEY ("bookID") REFERENCES public."Book"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: SeriesBook SeriesBook_seriesID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SeriesBook"
    ADD CONSTRAINT "SeriesBook_seriesID_fkey" FOREIGN KEY ("seriesID") REFERENCES public."Series"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: UserBook UserBook_bookID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserBook"
    ADD CONSTRAINT "UserBook_bookID_fkey" FOREIGN KEY ("bookID") REFERENCES public."Book"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: UserBook UserBook_userID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserBook"
    ADD CONSTRAINT "UserBook_userID_fkey" FOREIGN KEY ("userID") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: User User_roleID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_roleID_fkey" FOREIGN KEY ("roleID") REFERENCES public."Roles"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: _BookCategory _BookCategory_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_BookCategory"
    ADD CONSTRAINT "_BookCategory_A_fkey" FOREIGN KEY ("A") REFERENCES public."BookCategory"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _BookCategory _BookCategory_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_BookCategory"
    ADD CONSTRAINT "_BookCategory_B_fkey" FOREIGN KEY ("B") REFERENCES public."UserBook"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _BookToGenres _BookToGenres_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_BookToGenres"
    ADD CONSTRAINT "_BookToGenres_A_fkey" FOREIGN KEY ("A") REFERENCES public."Book"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _BookToGenres _BookToGenres_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_BookToGenres"
    ADD CONSTRAINT "_BookToGenres_B_fkey" FOREIGN KEY ("B") REFERENCES public."Genres"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _BookToTag _BookToTag_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_BookToTag"
    ADD CONSTRAINT "_BookToTag_A_fkey" FOREIGN KEY ("A") REFERENCES public."Book"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _BookToTag _BookToTag_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_BookToTag"
    ADD CONSTRAINT "_BookToTag_B_fkey" FOREIGN KEY ("B") REFERENCES public."Tag"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _FavoriteToUser _FavoriteToUser_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_FavoriteToUser"
    ADD CONSTRAINT "_FavoriteToUser_A_fkey" FOREIGN KEY ("A") REFERENCES public."Favorite"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _FavoriteToUser _FavoriteToUser_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_FavoriteToUser"
    ADD CONSTRAINT "_FavoriteToUser_B_fkey" FOREIGN KEY ("B") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _ThreadToThreadCategory _ThreadToThreadCategory_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_ThreadToThreadCategory"
    ADD CONSTRAINT "_ThreadToThreadCategory_A_fkey" FOREIGN KEY ("A") REFERENCES public."Thread"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _ThreadToThreadCategory _ThreadToThreadCategory_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_ThreadToThreadCategory"
    ADD CONSTRAINT "_ThreadToThreadCategory_B_fkey" FOREIGN KEY ("B") REFERENCES public."ThreadCategory"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _UserBookCategory _UserBookCategory_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_UserBookCategory"
    ADD CONSTRAINT "_UserBookCategory_A_fkey" FOREIGN KEY ("A") REFERENCES public."BookCategory"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _UserBookCategory _UserBookCategory_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_UserBookCategory"
    ADD CONSTRAINT "_UserBookCategory_B_fkey" FOREIGN KEY ("B") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _UserFollows _UserFollows_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_UserFollows"
    ADD CONSTRAINT "_UserFollows_A_fkey" FOREIGN KEY ("A") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _UserFollows _UserFollows_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_UserFollows"
    ADD CONSTRAINT "_UserFollows_B_fkey" FOREIGN KEY ("B") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _bookThread _bookThread_A_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_bookThread"
    ADD CONSTRAINT "_bookThread_A_fkey" FOREIGN KEY ("A") REFERENCES public."Book"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: _bookThread _bookThread_B_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."_bookThread"
    ADD CONSTRAINT "_bookThread_B_fkey" FOREIGN KEY ("B") REFERENCES public."Thread"(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: activity activity_bookID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT "activity_bookID_fkey" FOREIGN KEY ("bookID") REFERENCES public."Book"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: activity activity_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT "activity_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public."BookCategory"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: activity activity_userID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT "activity_userID_fkey" FOREIGN KEY ("userID") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: review review_bookID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT "review_bookID_fkey" FOREIGN KEY ("bookID") REFERENCES public."Book"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: review review_userID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.review
    ADD CONSTRAINT "review_userID_fkey" FOREIGN KEY ("userID") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: status status_userID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT "status_userID_fkey" FOREIGN KEY ("userID") REFERENCES public."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

