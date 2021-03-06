PGDMP         $                 x            api    12.1    12.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16422    api    DATABASE     ?   CREATE DATABASE api WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Polish_Poland.1250' LC_CTYPE = 'Polish_Poland.1250';
    DROP DATABASE api;
                me    false                        2615    16501    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                me    false            ?            1259    16502    pokoje    TABLE     ?   CREATE TABLE public.pokoje (
    p integer,
    pietro integer NOT NULL,
    s integer NOT NULL,
    dostepnosc boolean NOT NULL
);
    DROP TABLE public.pokoje;
       public         heap    me    false    6            ?            1259    16505 
   rezerwacje    TABLE     ?   CREATE TABLE public.rezerwacje (
    imie character varying(30) NOT NULL,
    nazwisko character varying(30) NOT NULL,
    p integer NOT NULL,
    r integer NOT NULL
);
    DROP TABLE public.rezerwacje;
       public         heap    me    false    6            ?            1259    16508    rezerwacje_r_seq    SEQUENCE     ?   CREATE SEQUENCE public.rezerwacje_r_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.rezerwacje_r_seq;
       public          me    false    6    203                       0    0    rezerwacje_r_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.rezerwacje_r_seq OWNED BY public.rezerwacje.r;
          public          me    false    204            ?            1259    16510 	   standardy    TABLE     ?   CREATE TABLE public.standardy (
    malzenskie boolean,
    "ilosc lozek pojedynczych" integer NOT NULL,
    "cena/dobe" integer NOT NULL,
    nazwa character varying(50),
    opis character varying(256),
    s integer NOT NULL
);
    DROP TABLE public.standardy;
       public         heap    me    false    6            ?            1259    16513    standardy_s_seq    SEQUENCE     ?   CREATE SEQUENCE public.standardy_s_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.standardy_s_seq;
       public          me    false    6    205                       0    0    standardy_s_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.standardy_s_seq OWNED BY public.standardy.s;
          public          me    false    206            ?
           2604    16515    rezerwacje r    DEFAULT     l   ALTER TABLE ONLY public.rezerwacje ALTER COLUMN r SET DEFAULT nextval('public.rezerwacje_r_seq'::regclass);
 ;   ALTER TABLE public.rezerwacje ALTER COLUMN r DROP DEFAULT;
       public          me    false    204    203            ?
           2604    16516    standardy s    DEFAULT     j   ALTER TABLE ONLY public.standardy ALTER COLUMN s SET DEFAULT nextval('public.standardy_s_seq'::regclass);
 :   ALTER TABLE public.standardy ALTER COLUMN s DROP DEFAULT;
       public          me    false    206    205                      0    16502    pokoje 
   TABLE DATA           :   COPY public.pokoje (p, pietro, s, dostepnosc) FROM stdin;
    public          me    false    202   ?                 0    16505 
   rezerwacje 
   TABLE DATA           :   COPY public.rezerwacje (imie, nazwisko, p, r) FROM stdin;
    public          me    false    203   L                 0    16510 	   standardy 
   TABLE DATA           h   COPY public.standardy (malzenskie, "ilosc lozek pojedynczych", "cena/dobe", nazwa, opis, s) FROM stdin;
    public          me    false    205   ~                   0    0    rezerwacje_r_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.rezerwacje_r_seq', 161, true);
          public          me    false    204            !           0    0    standardy_s_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.standardy_s_seq', 6, true);
          public          me    false    206            ?
           2606    16537    rezerwacje p_unique 
   CONSTRAINT     K   ALTER TABLE ONLY public.rezerwacje
    ADD CONSTRAINT p_unique UNIQUE (p);
 =   ALTER TABLE ONLY public.rezerwacje DROP CONSTRAINT p_unique;
       public            me    false    203            ?
           2606    16518    pokoje pokoje_p.id_key 
   CONSTRAINT     P   ALTER TABLE ONLY public.pokoje
    ADD CONSTRAINT "pokoje_p.id_key" UNIQUE (p);
 B   ALTER TABLE ONLY public.pokoje DROP CONSTRAINT "pokoje_p.id_key";
       public            me    false    202            ?
           2606    16520    rezerwacje rezerwacje_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.rezerwacje
    ADD CONSTRAINT rezerwacje_pkey PRIMARY KEY (r);
 D   ALTER TABLE ONLY public.rezerwacje DROP CONSTRAINT rezerwacje_pkey;
       public            me    false    203            ?
           2606    16522    standardy standardy_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.standardy
    ADD CONSTRAINT standardy_pkey PRIMARY KEY (s);
 B   ALTER TABLE ONLY public.standardy DROP CONSTRAINT standardy_pkey;
       public            me    false    205            ?
           2606    16529    rezerwacje pokoj_key    FK CONSTRAINT     m   ALTER TABLE ONLY public.rezerwacje
    ADD CONSTRAINT pokoj_key FOREIGN KEY (p) REFERENCES public.pokoje(p);
 >   ALTER TABLE ONLY public.rezerwacje DROP CONSTRAINT pokoj_key;
       public          me    false    203    2700    202            ?
           2606    16524    pokoje standard_key    FK CONSTRAINT     o   ALTER TABLE ONLY public.pokoje
    ADD CONSTRAINT standard_key FOREIGN KEY (s) REFERENCES public.standardy(s);
 =   ALTER TABLE ONLY public.pokoje DROP CONSTRAINT standard_key;
       public          me    false    2706    205    202               }   x?=??C!Ϧ????wN?"?n;??!??????b/?P?B????CN:F\C??).?!?5???\rse1?q[S??S?tZ?.???=?6)??7??Yʹ??????n?Fї-??`??|?Z?N0>         "   x???I,M?L????:???????̐+F??? qH?         Z  x???;n1???SLi#?bW??pm?1?H????.G?? ??#??1Ԫ?x/???KE???????????q?exw:lp?d9n?x??;??	?Tv???Ϥ?ڊI*?|]?W??_??g???*jƼ?e?|?oL??^z"yC???5Eʱ??qpa?[?~z?A?i?#?v??첢?b??,?3̪_????=m??G?1i ?V???qP??_[?u?\?m?O*??????????a?3h|	?ˌ?/??&IO???h?c-?+]5?C{???`???0?[?#?#ý];??b??&Lw~?-?'2??e,.^,?ɡ?;Y??`E)????YWU??W?5     