use db;
# 1. Write a SQL query to find the salaries of all employees
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY FROM employees;

#2. Write a SQL query to find the unique designations of the employees. Return job name.
select job_title from jobs

#3. write a SQL query to list the employees’ name, increased their salary by 15%, and expressed as number of Dollars
SELECT concat(first_name,' ',last_name)as employee_name, concat('$',salary*1.15) as increased_salary FROM employees;

#4. Write a SQL query to list the employee's name and job name as a format of "Employee & Job".
select employee_id, concat(first_name,' ',last_name) as Employee,job_title as job from employees inner join jobs where jobs.job_id=employees.job_id;

#5. Write a SQL query to find those employees with hire date in the format like February 22, 1991. Return employee ID, employee name, salary, hire date.
SELECT  employee_id, concat(first_name,' ',last_name) as employee_name, salary, date_format(hire_date,'%M %d ,%Y') as hire_date FROM employees;

#6. Write a SQL query to count the number of characters except the spaces for each employee name. Return employee name length.
select first_name,last_name,length(concat(first_name,last_name)) as length_of_name from employees;

#7. Write a SQL query to find the employee ID, salary, and commission of all the employees

select employee_id, salary, commission_pct, first_name from employees;

#8. Write a SQL query to find the unique department with jobs. Return department ID, Job name. 
select distinct department_id, job_title from employees inner join jobs where employees.job_id=jobs.job_id;

#9. Write a SQL query to find those employees who joined before 1991. Return complete information about the employees.
select * from employees
where hire_date<'1991-01-01';

#10. Write a SQL query to compute the average salary of those employees who work as ‘ANALYST’. Return average salary.
  #there are no fields with 'ANALYST'
select avg(salary) from employees inner join jobs where jobs.job_id=employees.job_id and job_title='ANALYST';

# practice
select first_name, department_name, job_id from employees inner join departments where employees.department_id=departments.department_id
