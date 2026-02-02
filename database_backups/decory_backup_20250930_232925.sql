--
-- PostgreSQL database dump
--

\restrict 5QkzqC4TQ5dFwNCLt9iAsgvN8IhVokC9BOAKrsLYA46Lg43wvDXhBUNs4dYsIPA

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS "products_categoryId_fkey";
ALTER TABLE IF EXISTS ONLY public.orders DROP CONSTRAINT IF EXISTS "orders_userId_fkey";
ALTER TABLE IF EXISTS ONLY public.order_items DROP CONSTRAINT IF EXISTS "order_items_productId_fkey";
ALTER TABLE IF EXISTS ONLY public.order_items DROP CONSTRAINT IF EXISTS "order_items_orderId_fkey";
ALTER TABLE IF EXISTS ONLY public.images DROP CONSTRAINT IF EXISTS "images_productId_fkey";
DROP INDEX IF EXISTS public.users_email_key;
DROP INDEX IF EXISTS public."order_items_orderId_productId_key";
DROP INDEX IF EXISTS public.categories_name_key;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS products_pkey;
ALTER TABLE IF EXISTS ONLY public.orders DROP CONSTRAINT IF EXISTS orders_pkey;
ALTER TABLE IF EXISTS ONLY public.order_items DROP CONSTRAINT IF EXISTS order_items_pkey;
ALTER TABLE IF EXISTS ONLY public.images DROP CONSTRAINT IF EXISTS images_pkey;
ALTER TABLE IF EXISTS ONLY public.categories DROP CONSTRAINT IF EXISTS categories_pkey;
ALTER TABLE IF EXISTS ONLY public._prisma_migrations DROP CONSTRAINT IF EXISTS _prisma_migrations_pkey;
DROP TABLE IF EXISTS public.users;
DROP TABLE IF EXISTS public.products;
DROP TABLE IF EXISTS public.orders;
DROP TABLE IF EXISTS public.order_items;
DROP TABLE IF EXISTS public.images;
DROP TABLE IF EXISTS public.categories;
DROP TABLE IF EXISTS public._prisma_migrations;
DROP TYPE IF EXISTS public."UserRole";
DROP TYPE IF EXISTS public."PaymentStatus";
DROP TYPE IF EXISTS public."OrderStatus";
--
-- Name: OrderStatus; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."OrderStatus" AS ENUM (
    'PENDING',
    'CONFIRMED',
    'PROCESSING',
    'SHIPPED',
    'DELIVERED',
    'CANCELLED'
);


--
-- Name: PaymentStatus; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."PaymentStatus" AS ENUM (
    'PENDING',
    'PAID',
    'FAILED',
    'REFUNDED'
);


--
-- Name: UserRole; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public."UserRole" AS ENUM (
    'ADMIN',
    'CLIENT'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: -
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


--
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id text NOT NULL,
    name text NOT NULL,
    description text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: images; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.images (
    id text NOT NULL,
    url text NOT NULL,
    alt text NOT NULL,
    "productId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.order_items (
    id text NOT NULL,
    "orderId" text NOT NULL,
    "productId" text NOT NULL,
    quantity integer NOT NULL,
    price double precision NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    id text NOT NULL,
    "userId" text NOT NULL,
    status public."OrderStatus" DEFAULT 'PENDING'::public."OrderStatus" NOT NULL,
    "totalAmount" double precision NOT NULL,
    "shippingAddress" text NOT NULL,
    "billingAddress" text NOT NULL,
    "paymentMethod" text NOT NULL,
    "paymentStatus" public."PaymentStatus" DEFAULT 'PENDING'::public."PaymentStatus" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    id text NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    price double precision NOT NULL,
    stock integer DEFAULT 0 NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    "categoryId" text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    role public."UserRole" DEFAULT 'CLIENT'::public."UserRole" NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "updatedAt" timestamp(3) without time zone NOT NULL
);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.categories (id, name, description, "createdAt", "updatedAt") FROM stdin;
cmfzc1u3j0002y7unri9cj4gq	Leather Products	Premium engraved leather items including wallets, belts, and accessories	2025-09-25 11:31:42.368	2025-09-25 11:31:42.368
cmfzc1u3o0003y7unx9wntede	Wood Products	Handcrafted laser-engraved wooden items and decorative pieces	2025-09-25 11:31:42.372	2025-09-25 11:31:42.372
cmfzc1u3p0004y7unxuki667s	Accessories	Custom engraved accessories and personalized gifts	2025-09-25 11:31:42.374	2025-09-25 11:31:42.374
cmg25phe60016y7ad6dp6bi3i	Gear Deco	Unique wall art crafted with CO₂ laser precision, inspired by motors, gears, and mechanical design.	2025-09-27 10:57:26.863	2025-09-27 10:57:26.863
cmg25rxc9001dy7adh4y6rz2e	Anime Deco	Laser-engraved wall art bringing your favorite anime worlds to life with stunning CO₂ craftsmanship.	2025-09-27 10:59:20.841	2025-09-27 10:59:20.841
cmg25tkso001gy7adoo6rxmuy	Room Deco	Elegant CO₂ laser wall art designed to elevate salons, bedrooms, and personal spaces with style.	2025-09-27 11:00:37.896	2025-09-27 11:00:37.896
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.images (id, url, alt, "productId", "createdAt") FROM stdin;
cmfzz62uk0003y75arhlzftn5	https://i.pinimg.com/1200x/7a/65/62/7a6562cfa7b2911343c4e7e58a2068bd.jpg	My Happy Place	cmfzz43jz0001y75ad5wnw16u	2025-09-25 22:18:51.501
cmfzz62uk0004y75aoorj69w2	https://i.pinimg.com/1200x/7a/65/62/7a6562cfa7b2911343c4e7e58a2068bd.jpg	My Happy Place	cmfzz43jz0001y75ad5wnw16u	2025-09-25 22:18:51.501
cmg1axtfc000hy7adrkaxl2sz	https://dokenzmen.com/Tibo/images/decory/stitch.png	Wood Clock	cmg1axtfc000gy7adfxet2ari	2025-09-26 20:36:07.609
cmg1az7dy000ky7adenjhmknh	https://dokenzmen.com/Tibo/images/decory/woodpanel.png	Wooden Slat Wall Panel	cmg1az7dy000jy7adjeprtrdq	2025-09-26 20:37:12.358
cmg1eo9kn000ny7adisdtzsw3	https://dokenzmen.com/Tibo/images/decory/guitar.avif	Art mural guitare 3D	cmg1eo9kn000my7ad28yi27mj	2025-09-26 22:20:40.439
cmg1f37x9000zy7ad1auqu6l0	https://dokenzmen.com/Tibo/images/decory/brayent.avif	Kobe Bryant	cmg1f37x9000yy7adwjwpkykf	2025-09-26 22:32:18.141
cmg25pvsu0017y7adlzbb3j9w	https://dokenzmen.com/Tibo/images/decory/ninja.avif	Moto Ninja	cmg1exxc2000sy7adrg5th6v8	2025-09-27 10:57:45.534
cmg25q31r0018y7admz6kkdkx	https://dokenzmen.com/Tibo/images/decory/lamborgini.png	Lamborghini Wood Wall Art	cmg1aqgrf0007y7admj0l3n24	2025-09-27 10:57:54.927
cmg25qbcj0019y7adv8abb93p	https://dokenzmen.com/Tibo/images/decory/porche911.png	Porsche 911 Wood Wall Art	cmg1auecp000dy7adtf6lh6uq	2025-09-27 10:58:05.683
cmg25qs9w001by7ad3ymf6wgt	https://dokenzmen.com/Tibo/images/decory/bmwwatch.png	BMW Wood Car Clock	cmg1amg900001y7adxf58wec2	2025-09-27 10:58:27.621
cmg25qzt4001cy7adi56s8mrg	https://dokenzmen.com/Tibo/images/decory/bmw.png	BMW Green	cmg1adeuf0006y75ak572w6dz	2025-09-27 10:58:37.385
cmg25s8cn001ey7adaacgdeta	https://dokenzmen.com/Tibo/images/decory/stitch03.avif	Stitch 3D Alien Shadow Box Wall Art	cmg1f6f0z0011y7adc20oe7r3	2025-09-27 10:59:35.111
cmg25sgq4001fy7adqzx881ye	https://dokenzmen.com/Tibo/images/decory/onepeace.png	One Piece Wood Wall Art	cmg1asgs0000ay7admypoho3f	2025-09-27 10:59:45.964
cmg25ttr8001hy7ad562tgi4q	https://dokenzmen.com/Tibo/images/decory/tiger.webp	Wild Tiger 3D	cmg1f8vqa0014y7ad8pl3ayem	2025-09-27 11:00:49.508
cmg25u20w001iy7adqgwas9dx	https://dokenzmen.com/Tibo/images/decory/yingyang.webp	Yin Yang	cmg1f0n9u000vy7adbihxaxxy	2025-09-27 11:01:00.224
cmg25u7fg001jy7adc8j5fuz8	https://dokenzmen.com/Tibo/images/decory/kiss.webp	panneau Couple d'arbres	cmg1etpdo000py7adi5h9gprp	2025-09-27 11:01:07.228
cmg3lfz390001y7lyrp0t6ujd	https://dokenzmen.com/Tibo/images/decory/gclass.png	G-Class Automotive	cmg1aor8v0004y7ad76esjei4	2025-09-28 11:05:43.27
cmg56m9o70002y7z8l3p8cf0h	https://dokenzmen.com/Tibo/images/decory/eagle.jpg	Eagle wall art	cmg56m9o60001y7z8dy272t4h	2025-09-29 13:46:15.03
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.order_items (id, "orderId", "productId", quantity, price, "createdAt") FROM stdin;
cmg3kcu5p0003y7fj1os04cln	cmg3kcu5p0001y7fja1kjd86d	cmg1f0n9u000vy7adbihxaxxy	1	79	2025-09-28 10:35:17.292
cmg3kcu5p0004y7fjo7bqxg4f	cmg3kcu5p0001y7fja1kjd86d	cmg1eo9kn000my7ad28yi27mj	1	99	2025-09-28 10:35:17.292
cmg3ljvgt0005y7lyzfs9j0dn	cmg3ljvgt0003y7ly7m1k8po5	cmg1etpdo000py7adi5h9gprp	1	139	2025-09-28 11:08:45.197
cmg3ljvgt0006y7lyi38mism0	cmg3ljvgt0003y7ly7m1k8po5	cmg1auecp000dy7adtf6lh6uq	1	88.9	2025-09-28 11:08:45.197
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders (id, "userId", status, "totalAmount", "shippingAddress", "billingAddress", "paymentMethod", "paymentStatus", "createdAt", "updatedAt") FROM stdin;
cmg3kcu5p0001y7fja1kjd86d	cmfzc1tw50000y7un04o10q9i	DELIVERED	178	Hhj66, Sousse, 4000	Hhj66, Sousse, 4000	CASH_ON_DELIVERY	PAID	2025-09-28 10:35:17.292	2025-09-28 10:52:27.637
cmg3ljvgt0003y7ly7m1k8po5	cmg3l5g890000y7ly0xf1qg7w	DELIVERED	227.9	Hhj66, Sousse, 4000	Hhj66, Sousse, 4000	CASH_ON_DELIVERY	PAID	2025-09-28 11:08:45.197	2025-09-28 11:10:18.032
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products (id, name, description, price, stock, "isActive", "categoryId", "createdAt", "updatedAt") FROM stdin;
cmfzz43jz0001y75ad5wnw16u	My Happy Place	My Happy Placewood cercle good for each home	49.8	10	t	cmfzc1u3o0003y7unx9wntede	2025-09-25 22:17:19.103	2025-09-25 22:18:51.501
cmg1amg900001y7adxf58wec2	BMW Wood Car Clock	Stylish wooden wall clock with a detailed BMW green car engraving. Combines elegant craftsmanship with a modern automotive touch. Perfect décor for car enthusiasts, living rooms, or offices.	88.98	3	t	cmg25phe60016y7ad6dp6bi3i	2025-09-26 20:27:17.316	2025-09-27 10:58:27.621
cmg1axtfc000gy7adfxet2ari	Wood Clock	Crafted from natural wood with a smooth, warm grain, this clock brings a touch of rustic elegance to any room	99	3	t	cmfzc1u3o0003y7unx9wntede	2025-09-26 20:36:07.609	2025-09-26 20:36:07.609
cmg1az7dy000jy7adjeprtrdq	Wooden Slat Wall Panel	Add a touch of natural elegance with this wooden slat wall panel. Crafted from durable wood, it offers a sleek, modern design that complements various interior styles. Ideal for enhancing living rooms, offices, or creating feature walls with a minimalist aesthetic.	78.9	3	t	cmfzc1u3o0003y7unx9wntede	2025-09-26 20:37:12.358	2025-09-26 20:37:12.358
cmg1f37x9000yy7adwjwpkykf	Kobe Bryant	Art mural LED en métal sur le thème de Kobe Bryant - Décoration murale lumineuse NBA Legend, affiches de sport personnalisées et décoration d'intérieur moderne pour les fans de basket-ball	129	3	t	cmfzc1u3o0003y7unx9wntede	2025-09-26 22:32:18.141	2025-09-26 22:32:18.141
cmg1exxc2000sy7adrg5th6v8	Moto Ninja	Stylish 3D motorcycle wall art panel for a modern bedroom or living space.\nCrafted from layered wood for depth and visual impact.\nEnhance your décor with optional LED backlighting for a dynamic, eye-catching effect.	89	2	t	cmg25phe60016y7ad6dp6bi3i	2025-09-26 22:28:11.139	2025-09-27 10:57:45.534
cmg1aqgrf0007y7admj0l3n24	Lamborghini Wood Wall Art	Elegant wooden wall décor featuring the iconic Lamborghini design in fine detail. A perfect fusion of luxury automotive style and handcrafted artistry. Adds a bold, modern touch to any living room, office, or showroom.	98.9	10	t	cmg25phe60016y7ad6dp6bi3i	2025-09-26 20:30:24.603	2025-09-27 10:57:54.927
cmg56m9o60001y7z8dy272t4h	Eagle wall art	back to haven	76.9	4	t	cmg25rxc9001dy7adh4y6rz2e	2025-09-29 13:46:15.03	2025-09-29 13:46:15.03
cmg1adeuf0006y75ak572w6dz	BMW Green	A finely crafted wooden engraving of a BMW, highlighted with a sleek green finish. The mix of natural wood texture and vibrant green detailing captures the elegance and power of BMW design, making it a standout decorative piece for collectors and car enthusiasts.	78.9	1	t	cmg25phe60016y7ad6dp6bi3i	2025-09-26 20:20:15.591	2025-09-27 10:58:37.385
cmg1f6f0z0011y7adc20oe7r3	Stitch 3D Alien Shadow Box Wall Art	Colorful layered 3D wall art featuring a playful blue alien (Stitch) design.\nPerfect for creating a fun, cartoon-inspired décor piece for any room.\nAdds depth and charm, ideal as a standout decorative element or shadow box display.	88	2	t	cmg25rxc9001dy7adh4y6rz2e	2025-09-26 22:34:47.315	2025-09-27 10:59:35.111
cmg1asgs0000ay7admypoho3f	One Piece Wood Wall Art	Wooden wall décor with an iconic One Piece skull-and-bones design laser-etched for a bold, anime-inspired look. Combines the warmth of natural wood with striking fan art style. Perfect for bedrooms, studios, or any space for manga lovers.	259.9	2	t	cmg25rxc9001dy7adh4y6rz2e	2025-09-26 20:31:57.937	2025-09-27 10:59:45.964
cmg1f8vqa0014y7ad8pl3ayem	Wild Tiger 3D	Stunning multi-layered tiger wall art that brings the power and beauty of the wild into your space.\nCrafted for laser or CNC cutting, perfect for wood, metal, or acrylic décor.\nAdds a bold and artistic touch to any room, office, or living space.	112	2	t	cmg25tkso001gy7adoo6rxmuy	2025-09-26 22:36:42.274	2025-09-27 11:00:49.508
cmg1f0n9u000vy7adbihxaxxy	Yin Yang	Striking multi-layered laser-cut wall art featuring a Yin Yang design.\nCrafted for depth and visual elegance, perfect for modern décor.\nAdds a harmonious and artistic touch to any room or office space.	79	2	t	cmg25tkso001gy7adoo6rxmuy	2025-09-26 22:30:18.066	2025-09-28 10:35:17.326
cmg1eo9kn000my7ad28yi27mj	Art mural guitare 3D	Flowing Muse – Art mural guitare 3D découpé au laser | Conception de mandala musical | Fichier en couches complexe pour lasers et machines CNC	99	1	t	cmfzc1u3o0003y7unx9wntede	2025-09-26 22:20:40.439	2025-09-28 10:35:17.33
cmg1aor8v0004y7ad76esjei4	G-Class Automotive	Showcase your passion for off-road luxury with this wooden wall art featuring a bold G-Class car silhouette. Crafted from natural wood, it blends rugged automotive character with warm, organic texture. Ideal for car lovers’ rooms, garages, or stylish living spaces.	99.7	10	t	cmg25phe60016y7ad6dp6bi3i	2025-09-26 20:29:04.88	2025-09-28 11:05:43.27
cmg1etpdo000py7adi5h9gprp	panneau Couple d'arbres	Elegant tree wall art featuring a man and woman silhouette, perfect for romantic or nature-themed décor.\nCompatible with laser, CNC, and forge cutting for wood, metal, or acrylic.\nIdeal for home decoration, gifts, or custom craft projects.	139	1	t	cmg25tkso001gy7adoo6rxmuy	2025-09-26 22:24:54.205	2025-09-28 11:08:45.206
cmg1auecp000dy7adtf6lh6uq	Porsche 911 Wood Wall Art	Stylish wooden wall décor featuring a finely detailed silhouette of the Porsche 911. Merges automotive sophistication with natural wood texture and artisanal craftsmanship. Perfect for car enthusiasts who want a sleek, eye-catching piece in their space.	88.9	9	t	cmg25phe60016y7ad6dp6bi3i	2025-09-26 20:33:28.106	2025-09-28 11:08:45.208
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users (id, email, password, "firstName", "lastName", role, "createdAt", "updatedAt") FROM stdin;
cmfzc1tw50000y7un04o10q9i	admin@decory.com	$2b$12$Wn6FpDNwyut6Jt11rGPAm.1s/GchHOXIkc3l.A34xN6kNiSsVTiiu	Admin	User	ADMIN	2025-09-25 11:31:42.101	2025-09-25 11:31:42.101
cmg3l5g890000y7ly0xf1qg7w	maram@aziza.com	$2b$12$qSOpYCfvYjVu6.Y6pPH0iOzLsRHXK1Ttc3JlV9NGZc6ewaLi3asgG	maram	ben aziza	CLIENT	2025-09-28 10:57:32.265	2025-09-28 10:57:32.265
\.


--
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: categories_name_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX categories_name_key ON public.categories USING btree (name);


--
-- Name: order_items_orderId_productId_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "order_items_orderId_productId_key" ON public.order_items USING btree ("orderId", "productId");


--
-- Name: users_email_key; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);


--
-- Name: images images_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT "images_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_items order_items_orderId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT "order_items_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_items order_items_productId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT "order_items_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orders orders_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: products products_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict 5QkzqC4TQ5dFwNCLt9iAsgvN8IhVokC9BOAKrsLYA46Lg43wvDXhBUNs4dYsIPA

