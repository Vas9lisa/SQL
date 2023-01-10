-- показать всех клиентов в Австралии
select * from classicmodels.customers
where country = "Australia";

select * from classicmodels.customers where country = 'Australia';

-- показать имя и фамилию клиентов в Мельбурне
select contactFirstName, contactLastName from classicmodels.customers
where city = "Melbourne";

select contactFirstName,contactLastName, city from classicmodels.customers where city = 'Melbourne';

-- показать всех клиентов с кредитным лимитом более 200 000 долларов
select * from classicmodels.customers
where creditLimit > 200000;

select * from classicmodels.customers where creditLimit > 200000;

-- кто является президентом компании?
select FirstName, LastName from classicmodels.employees
where jobTitle = "President";

select * from classicmodels.employees where jobTitle = 'President';

-- сколько торговых представителей работает в компании?
select count(*) from classicmodels.employees
where jobTitle = "Sales Rep";

select count(*) from classicmodels.employees where jobTitle like 'Sales%Rep%';

-- показывать платежи в порядке убывания
select * from classicmodels.payments
order by amount desc;

select * from classicmodels.payments order by amount desc;

-- какой был номер чека для оплаты, произведенной 17 декабря 2004 года
select checkNumber from classicmodels.payments
where paymentDate = "2004-12-17";

select checkNumber, paymentDate from classicmodels.payments where paymentDate = '2004-12-17';

-- показать линейку продуктов со словом "реалистичный" в описании
select * from classicmodels.productlines
where textDescription like '%realistic%';

select productLine, textDescription from classicmodels.productlines where textDescription like '%realistic%';

-- показать название продукта для поставщика "Unimax Art Galleries"
select productName from classicmodels.products
where productVendor ="Unimax Art Galleries";

select productName, productVendor from classicmodels.products where productVendor = 'Unimax Art Galleries';

-- каков номер клиента для получения наибольшей суммы платежа
select customerNumber from classicmodels.payments
order by amount desc	
limit 1; 

select customerNumber, amount from classicmodels.payments order by amount desc limit 1;
