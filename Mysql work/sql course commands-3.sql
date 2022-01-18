/*STRINGS*/

/*Setting up new database for work*/
create database book_shop;
use book_shop;


CREATE TABLE books 
	(
		book_id INT NOT NULL AUTO_INCREMENT,
		title VARCHAR(100),
		author_fname VARCHAR(100),
		author_lname VARCHAR(100),
		released_year INT,
		stock_quantity INT,
		pages INT,
		PRIMARY KEY(book_id)
	);

INSERT INTO books (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES
('The Namesake', 'Jhumpa', 'Lahiri', 2003, 32, 291),
('Norse Mythology', 'Neil', 'Gaiman',2016, 43, 304),
('American Gods', 'Neil', 'Gaiman', 2001, 12, 465),
('Interpreter of Maladies', 'Jhumpa', 'Lahiri', 1996, 97, 198),
('A Hologram for the King: A Novel', 'Dave', 'Eggers', 2012, 154, 352),
('The Circle', 'Dave', 'Eggers', 2013, 26, 504),
('The Amazing Adventures of Kavalier & Clay', 'Michael', 'Chabon', 2000, 68, 634),
('Just Kids', 'Patti', 'Smith', 2010, 55, 304),
('A Heartbreaking Work of Staggering Genius', 'Dave', 'Eggers', 2001, 104, 437),
('Coraline', 'Neil', 'Gaiman', 2003, 100, 208),
('What We Talk About When We Talk About Love: Stories', 'Raymond', 'Carver', 1981, 23, 176),
("Where I'm Calling From: Selected Stories", 'Raymond', 'Carver', 1989, 12, 526),
('White Noise', 'Don', 'DeLillo', 1985, 49, 320),
('Cannery Row', 'John', 'Steinbeck', 1945, 95, 181),
('Oblivion: Stories', 'David', 'Foster Wallace', 2004, 172, 329),
('Consider the Lobster', 'David', 'Foster Wallace', 2005, 92, 343);
/*----------*/


/*CONCAT*/
/*CONCAT(column,'text', another_column,'more text')*/
SELECT 
	CONCAT(author_fname, ' ',author_lname) AS 'Author Full Name'
FROM books;

Select author_fname As first, author_lname AS last,
CONCAT(author_fname,',',author_lname) as full
From books;

/*CONCAT_WS - CONCAT WITH SEPERATOR*/
Select CONCAT(title,'-',author_fname,'-',author_lname)
from books;
Select CONCAT_WS('-', title,author_fname,author_lname)
from books;

/*SUBSTRING*/
SELECT SUBSTRING('HELLO WORLD',1,4);
/*IN MYSQL INDEXING START FROM 1 NOT 0*/
SELECT SUBSTRING('HELLO WORLD',3);
/*STARTS FROM PARTICULAR INDEX*/
SELECT SUBSTRING('HELLO WORLD',-7);
/*STARTS INDEXING IN REVERSE AND STARTS FROM THERE*/

SELECT SUBSTRING(title, 1, 10) as 'Short title'
from books;
/*dOUBLE QOUTES USAGE IS ADVICED STRICTLY*/

/*SUBSTRING short cut - SUBSTR()*/

/*REPLACE*/
SELECT REPLACE('HELLO WORLD','HELL','%$#@');
SELECT REPLACE('HELLO WERLD','L',7);
SELECT REPLACE('HELLO WORLD','O',0);

SELECT 
	REPLACE('CHEESE BREAD COFFEE MILK',' ',' AND ');

SELECT REPLACE(title,'e','3') FROM books;

SELECT SUBSTRING(REPLACE(title,'e','3'),1,10) as 'Weird String'
FROM books;

/*REVERSE*/
SELECT REVERSE('HELLO WORLD');

SELECT REVERSE(author_fname)
from books;

SELECT CONCAT('WOOF',REVERSE('WOOF'));
SELECT CONCAT(author_fname, REVERSE(author_fname)) as 'Author fname palindrome'
from books;

/*CHAR_LENGTH()*/
SELECT CONCAT(author_lname,' is ',CHAR_LENGTH(author_lname),' characters long') as 'Details'
from books;
/*If you want use sql formatter*/

/*UPPER() AND LOWER()*/
SELECT UPPER('hello world');
SELECT LOWER('HELLO WORLD');

SELECT CONCAT('My Favourite book is ',UPPER(title)) as 'Info'
from books;

/*Extra Activity*/
SELECT Reverse(
UPPER('Why does my cat look at me with such hatred')
);
/*PRINTS - 'I-like-cats'*/
SELECT REPLACE(title,' ','->') AS 'title'
from books;
SELECT author_fname as 'forwards', Reverse(author_fname) as 'backwards'
from books;
SELECT CONCAT(UPPER(author_fname),' ',UPPER(author_lname)) as 'full name in caps'
from books;
SELECT CONCAT(title,' was released in ',released_year) as 'blurb'
from books;
SELECT title as 'title', CHAR_LENGTH(title) as 'character length'
from books;
SELECT 
	CONCAT(Substring(title,1,10),'...') as 'short title',
    CONCAT(author_fname,',',author_lname) as 'author',
    CONCAT(stock_quantity,' in stock')
from books;

/*Refining our SELECTIONS*/
INSERT INTO books
    (title, author_fname, author_lname, released_year, stock_quantity, pages)
VALUES ('10% Happier', 'Dan', 'Harris', 2014, 29, 256), 
	   ('fake_book', 'Freida', 'Harris', 2001, 287, 428),
	   ('Lincoln In The Bardo', 'George', 'Saunders', 
			2017, 1000, 367);

/*DISTINCT name says it gives distinct elements*/
SELECT author_lname
from books;

SELECT DISTINCT author_lname 
from books;
SELECT DISTINCT released_year 
from books;
SELECT DISTINCT CONCAT(author_fname,' ', author_lname)
FROM BOOKS;
SELECT DISTINCT author_fname, author_lname FROM books;

/*ORDER BY*/
/*HOW WE SORT OUR DATA*/
SELECT author_lname From books ORDER BY author_lname;
select title from books order by title;

select author_lname from books order by author_lname DESC;
/*Here desc indicates descending*/
SELECT released_year from books order by released_year desc;
SELECT title, released_year, pages from books 
order by released_year;
SELECT title, author_fname, author_lname
from books ORDER by 2;
/*Here 2 indicates author_fname as per the order we given above*
and orders according to it*/
SELECT author_fname, author_lname from books
order by author_lname,author_fname;
/*Some what complicated*/

/*LIMIT*/
SELECT title FROM books LIMIT 3;
SELECT * FROM books LIMIT 10;
SELECT title, released_year FROM books
ORDER BY released_year DESC LIMIT 10;
SELECT title, released_year From books
order by released_year desc limit 0,5;
/*Syntax specify starting point and end point*/
SELECT * FROM title LIMIT 5,183918913;


/*LIKE*/
SELECT title, author_fname FROM books
WHERE author_fname LIKE '%da%';
/*its a pattern matching*/
SELECT title, author_fname FROM books
WHERE author_fname LIKE 'da%';
/*removing first percentile symbol
says that it definitely should start with da*/
SELECT title from books
where title like '%the%';

/*LIKE PART-2*/
SELECT title, stock_quantity FROM books
WHERE stock_quantity LIKE '__';
/*gives 2 digits as output*/
/*Applications of regular expressins*/
SELECT title FROM books
WHERE title LIKE '%\%%';
/*Escape sequence*/
SELECT title FROM books
WHERE title LIKE '%\_%';

/*Extra - activity*/
SELECT title from books
where title like '%stories%';
SELECT title, pages from books
Order by pages DESC LIMIT 1;
SELECT CONCAT(title,' - ',released_year) as 'summary' from books
order by released_year desc limit 3;
SELECT title, author_lname from books
where author_lname like '% %';
SELECT title,released_year,stock_quantity from books
order by stock_quantity limit 3;
select title, author_lname from books
order by author_lname,title;
select concat('MY FAVORITE BOOK IS ',upper(author_fname),' ',upper(author_lname)) as 'yell'from books
order by author_lname, author_fname;