/*LOGICAL OPERATORS*/
use book_shop;
select database();
/*NOT EQUAL*/
SELECT title FROM books
WHERE released_year != 2017;
select title, author_lname from books
where author_lname != 'Harris';

/*NOT LIKE*/
SELECT title FROM books WHERE title NOT LIKE '%W%';

/*GREATER THAN*/
SELECT * FROM books
WHERE released_year > 2000 ORDER BY released_year;

/*GREATER THAN OR EQUAL TO*/
SELECT * FROM books
WHERE released_year >= 2000 ORDER BY released_year; 
SELECT title, stock_quantity from books where stock_quantity >= 100;

/*SMALL ACT*/
SELECT 99>1;
SELECT 'a'<'b';
SELECT 'A'='a';

/*LESS THAN*/
SELECT title,released_year FROM books WHERE released_year < 2000
Order by released_year;

/*LESS THAN EQUAL TO*/
SELECT title, stock_quantity FROM books
WHERE stock_quantity<=100 order by stock_quantity;
SELECT 'Q'<='q'; //*Less than (or) equal to*/

/*LOGICAL AND - && or (AND)*/
SELECT title,author_lname,author_fname, released_year FROM books
WHERE author_lname='Eggers' && released_year>2010 order by released_year;
SELECT title,author_lname,author_fname, released_year FROM books
WHERE author_lname='Eggers' AND released_year>2010 order by released_year;

SELECT title, released_year FROM books 
WHERE author_lname='Eggers' AND released_year>2010 
AND title LIKE '%novel%';

/*LOGICAL OR - || OR (OR)*/
SELECT title,author_lname,author_fname, released_year FROM books
WHERE author_lname='Eggers' OR released_year>2010 order by released_year;

/*BETWEEN*/
/*STRAIGHT FORWARD 
BETWEEN: >= AND <=*/
SELECT title,released_year FROM books
WHERE released_year BETWEEN 2004 AND 2015;

/*NOT BETWEEN*/
/*OPPOSITE OF ABOVE*/
SELECT title,released_year FROM books
WHERE released_year NOT BETWEEN 2004 AND 2015 ORDER BY released_year;

/*IN*/
/*Minimizes writing more OR operators in checking*/
SELECT title,author_fname, author_lname FROM books
WHERE author_lname IN ('Carver','Lahiri','Smith');

SELECT title, released_year FROM books
WHERE released_year IN (2017,1985);

/*NOT IN*/
SELECT title,author_fname, author_lname FROM books
WHERE author_lname NOT IN ('Carver','Lahiri','Smith')
ORDER BY author_lname,author_fname;

SELECT title, released_year from books
where released_year not in (2000, 2002, 2004,
2006,2008,2010,2012,2014,2016) order by released_year;

/* % - MODULO OPERATOR */
select title,released_year from books 
where released_year%2!=0 order by released_year;

/*CASE STATEMENTS*/
SELECT title, released_year,
	CASE
		WHEN released_year >= 2000 THEN 'Modern Lit'
        ELSE '20th Century Lit'
	END AS GENRE
FROM books order by released_year;

SELECT title,stock_quantity,
	CASE
		WHEN stock_quantity BETWEEN 0 AND 50 THEN '+'
        WHEN stock_quantity BETWEEN 51 AND 100 THEN '++'
        ELSE '+++'
	END AS 'STOCK VALUE'
FROM books order by stock_quantity;

/*EXTRA - ACTIVITY*/
/*0*/
/*0*/
/*1*/
select title, released_year from books 
where released_year<1980 order by released_year;
select title, CONCAT(author_fname,' ',author_lname) from books
where author_lname in ('Eggers','Chabon') order by author_lname;
select title,author_lname,released_year from books
where author_lname='Lahiri' && released_year>2000 order by released_year;
select title,pages from books
where pages between 100 and 200 order by pages;
select author_lname from books
where author_lname like 'c%' or author_lname like 'S%'order by author_lname;
select title,author_lname,
	CASE
		WHEN title like '%stories%' then 'Short Stories'
        WHEN title='Just Kids' OR title like 'A Heartbreaking%' then 'Memoir'
        ELSE 'Novel'
	END AS 'TYPE'
from books;
select title,author_lname, Count(*),
    CASE
		WHEN  Count(*)<=1 then Concat(Count(*),' book')
        Else Concat(count(*), ' books')
	end as 'COUNT'
From books group by author_lname order by author_lname;
drop database book_store;