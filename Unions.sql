-- Unions
/* allows one to combine rows together.
by default, union is a DISTINCT and it removes duplicates. if you 
use UNION ALL, it will display all the data even if it has duplicates */
select first_name, last_name
from employee_demographics
union all
select first_name, last_name
from employee_salary;

-- use case
select first_name, last_name, 'Old male' as label
from employee_demographics
where age > 40 and gender = 'male'
union 
select first_name, last_name, 'Old female' as label
from employee_demographics
where age > 40 and gender = 'female' 
union 
select first_name, last_name, 'Highly Paid Employee' as label
from employee_salary
where salary > 70000
order by first_name, last_name;