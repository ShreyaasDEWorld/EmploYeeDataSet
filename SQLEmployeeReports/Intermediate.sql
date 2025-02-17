Intermediate SQL Questions
Find the total salary paid for each DEPARTMENT_ID.
Retrieve all employees who have SALARY greater than the department average salary
Write a query to get the second highest salary from the emp table.
Find the number of employees in each DEPARTMENT_ID, sorted in descending order.
How do you retrieve employees who were hired in the year 2007?
Display all employees who have the same JOB_ID as 'Steven King'.
Write a query to get employees whose LAST_NAME contains exactly 6 characters.
Retrieve the top 3 highest-paid employees in each department.
Write a query to show employees and their respective managers names.
Find employees who have a higher salary than their manager.



--Find the total salary paid for each DEPARTMENT_ID.

select DEPARTMENT_ID,
sum(salary) as "TotalSalaryPaidEachDept"
from 
emp 
group by DEPARTMENT_ID
order by sum(salary) desc


--Retrieve all employees who have SALARY greater than the department average salary.
WITH PerDeptAvgsalary AS (
    SELECT  
        employee_id,
        first_name,
        last_name,
        salary,
        department_id,
        AVG(salary) OVER (PARTITION BY department_id) AS avgsalary
    FROM emp
)
SELECT 
    employee_id,
    first_name,
    last_name,
    salary,
	avgsalary
FROM PerDeptAvgsalary
WHERE salary > avgsalary;

--Write a query to get the second highest salary from the emp table.

with cte as (
		select 
		employee_id,
		first_name,
		salary,
		dense_rank() over (order by salary desc) as drnk
		from 
		emp
)

select * from cte
where 
 drnk=2
 
--Find the number of employees in each DEPARTMENT_ID, sorted in descending order.
with cte as(
	select *,
	row_number() over(partition by department_id ) as rnum
	from 
	emp
)
select d.department_name,
count(rnum) as "totalcont"
from department d
inner join cte c on d.department_id=c.department_id
group by department_name
order by count(rnum) desc


--How do you retrieve employees who were hired in the year 2007?
select 
employee_id,
first_name,
extract(year from hire_date) as "YearToBEHired"
from emp
where extract(year from hire_date)=2007


--Display all employees who have the same JOB_ID as 'Steven King'.
--Display all employees who have the same JOB_ID as 'Alexander Khoo'
with cte as (
select * from emp
where JOB_ID in (select JOB_ID from emp where first_name='Alexander' and last_name='Khoo')
)
select employee_id,
first_name,
last_name,
job_id
from cte
where first_name not in ('Alexander') and last_name not in('Khoo')


----Write a query to get employees whose LAST_NAME contains exactly 6 characters.
select employee_id,first_name,
last_name,length(last_name) as "CountOFlastName"
from emp
where length(last_name)=6

--Retrieve the top 3 highest-paid employees in each department.
with cte as (
select 
employee_id,
first_name,
last_name,
salary,
department_id,
rank() over (partition by department_id order by salary desc) as rnk
from emp
)
select * from cte
where rnk < 3
order by salary desc

--Write a query to show employees and their respective managers names.
SELECT 
    e.EMPLOYEE_ID, 
    e.FIRST_NAME || ' ' || e.LAST_NAME AS Employee_Name,
    m.EMPLOYEE_ID AS Manager_ID,
    m.FIRST_NAME || ' ' || m.LAST_NAME AS Manager_Name
FROM emp e
LEFT JOIN emp m ON e.MANAGER_ID = m.EMPLOYEE_ID
ORDER BY e.MANAGER_ID;
--Find employees who have a higher salary than their manager.

--Write a query to show employees and their respective managers names.
SELECT 
    e.EMPLOYEE_ID, 
    e.FIRST_NAME || ' ' || e.LAST_NAME AS Employee_Name,
    m.EMPLOYEE_ID AS Manager_ID,
    m.FIRST_NAME || ' ' || m.LAST_NAME AS Manager_Name,
	e.salary as "EmployeeSalary",
	m.salary as "ManagerSalary"
FROM emp e
LEFT JOIN emp m ON e.MANAGER_ID = m.EMPLOYEE_ID
where e.salary > m.salary
ORDER BY e.MANAGER_ID;
