use testcoursedb ;

--   Find the total department in employee table
select count(distinct department_id) as total_departments from employees;

-- find the max salary
select max(salary) as max_salary from employees;
-- find the min salary 
select min(salary) from employees;
--  find the total salary 
select sum(salary) as total_salary from employees;
-- find the avg salary 
select avg(salary) from employees;

-- 1. Find the total employees in each department
select department_id, count(employees) as total_emp from employees group by department_id;
 -- 2. Find the total department in each job
 select job_id, count(department_id) as total_departments from employees group by job_id;
 
-- 3. Find the average salary according to department
select department_id ,avg(salary) as avg_salary from employees group by department_id;
-- 4. Find the max salary for each job id
select job_id , max(salary) as max_salary from employees group by job_id;
-- 5. Find the total salary dispursed in each department
select department_id , sum(salary) as total_salary from employees group by department_id;
-- 6. Find the total employees in each department where employees are greater than 5
select department_id , count(*) as total_employees from employees group by department_id having count(*)>5;
-- 7. Find the total department in each location and having a manager
select location_id, count(*) as total_departments from departments where manager_id is not null group by location_id;
-- 8. Find the total department in each location and it should be greater than 2
select location_id,count(*) as total_departments from departments group by location_id having count(*) > 2; 
-- 9. Find the max salary for each job id and department should be 60,90,100,110
select job_id, max(salary) as max_salary from employees where department_id in(60,90,100,110) group by job_id;
select * from departments;
select * from employees;

-- 1. Write a query to display the names (first_name, last_name) and salary for
-- all employees whose salary is not in the range 10,000 through $15,000.
select first_name ,last_name ,salary from employees where salary not in (10000 and 15000);
-- 2. Write a query to display the names (first_name, last_name) and
-- department ID of all employees in departments 30 or 100 in ascending
-- alphabetical order by department ID.
select first_name,last_name,department_id from employees
where department_id in (30 , 100) 
order by department_id asc;
-- 3. Write a query to display the names (first_name, last_name) and salary for
-- all employees whose salary is not in the range $10,000 through $15,000
-- and are in department 30 or 100.
select first_name,last_name,salary from employees
where salary not between (10000 and 15000) and department_id in (30, 100);
-- 4. Write a query to display the names (first_name, last_name) and hire date
-- for all employees who were hired in 1987.


-- 5. Write a query to display the first_name of all employees 
-- who have both "b" and "c" in their first name.
select first_name from employees where first_name like '%b%' and  first_name like '%c%' ;

-- 6. Write a query to display the last name, job, and 
-- salary for all employees whose job is that of a Programmer 
-- or a Shipping Clerk, and whose salary
-- is not equal to $4,500, $10,000, or $15,000.
select last_name, job_id , salary from employees 
where job_id in ('programmer','shipping clerk') and 
salary not in(4500,10000,15000);

select e.last_name, j.job_title,e.salary from employees e join jobs j on e.job_id = j.job_id
where (j.job_title = 'programmer' or j.job_title = 'shipping clerk') and 
e.salary not in (4000,10000,15000);
select * from employees where last_name = 'Geoni';
select * from jobs;

-- 7. Write a query to display the last names of employees whose names have
-- exactly 6 characters.
select last_name from employees where length(last_name) = 6;
-- 8. Write a query to display the last names of employees
--  having 'e' as the third character.
select last_name from employees where last_name like '__e%' ;
-- 9. Write a query to display the jobs/designations available in the employees table.
select distinct job_id from employees;
-- 10. Write a query to display the names (first_name, last_name), 
-- salary and PF (15% of salary) of all employees
select first_name, last_name, salary , salary * 0.15 as PF from employees;

-- Assignment:
-- # Assignment2:
-- #Use testdb
-- #1. Find the empid, firstname, lastname and salary of employee
select employee_id,first_name, last_name, salary from employees;
-- #2. Find the employees in deptid 60
select first_name,last_name, department_id from employees where department_id = 60;

-- #3. Find the employees with salary greater than 1000
select first_name,last_name,salary from employees where salary > 1000;
-- #4. Find the employees whose manager id is not given
select first_name,last_name, manager_id from employees where manager_id = ' ' or manager_id is null;

-- #5. find the department whose manaer_id is 0
select department_id,department_name,manager_id from departments where manager_id = ' ';
-- #6. Find the employees with salary in range 5000 to 10000
select first_name,last_name,salary from employees where salary between 5000 and 10000;
-- #7. Find the employees who works in deparment 10,20 or50
select first_name,last_name,department_id from employees where department_id in (10, 20 ,50);
-- # 8.Find the employees who work in department 80 and 60  and has salary above 15000
select first_name, last_name, department_id , salary from employees
 where department_id in (80,60) and salary > 15000 ;

-- Assignment:
-- # Like Clause
-- use testdb;

-- # show the employee names starting with vowels
select first_name, last_name from employees where first_name like 'a%' or first_name like 'e%' or first_name like 'i%' or first_name like 'o%' or first_name like 'u%' ;
-- # show the employee names ending with vowels
select first_name, last_name from employees where first_name like '%a' or first_name like '%e' or first_name like '%i' or first_name like '%o' or first_name like '%u' ;
-- # show the department names having exactly 5 characters
select department_id,department_name from departments where department_name like '_____' ;
-- # show the employee names starting with a and having min 2 characters
select first_name, last_name from employees where first_name like 'a%' and length(first_name) >= 2;
-- # show the employees names that start with a and end with r
select first_name, last_name from employees where first_name like 'a%r' ;

-- # Update and Delete
-- # 1. Increase the salary of all employees by 10%
update employees set salary = salary * 1.10;
-- # 2. Increase the salary of employees by 1000 who works in department 60
update employees set salary = salary + 1000 where department_id =60;
 -- # 3. Delete the employees working in 60 department -- Ensure to rollback this
delete from employees where department_id = '60';
rollback;

select * from employees;

