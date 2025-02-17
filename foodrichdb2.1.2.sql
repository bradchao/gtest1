PGDMP  -    )    
             }         
   richfooddb    16.6    17.2 j    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16398 
   richfooddb    DATABASE     �   CREATE DATABASE richfooddb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Chinese (Traditional)_Taiwan.950';
    DROP DATABASE richfooddb;
                     postgres    false                        3079    16439    dblink 	   EXTENSION     :   CREATE EXTENSION IF NOT EXISTS dblink WITH SCHEMA public;
    DROP EXTENSION dblink;
                        false            �           0    0    EXTENSION dblink    COMMENT     _   COMMENT ON EXTENSION dblink IS 'connect to other PostgreSQL databases from within a database';
                             false    2            �            1259    16544    reviews    TABLE       CREATE TABLE public.reviews (
    review_id integer NOT NULL,
    restaurant_id integer,
    user_id integer,
    rating numeric(2,1),
    content text,
    created_at timestamp with time zone,
    store_id integer,
    is_flagged boolean DEFAULT false,
    is_approved boolean
);
    DROP TABLE public.reviews;
       public         heap r       postgres    false            �            1259    16543    Reviews_review_id_seq    SEQUENCE     �   CREATE SEQUENCE public."Reviews_review_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Reviews_review_id_seq";
       public               postgres    false    225            �           0    0    Reviews_review_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Reviews_review_id_seq" OWNED BY public.reviews.review_id;
          public               postgres    false    224            �            1259    16558    Reviews_review_id_seq1    SEQUENCE     �   ALTER TABLE public.reviews ALTER COLUMN review_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Reviews_review_id_seq1"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    225            �            1259    16663    admin    TABLE     �   CREATE TABLE public.admin (
    admin_id integer NOT NULL,
    admin_account character varying(100) NOT NULL,
    password character varying(255) NOT NULL
);
    DROP TABLE public.admin;
       public         heap r       postgres    false            �            1259    16934    admin_admin_id_seq    SEQUENCE     �   ALTER TABLE public.admin ALTER COLUMN admin_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.admin_admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    237            �            1259    17249    browsing_history    TABLE     �   CREATE TABLE public.browsing_history (
    history_id integer NOT NULL,
    user_id integer NOT NULL,
    restaurant_id integer NOT NULL,
    viewed_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);
 $   DROP TABLE public.browsing_history;
       public         heap r       postgres    false            �            1259    17248    browsing_history_history_id_seq    SEQUENCE     �   CREATE SEQUENCE public.browsing_history_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.browsing_history_history_id_seq;
       public               postgres    false    243            �           0    0    browsing_history_history_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.browsing_history_history_id_seq OWNED BY public.browsing_history.history_id;
          public               postgres    false    242            �            1259    16399    business_hours    TABLE     �   CREATE TABLE public.business_hours (
    restaurant_id integer NOT NULL,
    day_of_week character varying(20) NOT NULL,
    start_time time with time zone NOT NULL,
    end_time time with time zone
);
 "   DROP TABLE public.business_hours;
       public         heap r       postgres    false            �            1259    16402 
   categories    TABLE     n   CREATE TABLE public.categories (
    category_id integer NOT NULL,
    name character varying(50) NOT NULL
);
    DROP TABLE public.categories;
       public         heap r       postgres    false            �            1259    16520    coupons    TABLE     �   CREATE TABLE public.coupons (
    coupon_id integer NOT NULL,
    restaurant_id integer,
    name character varying(255) NOT NULL,
    description text,
    created_at timestamp without time zone,
    store_id integer
);
    DROP TABLE public.coupons;
       public         heap r       postgres    false            �            1259    16542    coupons_coupon_id_seq    SEQUENCE     �   ALTER TABLE public.coupons ALTER COLUMN coupon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.coupons_coupon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    222            �            1259    16585    coupons_orders    TABLE     �   CREATE TABLE public.coupons_orders (
    order_id integer NOT NULL,
    coupon_id integer,
    user_id integer,
    restaurant_id integer,
    quantity integer,
    total_price numeric(10,2)
);
 "   DROP TABLE public.coupons_orders;
       public         heap r       postgres    false            �            1259    16623    coupons_orders_order_id_seq    SEQUENCE     �   ALTER TABLE public.coupons_orders ALTER COLUMN order_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.coupons_orders_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    230            �            1259    16605    favorite_restaurants    TABLE        CREATE TABLE public.favorite_restaurants (
    favorite_id integer NOT NULL,
    user_id integer,
    restaurant_id integer
);
 (   DROP TABLE public.favorite_restaurants;
       public         heap r       postgres    false            �            1259    16620 $   favorite_restaurants_favorite_id_seq    SEQUENCE     �   ALTER TABLE public.favorite_restaurants ALTER COLUMN favorite_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.favorite_restaurants_favorite_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    231            �            1259    16570    reservations    TABLE     M  CREATE TABLE public.reservations (
    reservation_id integer NOT NULL,
    restaurant_id integer NOT NULL,
    user_id integer NOT NULL,
    reservation_date date NOT NULL,
    reservation_time time with time zone NOT NULL,
    num_people smallint NOT NULL,
    edit_time time with time zone NOT NULL,
    state boolean NOT NULL
);
     DROP TABLE public.reservations;
       public         heap r       postgres    false            �            1259    16621    reservations_reservation_id_seq    SEQUENCE     �   ALTER TABLE public.reservations ALTER COLUMN reservation_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.reservations_reservation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    229            �            1259    16405    restaurant_categories    TABLE     t   CREATE TABLE public.restaurant_categories (
    restaurant_id integer NOT NULL,
    category_id integer NOT NULL
);
 )   DROP TABLE public.restaurant_categories;
       public         heap r       postgres    false            �            1259    16408    restaurants    TABLE     �  CREATE TABLE public.restaurants (
    restaurant_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    country character varying(100) NOT NULL,
    district character varying(100) NOT NULL,
    address character varying(255) NOT NULL,
    score numeric(3,2) NOT NULL,
    average integer NOT NULL,
    image character varying(255) NOT NULL,
    phone character varying(20) NOT NULL,
    store_id integer
);
    DROP TABLE public.restaurants;
       public         heap r       postgres    false            �            1259    16502    restaurants_id_seq    SEQUENCE     {   CREATE SEQUENCE public.restaurants_id_seq
    START WITH 7
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.restaurants_id_seq;
       public               postgres    false            �            1259    16933    restaurants_restaurant_id_seq    SEQUENCE     �   ALTER TABLE public.restaurants ALTER COLUMN restaurant_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.restaurants_restaurant_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    219            �            1259    16669    review_audits    TABLE     �   CREATE TABLE public.review_audits (
    audit_id integer NOT NULL,
    review_id integer,
    admin_id integer,
    action character varying(50) NOT NULL,
    reason text,
    is_final boolean DEFAULT false
);
 !   DROP TABLE public.review_audits;
       public         heap r       postgres    false            �            1259    16932    review_audits_audit_id_seq    SEQUENCE     �   ALTER TABLE public.review_audits ALTER COLUMN audit_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.review_audits_audit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    238            �            1259    16632    store    TABLE     �   CREATE TABLE public.store (
    store_id integer NOT NULL,
    restaurant_id integer,
    store_account character varying,
    password character varying
);
    DROP TABLE public.store;
       public         heap r       postgres    false            �            1259    16642    store_store_id_seq    SEQUENCE     �   ALTER TABLE public.store ALTER COLUMN store_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.store_store_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    235            �            1259    16559    users    TABLE       CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(50) NOT NULL,
    users_account character varying(100) NOT NULL,
    password character varying(255) NOT NULL,
    tel character varying(50),
    email character varying(255),
    icon bytea
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    16564    users_user_id_seq    SEQUENCE     �   ALTER TABLE public.users ALTER COLUMN user_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public               postgres    false    227            �           2604    17252    browsing_history history_id    DEFAULT     �   ALTER TABLE ONLY public.browsing_history ALTER COLUMN history_id SET DEFAULT nextval('public.browsing_history_history_id_seq'::regclass);
 J   ALTER TABLE public.browsing_history ALTER COLUMN history_id DROP DEFAULT;
       public               postgres    false    242    243    243            �          0    16663    admin 
   TABLE DATA           B   COPY public.admin (admin_id, admin_account, password) FROM stdin;
    public               postgres    false    237   �       �          0    17249    browsing_history 
   TABLE DATA           Y   COPY public.browsing_history (history_id, user_id, restaurant_id, viewed_at) FROM stdin;
    public               postgres    false    243   A�       �          0    16399    business_hours 
   TABLE DATA           Z   COPY public.business_hours (restaurant_id, day_of_week, start_time, end_time) FROM stdin;
    public               postgres    false    216   ^�       �          0    16402 
   categories 
   TABLE DATA           7   COPY public.categories (category_id, name) FROM stdin;
    public               postgres    false    217   ��       �          0    16520    coupons 
   TABLE DATA           d   COPY public.coupons (coupon_id, restaurant_id, name, description, created_at, store_id) FROM stdin;
    public               postgres    false    222   ߉       �          0    16585    coupons_orders 
   TABLE DATA           l   COPY public.coupons_orders (order_id, coupon_id, user_id, restaurant_id, quantity, total_price) FROM stdin;
    public               postgres    false    230   �       �          0    16605    favorite_restaurants 
   TABLE DATA           S   COPY public.favorite_restaurants (favorite_id, user_id, restaurant_id) FROM stdin;
    public               postgres    false    231   '�       �          0    16570    reservations 
   TABLE DATA           �   COPY public.reservations (reservation_id, restaurant_id, user_id, reservation_date, reservation_time, num_people, edit_time, state) FROM stdin;
    public               postgres    false    229   T�       �          0    16405    restaurant_categories 
   TABLE DATA           K   COPY public.restaurant_categories (restaurant_id, category_id) FROM stdin;
    public               postgres    false    218   ��       �          0    16408    restaurants 
   TABLE DATA           �   COPY public.restaurants (restaurant_id, name, description, country, district, address, score, average, image, phone, store_id) FROM stdin;
    public               postgres    false    219   �       �          0    16669    review_audits 
   TABLE DATA           `   COPY public.review_audits (audit_id, review_id, admin_id, action, reason, is_final) FROM stdin;
    public               postgres    false    238   !�       �          0    16544    reviews 
   TABLE DATA           �   COPY public.reviews (review_id, restaurant_id, user_id, rating, content, created_at, store_id, is_flagged, is_approved) FROM stdin;
    public               postgres    false    225   ��       �          0    16632    store 
   TABLE DATA           Q   COPY public.store (store_id, restaurant_id, store_account, password) FROM stdin;
    public               postgres    false    235   �       �          0    16559    users 
   TABLE DATA           Y   COPY public.users (user_id, name, users_account, password, tel, email, icon) FROM stdin;
    public               postgres    false    227   m�       �           0    0    Reviews_review_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Reviews_review_id_seq"', 1, false);
          public               postgres    false    224            �           0    0    Reviews_review_id_seq1    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Reviews_review_id_seq1"', 2, true);
          public               postgres    false    226            �           0    0    admin_admin_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_admin_id_seq', 2, true);
          public               postgres    false    241            �           0    0    browsing_history_history_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.browsing_history_history_id_seq', 1, false);
          public               postgres    false    242            �           0    0    coupons_coupon_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.coupons_coupon_id_seq', 4, true);
          public               postgres    false    223            �           0    0    coupons_orders_order_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.coupons_orders_order_id_seq', 3, true);
          public               postgres    false    234            �           0    0 $   favorite_restaurants_favorite_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.favorite_restaurants_favorite_id_seq', 3, true);
          public               postgres    false    232            �           0    0    reservations_reservation_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.reservations_reservation_id_seq', 2, true);
          public               postgres    false    233            �           0    0    restaurants_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.restaurants_id_seq', 7, true);
          public               postgres    false    221            �           0    0    restaurants_restaurant_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.restaurants_restaurant_id_seq', 1, false);
          public               postgres    false    240            �           0    0    review_audits_audit_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.review_audits_audit_id_seq', 2, true);
          public               postgres    false    239            �           0    0    store_store_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.store_store_id_seq', 4, true);
          public               postgres    false    236            �           0    0    users_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);
          public               postgres    false    228            �           2606    17191    admin  account 
   CONSTRAINT     T   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT " account" UNIQUE (admin_account);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT " account";
       public                 postgres    false    237            �           2606    16524    coupons  coupon_id 
   CONSTRAINT     Y   ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT " coupon_id" PRIMARY KEY (coupon_id);
 >   ALTER TABLE ONLY public.coupons DROP CONSTRAINT " coupon_id";
       public                 postgres    false    222            �           2606    16551    reviews  review_id 
   CONSTRAINT     Y   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT " review_id" PRIMARY KEY (review_id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT " review_id";
       public                 postgres    false    225            �           2606    16563    users  user_id 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT " user_id" PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT " user_id";
       public                 postgres    false    227            �           2606    17187 	   users acc 
   CONSTRAINT     M   ALTER TABLE ONLY public.users
    ADD CONSTRAINT acc UNIQUE (users_account);
 3   ALTER TABLE ONLY public.users DROP CONSTRAINT acc;
       public                 postgres    false    227            �           2606    16667    admin admin_id 
   CONSTRAINT     R   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_id PRIMARY KEY (admin_id);
 8   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_id;
       public                 postgres    false    237            �           2606    16675    review_audits audit_id 
   CONSTRAINT     Z   ALTER TABLE ONLY public.review_audits
    ADD CONSTRAINT audit_id PRIMARY KEY (audit_id);
 @   ALTER TABLE ONLY public.review_audits DROP CONSTRAINT audit_id;
       public                 postgres    false    238            �           2606    17255 &   browsing_history browsing_history_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.browsing_history
    ADD CONSTRAINT browsing_history_pkey PRIMARY KEY (history_id);
 P   ALTER TABLE ONLY public.browsing_history DROP CONSTRAINT browsing_history_pkey;
       public                 postgres    false    243            �           2606    16531 "   business_hours business_hours_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.business_hours
    ADD CONSTRAINT business_hours_pkey PRIMARY KEY (restaurant_id, day_of_week, start_time);
 L   ALTER TABLE ONLY public.business_hours DROP CONSTRAINT business_hours_pkey;
       public                 postgres    false    216    216    216            �           2606    16416    categories categories_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public                 postgres    false    217            �           2606    16609     favorite_restaurants favorite_id 
   CONSTRAINT     g   ALTER TABLE ONLY public.favorite_restaurants
    ADD CONSTRAINT favorite_id PRIMARY KEY (favorite_id);
 J   ALTER TABLE ONLY public.favorite_restaurants DROP CONSTRAINT favorite_id;
       public                 postgres    false    231            �           2606    17195    coupons name 
   CONSTRAINT     G   ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT name UNIQUE (name);
 6   ALTER TABLE ONLY public.coupons DROP CONSTRAINT name;
       public                 postgres    false    222            �           2606    16589    coupons_orders order_id 
   CONSTRAINT     [   ALTER TABLE ONLY public.coupons_orders
    ADD CONSTRAINT order_id PRIMARY KEY (order_id);
 A   ALTER TABLE ONLY public.coupons_orders DROP CONSTRAINT order_id;
       public                 postgres    false    230            �           2606    16574    reservations reservation_id 
   CONSTRAINT     e   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT reservation_id PRIMARY KEY (reservation_id);
 E   ALTER TABLE ONLY public.reservations DROP CONSTRAINT reservation_id;
       public                 postgres    false    229            �           2606    16418 0   restaurant_categories restaurant_categories_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.restaurant_categories
    ADD CONSTRAINT restaurant_categories_pkey PRIMARY KEY (restaurant_id, category_id);
 Z   ALTER TABLE ONLY public.restaurant_categories DROP CONSTRAINT restaurant_categories_pkey;
       public                 postgres    false    218    218            �           2606    17203    store restaurant_id 
   CONSTRAINT     W   ALTER TABLE ONLY public.store
    ADD CONSTRAINT restaurant_id UNIQUE (restaurant_id);
 =   ALTER TABLE ONLY public.store DROP CONSTRAINT restaurant_id;
       public                 postgres    false    235            �           2606    16420    restaurants restaurants_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (restaurant_id);
 F   ALTER TABLE ONLY public.restaurants DROP CONSTRAINT restaurants_pkey;
       public                 postgres    false    219            �           2606    16636    store store_id 
   CONSTRAINT     R   ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_id PRIMARY KEY (store_id);
 8   ALTER TABLE ONLY public.store DROP CONSTRAINT store_id;
       public                 postgres    false    235            �           2606    17189 	   users tel 
   CONSTRAINT     C   ALTER TABLE ONLY public.users
    ADD CONSTRAINT tel UNIQUE (tel);
 3   ALTER TABLE ONLY public.users DROP CONSTRAINT tel;
       public                 postgres    false    227            �           2606    17197    store username 
   CONSTRAINT     R   ALTER TABLE ONLY public.store
    ADD CONSTRAINT username UNIQUE (store_account);
 8   ALTER TABLE ONLY public.store DROP CONSTRAINT username;
       public                 postgres    false    235            �           1259    16421     idx_business_hours_restaurant_id    INDEX     d   CREATE INDEX idx_business_hours_restaurant_id ON public.business_hours USING btree (restaurant_id);
 4   DROP INDEX public.idx_business_hours_restaurant_id;
       public                 postgres    false    216            �           1259    16422 %   idx_restaurant_categories_category_id    INDEX     n   CREATE INDEX idx_restaurant_categories_category_id ON public.restaurant_categories USING btree (category_id);
 9   DROP INDEX public.idx_restaurant_categories_category_id;
       public                 postgres    false    218            �           1259    16423 '   idx_restaurant_categories_restaurant_id    INDEX     r   CREATE INDEX idx_restaurant_categories_restaurant_id ON public.restaurant_categories USING btree (restaurant_id);
 ;   DROP INDEX public.idx_restaurant_categories_restaurant_id;
       public                 postgres    false    218                        2606    17261 4   browsing_history browsing_history_restaurant_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.browsing_history
    ADD CONSTRAINT browsing_history_restaurant_id_fkey FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(restaurant_id);
 ^   ALTER TABLE ONLY public.browsing_history DROP CONSTRAINT browsing_history_restaurant_id_fkey;
       public               postgres    false    4813    219    243                       2606    17256 .   browsing_history browsing_history_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.browsing_history
    ADD CONSTRAINT browsing_history_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 X   ALTER TABLE ONLY public.browsing_history DROP CONSTRAINT browsing_history_user_id_fkey;
       public               postgres    false    4821    227    243            �           2606    16681    review_audits fk_admin_id     FK CONSTRAINT     �   ALTER TABLE ONLY public.review_audits
    ADD CONSTRAINT "fk_admin_id " FOREIGN KEY (admin_id) REFERENCES public.admin(admin_id);
 F   ALTER TABLE ONLY public.review_audits DROP CONSTRAINT "fk_admin_id ";
       public               postgres    false    4841    238    237            �           2606    16424 "   business_hours fk_bh_restaurant_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.business_hours
    ADD CONSTRAINT fk_bh_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(restaurant_id) ON UPDATE CASCADE ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.business_hours DROP CONSTRAINT fk_bh_restaurant_id;
       public               postgres    false    219    4813    216            �           2606    16590    coupons_orders fk_coupon_id     FK CONSTRAINT     �   ALTER TABLE ONLY public.coupons_orders
    ADD CONSTRAINT "fk_coupon_id " FOREIGN KEY (coupon_id) REFERENCES public.coupons(coupon_id);
 H   ALTER TABLE ONLY public.coupons_orders DROP CONSTRAINT "fk_coupon_id ";
       public               postgres    false    4815    222    230            �           2606    16429 '   restaurant_categories fk_rc_category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurant_categories
    ADD CONSTRAINT fk_rc_category_id FOREIGN KEY (category_id) REFERENCES public.categories(category_id) ON UPDATE CASCADE ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.restaurant_categories DROP CONSTRAINT fk_rc_category_id;
       public               postgres    false    218    217    4807            �           2606    16434 )   restaurant_categories fk_rc_restaurant_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurant_categories
    ADD CONSTRAINT fk_rc_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(restaurant_id) ON UPDATE CASCADE ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.restaurant_categories DROP CONSTRAINT fk_rc_restaurant_id;
       public               postgres    false    219    4813    218            �           2606    16552    reviews fk_restaurant_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(restaurant_id);
 B   ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_restaurant_id;
       public               postgres    false    219    225    4813            �           2606    17204    coupons_orders fk_restaurant_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.coupons_orders
    ADD CONSTRAINT fk_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES public.store(restaurant_id) NOT VALID;
 I   ALTER TABLE ONLY public.coupons_orders DROP CONSTRAINT fk_restaurant_id;
       public               postgres    false    4833    235    230            �           2606    17214    reservations fk_restaurant_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT fk_restaurant_id FOREIGN KEY (restaurant_id) REFERENCES public.store(restaurant_id) NOT VALID;
 G   ALTER TABLE ONLY public.reservations DROP CONSTRAINT fk_restaurant_id;
       public               postgres    false    229    235    4833            �           2606    16615 &   favorite_restaurants fk_restaurant_id     FK CONSTRAINT     �   ALTER TABLE ONLY public.favorite_restaurants
    ADD CONSTRAINT "fk_restaurant_id " FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(restaurant_id);
 R   ALTER TABLE ONLY public.favorite_restaurants DROP CONSTRAINT "fk_restaurant_id ";
       public               postgres    false    4813    231    219            �           2606    16637    store fk_restaurant_id     FK CONSTRAINT     �   ALTER TABLE ONLY public.store
    ADD CONSTRAINT "fk_restaurant_id " FOREIGN KEY (restaurant_id) REFERENCES public.restaurants(restaurant_id);
 C   ALTER TABLE ONLY public.store DROP CONSTRAINT "fk_restaurant_id ";
       public               postgres    false    4813    219    235            �           2606    16676    review_audits fk_review_id     FK CONSTRAINT     �   ALTER TABLE ONLY public.review_audits
    ADD CONSTRAINT "fk_review_id " FOREIGN KEY (review_id) REFERENCES public.reviews(review_id);
 G   ALTER TABLE ONLY public.review_audits DROP CONSTRAINT "fk_review_id ";
       public               postgres    false    238    225    4819            �           2606    16643    restaurants fk_store_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.restaurants
    ADD CONSTRAINT fk_store_id FOREIGN KEY (store_id) REFERENCES public.store(store_id) NOT VALID;
 A   ALTER TABLE ONLY public.restaurants DROP CONSTRAINT fk_store_id;
       public               postgres    false    4835    219    235            �           2606    16648    reviews fk_store_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_store_id FOREIGN KEY (store_id) REFERENCES public.store(store_id) NOT VALID;
 =   ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_store_id;
       public               postgres    false    225    4835    235            �           2606    17266    coupons fk_store_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.coupons
    ADD CONSTRAINT fk_store_id FOREIGN KEY (store_id) REFERENCES public.store(store_id) NOT VALID;
 =   ALTER TABLE ONLY public.coupons DROP CONSTRAINT fk_store_id;
       public               postgres    false    235    4835    222            �           2606    16565    reviews fk_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES public.users(user_id) NOT VALID;
 <   ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_user_id;
       public               postgres    false    225    4821    227            �           2606    16575    reservations fk_user_id     FK CONSTRAINT     ~   ALTER TABLE ONLY public.reservations
    ADD CONSTRAINT "fk_user_id " FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 D   ALTER TABLE ONLY public.reservations DROP CONSTRAINT "fk_user_id ";
       public               postgres    false    227    229    4821            �           2606    16595    coupons_orders fk_user_id     FK CONSTRAINT     �   ALTER TABLE ONLY public.coupons_orders
    ADD CONSTRAINT "fk_user_id " FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 F   ALTER TABLE ONLY public.coupons_orders DROP CONSTRAINT "fk_user_id ";
       public               postgres    false    230    227    4821            �           2606    16610     favorite_restaurants fk_user_id     FK CONSTRAINT     �   ALTER TABLE ONLY public.favorite_restaurants
    ADD CONSTRAINT "fk_user_id " FOREIGN KEY (user_id) REFERENCES public.users(user_id);
 L   ALTER TABLE ONLY public.favorite_restaurants DROP CONSTRAINT "fk_user_id ";
       public               postgres    false    227    231    4821            �   #   x�3�,��/�442615�2�LL��̃qc���� ��{      �      x������ � �      �     x���M
�0���UI���Y<���
]�t/�G{���i:�袋����Ǩ��w����υRG)�������BM�������./̴-d�ۓeJ&��f?3������͐�8zL��@O�����Ez<�N)�gO���b4f�. c �g�7���S/;_Q3���ˉ����3t>�;OzL��@����C3�3t>��U�	����{V�<MƝo�;M3�;�0��bRw�a�Ť��.�.�˒b4flv�ȸ양I�fG���B�?$ll.      �   J  x�M�YRA����Xt7�]<��"԰L�S���Ȱ)�r�=}3U��_*˟D���9��B	&;�U����%;t1���am�a�/��0f�7�;;�3�.������q&햘s���=���Fx]F!�慨z<�I�o����B�ُ�~�8�n�g��MfI���R�7������q�P3k��A�s̒���m�^�J���T@�JX�Q���{l�n�(�Ze�<j=���젏24[���yy�НY8�:C���W��'��C_%ݚcT<�}MCU<�A� ���+/��T��p8�|��"����\      �   �   x�3�4�|���d����^4u>�����-O�,ڲ�Y�Χ���M_�b�����L���_l��b��gk�<��y�ӎ
O����Z��u��]�-A�`�
����@m&���f
��V��V�F\F���O7v�\�jq��K�B��t���]:�����Ɔ
FPW�ps�q:���y�g�ؾ��獈�����Bm6�2�4�|�d哽�_Ξ��o���c����rSNc�=... #tE      �   3   x���	 0��S4i���sT�����;:#*{`������m���M>      �      x�3�4�4�bN3.cNcNS�=... !��      �   D   x�M��	�0���� s'YƸ����I~��#�`�S.Bs%yq�C��}�r��T濇�����w      �   I   x����0B�0LU�����(�� �@�D
U�0�c-Z�iI��U#��j\�_�7q��i$lއ�H��      �     x���kWW�_O>�_@3̕�Z}(�DP\]��M.2�D^1jZ��'֠>��L5�~��3�W�
=���Y��f�}��}~{��6 J����$�����5�Z �-�������Qޒ��r�\݄�?/����H�'�ё|�
~� ��Eu��t��xY3���V]j��'��~.W䧻��0��=���>��7��u�)��@�s��G�?����wA�����9+eD�F�x��-KGgI)��1dD��HR��o?�$��'2�B>.D�91>'Ey��a��s�{��A.�
���H�J1��)0���$��I�8�bJ�4���y� mA�0>:���lx���I��	���f;��c&G)��N�&�3��1�J`AIE�s?��&Xݖ^��ޙ�k����oJ�O�NK��@��X���-+��@�4���>V*�AsE��x�\� �4���A�D�����w?[<0Nn-J{ಡ���R�������!b�ft�0q���s&�;챜'�%��S�<�i24�!�E&����'�$�#����/�H���5 |%&���#n���tJ���"�;����D1��1j8q����%����e�6z�~�`�j�ݖԩ@"��I�u�����lH����a�דN�p�|~
��{���7i�H^9ϴ@��{��
VA9���` 8:�[����z�@<xn��M�8_ \Az!��E�S���tS�I�M'�h�泏x��⣜�劜�eN�����DZ��	,GXb�"+��P!�O�Kɬ��Π8Ja��@�Yt:���R�)�_}���\�'5�>�*{��^����,��Bg���\��8)�p���^H���ّ����t����;� �m��������R�qK�x��nzu(HZ	.���P�����ڒ�������w���*��"z����4ީ��@<�3a7)Z��p��s[-d�k�D֙�Q1��\>Cbڔ�ř���*%�(f�
�l�Ή��0<	��	c�1���a��yBz�oNNE����	:w� �pӋB"��B�����/�F
��/[t�R�ٿz����6X^{�rז�VG�h��u������yK^ږ�u�R� >"����ol�z*�W��R7bB����ԃ��0j������p����Px�;�㜶�@l�fC}c�aKr6=(d�b��	N3Ӥ���Ps�=i���li�;����|�+1�(�h�"&b.��0��9q������6�.�%ծ�>�ښZy+���7O5�h\�JKP��Q>	�u��7��8�t�4l_��+oA�����9��/8i�/���}�2�}��K4�����a*J�}��-��L$02�{SgA_���E�,�����r.͊A{`�G��0)�(����6�6D�0��Z�'��(N��hDi�沙��;��o������ʊ)~�v���Da�nG*/
��xk�b1!��#��"$���Jq�D|(�M 'H�6�#���G���Ce      �   a   x�3�4�gv<mo�|ں�麝Oׯ�_6�z���~O��5˞N�x�m���3_,������ˈ����E��l�*��5����k6D�&Ш=... �zP�      �   m   x�3�4�4�4�3�|�0�ٌ�Ov4<m�~�����I�g��\2������4r����)�Z ���Pog	���1���!�)/:&=�Ӌ� 3�A�`�b���� i�:b      �   N   x��K
� ��	��_{ib �������9�{��W�u ��:OAO��Q�Y�R�H������Ib�q��A�(��      �   Z   x�3�t*JL�L�F�&�f����X�!=713G/9?�3Əˈ�;�,3�3L�u@�`qT-Ɯ^�y�Y a�!�	FU���� (d(�     