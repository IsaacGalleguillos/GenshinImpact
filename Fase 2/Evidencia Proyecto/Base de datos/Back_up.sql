PGDMP                   
    |           GenshinImpact    16.4    16.4 ,                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            !           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            "           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            #           1262    16449    GenshinImpact    DATABASE     �   CREATE DATABASE "GenshinImpact" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Chile.1252';
    DROP DATABASE "GenshinImpact";
                postgres    false            �            1259    16573    basicos    TABLE       CREATE TABLE public.basicos (
    id integer NOT NULL,
    id_basico integer NOT NULL,
    id_personaje integer NOT NULL,
    attack_name character varying(255) NOT NULL,
    formula text NOT NULL,
    multiplier numeric(10,4) NOT NULL,
    nivel integer NOT NULL
);
    DROP TABLE public.basicos;
       public         heap    postgres    false            �            1259    16572    basicos_id_seq    SEQUENCE     �   CREATE SEQUENCE public.basicos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.basicos_id_seq;
       public          postgres    false    223            $           0    0    basicos_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.basicos_id_seq OWNED BY public.basicos.id;
          public          postgres    false    222            �            1259    16547 
   definitiva    TABLE     6  CREATE TABLE public.definitiva (
    id_definitiva integer NOT NULL,
    id_personaje integer,
    attack_name character varying(255) NOT NULL,
    formula text NOT NULL,
    multiplier numeric(10,4) NOT NULL,
    nivel integer,
    tipo_ataque character varying(50) DEFAULT 'definitiva'::character varying
);
    DROP TABLE public.definitiva;
       public         heap    postgres    false            �            1259    16546    definitiva_id_definitiva_seq    SEQUENCE     �   CREATE SEQUENCE public.definitiva_id_definitiva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.definitiva_id_definitiva_seq;
       public          postgres    false    220            %           0    0    definitiva_id_definitiva_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.definitiva_id_definitiva_seq OWNED BY public.definitiva.id_definitiva;
          public          postgres    false    219            �            1259    16581    elemental_id_seq    SEQUENCE     y   CREATE SEQUENCE public.elemental_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.elemental_id_seq;
       public          postgres    false            �            1259    16597 	   elemental    TABLE     E  CREATE TABLE public.elemental (
    id integer DEFAULT nextval('public.elemental_id_seq'::regclass) NOT NULL,
    id_elemental integer NOT NULL,
    id_personaje integer NOT NULL,
    attack_name character varying(255) NOT NULL,
    formula text NOT NULL,
    multiplier numeric(10,4) NOT NULL,
    nivel integer NOT NULL
);
    DROP TABLE public.elemental;
       public         heap    postgres    false    224            �            1259    16561    habilidades_personaje    TABLE     �   CREATE TABLE public.habilidades_personaje (
    uid_usuario integer NOT NULL,
    id_personaje integer NOT NULL,
    tipo_ataque character varying(20) NOT NULL,
    id_habilidad integer
);
 )   DROP TABLE public.habilidades_personaje;
       public         heap    postgres    false            �            1259    16494 
   personajes    TABLE     0  CREATE TABLE public.personajes (
    uid integer NOT NULL,
    api character varying(255) NOT NULL,
    "real" character varying(255) NOT NULL,
    imagen_menu character varying(255),
    imagen_personaje character varying(255),
    elemento character varying(50),
    tipo_arma character varying(50)
);
    DROP TABLE public.personajes;
       public         heap    postgres    false            �            1259    16501    personajes_del_usuario    TABLE     t   CREATE TABLE public.personajes_del_usuario (
    uid_usuario integer NOT NULL,
    id_personaje integer NOT NULL
);
 *   DROP TABLE public.personajes_del_usuario;
       public         heap    postgres    false            �            1259    16484    usuarios    TABLE     �   CREATE TABLE public.usuarios (
    uid integer NOT NULL,
    usuario character varying(255) NOT NULL,
    contrasena character varying(255) NOT NULL,
    rol character varying(50) NOT NULL
);
    DROP TABLE public.usuarios;
       public         heap    postgres    false            �            1259    16483    usuarios_uid_seq    SEQUENCE     �   CREATE SEQUENCE public.usuarios_uid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.usuarios_uid_seq;
       public          postgres    false    216            &           0    0    usuarios_uid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.usuarios_uid_seq OWNED BY public.usuarios.uid;
          public          postgres    false    215            n           2604    16576 
   basicos id    DEFAULT     h   ALTER TABLE ONLY public.basicos ALTER COLUMN id SET DEFAULT nextval('public.basicos_id_seq'::regclass);
 9   ALTER TABLE public.basicos ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    223    223            l           2604    16550    definitiva id_definitiva    DEFAULT     �   ALTER TABLE ONLY public.definitiva ALTER COLUMN id_definitiva SET DEFAULT nextval('public.definitiva_id_definitiva_seq'::regclass);
 G   ALTER TABLE public.definitiva ALTER COLUMN id_definitiva DROP DEFAULT;
       public          postgres    false    219    220    220            k           2604    16487    usuarios uid    DEFAULT     l   ALTER TABLE ONLY public.usuarios ALTER COLUMN uid SET DEFAULT nextval('public.usuarios_uid_seq'::regclass);
 ;   ALTER TABLE public.usuarios ALTER COLUMN uid DROP DEFAULT;
       public          postgres    false    215    216    216                      0    16573    basicos 
   TABLE DATA           g   COPY public.basicos (id, id_basico, id_personaje, attack_name, formula, multiplier, nivel) FROM stdin;
    public          postgres    false    223   �6                 0    16547 
   definitiva 
   TABLE DATA           w   COPY public.definitiva (id_definitiva, id_personaje, attack_name, formula, multiplier, nivel, tipo_ataque) FROM stdin;
    public          postgres    false    220   �9                 0    16597 	   elemental 
   TABLE DATA           l   COPY public.elemental (id, id_elemental, id_personaje, attack_name, formula, multiplier, nivel) FROM stdin;
    public          postgres    false    225   �9                 0    16561    habilidades_personaje 
   TABLE DATA           e   COPY public.habilidades_personaje (uid_usuario, id_personaje, tipo_ataque, id_habilidad) FROM stdin;
    public          postgres    false    221   �:                 0    16494 
   personajes 
   TABLE DATA           j   COPY public.personajes (uid, api, "real", imagen_menu, imagen_personaje, elemento, tipo_arma) FROM stdin;
    public          postgres    false    217   �:                 0    16501    personajes_del_usuario 
   TABLE DATA           K   COPY public.personajes_del_usuario (uid_usuario, id_personaje) FROM stdin;
    public          postgres    false    218   L;                 0    16484    usuarios 
   TABLE DATA           A   COPY public.usuarios (uid, usuario, contrasena, rol) FROM stdin;
    public          postgres    false    216   ~;       '           0    0    basicos_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.basicos_id_seq', 42, true);
          public          postgres    false    222            (           0    0    definitiva_id_definitiva_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.definitiva_id_definitiva_seq', 1, false);
          public          postgres    false    219            )           0    0    elemental_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.elemental_id_seq', 3, true);
          public          postgres    false    224            *           0    0    usuarios_uid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.usuarios_uid_seq', 1, false);
          public          postgres    false    215            }           2606    16580    basicos basicos_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.basicos
    ADD CONSTRAINT basicos_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.basicos DROP CONSTRAINT basicos_pkey;
       public            postgres    false    223            y           2606    16555    definitiva definitiva_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.definitiva
    ADD CONSTRAINT definitiva_pkey PRIMARY KEY (id_definitiva);
 D   ALTER TABLE ONLY public.definitiva DROP CONSTRAINT definitiva_pkey;
       public            postgres    false    220                       2606    16604    elemental elemental_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.elemental
    ADD CONSTRAINT elemental_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.elemental DROP CONSTRAINT elemental_pkey;
       public            postgres    false    225            {           2606    16565 0   habilidades_personaje habilidades_personaje_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.habilidades_personaje
    ADD CONSTRAINT habilidades_personaje_pkey PRIMARY KEY (uid_usuario, id_personaje, tipo_ataque);
 Z   ALTER TABLE ONLY public.habilidades_personaje DROP CONSTRAINT habilidades_personaje_pkey;
       public            postgres    false    221    221    221            w           2606    16505 2   personajes_del_usuario personajes_del_usuario_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.personajes_del_usuario
    ADD CONSTRAINT personajes_del_usuario_pkey PRIMARY KEY (uid_usuario, id_personaje);
 \   ALTER TABLE ONLY public.personajes_del_usuario DROP CONSTRAINT personajes_del_usuario_pkey;
       public            postgres    false    218    218            u           2606    16500    personajes personajes_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.personajes
    ADD CONSTRAINT personajes_pkey PRIMARY KEY (uid);
 D   ALTER TABLE ONLY public.personajes DROP CONSTRAINT personajes_pkey;
       public            postgres    false    217            q           2606    16491    usuarios usuarios_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (uid);
 @   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_pkey;
       public            postgres    false    216            s           2606    16493    usuarios usuarios_usuario_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_usuario_key UNIQUE (usuario);
 G   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT usuarios_usuario_key;
       public            postgres    false    216            �           2606    16556 '   definitiva definitiva_id_personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.definitiva
    ADD CONSTRAINT definitiva_id_personaje_fkey FOREIGN KEY (id_personaje) REFERENCES public.personajes(uid);
 Q   ALTER TABLE ONLY public.definitiva DROP CONSTRAINT definitiva_id_personaje_fkey;
       public          postgres    false    4725    220    217            �           2606    16566 I   habilidades_personaje habilidades_personaje_uid_usuario_id_personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.habilidades_personaje
    ADD CONSTRAINT habilidades_personaje_uid_usuario_id_personaje_fkey FOREIGN KEY (uid_usuario, id_personaje) REFERENCES public.personajes_del_usuario(uid_usuario, id_personaje);
 s   ALTER TABLE ONLY public.habilidades_personaje DROP CONSTRAINT habilidades_personaje_uid_usuario_id_personaje_fkey;
       public          postgres    false    221    4727    218    221    218            �           2606    16511 ?   personajes_del_usuario personajes_del_usuario_id_personaje_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personajes_del_usuario
    ADD CONSTRAINT personajes_del_usuario_id_personaje_fkey FOREIGN KEY (id_personaje) REFERENCES public.personajes(uid);
 i   ALTER TABLE ONLY public.personajes_del_usuario DROP CONSTRAINT personajes_del_usuario_id_personaje_fkey;
       public          postgres    false    217    218    4725            �           2606    16506 >   personajes_del_usuario personajes_del_usuario_uid_usuario_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.personajes_del_usuario
    ADD CONSTRAINT personajes_del_usuario_uid_usuario_fkey FOREIGN KEY (uid_usuario) REFERENCES public.usuarios(uid);
 h   ALTER TABLE ONLY public.personajes_del_usuario DROP CONSTRAINT personajes_del_usuario_uid_usuario_fkey;
       public          postgres    false    216    4721    218               �  x�՘���0�k�)T�3�KNwsWd&)r�*��h�3�&`2����ȤK^,+ͅe.p�L���ߊշ�yƙ��������~6t(k�h�U�ڦ����k:��mՖ����p:�M�����_����4�a�m6��u����A�ɯ}ц���5T��ndJ��.r<�a�&�I�q"Pj1��;=lir�ŖIN�v�Z��*���N,�(���;z��?o���	�mP�[��1�� �T5M,�\.Wp�������P
|¥�)��H�WmR)(��^9I�\3�2E^=i�\!"7^2I�\[�"v�3�[�8pǾ�/�>p�#�[a�Ȍo�N}����1|�կD�U��ە����6M����ȍ��$ݮr`l|٦�v#l��U���a��"8~o���W]m�7F=Q���D��n��w�i��@K����4宄��I�]k [�4Q�[(l��{i�r�ܱ�w��n���xC���� $��.uHD���c"�>��ǴX��̷���a� w]	�Ѱ���L\'q�b��aa�Y�"-�
ɠ�E|��ם\4u[��=A�l��%}�6�E�i(���u���$�pL��ގ؄q���'�u��c�0��s��UG�%��i8�:����h�OfpW"p�n.s��Z�sQ��<Ϛϔ�c:��qB��O-            x������ � �         �   x���;�0�����"�Pԍ1��PEU�2p+���H*�ʂ�`��e��	_()RΡ$i������`t7}'�G4��*���]o:�(8�p�nZ�x��w
]�a�I��=%�)�3���h�.j��O��op��RMp9?k���b��6o?����Pօd�7������e��O֍Ze[F)}i�u�            x������ � �         �   x���=�0���19�C�MD4K��&�#9lhL�5���������x��c�y��v߫N�� L�76HO���r�4�kd4���^B���Q���9r����V&deb�Jg��Q��嘙��wW��E��Z��~p�SJ�wO���ɑcz�����q         "   x�3301�0�0�44 sc.3Ts�=... �w4         ,   x�3301�0�0�N�M�+�H�3�,9K�K�2�b����  �     