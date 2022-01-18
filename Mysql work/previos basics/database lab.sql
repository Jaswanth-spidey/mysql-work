


select * from employee
where salary in(8000, 15000);


select * from employee
where salary between 8000 and 15000;

/* distinct is used for fetching details as non repetetive*/

select distinct department_id from employee;
/*count() will give the count of the attribute*/
select count(employee_id) from employee;

/*
like "a%" -> should start with a
like "%d" _> should end with d
like "__%d" _> how many underscores the number of _'s+1 character d wiil print;
*/

select last_name from employee
where last_name like "a%";

select last_name from employee
where last_name like "__a%";/*third character*/

/*limit -> limits number of rows in table*/
select * from employee
limit 5;

/*order by default ascending or else keywordsd -> asc, desc*/
select * from employee
order by employee_id desc;

/*min() max() avg() -> by name says what they are called aggregation functions;*/

/*aliasing -> "as" to change name*/