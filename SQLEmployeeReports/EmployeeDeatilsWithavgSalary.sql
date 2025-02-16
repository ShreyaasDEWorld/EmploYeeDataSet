

select *,
avg(salary) over(partition by department  ) as Meolo
from employees