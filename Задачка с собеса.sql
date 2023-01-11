create database Ler;
create table Ler.users (
user_id int not null,
username varchar(10),
primary key (user_id) );

create table Ler.Phones (
phone_id int not null,
user_id int,
phone_number int,
primary key (phone_id));

insert into ler.users(user_id,username)
values (1, "foo"),
(2, "bar"),
(3, "baz"),
(4, "qux");

insert into ler.phones(phone_id,user_id,phone_number)
values (1, 2, 200),
(2, 4, 200),
(3, 3, 202),
(4, 1, 200);

-- ВЫВЕСТИ НОМЕР ТЕЛЕФОНА КЛИЕНТА baz

select u.username, p.phone_number
from ler.users u
join ler.phones p
on u.user_id = p.user_id
where username = "baz";