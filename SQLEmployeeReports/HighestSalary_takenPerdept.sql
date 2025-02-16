with cte as 
(
	select 
	department,
	avg(salary) as "salryavg"
	from 
	public.employees
	group by department
) ,diff as (

select e.department,
e.salary,
c.salryavg,
case 
when c.salryavg > e.salary then 1 else 0 end as "Highestsalaryaken" ,
(c.salryavg - e.salary) as "saladryDff"
from employees e inner join cte c
on e.department=c.department 
)

select * from diff where "Highestsalaryaken"=1