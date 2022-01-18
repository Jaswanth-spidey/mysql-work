/*Practical records*/
/*mysql is a not case-sensitive*/
show databases;
/*it shows all databases*/

CREATE DATABASE soap_store;
/*creates database*/

create database hello_world_db;

DROP DATABASE hello_world_db;
/*it delete database*/

USE soap_store;
/*what database to use at present that is with which you want to work
with*/

SELECT database();
/*tells which data base in use "database()" is main thing*/

/*INT range(-2^31,2^31-1)*/
/*VARCHAR range(1,255) characters*/
/*varchar uses brackets like varchar(100) 
where 100 is the maximum limit*/

/*creating table syntax
CREATE TABLE tablename
	(
		column_name datatype,
        column_name datatype
	);
*/

create table cats
	(
		name varchar(100),
        age int
	);

SHOW tables;
/*pretty straight forward shows only tables*/

show columns from cats;
/*shows columns in the table*/
    
DESC cats;
/*desc is describe the table shows same output as above
only in this case*/

DROP table cats;
/*same as drop for database*/

SHOW tables;
/*you can understand*/

/*Extra content - activity*/
create table pastries
(
	name varchar(50),
    quantity int
);
show columns from pastries;
drop table pastries;


show tables;

create table cats
	(
		name varchar(50),
        age int
	);

/*insert elements into tables*/
INSERT INTO cats(name, age)
/*in () we are specifying colums we are giving and 
others you can understand by looking at it*/
VALUES ('BLUE', 1);

INSERT INTO cats(age, name)
values(7,'jeffrey');

/*select statement gives shows everything in table
will breif about it next i.e down '*' represents all of the data*/
SELECT * from cats;

/*multiple insertion as below*/
INSERT INTO cats(name, age)
values ('Charlie', 10),
		('Peanut',5);
select * from cats;

/*extra content-activity*/
create table people
	(
		first_name varchar(20),
        last_name varchar(20),
        age int
	);

INSERT INTO people(first_name, last_name, age)
values ('Tina', 'Belcher', 13),
	   ('Bob','Belcher', 42),
       ('Calvin', 'Belcher', 70);
select * from people;
drop table people;

/*Commands for warning/error*/
SHOW WARNINGS;
/*If you wanna try get warning by passing more characters
than given value limit in values() for a varchar*/
USE soap_store;
insert into cats(name) values('nana');
select * from cats;
/*As seen above we got null values*/
/*We have to use value not null for not giving the values null
by default for ex see the table below*/
create table its_test
	(
		name varchar(50) not null,
        age int not null
    );
desc its_test;
INSERT INTO its_test(name) values('Texas');
select * from its_test;

/*Default values [DEFAULT in the place of NOT NULL
while creating the table as shown below*/
Create table cats3
	(
		name varchar(20) Default 'no name provided',
		age int default 99
	);
insert into cats3(name) values('texas');
select * from cats3;
insert into cats3(age) values(99);

/*now not null and default together*/
create table cats4
(
name varchar(20) not null default 'no name provided',
age int not null default 99
);
/*if we use null in inserting if it is a not null
you will go into errors*/

/*Primary key*/
/*Primary key should have uniquely identifiable
i.e, all values under this column should be unique*/
/*Columns are called fields*/
Create table table_primarykey(cat_id int not null,
name varchar(15),
age int,
primary key (cat_id)
);
DESC table_primarykey;
insert into table_primarykey(cat_id,name,age) 
values(1,'Jeffrey',10);
insert into table_primarykey(cat_id,name,age) 
values(2,'loouis',22);
select * from table_primarykey;
/*If we use a same id while inserting
we will run into error saying 'duplicate entry'*/
/*If we use AUTO_INCREMENT it will auto increment itself
the primary key*/
create table unqcats
	(
		catid int not null auto_increment,
		name varchar(20) not null,
		age int not null,
        primary key (catid)
	);
select * from unqcats;
insert into unqcats(name, age)
values('peanut',12),
('butter',13);

/*Extra content - activity*/
create table employee
( id int not null auto_increment,
last_name varchar(20) not null,
first_name varchar(20) not null, 
middle_name varchar(20),
age int not null,
current_status varchar(19) not null default 'employed'
,primary key (id)
); 
insert into employee(last_name, first_name, age)
values('mosh','hamedani',40);
insert into employee(last_name, first_name, age, current_status)
values('jose','portila',34,'fired');
select * from employee;
/*End of section 4*/