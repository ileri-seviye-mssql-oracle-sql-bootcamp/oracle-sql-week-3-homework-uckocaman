-- S�PAR��� HEN�Z KARGOYA VER�LMEYEN M��TER�LER�N ADI, SOYADI, 
-- S�PAR�� TAR�H�, ALDI�I �R�NLER�N S�PAR�� TAR�H�NE G�RE SIRALANMASI
SELECT C.NAME, c.surname, o.order_date, p.product_name, s.status_type FROM orders O
INNER JOIN order_deta�ls OD ON o.order_�d = od.order_�d
INNER JOIN status S ON o.status_�d = s.�d
INNER JOIN customer C ON o.customer_�d = c.customer_�d
INNER JOIN PRODUCTS P ON OD.PRODUCT_ID = p.product_�d
WHERE s.status_type = 'Siparis Alindi'
ORDER BY o.order_date;

-- TEK SEFERDE �ND�R�MS�Z OLARAK 10'DAN FAZLA SATILAN �R�NLER 
SELECT od.quant�ty, od.pr�ce, od.d�scount, p.product_name, b.brand_name FROM order_deta�ls OD
INNER JOIN PRODUCTS P ON od.product_�d = p.product_�d
INNER JOIN brand B ON p.brand_�d = b.brand_�d
WHERE OD.quant�ty > 10 AND d�scount = 0;

-- H�� S�PAR�� VERMEYEN M��TER�LER
SELECT * FROM customer C LEFT JOIN orders O ON c.customer_�d = o.customer_�d
WHERE o.order_�d IS NULL;

-- H�� SATI� YAPILMAYAN �R�NLER
SELECT * FROM products P LEFT JOIN order_deta�ls OD ON p.product_�d = od.product_�d
WHERE od.order_�d IS NULL;