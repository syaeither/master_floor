PGDMP         '                }         	   recruiter    15.1    15.1     #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            &           1262    122816 	   recruiter    DATABASE     }   CREATE DATABASE recruiter WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE recruiter;
                postgres    false            �            1259    122856    deals_id_deals_seq    SEQUENCE     {   CREATE SEQUENCE public.deals_id_deals_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.deals_id_deals_seq;
       public          postgres    false            �            1259    122857    deals    TABLE       CREATE TABLE public.deals (
    id_deals bigint DEFAULT nextval('public.deals_id_deals_seq'::regclass) NOT NULL,
    code_job_seaker bigint,
    code_vacancy bigint,
    code_employee bigint,
    deal_date date NOT NULL,
    status character varying NOT NULL
);
    DROP TABLE public.deals;
       public         heap    postgres    false    221            �            1259    122826    employees_id_employees_seq1    SEQUENCE     �   CREATE SEQUENCE public.employees_id_employees_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.employees_id_employees_seq1;
       public          postgres    false            �            1259    122827 	   employees    TABLE     (  CREATE TABLE public.employees (
    id_employees bigint DEFAULT nextval('public.employees_id_employees_seq1'::regclass) NOT NULL,
    full_name text NOT NULL,
    telephone character varying,
    job_title text,
    username character varying NOT NULL,
    password character varying NOT NULL
);
    DROP TABLE public.employees;
       public         heap    postgres    false    216            �            1259    122817    employees_id_employees_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_id_employees_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.employees_id_employees_seq;
       public          postgres    false            �            1259    122818 	   employers    TABLE     �  CREATE TABLE public.employers (
    id_employers bigint DEFAULT nextval('public.employees_id_employees_seq'::regclass) NOT NULL,
    name character varying NOT NULL,
    activity_type character varying NOT NULL,
    address character varying,
    organization_details text,
    contact_full_name character varying,
    contact_telephone character varying,
    telephone character varying
);
    DROP TABLE public.employers;
       public         heap    postgres    false    214            �            1259    122847    job_seekers_id_job_seekers_seq    SEQUENCE     �   CREATE SEQUENCE public.job_seekers_id_job_seekers_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.job_seekers_id_job_seekers_seq;
       public          postgres    false            �            1259    122848    job_seekers    TABLE     �  CREATE TABLE public.job_seekers (
    id_job_seekers bigint DEFAULT nextval('public.job_seekers_id_job_seekers_seq'::regclass) NOT NULL,
    full_name text NOT NULL,
    date_birth date,
    gender character varying,
    "position" character varying NOT NULL,
    education character varying NOT NULL,
    qualification character varying,
    experience integer,
    desired_salary numeric(10,2),
    additional_info text,
    application_date date
);
    DROP TABLE public.job_seekers;
       public         heap    postgres    false    219            �            1259    122835 	   vacancies    TABLE       CREATE TABLE public.vacancies (
    id_vacancies bigint NOT NULL,
    gender character varying NOT NULL,
    "position" character varying NOT NULL,
    qualification character varying,
    drivers_license character varying,
    pc_skills character varying,
    foreign_language text,
    job_respons text,
    salary numeric(10,2),
    working_condition text,
    aditional_info text,
    application_date date NOT NULL,
    quantity integer NOT NULL,
    education character varying,
    code_employer bigint
);
    DROP TABLE public.vacancies;
       public         heap    postgres    false                       0    122857    deals 
   TABLE DATA           j   COPY public.deals (id_deals, code_job_seaker, code_vacancy, code_employee, deal_date, status) FROM stdin;
    public          postgres    false    222   *)                 0    122827 	   employees 
   TABLE DATA           f   COPY public.employees (id_employees, full_name, telephone, job_title, username, password) FROM stdin;
    public          postgres    false    217   �)                 0    122818 	   employers 
   TABLE DATA           �   COPY public.employers (id_employers, name, activity_type, address, organization_details, contact_full_name, contact_telephone, telephone) FROM stdin;
    public          postgres    false    215   �*                 0    122848    job_seekers 
   TABLE DATA           �   COPY public.job_seekers (id_job_seekers, full_name, date_birth, gender, "position", education, qualification, experience, desired_salary, additional_info, application_date) FROM stdin;
    public          postgres    false    220   �,                 0    122835 	   vacancies 
   TABLE DATA           �   COPY public.vacancies (id_vacancies, gender, "position", qualification, drivers_license, pc_skills, foreign_language, job_respons, salary, working_condition, aditional_info, application_date, quantity, education, code_employer) FROM stdin;
    public          postgres    false    218   �.       '           0    0    deals_id_deals_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.deals_id_deals_seq', 8, true);
          public          postgres    false    221            (           0    0    employees_id_employees_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.employees_id_employees_seq', 3, true);
          public          postgres    false    214            )           0    0    employees_id_employees_seq1    SEQUENCE SET     I   SELECT pg_catalog.setval('public.employees_id_employees_seq1', 5, true);
          public          postgres    false    216            *           0    0    job_seekers_id_job_seekers_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.job_seekers_id_job_seekers_seq', 11, true);
          public          postgres    false    219            �           2606    122864    deals deals_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.deals
    ADD CONSTRAINT deals_pkey PRIMARY KEY (id_deals);
 :   ALTER TABLE ONLY public.deals DROP CONSTRAINT deals_pkey;
       public            postgres    false    222            }           2606    122825    employers employees_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.employers
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id_employers);
 B   ALTER TABLE ONLY public.employers DROP CONSTRAINT employees_pkey;
       public            postgres    false    215                       2606    122834    employees employees_pkey1 
   CONSTRAINT     a   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey1 PRIMARY KEY (id_employees);
 C   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey1;
       public            postgres    false    217            �           2606    122855    job_seekers job_seekers_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.job_seekers
    ADD CONSTRAINT job_seekers_pkey PRIMARY KEY (id_job_seekers);
 F   ALTER TABLE ONLY public.job_seekers DROP CONSTRAINT job_seekers_pkey;
       public            postgres    false    220            �           2606    122841    vacancies vacancies_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT vacancies_pkey PRIMARY KEY (id_vacancies);
 B   ALTER TABLE ONLY public.vacancies DROP CONSTRAINT vacancies_pkey;
       public            postgres    false    218            �           2606    122875    deals fk_code_employee    FK CONSTRAINT     �   ALTER TABLE ONLY public.deals
    ADD CONSTRAINT fk_code_employee FOREIGN KEY (code_employee) REFERENCES public.employees(id_employees) ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.deals DROP CONSTRAINT fk_code_employee;
       public          postgres    false    3199    217    222            �           2606    122897    vacancies fk_code_employer    FK CONSTRAINT     �   ALTER TABLE ONLY public.vacancies
    ADD CONSTRAINT fk_code_employer FOREIGN KEY (code_employer) REFERENCES public.employers(id_employers) ON DELETE CASCADE NOT VALID;
 D   ALTER TABLE ONLY public.vacancies DROP CONSTRAINT fk_code_employer;
       public          postgres    false    215    3197    218            �           2606    122865    deals fk_code_job_seaker    FK CONSTRAINT     �   ALTER TABLE ONLY public.deals
    ADD CONSTRAINT fk_code_job_seaker FOREIGN KEY (code_job_seaker) REFERENCES public.job_seekers(id_job_seekers) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.deals DROP CONSTRAINT fk_code_job_seaker;
       public          postgres    false    3203    220    222            �           2606    122870    deals fk_code_vacancy    FK CONSTRAINT     �   ALTER TABLE ONLY public.deals
    ADD CONSTRAINT fk_code_vacancy FOREIGN KEY (code_vacancy) REFERENCES public.vacancies(id_vacancies) ON DELETE CASCADE;
 ?   ALTER TABLE ONLY public.deals DROP CONSTRAINT fk_code_vacancy;
       public          postgres    false    218    3201    222                �   x�3�4�4�4�4202�54�52㼰�bӅ]6\خp�Hm컰�� �����\��Ɯf@�C[#P� �I�	��)�����	�ň(ǁ�c���8?Ypr���P�������%A7��qqq i~�         (  x����J�0���Sti�
�o�.w#��gh+"r^EA.��q]m���N�ȓ�+
���!�9ߜI(������ޜ{�cPc�
0/���i��<���-F�|ӛ�TT�M������n	<8�ќ�u.=\�(Y�f�P{�Ec�jB�CeY�eQU&S�"(�RR	\�c%[�L�F&�ƫ�-�/X���DD�d������y�� ւ��a�OCv*B�زf�?[��iKс{tF�ic9v,v��컷<T��� I�H�5�P�2Y`��4��<��ꙺk�$�~���vV'�XH�?D���@J��u,         �  x��SKNA]�O�b�(�R��]r�Xĉ0�,"�p�a<�c�X�U7��,6!$��VwU��W��N���{r.sܮ�f�I�c��F)e�?����;�4�T��������QyM���ie��JJMCL)�����_&�1���)S
Ħp���ɢ�債��\2�C��H�G̷�� :�A��:CD��a��@�%�[DF�T:u�F����p8��/���N�W��9�t?G&  ����Ş�UK.8K��mPł4ְmo2A�� ��Q=�8�M���u4�E=4t;��9;�����ę�_Y�P:(�$�4L��7:s�'�Y8����$f$�cP��}�	��}ur��-$XY�Ԙq�f�q��Y\�K���&��t��nk�jFU���*�pn�Q܂�
ғ����p&�E�k�ފ�%���]f���{9~�}��F��T���R������;�η�t��t��:��1�+�         �  x���]n�@ǟgO�l�kpe�/9A䣕�*�)������	,A�+�ܨ�a�V*F�ݙ��o�"��2�/�姌���r��Z��m�/�Ū
>>�_H��)�R&��/�g��7e2�5'����\b��D�Lu��5�|�B��c�C>���!����[H�@��I���O���d�6�T�Y�a�y�����
 e�-��C ��@�$߰�ոy�a'l�!��2Jr��S'M�9�K�F��B�(�T�/�n"1�:�-�\ʕV YZ��h��
A}�"�?�) �F�0�s�)*��D|�uY-���3���{��[����2�R1�VɟPŎi� ��sW�v�j�y�U���������7�}z�.�mM�Z�#|Dһ��H6|��P:/5鯔
�+�}�!f��]�ƻ�^�����QXj��k��k^���\�0N>í��բ�nǽ�.�c��#��o ��         �  x��TmN�@�={�=�%݅��x%~o��l�@�
�7�͠hPM���!m�o޼����xE<�5?q3.xoipNg��R�ZiJ\�c��8��C��8G��~��<��+��
:�AG`͹��o�Z(Qa�幖�ɧ>$�K�'/�;���q���0�!�l��Ϣs�R�x(J�\n��J�����
�Q \ȝ�0e)U~�!?�r���R�ω�Y� v�a�N��yW������7H�D$sT��W���@N�LO�K0mTp�}���7�N�|�zJe�=��9N�8^�k�g���q���Pa�mv&|q)�k0�^��c2�"p@e 7�����zQ�x��ZM~��q�7�����Q�4�emf�K����W�8������k`m�{?��f�2Ƽ�{�$     