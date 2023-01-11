-- HW4
-- #1 база данных классических моделей 
-- (написать sql для #6, 8, 9, 10, 11, 14, 16, 17, 21) -- для 4го урока
-- 1.сколько поставщиков, продуктовых линеек и продуктов существует в базе данных?
select count(*) from classicmodels.products;

-- 2.какова средняя цена, цена покупки, MSRP для каждого поставщика?
-- 3.какова средняя цена, цена покупки, MSRP на одного клиента?
-- 4.какой товар был продан больше всего?
-- 5.сколько денег было заработано между BuyPrice и MSRP?
-- 6.какой продавец продает Shelby Cobra 1966 года выпуска?
select productVendor, productName from classicmodels.products
where productName like "%1966%Shelby%Cobra%";

-- 7.какой поставщик продает больше товаров?
-- 8.какой продукт является самым дорогим и наименее затратным?
select * from classicmodels.products;
select productName, msrp from classicmodels.products
order by msrp desc
limit 1;

-- 9.какой продукт имеет наибольшее количество на складе?
select productName, quantityInStock from classicmodels.products
order by quantityInStock desc
limit 1;

-- 10.перечислите все товары, количество которых на складе меньше 20
select productName, quantityInStock from classicmodels.products
where quantityInStock < 20;

-- 11.у какого клиента самый высокий и самый низкий кредитный лимит?
select contactFirstName, contactLastName, creditLimit from classicmodels.customers
order by creditLimit desc
limit 1;

select contactFirstName, contactLastName, creditLimit from classicmodels.customers
order by creditLimit asc
limit 1;

-- 12.ранжируйте клиентов по кредитному лимиту
select * from classicmodels.customers
order by creditLimit desc; -- asc

-- 13.перечислите наиболее продаваемый товар по городам
-- 14.клиенты в каком городе являются наиболее выгодными для компании?
select c.city, c.customerNumber, p.amount
from classicmodels.customers c  -- 122
join classicmodels.payments p -- 273
on c.customerNumber = p.customerNumber
order by p.amount desc
limit 1;

-- 15.каково среднее количество заказов на одного клиента?
-- 16.кто является лучшим клиентом?
select c.contactFirstName, c.contactLastName, p.amount
from classicmodels.customers c  -- 122
join classicmodels.payments p -- 273
on c.customerNumber = p.customerNumber
order by p.amount desc
limit 1;

-- 17.клиенты без оплаты
select c.customerNumber, p.amount
from classicmodels.customers c  -- 122
left join classicmodels.payments p -- 273
on c.customerNumber = p.customerNumber
where p.amount is null;

-- 18.каково среднее количество дней между датой заказа и датой отправки?
-- 19.продажи по годам
-- 20.сколько заказов не отправлено?
select count(*) as NotShipped
from classicmodels.orders
where status != "Shipped";

-- 21.перечислите всех сотрудников по их (полное имя: имя + фамилия) в алфавитном порядке
select concat(lastName, " ", firstName) as fullName
from classicmodels.employees
order by fullName;

-- 22.список сотрудников по количеству проданных ими товаров в 2003 году?
-- 23.в каком городе больше всего сотрудников?
-- 24.в каком офисе самые большие продажи?

-- Часть #2 -- база данных library_simple
-- 1.найдите всю информацию (запросите каждую таблицу отдельно для book_id = 252)
select * from library_simple.book where id = 252;
select * from library_simple.author_has_book where book_id = 252;
select * from library_simple.author where id in (750,770,794);
select * from library_simple.category_has_book where book_id = 252;
select * from library_simple.category where id in (46, 142);
select * from library_simple.copy where book_id = 252;
select * from library_simple.issuance where copy_id in (182, 774, 1024);
select * from library_simple.reader where id in (170, 76, 91);

-- 2.какие книги написал Ван Паркс?
select a.first_name, a.last_name, b.name
from library_simple.author_has_book h
join library_simple.author a
on a.id = h.author_id
join library_simple.book b
on h.book_id = b.id
where a.first_name = "Van" AND a.last_name = "Parks";

-- 3.какие книги были опубликованы в 2003 году?
select name, pub_year from library_simple.book
where pub_year = 2003;