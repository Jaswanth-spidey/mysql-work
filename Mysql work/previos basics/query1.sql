show databases;

create database data_base;
/*create database*/

use data_base;
/*use this database*/

drop database data_base;
/*drop used to delete database*/

create table student(id int(11) primary key, name varchar(100) not null, city varchar(50));
/*create table table_name( col1, col2,...) varchar -> string, notnull -> shouldn't be null, primary key -> should be a primary key;*/
show tables;

desc student;
/*desc used to display/ describe the table*/
drop table student;
/*delete table*/

alter table student rename to study;
/*rename table*/

desc study;

alter table student rename to study;

truncate table study;
/*delete data in table not table*/

insert into student(id, name, city) values(12, 'uaeifb', 'delhi');
/*insert data into table*/

select * from student;
/* display values in table*/

alter table student add country varchar(50);

drop table study;

alter table study rename to student;

update student set country='ind', city='mumbai' where id='12';
/*update the table rows here after where we have to give primary key attribute only remember*/
select * from student;