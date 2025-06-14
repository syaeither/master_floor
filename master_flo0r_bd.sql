PGDMP     -                    }            master_floor    15.1    15.1 _    s           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            t           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            u           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            v           1262    121511    master_floor    DATABASE     �   CREATE DATABASE master_floor WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE master_floor;
                postgres    false            �            1259    121602    access_logs    TABLE     �   CREATE TABLE public.access_logs (
    id_access_logs bigint NOT NULL,
    employee_code bigint,
    access_time character varying NOT NULL,
    access_type character varying NOT NULL
);
    DROP TABLE public.access_logs;
       public         heap    postgres    false            �            1259    121601    access_logs_id_access_logs_seq    SEQUENCE     �   CREATE SEQUENCE public.access_logs_id_access_logs_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.access_logs_id_access_logs_seq;
       public          postgres    false    229            w           0    0    access_logs_id_access_logs_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.access_logs_id_access_logs_seq OWNED BY public.access_logs.id_access_logs;
          public          postgres    false    228            �            1259    121579 	   employees    TABLE     o  CREATE TABLE public.employees (
    id_employees bigint NOT NULL,
    full_name text NOT NULL,
    birth_date date,
    passport_data character varying,
    bank_details text NOT NULL,
    family_status character varying,
    "health_status " text,
    role character varying NOT NULL,
    login character varying NOT NULL,
    password character varying NOT NULL
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    121578    employees_id_employees_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_id_employees_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.employees_id_employees_seq;
       public          postgres    false    225            x           0    0    employees_id_employees_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.employees_id_employees_seq OWNED BY public.employees.id_employees;
          public          postgres    false    224            �            1259    121616 	   materials    TABLE     �  CREATE TABLE public.materials (
    id_materials bigint NOT NULL,
    type_materials character varying NOT NULL,
    name_materials character varying,
    supplier_code bigint,
    quantity_per_pack integer,
    unit character varying,
    description text,
    image bytea,
    cost numeric(10,2),
    stock_quantity integer,
    min_stock_quantity integer,
    waste_percentage numeric(5,2)
);
    DROP TABLE public.materials;
       public         heap    postgres    false            �            1259    121625    materials_history    TABLE     �   CREATE TABLE public.materials_history (
    id_materials_history bigint NOT NULL,
    material_code bigint,
    "change_date " character varying NOT NULL,
    change_type character varying NOT NULL,
    quantity_change integer NOT NULL
);
 %   DROP TABLE public.materials_history;
       public         heap    postgres    false            �            1259    121624 *   materials_history_id_materials_history_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_history_id_materials_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.materials_history_id_materials_history_seq;
       public          postgres    false    233            y           0    0 *   materials_history_id_materials_history_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.materials_history_id_materials_history_seq OWNED BY public.materials_history.id_materials_history;
          public          postgres    false    232            �            1259    121615    materials_id_materials_seq    SEQUENCE     �   CREATE SEQUENCE public.materials_id_materials_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.materials_id_materials_seq;
       public          postgres    false    231            z           0    0    materials_id_materials_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.materials_id_materials_seq OWNED BY public.materials.id_materials;
          public          postgres    false    230            �            1259    121562    order_items    TABLE     �   CREATE TABLE public.order_items (
    id_order_items bigint NOT NULL,
    order_code bigint,
    product_code bigint,
    quantity integer NOT NULL,
    price_edin numeric(10,2) NOT NULL,
    production_date date
);
    DROP TABLE public.order_items;
       public         heap    postgres    false            �            1259    121561    order_items_id_order_items_seq    SEQUENCE     �   CREATE SEQUENCE public.order_items_id_order_items_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.order_items_id_order_items_seq;
       public          postgres    false    223            {           0    0    order_items_id_order_items_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.order_items_id_order_items_seq OWNED BY public.order_items.id_order_items;
          public          postgres    false    222            �            1259    121548    orders    TABLE     �   CREATE TABLE public.orders (
    id_orders bigint NOT NULL,
    partner_code bigint,
    status character varying NOT NULL,
    created_at date NOT NULL,
    prepayment_date date NOT NULL,
    final_payment_date date NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    121547    orders_id_orders_seq    SEQUENCE     }   CREATE SEQUENCE public.orders_id_orders_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.orders_id_orders_seq;
       public          postgres    false    221            |           0    0    orders_id_orders_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.orders_id_orders_seq OWNED BY public.orders.id_orders;
          public          postgres    false    220            �            1259    121512    partners_id_partner_seq    SEQUENCE     �   CREATE SEQUENCE public.partners_id_partner_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.partners_id_partner_seq;
       public          postgres    false            �            1259    121513    partners    TABLE     �  CREATE TABLE public.partners (
    id_partner bigint DEFAULT nextval('public.partners_id_partner_seq'::regclass) NOT NULL,
    type character varying NOT NULL,
    name_company text NOT NULL,
    legal_address text NOT NULL,
    inn character varying(12) NOT NULL,
    director_name text NOT NULL,
    telephone character(50) NOT NULL,
    email character varying,
    rating integer,
    sales_places text,
    logo bytea
);
    DROP TABLE public.partners;
       public         heap    postgres    false    214            �            1259    121521    products_id_product_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_product_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.products_id_product_seq;
       public          postgres    false            �            1259    121522    products    TABLE     �  CREATE TABLE public.products (
    id_product bigint DEFAULT nextval('public.products_id_product_seq'::regclass) NOT NULL,
    article character varying(50) NOT NULL,
    type_product character varying NOT NULL,
    name text,
    description text,
    image bytea,
    min_price numeric(1000,2),
    size_length numeric(10,2),
    size_width numeric(10,2),
    size_height numeric(10,2),
    weight_without_package numeric(10,2),
    weight_with_package numeric(10,2),
    quality_certificate bytea,
    standard_number character varying,
    production_time character varying,
    cost_price numeric(10,2),
    workshop_number bigint,
    workers_count bigint,
    coefficient numeric(5,2) NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false    216            �            1259    121531    sales_history    TABLE     �   CREATE TABLE public.sales_history (
    id_sales_history bigint NOT NULL,
    partner_code bigint,
    product_code bigint,
    quantity integer,
    sale_date date NOT NULL
);
 !   DROP TABLE public.sales_history;
       public         heap    postgres    false            �            1259    121530 "   sales_history_id_sales_history_seq    SEQUENCE     �   CREATE SEQUENCE public.sales_history_id_sales_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.sales_history_id_sales_history_seq;
       public          postgres    false    219            }           0    0 "   sales_history_id_sales_history_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public.sales_history_id_sales_history_seq OWNED BY public.sales_history.id_sales_history;
          public          postgres    false    218            �            1259    121652 	   suppliers    TABLE     �   CREATE TABLE public.suppliers (
    id_suppliers bigint NOT NULL,
    type_suppliers character varying NOT NULL,
    name_suppliers character varying NOT NULL,
    inn_suppliers character varying,
    "history_history " text,
    code_employee bigint
);
    DROP TABLE public.suppliers;
       public         heap    postgres    false            �            1259    121651    suppliers_id_suppliers_seq    SEQUENCE     �   CREATE SEQUENCE public.suppliers_id_suppliers_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.suppliers_id_suppliers_seq;
       public          postgres    false    237            ~           0    0    suppliers_id_suppliers_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.suppliers_id_suppliers_seq OWNED BY public.suppliers.id_suppliers;
          public          postgres    false    236            �            1259    121639 	   warehouse    TABLE     �   CREATE TABLE public.warehouse (
    id_warehouse bigint NOT NULL,
    material_code bigint,
    stock_quantity integer NOT NULL
);
    DROP TABLE public.warehouse;
       public         heap    postgres    false            �            1259    121638    warehouse_id_warehouse_seq    SEQUENCE     �   CREATE SEQUENCE public.warehouse_id_warehouse_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.warehouse_id_warehouse_seq;
       public          postgres    false    235                       0    0    warehouse_id_warehouse_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.warehouse_id_warehouse_seq OWNED BY public.warehouse.id_warehouse;
          public          postgres    false    234            �            1259    121588    work_permits    TABLE     �   CREATE TABLE public.work_permits (
    id_work_permits bigint NOT NULL,
    code_employee bigint,
    equipment_access text NOT NULL
);
     DROP TABLE public.work_permits;
       public         heap    postgres    false            �            1259    121587     work_permits_id_work_permits_seq    SEQUENCE     �   CREATE SEQUENCE public.work_permits_id_work_permits_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.work_permits_id_work_permits_seq;
       public          postgres    false    227            �           0    0     work_permits_id_work_permits_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.work_permits_id_work_permits_seq OWNED BY public.work_permits.id_work_permits;
          public          postgres    false    226            �           2604    121605    access_logs id_access_logs    DEFAULT     �   ALTER TABLE ONLY public.access_logs ALTER COLUMN id_access_logs SET DEFAULT nextval('public.access_logs_id_access_logs_seq'::regclass);
 I   ALTER TABLE public.access_logs ALTER COLUMN id_access_logs DROP DEFAULT;
       public          postgres    false    229    228    229            �           2604    121582    employees id_employees    DEFAULT     �   ALTER TABLE ONLY public.employees ALTER COLUMN id_employees SET DEFAULT nextval('public.employees_id_employees_seq'::regclass);
 E   ALTER TABLE public.employees ALTER COLUMN id_employees DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    121619    materials id_materials    DEFAULT     �   ALTER TABLE ONLY public.materials ALTER COLUMN id_materials SET DEFAULT nextval('public.materials_id_materials_seq'::regclass);
 E   ALTER TABLE public.materials ALTER COLUMN id_materials DROP DEFAULT;
       public          postgres    false    230    231    231            �           2604    121628 &   materials_history id_materials_history    DEFAULT     �   ALTER TABLE ONLY public.materials_history ALTER COLUMN id_materials_history SET DEFAULT nextval('public.materials_history_id_materials_history_seq'::regclass);
 U   ALTER TABLE public.materials_history ALTER COLUMN id_materials_history DROP DEFAULT;
       public          postgres    false    233    232    233            �           2604    121565    order_items id_order_items    DEFAULT     �   ALTER TABLE ONLY public.order_items ALTER COLUMN id_order_items SET DEFAULT nextval('public.order_items_id_order_items_seq'::regclass);
 I   ALTER TABLE public.order_items ALTER COLUMN id_order_items DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    121551    orders id_orders    DEFAULT     t   ALTER TABLE ONLY public.orders ALTER COLUMN id_orders SET DEFAULT nextval('public.orders_id_orders_seq'::regclass);
 ?   ALTER TABLE public.orders ALTER COLUMN id_orders DROP DEFAULT;
       public          postgres    false    220    221    221            �           2604    121534    sales_history id_sales_history    DEFAULT     �   ALTER TABLE ONLY public.sales_history ALTER COLUMN id_sales_history SET DEFAULT nextval('public.sales_history_id_sales_history_seq'::regclass);
 M   ALTER TABLE public.sales_history ALTER COLUMN id_sales_history DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    121655    suppliers id_suppliers    DEFAULT     �   ALTER TABLE ONLY public.suppliers ALTER COLUMN id_suppliers SET DEFAULT nextval('public.suppliers_id_suppliers_seq'::regclass);
 E   ALTER TABLE public.suppliers ALTER COLUMN id_suppliers DROP DEFAULT;
       public          postgres    false    237    236    237            �           2604    121642    warehouse id_warehouse    DEFAULT     �   ALTER TABLE ONLY public.warehouse ALTER COLUMN id_warehouse SET DEFAULT nextval('public.warehouse_id_warehouse_seq'::regclass);
 E   ALTER TABLE public.warehouse ALTER COLUMN id_warehouse DROP DEFAULT;
       public          postgres    false    234    235    235            �           2604    121591    work_permits id_work_permits    DEFAULT     �   ALTER TABLE ONLY public.work_permits ALTER COLUMN id_work_permits SET DEFAULT nextval('public.work_permits_id_work_permits_seq'::regclass);
 K   ALTER TABLE public.work_permits ALTER COLUMN id_work_permits DROP DEFAULT;
       public          postgres    false    226    227    227            h          0    121602    access_logs 
   TABLE DATA           ^   COPY public.access_logs (id_access_logs, employee_code, access_time, access_type) FROM stdin;
    public          postgres    false    229   
|       d          0    121579 	   employees 
   TABLE DATA           �   COPY public.employees (id_employees, full_name, birth_date, passport_data, bank_details, family_status, "health_status ", role, login, password) FROM stdin;
    public          postgres    false    225   '|       j          0    121616 	   materials 
   TABLE DATA           �   COPY public.materials (id_materials, type_materials, name_materials, supplier_code, quantity_per_pack, unit, description, image, cost, stock_quantity, min_stock_quantity, waste_percentage) FROM stdin;
    public          postgres    false    231   �|       l          0    121625    materials_history 
   TABLE DATA           ~   COPY public.materials_history (id_materials_history, material_code, "change_date ", change_type, quantity_change) FROM stdin;
    public          postgres    false    233   }       b          0    121562    order_items 
   TABLE DATA           v   COPY public.order_items (id_order_items, order_code, product_code, quantity, price_edin, production_date) FROM stdin;
    public          postgres    false    223   3}       `          0    121548    orders 
   TABLE DATA           r   COPY public.orders (id_orders, partner_code, status, created_at, prepayment_date, final_payment_date) FROM stdin;
    public          postgres    false    221   P}       Z          0    121513    partners 
   TABLE DATA           �   COPY public.partners (id_partner, type, name_company, legal_address, inn, director_name, telephone, email, rating, sales_places, logo) FROM stdin;
    public          postgres    false    215   m}       \          0    121522    products 
   TABLE DATA           -  COPY public.products (id_product, article, type_product, name, description, image, min_price, size_length, size_width, size_height, weight_without_package, weight_with_package, quality_certificate, standard_number, production_time, cost_price, workshop_number, workers_count, coefficient) FROM stdin;
    public          postgres    false    217   ��       ^          0    121531    sales_history 
   TABLE DATA           j   COPY public.sales_history (id_sales_history, partner_code, product_code, quantity, sale_date) FROM stdin;
    public          postgres    false    219   _�       p          0    121652 	   suppliers 
   TABLE DATA           �   COPY public.suppliers (id_suppliers, type_suppliers, name_suppliers, inn_suppliers, "history_history ", code_employee) FROM stdin;
    public          postgres    false    237   �       n          0    121639 	   warehouse 
   TABLE DATA           P   COPY public.warehouse (id_warehouse, material_code, stock_quantity) FROM stdin;
    public          postgres    false    235   7�       f          0    121588    work_permits 
   TABLE DATA           X   COPY public.work_permits (id_work_permits, code_employee, equipment_access) FROM stdin;
    public          postgres    false    227   T�       �           0    0    access_logs_id_access_logs_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.access_logs_id_access_logs_seq', 1, false);
          public          postgres    false    228            �           0    0    employees_id_employees_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.employees_id_employees_seq', 2, true);
          public          postgres    false    224            �           0    0 *   materials_history_id_materials_history_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.materials_history_id_materials_history_seq', 1, false);
          public          postgres    false    232            �           0    0    materials_id_materials_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.materials_id_materials_seq', 6, true);
          public          postgres    false    230            �           0    0    order_items_id_order_items_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.order_items_id_order_items_seq', 1, false);
          public          postgres    false    222            �           0    0    orders_id_orders_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.orders_id_orders_seq', 1, false);
          public          postgres    false    220            �           0    0    partners_id_partner_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.partners_id_partner_seq', 6, true);
          public          postgres    false    214            �           0    0    products_id_product_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.products_id_product_seq', 5, true);
          public          postgres    false    216            �           0    0 "   sales_history_id_sales_history_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public.sales_history_id_sales_history_seq', 1, false);
          public          postgres    false    218            �           0    0    suppliers_id_suppliers_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.suppliers_id_suppliers_seq', 1, false);
          public          postgres    false    236            �           0    0    warehouse_id_warehouse_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.warehouse_id_warehouse_seq', 1, false);
          public          postgres    false    234            �           0    0     work_permits_id_work_permits_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.work_permits_id_work_permits_seq', 1, false);
          public          postgres    false    226            �           2606    121609    access_logs access_logs_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.access_logs
    ADD CONSTRAINT access_logs_pkey PRIMARY KEY (id_access_logs);
 F   ALTER TABLE ONLY public.access_logs DROP CONSTRAINT access_logs_pkey;
       public            postgres    false    229            �           2606    121586    employees employees_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id_employees);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    225            �           2606    121632 (   materials_history materials_history_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.materials_history
    ADD CONSTRAINT materials_history_pkey PRIMARY KEY (id_materials_history);
 R   ALTER TABLE ONLY public.materials_history DROP CONSTRAINT materials_history_pkey;
       public            postgres    false    233            �           2606    121623    materials materials_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT materials_pkey PRIMARY KEY (id_materials);
 B   ALTER TABLE ONLY public.materials DROP CONSTRAINT materials_pkey;
       public            postgres    false    231            �           2606    121567    order_items order_items_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id_order_items);
 F   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_pkey;
       public            postgres    false    223            �           2606    121555    orders orders_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id_orders);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    221            �           2606    121520    partners partners_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.partners
    ADD CONSTRAINT partners_pkey PRIMARY KEY (id_partner);
 @   ALTER TABLE ONLY public.partners DROP CONSTRAINT partners_pkey;
       public            postgres    false    215            �           2606    121529    products products_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id_product);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    217            �           2606    121536     sales_history sales_history_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.sales_history
    ADD CONSTRAINT sales_history_pkey PRIMARY KEY (id_sales_history);
 J   ALTER TABLE ONLY public.sales_history DROP CONSTRAINT sales_history_pkey;
       public            postgres    false    219            �           2606    121659    suppliers suppliers_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id_suppliers);
 B   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT suppliers_pkey;
       public            postgres    false    237            �           2606    121644    warehouse warehouse_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT warehouse_pkey PRIMARY KEY (id_warehouse);
 B   ALTER TABLE ONLY public.warehouse DROP CONSTRAINT warehouse_pkey;
       public            postgres    false    235            �           2606    121595    work_permits work_permits_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.work_permits
    ADD CONSTRAINT work_permits_pkey PRIMARY KEY (id_work_permits);
 H   ALTER TABLE ONLY public.work_permits DROP CONSTRAINT work_permits_pkey;
       public            postgres    false    227            �           2606    121610    access_logs fk1_employee_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.access_logs
    ADD CONSTRAINT fk1_employee_code FOREIGN KEY (employee_code) REFERENCES public.employees(id_employees) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.access_logs DROP CONSTRAINT fk1_employee_code;
       public          postgres    false    3251    229    225            �           2606    121633 #   materials_history fk1_material_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials_history
    ADD CONSTRAINT fk1_material_code FOREIGN KEY (material_code) REFERENCES public.materials(id_materials) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.materials_history DROP CONSTRAINT fk1_material_code;
       public          postgres    false    3257    233    231            �           2606    121556    orders fk1_partners_codee    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1_partners_codee FOREIGN KEY (partner_code) REFERENCES public.partners(id_partner) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 C   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk1_partners_codee;
       public          postgres    false    221    3241    215            �           2606    121573    order_items fk1_product_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk1_product_code FOREIGN KEY (product_code) REFERENCES public.products(id_product) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.order_items DROP CONSTRAINT fk1_product_code;
       public          postgres    false    223    217    3243            �           2606    121645    warehouse fk2_material_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.warehouse
    ADD CONSTRAINT fk2_material_code FOREIGN KEY (material_code) REFERENCES public.materials(id_materials) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.warehouse DROP CONSTRAINT fk2_material_code;
       public          postgres    false    3257    231    235            �           2606    121596    work_permits fk_code_employee    FK CONSTRAINT     �   ALTER TABLE ONLY public.work_permits
    ADD CONSTRAINT fk_code_employee FOREIGN KEY (code_employee) REFERENCES public.employees(id_employees) ON UPDATE CASCADE ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.work_permits DROP CONSTRAINT fk_code_employee;
       public          postgres    false    227    225    3251            �           2606    122809    suppliers fk_code_employee    FK CONSTRAINT     �   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT fk_code_employee FOREIGN KEY (code_employee) REFERENCES public.employees(id_employees) ON DELETE CASCADE NOT VALID;
 D   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT fk_code_employee;
       public          postgres    false    225    3251    237            �           2606    121537    sales_history fk_code_partners    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales_history
    ADD CONSTRAINT fk_code_partners FOREIGN KEY (partner_code) REFERENCES public.partners(id_partner) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 H   ALTER TABLE ONLY public.sales_history DROP CONSTRAINT fk_code_partners;
       public          postgres    false    219    215    3241            �           2606    121542    sales_history fk_code_product    FK CONSTRAINT     �   ALTER TABLE ONLY public.sales_history
    ADD CONSTRAINT fk_code_product FOREIGN KEY (product_code) REFERENCES public.products(id_product) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.sales_history DROP CONSTRAINT fk_code_product;
       public          postgres    false    219    217    3243            �           2606    121568    order_items fk_order_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_code FOREIGN KEY (order_code) REFERENCES public.orders(id_orders) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.order_items DROP CONSTRAINT fk_order_code;
       public          postgres    false    3247    223    221            �           2606    121660    materials fk_supplier_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.materials
    ADD CONSTRAINT fk_supplier_code FOREIGN KEY (supplier_code) REFERENCES public.suppliers(id_suppliers) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 D   ALTER TABLE ONLY public.materials DROP CONSTRAINT fk_supplier_code;
       public          postgres    false    231    237    3263            h      x������ � �      d   t   x�E���0�Wn@�[!7A*�c�(��
v�Ǫ�ԑ������;��u������:��@��-{�Z'̔dq�g���EB��Ω6���q����_,���Қt2����D�      j   [   x�3估��.칰�bӅ���v_ؠ`���p��m�_��)�1���uYp���m�_��)�)ݦ�u�p��qqq Z��      l      x������ � �      b      x������ � �      `      x������ � �      Z      x���ͮe�y�Ǉ�8�P}�_3� W��~%˄F@Z��"�)J�8`�@��:�[����4m�QO�Wwk���kU}�~�O-���/��o_��~w{~������>}����۷��^�^>|v��wɽ}�7>��ۋ���ݾ�=��{��O���}�/?㴯o?^�|s�O�|}{���ïo/߹��;�~v�A�{��ҝ�S���n�z��1��kk�s���9]~Å����p���½�p�}.�o����_~�?X�_<�<y������������{ß�����ǒ�T���&�5yvg�6S5�c���_kp�M*�%o���|��_W�KN���f��x��1���Bb0|���g��+��*/n�����k~��\�2���U�������惏�����~��ǟ<�D�w�/+�� _<|z�۝嘜J�9���ka�~�����P��}������!Q34�.𪵂J��ū�(�?�>\�%����wWAZ-XR�/��
����'=y�����R��z|�z��j�����o�,#��+���ZVy~�����
�e~ͥ8�/�`�	'<����dwƋ�T�������?_7����@������b=�uuP�����ެ(������/>��<}�ѓ�_�P�ʓ^�������p��]p�1����z�o�]���V��ū��|]�?p���W���]J��`�����~����pa��ۧ�>�L�	��
��'�CQʻ�oT�LI���ʬ��-׭��_+�Xcd�25�^m������w+���3��:3�s����zI�M��Stk%.��Hޏ����,��|kq��S�BS?l�O�q��f��k(��Vo1�o�%�>c���7�vb��7��a]G0sO�ʹ�������F�.�������-{WRə᭴�(-.�%��T|�~:��]z�3�p.�속=s:�ֱ��n3�T���t즣y�GG�:V�qՇ�c<^t�(�˹<�N��:����QFkř��Ú������b�z��V�i�R��v2�]��͵�j�/?�Yc����]8�J̍�Ek3�|Xz��,3�Uw`<����(F�}?Za�����V��:�<�9��]��ꤖckus�Y�jI��vf��Z���U\=�1���
��#���^.{�B��O��R�
\[�CV���*v�=V�Z_�g_sK5���kN�x�蕲���|�3���@W��{�f)r�I�&�6V`�{e%ZN���1
����<����:襾(��6��礌�Nq�бg�u
 ϧ��՚����kk�r]!<o��N�&3$��s��N�)����5��gEP�\=�n��7�Z��_�>���N�VO�p2v�����>4��<V���.��Ȋ�����:g1]*��?9eA�wl���'ˋ��'���C׵\<h���a�Lc��
�4���7�'F�v%ξ�fq���|�+�bW��S�tVK�-�kصl;j{f�R�c��!*n���5dY�ψ+�C����5��� �U�	0�=����q��Ԣot�-�P�3؀2�T�����sw�k]�tp����9�H�Œ��'����Ǩ=������P7|:�Y�A��<��˴(���}�����e��e0h�w1���`�X��c6�x�	�EŘ?3'��� >{12�݂���Jӝ�s�ۚ: Q�9iS�u�qVw\a��_�I�7�G3r��K�!=m{a�wgS�(��i�Q�Wm�m.ɽ��0	���d����1�zb1-� �� ��x;f�б=�c�J�m1�N��5��� ���:;cv��'�P�A*KR㤏��t=}o5�\�ٶ�>���	<[�p�)�qQ�V��aG�6S�����5�"p��X��c1�\�M� �� E�>_}����4/~��S�x�MC���~��J�=��rNu��{���@���E`�Y+M`ʙ��T�����m�w�?�(rՊ0���kL�n2M7�$�ȡk8�(�Q���x5��^�~ލ�R�.%l7�tȝ�=�_��5>5�>�C?�I	#U���Q�h0������.�@��T�E�y��j�r��~C�!�w�z^���+'��j������ �q�}����_((=c��<�
&p�s���rEէ�A}*�6^��Ь:�c��,���y&*4]�����C̗v9�:^(��6��n	.��]��8������3�vt�s�c����Vs�#�l �g.H��3����X����騹i�|L�ٺ�i�O� 8�~��n�	L�Ɯ2P��w5�[ܩ3)����Ma�CX*
q~��(]EI��=��	���TseaZq��=��*q%��|�>M"�\�����ͅ��j�x8	�=�;�]Fep��U�'�|�If���Ӏ�pg����R�֐����\��}�4Xqs�*oL�_�0z0�<���g��c-{0�[��\b�BI1n� K����%$���N����i��']���P�H7L,z�A�`�`����gb����E� k�ka��ǵ�a�6���Љ��7��!yA��@������0�
~�C(�/<,��#���UL"V�E�#�|���-���a%F�1�߁'Brh�8�4����:�yd�^ä�^P�LFP���<h�	�5�q�A�S�/"Of	����ػ^0.���]v΍4��R�0a�\&�QSz�k^Xl1*D��M;r�-��7���@5���V��,�t	��� �����2J����	셟�\�52��a��*ԝV J��q���1Z5'l.p����2����^��!�9,|����j`ų
�s ��f�I��/u�)z��:MCE�4�t8-�,�j�j���o]�ܼ�����2`'#� �?�yڰ6$��d\'bBk���P�ϋF�e˵��^)n�����؋�DM�DC�>�&�*Qv�T�2Rf�ԮpR��招jͣ�.C<O��
r�y���leX�{�7kF/ÕTi��hf"�����9�t�4� �1��.�T�O�T���1@��wb_Xx2�1�j��
_�QP$˚p� fH��L֞�V�ƕ��LL��}n�	bG=�3����|n�W$�d�jbl3�;`nAڞz�v� �)� ~vI�i�FN�?�K.��R��F�	*hO��·1m���I.c��Ճ�]��Z:��� uj	�.Hy�(�٫U�%���<���8��aK�']̗P}��$�XU����]�4�D'�&�c���K��,��&�"Rug���F:
���bզ�(���ɜ�d��0��]	��JX�4��>����x; �i� �V')�;ʋ_fx��kT:Lk���*b ����3��=����al҇�X��d2�����M|N|AS3ðD_8��C4�q�H��0ǡ�먃�ޫH��[T���,1KW�RX}`�h�G��X��B�l�Zt�pZ�J���g@�q�Xr�"K�$IT�$5LL�4&��e�͞��^dik�b+m-N�10�hi���+/��%�	3Y��U �ۓ}��Y����@��m��|f&����Qd���i�Z��k�8d�����ك��.K�;�49��/,e.]��{�����2nG�����y�J0������e4'��j�Q꣦`�0@���\�w�#���%���m(�o�F*����:�t2D�I����>�c��Ed��̀���D0Lے�����N���*�����kG�v*l��N;���B���n�ګ�R���v�A��$�R�m�^&m�d��B�^��Zx��Y�����@�, ��c䫶/�E�4�%ɘk%t���ip����;,?�\;&�����g�����J���	Z'��oR�Q6�& .��kDl�4��%�a�9N�V �Ӽ�;�I���$#�!��M>����L�����ǭEa���f#�ȑ��z�����1�8x�����=!k�H�"���vE�i�tX	�<&�qpo,I�F��%MZ�gz������e�W?��b�����QM���0* z  �L�t����5��g�~�: �0�I��F�lB=F�yU<ڴH��F	18��r0�Q �<БDFf�k*�£A��8hА� ss�"5�د������,n)�����D:::�=��	fvB;24����E}��#հH���XnY �t�k?}�v	jYe��`T�N��p�d@���1dx��H��j>�g�1����ϧ����LD���$�`�H]�T��%Ƴ�`CR�|�ɹ�:�ZE��y�%_LID`A�H��*�!�bi)�A+��T�1�-E�,�Tqb�K�;g����s���m��Z	�x�Gϧ:�(��%�@�H
�Bf-<�����O&�];Q[N�+�l��B���@h�ʌ{+��aE�n2]<�T�R��z�����`��H��J�[Ѷ�{��bA�(B�К��@9@��/�t�z��zܯ��i!��Q%�M�4�k9�o���m\_K�`*���c��RpR��|pC�,���k�h��s|�� ��x:�֙���M�45��m�?�Oؠ��'���Yp�N ��5�hI �~��~(IAia�;Q!�n|1�Eo�
��U<6�����7��iW��aI>E#�J	����ƏRof@�G�7���:E\A�3��W��X�+8��2��	8��,]�DH�� 1�v
k��R��4�II>/k�Ӵ3NWc�jJ�\���1'�=�)�&EK�jܖ�վd2�����{E&B��9	
&�w�8������l ��!֒J��ky�3¹�z (���UL�=�.I�J�ĵ�>�&]j�HO�q��T��*H��}�7�vʶ�Z+�,��58㪵�Ï�(=ۅ�(޾҃�_b��S ���)���il�I��iWNW.Ӈ�3�v�J�`�Y?H�*�9�y�0�@���0܁TH�!L�D�?<��A� �/�v��'��[gcAi^4M�cI��9��ݵ����D�Sa��,3�Q�� By��ú�f<��5F���Ѹ<>�0����B�DH�8�_֣L��$����be�8���`�R��'?��A��_��cNwm�ўi���v��:75���leMnO�� L�? |���:��"�s	?*��"P��� R�$hh�O�J ��X�#��gɃ�Q�*ހ�d�Ȕ�l=����Ǫ��NRڂɀ����a�	���\��Q�L4���������&��X��'���G8�."�S�`3��8���Y��Vpb�P=_"�Ӏ ��@9�=_���i��C���n@�>�����V���7m�o�jd�CD�!�z֦G�7��$��H�0Ǉ G��p�ÿ��G�;�@�� �p@+����E�_Β��1p����y뭷��ŮQ      \   S  x���AN�0E��)|,'�`���g�mA��H,�aO�0�6	W߈oU�B�����x��g��TU�ѓ�q�=�x��3� ��&N�M��;�?�:nr�6.�Φo9��=�����Y�	#���'gi�!%�펌J�*�ª�Y��HZ� �8?0���q�!��z�e�E�L�\�z��W�T���RS�k	h�x0~T����� j���9���b��^j=�Α�["��nL,���>��$�=����d;�G8���o�/�q&�Fn�|zH�_��ZI?���MI��䴣1��~JM�� �.��7�^�C�ҫ��Y��'낼�      ^   �   x�U�K�0C�p:��ܥ�?G����x#$C0��]£�7��A�	��%#�R��6�Ӽ�M	�S�I{hQ,��^��}���2O��[��m�2�,Bw�<X�bK጖R�׫�+��?�(bҒˆ�R�(�??�v�Kk�_��jO�40O��b��������c;�      p      x������ � �      n      x������ � �      f      x������ � �     