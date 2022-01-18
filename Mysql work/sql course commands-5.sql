/*DATA TYPES*/
create database new_testing_db;
use new_testing_db;
SET SQL_SAFE_UPDATES = 0;

create table dogs
	(
		name CHAR(5),
        breed VARCHAR(10)
	);
drop table dogs;
/*STRING*/
/*VARCHAR*/
/*CHAR*/
/*CHAR has a fixed length*/
/*The length of a CHAR column is fixed to the length 
that you declare when you create the table. 
The length can be any value from 0 to 255. 
When CHAR values are stored, they are right-padded with spaces to the 
specified length. When CHAR values are retrieved, trailing 
spaces are removed unless the PAD_CHAR_TO_FULL_LENGTH SQL mode is 
enabled.*/
insert into dogs(name, breed)
values ('bob','beagle');
insert into dogs(name, breed)
values ('robby','corgi');
insert into dogs(name, breed)
values ('Princess Jane','Retriever');
select * from dogs;
/*CHAR is fast for fixed length*/
/*But we use varchar the most */

/*INT*/
/*DECIMAL - DECIMAL(13,2)*/
/*FIRST NO-13 IS NUMBER OF DIGITS BEFORE DECIMAL
SECOND NO-2 IS NUMBER OF DIGITS AFTER DECIMAL*/
CREATE TABLE items (price DECIMAL(5,2));
insert into items(price) values(7);
insert into items(price) values(7466483);
insert into items(price) values(34.88);
insert into items(price) values(298.9999);
insert into items(price) values(1.9999);
select * from items;

/*FLOAT and DOUBLE*/
/*FLOAT - 7 DIGITS, DOUBLE - 15 DIGITS*/
/*Using DECIMAL is suggested*/
CREATE TABLE thingies(price FLOAT);
insert into thingies(price) values(88.45);
insert into thingies(price) values(8888.47);
insert into thingies(price) values(8877665544.47);
select * from thingies;

/*DATES AND TIMES*/
/*DATE*/
/*FORMAT- YYYY-MM-DD usage can be birthday*/
/*TIME is the least usage in practical world of projects*/
/*FORMAT-HH:MM:SS*/
/*DATETIME- will be most used*, Last Updates could be the use case
*/
/*FORMAT- YYYY-MM-DD HH:MM:SS*/
CREATE TABLE people (name VARCHAR(100), birthdate DATE, birthtime TIME, birthdt DATETIME);

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Padma', '1983-11-11', '10:07:35', '1983-11-11 10:07:35');

INSERT INTO people (name, birthdate, birthtime, birthdt)
VALUES('Larry', '1943-12-25', '04:10:42', '1943-12-25 04:10:42');

SELECT * FROM people;

/*CURDATE() - gives current date*/
/*CURTIME()- gives current time*/
/*NOW() - gives current date and time*/
select curdate();
insert into people(name, birthdate, birthtime, birthdt) 
values('Toaster',CURDATE(),CURTIME(),NOW());
select * from people;

/*Many date and time functions but all will be not used every time*/
SELECT name, birthdate from people;
/*DAY()*/
/*DAYNAME()*/
/*DAYOFWEEK()*/
/*DAYOFYEAR()*/
select name, birthdate, DAYNAME(birthdate) from people;
SELECT name, birthdate, DAYOFYEAR(birthdate) from people;
select name, birthdate, DAYOFWEEK(birthdate) from people;
select name, birthdate, MONTHNAME(birthdate) from people;
select name, birthdate, HOUR(birthtime) from people;

/*"2017-04-21"*/
/*to April 21st 2017"*/
/*MONTHNAME DAY YEAR with concat*/
SELECT CONCAT(MONTHNAME(birthdate),' ',DAY(birthdate),' ',YEAR(birthdate)) from people;
/*MUCH BETTER WAY,*/

/*SPECIFIERS*/
/*DATE_FORMAT()*/
SELECT DATE_FORMAT(birthdt,'Was born on %W') FROM people;
SELECT DATE_FORMAT(birthdt,'%d/%m/%Y at %h:%m') FROM people;
/*doc reference for % operators
link: https://dev.mysql.com/doc/refman/8.0/en/date-and-time-functions.html#function_date-format*/
/*Date_format is usually used the most*/

/*DATE MATH*/
/*DATEDIFF()- GIVES NO OF DAYS FROM NOW TO THAT DAY IN BELOW CASE*/
SELECT name, birthdate,DATEDIFF(NOW(),birthdate) FROM people;
/*DATEADD() will not be useful very much good to know they exist*/
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 1 MONTH) FROM people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 10 SECOND) FROM people;
SELECT birthdt, DATE_ADD(birthdt, INTERVAL 3 QUARTER) FROM people;

/* +/- sign */
/*most preferrable way to use*/
SELECT birthdt, (birthdt + INTERVAL 1 MONTH) FROM people;
SELECT birthdt, (birthdt - INTERVAL 5 MONTH) FROM people;
SELECT birthdt, (birthdt + INTERVAL 15 MONTH - INTERVAL 10 HOUR) FROM people;

/*TIMESTAMPS*/
/*DATETIME AND TIMESTAMPS differ in boundaries like TIMESTAMPS year is 1970-2038 only*/
/*BUT WHY TIMESTAMPS EXIST ANSWER - IT TAKES LESS TIME WITH LESS SPACE*/
/*USE DATETIME EVERYWHERE BUT THE USECASE BELOW USE TIMESTAMPS*/
CREATE TABLE comments(
content VARCHAR(100),
created_at TIMESTAMP DEFAULT NOW()
);

insert  comments (content) values('lol what a funny article');
insert comments(content) values('I found this offensive');
select * from comments;
insert into comments (content) values('aiaidfkjb');
SELECT * from comments order by created_at desc;


/*PRETTY MUCH ONLY NOW USED*/
CREATE TABLE comments2(
content VARCHAR(100),
created_at TIMESTAMP DEFAULT NOW() ON UPDATE CURRENT_TIMESTAMP
);

insert into comments2 (content) values('lol what a funny article');
insert into comments2(content) values('I found this offensive');
select * from comments2;
insert into comments2 (content) values('aiaidfkjb');
SELECT * from comments2 order by created_at desc;

UPDATE comments2 set content='THIS IS NOT GIBBERISH' where content='aiaidfkjb';

/*Extra - activity*/
/*CAN be used in y/n usecase*/
/* 1-varchar
	2-float()
    3-int*/
/*The key difference b/w datetime and timestamp is timestamp 
boundaries are limited to 1970's-2038 but it is good used in
in updating etc but datetime is advicable*/
select curtime();
select curdate();
select dayname(now());
select week(now());
select date_format(now(),'%m/%d/%Y');
select date_format(now(), '%M %D at %H:%I'); /*I is hour*/
create table tweet(
contentss varchar(10),
username varchar(10),
created_at TIMESTAMP DEFAULT NOW()
);
DESC tweet;

insert into tweet (username,contentss)
values ('coltsteele','Itanean');
select * from tweet;



