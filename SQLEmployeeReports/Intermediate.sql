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

Write a query to get the second highest salary from the emp table.
Find the number of employees in each DEPARTMENT_ID, sorted in descending order.
How do you retrieve employees who were hired in the year 2007?
Display all employees who have the same JOB_ID as 'Steven King'.
Write a query to get employees whose LAST_NAME contains exactly 6 characters.
Retrieve the top 3 highest-paid employees in each department.
Write a query to show employees and their respective managers' names.
Find employees who have a higher salary than their manager.