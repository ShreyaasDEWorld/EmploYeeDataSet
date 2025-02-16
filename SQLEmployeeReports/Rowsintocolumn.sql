WITH cte AS (
    SELECT 
        department,
        COUNT(employeeid) AS cnt
    FROM employees
    GROUP BY department
)
SELECT 
   max( CASE WHEN department = 'Marketing' THEN cnt ELSE 0 END) AS Marketing_cnt,
   max( CASE WHEN department = 'Finance' THEN cnt ELSE 0 END )AS Finance_cnt,
   max( CASE WHEN department = 'IT' THEN cnt ELSE 0 END) AS IT_cnt,
   max( CASE WHEN department = 'HR' THEN cnt ELSE 0 END )AS HR_cnt
FROM cte;