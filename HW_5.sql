-- HW5
-- #1 база данных классических моделей 
-- (написать -- write sql for #1,2,3,4,5,7) -- для 5го урока
-- 1.сколько поставщиков, продуктовых линеек и продуктов существует в базе данных?
select count(distinct productVendor), count(distinct productLine), count(distinct productName) 
from classicmodels.products;

-- 2.какова средняя цена, цена покупки, MSRP для каждого поставщика?
select productVendor, avg(buyPrice), avg(MSRP)
from classicmodels.products
group by productVendor;

-- 3.какова средняя цена, цена покупки, MSRP на одного клиента?
select o.customerNumber, avg(de.priceEach), avg(p.buyPrice), avg(p.MSRP)
from classicmodels.orders o
join classicmodels.orderdetails de
on o.orderNumber = de.orderNumber
join classicmodels.products p
on de.productCode = p.productCode
group by o.customerNumber;

-- 4.какой товар был продан больше всего?
select sum(o.quantityOrdered), p.productName
from classicmodels.orderdetails o
join classicmodels.products p
on p.productCode = o.productCode
GROUP BY p.productName;

SELECT COUNT(p.productCode), MAX(o.quantityOrdered), p.productName
FROM classicmodels.orderdetails o
JOIN classicmodels.products p ON o.productCode = p.productCode
GROUP BY p.productCode
ORDER BY p.productCode DESC;

-- 5.сколько денег было заработано между BuyPrice и MSRP?
select productVendor, productName, MSRP, buyPrice, MSRP-buyPrice as razniza 
from classicmodels.products
order by productVendor;

select sum(prod.msrp * det.quantityOrdered) as msrp_sales, 
sum(prod.buyPrice * det.quantityOrdered) as buyPrice_sales,
sum(prod.msrp * det.quantityOrdered) - sum(prod.buyPrice * det.quantityOrdered) as difference_in_sales
from classicmodels.products prod
join classicmodels.orderdetails det on prod.productCode = det.productCode;

-- 6.какой продавец продает Shelby Cobra 1966 года выпуска?
select productVendor, productName from classicmodels.products
where productName like "%1966%Shelby%Cobra%";

-- 7.какой поставщик продает больше товаров?
select productVendor, productName, sum(quantityInStock)
from classicmodels.products
group by productVendor
order by sum(quantityInStock) desc;

SELECT prod.productVendor, SUM(det.quantityOrdered) as quantity, count(det.productcode) as quantity2
FROM classicmodels.products prod
JOIN classicmodels.orderdetails det on prod.productCode = det.productCode
GROUP BY prod.productVendor
ORDER BY quantity desc
LIMIT 1;
-- 8.какой продукт является самым дорогим и наименее затратным?
select msrp, productName
from classicmodels.products
order by msrp desc
limit 1;

select msrp, productName
from classicmodels.products
order by msrp
limit 1;

-- Или такой вариант
select min(MSRP) as MinMSRP, max(MSRP) as MaxMSRP
from classicmodels.products;

-- 9.какой продукт имеет наибольшее количество на складе?
select productName, quantityInStock 
from classicmodels.products
order by quantityInStock desc
limit 1;

-- 10.перечислите все товары, количество которых на складе меньше 20
select productName, quantityInStock 
from classicmodels.products
where quantityInStock < 20;

-- 11.у какого клиента самый высокий и самый низкий кредитный лимит?
select customerNumber, creditLimit as MaxLimit
from classicmodels.customers
order by creditlimit desc
limit 1;

select customerNumber, creditLimit as MinLimit
from classicmodels.customers
order by creditlimit asc
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
select round(avg(shippedDate - orderDate),0) from classicmodels.orders;

-- 19.продажи по годам
select orderDate from classicmodels.orders;
-- 20.сколько заказов не отправлено?
select count(*) as NotShipped
from classicmodels.orders
where status != "Shipped";
 
-- 21.перечислите всех сотрудников по их (полное имя: имя + фамилия) в алфавитном порядке
select concat(lastName, " ", firstName) as fullName
from classicmodels.employees
order by fullName;

-- 22.список сотрудников по количеству проданных ими товаров в 2003 году?

-- доп. Список сотрудников по сумме покупок клиентов за 2003 год.
select e.firstName, e.lastName, sum(p.amount)
from classicmodels.employees e
join classicmodels.customers c
on c.salesRepEmployeeNumber = e.employeeNumber
join classicmodels.payments p
on p.customerNumber = c.customerNumber
where p.paymentDate like "%2003%"
group by e.firstName
order by sum(p.amount) desc;

-- 23.в каком городе больше всего сотрудников?
select o.officeCode, o.city, count(e.employeeNumber)
from classicmodels.employees e
join classicmodels.offices o
on e.officeCode = o.officeCode
group by o.officeCode
order by count(e.employeeNumber) desc
limit 1;

-- 24.в каком офисе самые большие продажи?


-- Часть #2 -- HW 5
-- инструкция sql (classicmodels db) с использованием union: показывать товары с ценой покупки > 100 и <200
select productName, buyPrice
from classicmodels.products
where buyPrice > 100
union
select productName, buyPrice
from classicmodels.products
where buyPrice < 200;

-- инструкция sql (classicmodels db) с использованием subquery: показать имена всех клиентов с сотрудниками в офисе в Сан-Франциско

select salesRepEmployeeNumber, customerName
from classicmodels.customers
where salesRepEmployeeNumber in 
(select distinct employeeNumber
from classicmodels.employees 
where officeCode in 
(select officeCode from classicmodels.offices where city = 'San Francisco'));

-- Часть #3 library_simple database
-- Найдите все даты выдачи книги "Собака с деньгами"
select name, pub_year, id
from library_simple.book
where name = "Dog With Money";
select book_id, id
from library_simple.copy
where book_id = 61;
select count(issue_date) from library_simple.issuance
where copy_id in (573, 758, 960);

select count(issue_date) 
from library_simple.issuance i
join library_simple.copy c
on i.copy_id = c.id
join library_simple.book b
on c.book_id = b.id
where name = "Dog With Money";


-- Мои пробы 

insert into mywork.dept (deptno,dname,city,country)
values (1, "Vas", "Saratov", "Russia"),
(2, "Vas9", "Moscow", "Russia"),
(3, "lusa", "Penza", "Germany");

select "maywork" as db, city 
from mywork.dept
union
select "classicmodels" as db, city
from classicmodels.customers;

select count(*) from classicmodels.customers
where city in ("Boston",'NYC','San Francisco');
