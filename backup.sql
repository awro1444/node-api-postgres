PGDMP          "                 x            api    12.1    12.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16422    api    DATABASE     �   CREATE DATABASE api WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Polish_Poland.1250' LC_CTYPE = 'Polish_Poland.1250';
    DROP DATABASE api;
                me    false            �            1259    16443    pokoje    TABLE     �   CREATE TABLE public.pokoje (
    "p.id" integer,
    pietro integer NOT NULL,
    "s.sid" integer NOT NULL,
    dostepnosc boolean NOT NULL
);
    DROP TABLE public.pokoje;
       public         heap    me    false            �            1259    16423 
   rezerwacje    TABLE     �   CREATE TABLE public.rezerwacje (
    r integer,
    imie character varying(30) NOT NULL,
    nazwisko character varying(30) NOT NULL,
    p integer NOT NULL
);
    DROP TABLE public.rezerwacje;
       public         heap    me    false            �            1259    16448 	   standardy    TABLE     �   CREATE TABLE public.standardy (
    "s.sid" integer NOT NULL,
    malzenskie boolean,
    "ilosc lozek pojedynczych" integer NOT NULL,
    "cena/dobe" integer NOT NULL
);
    DROP TABLE public.standardy;
       public         heap    me    false            
          0    16443    pokoje 
   TABLE DATA           E   COPY public.pokoje ("p.id", pietro, "s.sid", dostepnosc) FROM stdin;
    public          me    false    203          	          0    16423 
   rezerwacje 
   TABLE DATA           :   COPY public.rezerwacje (r, imie, nazwisko, p) FROM stdin;
    public          me    false    202   %                 0    16448 	   standardy 
   TABLE DATA           a   COPY public.standardy ("s.sid", malzenskie, "ilosc lozek pojedynczych", "cena/dobe") FROM stdin;
    public          me    false    204   W       �
           2606    16447    pokoje pokoje_p.id_key 
   CONSTRAINT     U   ALTER TABLE ONLY public.pokoje
    ADD CONSTRAINT "pokoje_p.id_key" UNIQUE ("p.id");
 B   ALTER TABLE ONLY public.pokoje DROP CONSTRAINT "pokoje_p.id_key";
       public            me    false    203            �
           2606    16427    rezerwacje rezerwacje_r.id_key 
   CONSTRAINT     X   ALTER TABLE ONLY public.rezerwacje
    ADD CONSTRAINT "rezerwacje_r.id_key" UNIQUE (r);
 J   ALTER TABLE ONLY public.rezerwacje DROP CONSTRAINT "rezerwacje_r.id_key";
       public            me    false    202            �
           2606    16452    standardy standardy_s.sid_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.standardy
    ADD CONSTRAINT "standardy_s.sid_key" UNIQUE ("s.sid");
 I   ALTER TABLE ONLY public.standardy DROP CONSTRAINT "standardy_s.sid_key";
       public            me    false    204            
      x������ � �      	   "   x�3�ʯJ��K�t�O�J,�424������ i��            x������ � �     