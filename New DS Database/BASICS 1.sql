DROP database demonstration;
use demonstration;
-- create table
create table customers (
ID int not null,
NAME varchar(32) not null,
time timestamp default current_timestamp not null,
age int ,
address varchar(32),
salary int
)

-- desc customers ;

Select * from customers ;
-- Alter table
Alter table customers add constraint primary key (ID,NAME);
-- Alter tablke adding columnn
Alter table customers add column  employer varchar(32) ;

desc customers ;

-- Alter drop  column
Alter table customers drop column employer ;
-- Alter -- droping the table - meanining deleting the table
drop table customers;


