/*Aggregate Functions*/
use book_shop;
select database();
show tables;

/*COUNT*/
SELECT COUNT(*) FROM BOOKS;
SELECT COUNT(DISTINCT author_fname) FROM books;
SELECT COUNT(DISTINCT author_fname, author_lname) FROM BOOKS;
SELECT COUNT(*) FROM books WHERE title LIKE '%the%';

/*GROUP BY*/
/*GROUP BY summarizes or aggregates identical data into single rows*/
SELECT author_fname,author_lname, COUNT(*) FROM books
GROUP BY author_lname;
SELECT author_fname,author_lname, COUNT(*) FROM books
GROUP BY author_lname, author_fname;
SELECT released_year,COUNT(*) from books
group by released_year order by released_year;
SELECT CONCAT('In ',released_year,' ',COUNT(*),' book/s released') as 'blurb' from books
group by released_year order by released_year;

/*MIN AND MAX*/
SELECT MIN(released_year) FROM books;
SELECT MIN(pages) FROM books;
SELECT MAX(pages) from books;
/*SUB QUERY CONCEPT WILL COME FURTHER*/
SELECT title,pages FROM books
WHERE pages = (SELECT MAX(pages) FROM books);

SELECT title,pages FROM books ORDER BY pages DESC LIMIT 1;

/*MIN AND MAX With GROUP BY*/
SELECT author_fname,author_lname, Min(released_year) from books
group by author_lname,author_fname order by released_year;

SELECT author_fname,author_lname,max(pages) from books
group by author_lname,author_lname order by author_lname,author_fname;

/*SUM*/
SELECT SUM(released_year) FROM BOOKS;
/*WITH GROUP BY*/
SELECT author_fname,author_lname, Sum(released_year)
FROM books
GROUP BY author_lname,author_fname order by author_lname,author_fname;

/*AVG*/
SELECT AVG(released_year) FROM books;
SELECT AVG(pages) from books;
/*WITH GROUP BY*/
SELECT released_year,AVG(stock_quantity)
FROM books GROUP BY released_year order by released_year;
SELECT author_fname,author_lname,AVG(pages) FROM books
group by author_lname,author_fname order by author_lname,author_fname;

/*EXTRA-ACTIVITY*/
SELECT COUNT(*) from books;
SELECT released_year,count(*) from books
group by released_year order by released_year;
select sum(stock_quantity) from books;
select author_fname,author_lname,avg(released_year) from books
group by author_lname,author_fname order by author_lname,author_fname;
select CONCAT(author_fname,' ',author_lname) as 'Longest Author' from books
where pages=(select max(pages) from books);
select released_year as 'year',count(*) as '# books',avg(pages) as 'avg pages' from books
group by released_year order by released_year; 