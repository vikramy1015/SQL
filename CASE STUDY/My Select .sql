SELECT first_name, last_name FROM employees;
    
Select * from employees where first_name='Elvis' And (gender='F' Or gender='M');
Select * from employees where gender='F' and (first_name='Kellie' Or first_name='Aruna');

Select dept_no from departments;
    
Select * from departments;

-- IN Operator Allow SQL to return the names written in Patentheses if it is exist in our table, NOT IN will opp to IN 
Select * from employees Where first_name IN ("Denis","Elvis");
 Select * from employees Where first_name NOT IN ("Denis","Elvis");   

-- % - A substitute for a sequence of characters 
Select * from employees where first_name Like ("%Mark%");
Select * From employees where first_name like ("%ar");
Select * from employees where first_name like ("%ar%");
-- if we use _ the it will come as 4 number of characters that we using +1 for the results 
select * from employees where first_name like ("Mar_");

Select * from employees where first_name Not Like ("ar%");
Select * From employees where first_name Not like ("%ar");
Select * from employees where first_name Not like ("%ar%");
-- if we use _ the it will come as 4 number of characters that we using +1 for the results 
select * from employees where first_name Not like ("Mar_");

select * from employees where hire_date like ("%2000%");
select * from employees where emp_no like ("1000_");

-- WILD CARDS CHARACTERS
select * from employees where first_name Like ("%jack%");
select * from employees where first_name NOT Like ("%jack%");


-- Between and will provide the list between mentioned dates including from and to date 
Select * from employees where hire_date Between '1990-01-01' and '2000-01-01';
-- Not Between and will provide the dates except the dates mentinoed in from and To dates 
Select * from employees where hire_date Not Between '1990-01-01' and '2000-01-01';

-- Between and , Not Between Assignments
Select * from salaries where salary between "66000" And "70000";
Select * from salaries where emp_no not between "10004" and "10012";
Select * from salaries where emp_no between "10004" and "10012";
Select * from departments where dept_no between "d003" and "d006";


-- IS NOT NULL and IS NULL exercise
Select * from employees where first_name is not null;
Select * from employees where first_name is  null;

Select dept_name from departments where dept_no  is not null;

-- Not equal to -- Assignment 
Select * from employees where first_name !="Mark";
Select * from employees where first_name <>"Mark";

Select * from employees where hire_date >="2000-01-01";
Select * from employees where hire_date <="1985-01-01";

Select * from employees where gender="F" and hire_date >"2000-01-01";
Select * from salaries where salary > "150000";

-- SELECT DISTINCT
Select distinct gender from employees;
Select distinct hire_date from employees;

-- Getting the count of total employee's using Count function :
Select count(emp_no) from employees;
Select count(distinct first_name) from employees;

Select count(*) from salaries where salary>="100000";
Select count(*) from dept_manager;

-- ORDR BY if we are not mentioning ASC or DESC then it will be treated as Ascending order 
select * from employees order by first_name;
select * from employees order by emp_no;
select * from employees order by first_name ASC;
select * from employees order by first_name DESC;
select * from employees order by emp_no ASC;
select * from employees order by emp_no DESC;
select * from employees order by first_name , last_name ASC;
Select * from employees order by hire_date DESC;


-- Use of GROUP BY along with ORDER BY
Select * from employees;
select first_name from employees;
select first_name from employees group by first_name;
select count(first_name) from employees group by first_name;
select first_name,count(first_name) from employees group by first_name;
select first_name , count(first_name)from employees group by first_name Order by first_name DESC;

-- ALIASES (AS)  here we are mentioning the firstname count name as first_name_count by using Alias 
select first_name , count(first_name) AS first_name_count from employees group by first_name Order by first_name DESC;


/* Write a query that obtains two columns. The first column must contain annual salaries higher than 80,000 dollars. 
The second column, renamed to “emps_with_same_salary”, must show the number of employees contracted to that salary. 
 Lastly, sort the output by the first column. */
select * from salaries;
select salary , count(salary) As emps_with_same_salary from salaries where salary>"80000" group by salary order by salary ASC;
select salary , count(emp_no) As emps_with_same_salary from salaries where salary>"80000" group by Salary order by Salary ASC;


-- HAVING
Select *,AVG(Salary) from salaries  Group by emp_no having salary > 120000 order by emp_no;
Select emp_no,Avg(salary) from salaries group by emp_no having Avg(salary)>120000 order by emp_no;
  
select * from employees;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name;

Select * from dept_emp;

/* Select the employee numbers of all individuals who have signed more than 1 contract after the 1st of January 2000.
Hint: To solve this exercise, use the “dept_emp” table. */

SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) >1
ORDER BY emp_no
Limit 100 ; -- here limit is for getting the number of records 


Select * from salaries Order by salary desc limit 15;
Select * from dept_emp limit 100;

-- Count function 
Select count(salary) from salaries;
Select count(distinct(salary)) from salaries;
Select count(distinct(from_date)) from salaries;
Select count(*) from salaries;

Select * from dept_emp;
Select count(distinct(dept_no)) from dept_emp;
select * from salaries;
Select SUM(salary) from salaries;
Select MIN(salary) from salaries;
Select MAX(salary) from salaries;

Select AVG(salary) from salaries where  from_date > '1997-01-01';
Select Round(AVG(salary),1) from salaries;

Select Max(emp_no) from employees;
Select Min(emp_no) from employees;

Select * from departments_dep;




