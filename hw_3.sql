-- Создать базу 
create database mybase;

-- Создать таблицу в базе
create table mybase.my_data (
number_id int not null,
firstName varchar (50),
age int ,
pet varchar (50),
sibling int,
primary key (number_id));

-- Проверить созданную таблицу
select * from mybase.my_data;

-- Добавить столбец в таблицу
alter table  mybase.my_data 
add column icq int;

-- Добавить данные в столбцы
insert into  mybase.my_data(number_id, firstName, age, pet, sibling, icq)
values (2, "Vas9", 23, "Dog", null, "678864345");

-- Удалите один столбец
alter table mybase.my_data
drop column icq;

-- Заменить даннные в колонке
update mybase.my_data 
set age = 28, firstName = "lusa", pet = "Cat"
where number_id = 2;

-- Удалить данные из таблицы  
delete from mybase.my_data 
where pet = "Cat";

-- Переименовать колонку
alter table mybase.my_data
rename column sibling to sisters_brothers;

-- Удаление таблицы
drop table mybase.my_data;



-- HW_3
-- Часть 1 - база данных mywork 
--  1. Добавьте столбец "страна" в таблицу dept в базе данных mywork
--  2. Переименуйте столбец "местоположение" в "город"


create database mywork;

create table mywork.dept (
deptno int not null,
dname varchar(14),
loc varchar(13),
primary key (deptno));

select * from mywork.dept;

alter table mywork.dept
add column country varchar (50);

alter table mywork.dept
rename column loc to city;




-- Написать sql по library_simple
--  1. Каково имя автора с фамилией Свенсон?
--  2. Сколько страниц в книге "Люди без страха"?
--  3. Показать все категории книг, начинающиеся с буквы "W"

select first_name, last_name from library_simple.author
where last_name = 'Swanson';

select name, page_num from library_simple.book
where name = "Men Without Fear";

select name from library_simple.category
where name like "W%";