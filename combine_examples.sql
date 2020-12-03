-- TEK�L OLARAK M��TER�LER�M VE �ALI�ANLARIM
select  name, surname from employees 
UNION
select name, surname from customer;

-- VER� TABANIMA KAYITLI T�M K���LER, AYNI ANDA HEM �ALI�ANIM HEM DE M��TER�M OLANLAR VARSA �K� KERE GEL�R
select  name, surname from employees 
UNION ALL
select name, surname from customer;

-- SADECE HEM M��TER�M HEM DE �ALI�ANIM OLANLAR
select  name, surname from employees 
INTERSECT
select name, surname from customer;

-- �ALI�ANIM OLMAYAN M��TER�LER�M
select  name, surname from customer 
MINUS
select name, surname from employees