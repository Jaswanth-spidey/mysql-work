/*ONE TO MANY*/
CREATE DATABASE relations_joins;
use relations_joins;
select database();


/*RELATIONSHIPS AND JOINS*/
/*HOW MORE THAN ONE TABLE COMBINED WORK TOGETHER*/

/*ONE TO ONE*/
/*ONE TO MANY*/

/*FOREIGN KEY*/
/*IT IS THE COLUMN OF A TABLE WHICH IS THE REFERENCE OF AN OTHER TABLE*/
/*EG: customer_id in orders table with order information
stored attached to customer_id*/
 
create table customers(
id int auto_increment,
first_name VARCHAR(100),
last_name varchar(100),
email varchar(100),
primary key (id)
);  

create table orders
(
id int auto_increment primary key,
order_date DATE,
amount DECIMAL(8,2),
customer_id int, /*->*/ 
FOREIGN KEY (customer_id) REFERENCES customers(id) 
);

INSERT INTO customers (first_name, last_name, email) 
VALUES ('Boy', 'George', 'george@gmail.com'),
       ('George', 'Michael', 'gm@gmail.com'),
       ('David', 'Bowie', 'david@gmail.com'),
       ('Blue', 'Steele', 'blue@gmail.com'),
       ('Bette', 'Davis', 'bette@aol.com');

INSERT INTO orders (order_date, amount, customer_id)
VALUES ('2016/02/10', 99.99, 1),
       ('2017/11/11', 35.50, 1),
       ('2014/12/12', 800.67, 2),
       ('2015/01/03', 12.50, 2),
       ('1999/04/11', 450.25, 5);
/*FOR THIS OPERATION WE WILL GET ERROR AS we don't have customer_id-98*/
INSERT INTO orders (order_date, amount, customer_id)
values ('2016/06/06', 33.67,98);  

/*JOINS*/
/*Using subquery (not joins)*/
SELECT * from orders WHERE customer_id =
	(
		select id from customers
        where last_name = 'George'
	);
/*JOINS -> */
SELECT * FROM customers, orders; /*IMPLICIT JOIN*/
SELECT * FROM customers, orders WHERE customers.id = orders.customer_id;

/*IMPLICIT INNER JOIN*/
/*Take the data where two tables overlap, IMPLICIT*/
SELECT first_name, last_name, order_date, amount 
FROM customers, orders 
	WHERE customers.id = orders.customer_id;

/*EXPLICIT INNER JOIN*/
SELECT first_name,last_name,order_date,amount from customers
JOIN orders
	ON customers.id = orders.customer_id;

/*GETTING FANCIER*/
SELECT first_name,last_name,sum(amount) as total_spent, count(*) as 'No of orders' from customers
JOIN orders
	ON customers.id = orders.customer_id group by first_name order by total_spent desc; 
/*You can write JOIN as INNER JOIN*/
SELECT * from customers
INNER JOIN orders
	ON customers.id=orders.customer_id;
/*MOST OF THE CASES PEOPLE USE INNER JOIN*/

/*LEFT JOIN*/
SELECT first_name, last_name, order_date, amount
FROM customers
LEFT JOIN orders
	ON customers.id = orders.customer_id;

SELECT first_name, last_name, IFNULL(sum(amount),0) as total_spent
FROM customers
LEFT JOIN orders
	ON customers.id = orders.customer_id
GROUP BY customers.id ORDER by total_spent desc;

/*RIGHT JOIN*/
/* SELECT everything from orders(B) in this case,
along with any matching records in customers(A)*/
SELECT * FROM customers
RIGHT JOIN orders 
	ON  customers.id = orders.id;
    
/*HOW THE JOIN WORKS*/
/*ON DELETE CASCADE*/
/* ALLOWS TO DELETE A RECORD EVEN HAVING A FORIEGN KEY SYNTAX ->
REFERENCES (id) ON DELETE CASCADE*/
/*IT DELETES RECORDS IN customers, orders table of particular customer_id*/

/*EXTRA - ACTIVITY*/
create table students(
id int auto_increment primary key,
first_name varchar(100)
);
create table papers(
student_id int,
title varchar(100),
grade int,
foreign key (student_id) references students(id)
);

INSERT INTO students (first_name) VALUES 
('Caleb'), 
('Samantha'), 
('Raj'), 
('Carlos'), 
('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89); 

select first_name,title,grade from students
inner join papers
on students.id=papers.student_id order by grade desc;
select first_name,title,grade from students
left join papers
on students.id=papers.student_id;
select first_name, ifnull(title,'MISSING') as title,ifnull(grade,0) as grade from students
left join papers
on students.id=papers.student_id;
select first_name, ifnull(avg(grade),0) as average from students
left join papers
on students.id=papers.student_id group by first_name order by average desc;
select first_name, ifnull(avg(grade),0) as average,
	case
		when ifnull(avg(grade),0)>75 then 'PASSING'
        else 'FAILING'
	end as passing_status 
from students
left join papers
on students.id=papers.student_id group by first_name order by average desc;



/*MANY TO MANY*/

create table reviewers(
id int auto_increment primary key,
first_name varchar(100),
last_name varchar(100)
);
create table series(
id int auto_increment primary key,
title varchar(100),
released_year YEAR(4),
genre varchar(100)
);

create table reviews(
id int auto_increment primary key,
rating decimal(2,1),
series_id int,
reviewer_id int,
foreign key (series_id) references series(id),
foreign key (reviewer_id) references reviewers(id)
);



INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');

INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');

INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);

/*Challenge 1*/
SELECT title,rating from series
inner join reviews
on series.id=reviews.series_id;

/*Challenge 2*/
select title, avg(rating) as avg_rating from series
inner join reviews
on series.id = reviews.series_id group by title order by avg_rating;

/*Challenge 3*/
select first_name,last_name,rating from reviewers
inner join reviews
on reviewers.id = reviews.reviewer_id;

/*Challenge 4*/
Select title from series
left join reviews 
on series.id =reviews.series_id where ifnull(rating,0)=0;

/*Challenge 5*/
select genre, avg(rating) from series
join reviews 
on series.id = reviews.series_id group by genre;

/*Challenge 6*/
select first_name,last_name, count(rating) as 'COUNT', ifnull(min(rating),0) as 'MIN', ifnull(max(rating),0) as 'MAX',
ifnull(avg(rating),0) as 'AVG',
	case
		when ifnull(min(rating),0)=0 then 'INACTIVE'
        else 'ACTIVE'
	end as 'STATUS'
from reviewers
left join reviews 
on reviewers.id = reviews.reviewer_id group by first_name;

/*Challenge 7 - 3 tables*/
select title,rating,CONCAT(first_name,' ',last_name) as 'reviewer' from reviewers 
INNER Join reviews 
	on reviewers.id = reviews.reviewer_id
INNER join series
	on series.id = reviews.series_id order by title;