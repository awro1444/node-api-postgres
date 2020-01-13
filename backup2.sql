PGDMP     "    2                  x            api    12.1    12.1                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16422    api    DATABASE     �   CREATE DATABASE api WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Polish_Poland.1250' LC_CTYPE = 'Polish_Poland.1250';
    DROP DATABASE api;
                me    false            �            1259    16443    pokoje    TABLE     �   CREATE TABLE public.pokoje (
    p integer,
    pietro integer NOT NULL,
    s integer NOT NULL,
    dostepnosc boolean NOT NULL
);
    DROP TABLE public.pokoje;
       public         heap    me    false            �            1259    16423 
   rezerwacje    TABLE     �   CREATE TABLE public.rezerwacje (
    imie character varying(30) NOT NULL,
    nazwisko character varying(30) NOT NULL,
    p integer NOT NULL,
    r integer NOT NULL
);
    DROP TABLE public.rezerwacje;
       public         heap    me    false            �            1259    16491    rezerwacje_r_seq    SEQUENCE     �   CREATE SEQUENCE public.rezerwacje_r_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.rezerwacje_r_seq;
       public          me    false    202                       0    0    rezerwacje_r_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.rezerwacje_r_seq OWNED BY public.rezerwacje.r;
          public          me    false    206            �            1259    16448 	   standardy    TABLE     �   CREATE TABLE public.standardy (
    malzenskie boolean,
    "ilosc lozek pojedynczych" integer NOT NULL,
    "cena/dobe" integer NOT NULL,
    nazwa character varying(50),
    opis character varying(256),
    s integer NOT NULL
);
    DROP TABLE public.standardy;
       public         heap    me    false            �            1259    16473    standardy_s_seq    SEQUENCE     �   CREATE SEQUENCE public.standardy_s_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.standardy_s_seq;
       public          me    false    204                       0    0    standardy_s_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.standardy_s_seq OWNED BY public.standardy.s;
          public          me    false    205            �
           2604    16493    rezerwacje r    DEFAULT     l   ALTER TABLE ONLY public.rezerwacje ALTER COLUMN r SET DEFAULT nextval('public.rezerwacje_r_seq'::regclass);
 ;   ALTER TABLE public.rezerwacje ALTER COLUMN r DROP DEFAULT;
       public          me    false    206    202            �
           2604    16475    standardy s    DEFAULT     j   ALTER TABLE ONLY public.standardy ALTER COLUMN s SET DEFAULT nextval('public.standardy_s_seq'::regclass);
 :   ALTER TABLE public.standardy ALTER COLUMN s DROP DEFAULT;
       public          me    false    205    204                      0    16443    pokoje 
   TABLE DATA           :   COPY public.pokoje (p, pietro, s, dostepnosc) FROM stdin;
    public          me    false    203   =                 0    16423 
   rezerwacje 
   TABLE DATA           :   COPY public.rezerwacje (imie, nazwisko, p, r) FROM stdin;
    public          me    false    202   �                 0    16448 	   standardy 
   TABLE DATA           h   COPY public.standardy (malzenskie, "ilosc lozek pojedynczych", "cena/dobe", nazwa, opis, s) FROM stdin;
    public          me    false    204   �                  0    0    rezerwacje_r_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.rezerwacje_r_seq', 12, true);
          public          me    false    206                       0    0    standardy_s_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.standardy_s_seq', 6, true);
          public          me    false    205            �
           2606    16447    pokoje pokoje_p.id_key 
   CONSTRAINT     P   ALTER TABLE ONLY public.pokoje
    ADD CONSTRAINT "pokoje_p.id_key" UNIQUE (p);
 B   ALTER TABLE ONLY public.pokoje DROP CONSTRAINT "pokoje_p.id_key";
       public            me    false    203            �
           2606    16495    rezerwacje rezerwacje_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.rezerwacje
    ADD CONSTRAINT rezerwacje_pkey PRIMARY KEY (r);
 D   ALTER TABLE ONLY public.rezerwacje DROP CONSTRAINT rezerwacje_pkey;
       public            me    false    202            �
           2606    16477    standardy standardy_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.standardy
    ADD CONSTRAINT standardy_pkey PRIMARY KEY (s);
 B   ALTER TABLE ONLY public.standardy DROP CONSTRAINT standardy_pkey;
       public            me    false    204               ^   x�=��	 1Eѵ3$~R͔1�3��ȅ�Y[�l��,C��(�H�+C��(��+C��ȫ�{ː�@9�*zMː�@9�U��-C���}T�70L         +   x�ʯJ��K�t�O�J,�420�44�
�"j�UԈ+F��� ��         \  x���;n1���SLi��bW��pm�1�H��c��.G�� ��#��1Ԫ�x��q��sE�����������q�exw:lp�d9n�x��;��	�Tv���Ǥ�؊I*�|Y�g��_��g���*jƼ�e�\��z���H�P0�eM�r�lb\�ֲ�^�zZ�ȸ]/��(���$K����	Z����g�����bL�����<�[ٯ-����.��6��t�K�R��xs�0׌����2����D���� �-�XG����JW�B��^7�5XyCc�_��#ý];��b��&Lw~�-�'2�⟱��,~[��C���
<}��R��c�XWU����E     