-- 1 - �S�M VE SOY�SM� B�RLE�T�R�P FULL_NAME ADINDA S�TUNDA GET�R.
SELECT CONCAT(NAME, SURNAME) AS FULL_NAME FROM CUSTOMER;

-- 2 - ADRES SATIR UZUNLUKLARINA G�RE SIRALANMI� �EK�DE GET�R
SELECT address_l�ne1, LENGTH(address_l�ne1) FROM ADDRESS ORDER BY LENGTH(address_l�ne1) DESC;

-- 3 - ADRES SATIRINDA SOKAK KEL�MES� 10. KARAKTERDEN SONRA GELENLER� GET�R
SELECT INSTR(address_l�ne1, 'ultricies') FROM ADDRESS WHERE INSTR(address_l�ne1, 'ultricies') > 10;

-- 4 - T�RK M��TER�LER�M�N NUMARALARI +90 �LE BA�LAMIYORSA EKLEME
SELECT CONCAT('+90', PHONE) FROM employees E
INNER JOIN address A ON e.address_�d = a.addres_�d
INNER JOIN country C ON a.country_�d = c.country_�d
WHERE e.phone NOT LIKE '+90%' AND c.country = 'Turkey';

-- 5 - ADRES SATIRI 1 VE 2 AYNI �SE �K�NC�N�N NULL YAPILMASI
SELECT REPLACE(address_l�ne2, NULL) FROM address
WHERE address_l�ne1 = address_l�ne2;

-- 6 - �LKE �S�MLER�N�N BA� HARFLER�N�N B�Y�T�LMES�
SELECT INITCAP(country) FROM COUNTRY;

-- 7 - SOY�S�MLER�N TAMAMININ B�Y�K HARFE �EVR�LMES�
SELECT UPPER(surname) FROM employees;

-- 8 - S�PAR�� DETAY TABLOSUNDAK� �R�N �ND�R�MLER�N�N A�A�I YUVARLANMASI :)
SELECT d�scount, TRUNC(d�scount) FROM order_deta�ls;

-- 9 - B�R�M F�YATLARIN V�RG�LDEN SONRA 2 BASAMA�A YUVARLANMASI
SELECT un�t_pr�ce, ROUND(un�t_pr�ce,2) FROM PRODUCTS;

-- 10 - �R�N B�R�M F�YATLARININ 100'E B�L�MLER�NDEN KALANLARI
SELECT UNIT_PRICE, MOD(un�t_pr�ce, 100)FROM PRODUCTS;

-- 11
INSERT INTO week2.orders (customer_id,order_date,status_id,total_price) VALUES (1,TO_DATE('2020/12/2 19:18:01', 'yyyy/mm/dd hh24:mi:ss'),1 ,11595.11);

-- 12 - YIL BA�INDNA BU G�NE KADAR VER�LEN S�PAR��LER
SELECT * FROM ORDERS WHERE order_date > TO_DATE('2020/01/01', 'YYYY/MM/DD');

--13 - HAFTASONU VER�LEN S�PAR��LER�N SAYISI ve F�YAT TOPLAMI
SELECT count(*), sum(total_pr�ce) FROM ORDERS WHERE TRIM(TO_CHAR(ORDER_DATE, 'Day')) IN ('Cumartesi', 'Pazar');

-- 14 - B�R�M F�YATI EN Y�KSEK OLAN �R�NLER�M
select * FROM (SELECT row_number() OVER(ORDER BY UNIT_PRICE DESC ) RN, PRODUCT_NAME, UNIT_PRICE from PRODUCTS)
WHERE RN  <= 10;

-- 15 - EN �OK GEL�R ELDE ETT���M �LK 10 �R�N�N ADI, ID'S�, TOPLAM GEL�R, VE KA� KERE SATI� YAPILDI�I
SELECT * FROM
(
    SELECT p.product_name, OD.product_�d, SUM(OD.PRICE) AS TOPLAM_GEL�R, COUNT(OD.product_�d) AS SATIS_ADEDI,
    ROW_NUMBER() OVER(ORDER BY SUM(OD.PRICE) DESC) RN
    FROM order_deta�ls OD
    INNER JOIN PRODUCTS P ON od.product_�d = p.product_�d
    GROUP BY OD.product_�d, p.product_name
)
WHERE RN <= 10;