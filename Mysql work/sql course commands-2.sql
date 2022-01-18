/*Starting part 2*/
/*CRUD Create "Read Update Delete"*/
Use soap_store;
drop table cats;
create table cats
(
id int not null auto_increment,
name varchar(100),
breed varchar(100),
age int,
primary key (id)
);
Desc cats;
/*Just preparing data*/
insert into cats(name, breed, age)
values('Ringo','Tabby',4),
	  ('Cindy', 'Maine Coon', 10),
	  ('Dumbledore', 'Maine Coon', 11),
	  ('Egg', 'Persian', 4),
	  ('Misty', 'Tabby', 13),
	  ('George Michael', 'Ragdoll', 9),
	  ('Jackson', 'Sphynx', 7);
/*Row is called a record*/

/*SELECT statement is used for reading the data
"*" is used to refer all the data*/
/* "," seperation of fields with select statement gives
the required fields specifically*/
SELECT age, name from cats;
/*Order matters*/

/*WHERE to get "Specific data" with 
help of logic(one of the application)*/
SELECT * from cats WHERE age=4;
SELECT age,breed from cats WHERE name='EGG';
/*Here it is case-insensitive for putting
case-sensitive functionality we will be getting 
it below in future*/

/*Extra - activity*/
Select id from cats;
select name,breed from cats;
select name,age from cats where breed='Tabby'; 
select id,age from cats where id=age;
/*-----*/

/*ALIASES-"AS"*/
Select name AS 'cat name',breed AS 'cat breed' from cats;

/*UPDATE-"ALTER"*/
SET SQL_SAFE_UPDATES = 0;
/*above is to minimize an error in mysql workbench*/
UPDATE cats SET breed='Shorthair'
WHERE breed='Tabby';
select age from cats where name='misty';

UPDATE cats set age=14
where name='Misty';
/*When you update run Select to cross-check or
double-check*/

/*Extra-activity*/
Update cats set name='Jack'
where name='jackson';
select * from cats where name='Ringo';
Update cats set breed='British Shorthair'
where name='Ringo';
Select * from cats where breed='Maine Coon';
Update cats set age=12
where breed='Maine Coon';

/*Delete*/
DELETE FROM cats WHERE name='Egg';
Select * from cats;
/*DELETE FROM cats; will remove all data in table 
not the table*/

/*Activity-Extra*/
Delete From cats where age=4;
Delete from cats where id=age;
Delete from cats;
/*----*/




