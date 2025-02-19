Hard SQL Questions
Write a SQL query to calculate the cumulative sum of SALARY for each department ordered by HIRE_DATE.
Retrieve the employee details of those who have the same SALARY as another employee.
Find the department with the highest average salary.
Write a query to rank employees by SALARY within their department.
Identify employees who were hired in the same month (regardless of year) as any other employee.
Find employees whose SALARY is within 10% of the average salary of their DEPARTMENT_ID.
Write a query to return employees who do not have any subordinates.
Using a recursive query, display the hierarchy of employees starting from Steven King.
Find employees who were hired exactly one year before or after another employee.
Write a query to pivot the employee count by JOB_ID across different DEPARTMENT_ID.


--Write a SQL query to calculate the cumulative sum of  SALARY for each department ordered by HIRE_DATE.

SELECT 
    department_id,
    hire_date,
    SUM(salary) OVER (PARTITION BY department_id ORDER BY hire_date ASC) AS "CumulativeSum"
FROM emp
ORDER BY department_id, hire_date desc;