-- Limit & Aliasing
select *
from employee_demographics
order by age desc
limit 2, 1;
/*
ORDER BY age DESC
Sorts the employee_demographics table by age in descending order (oldest to youngest).
LIMIT 2, 1
Skips the first 2 rows (OFFSET 2)
Retrieves only 1 row (LIMIT 1) */

-- Aliasing
select gender, avg(age) as avg_age
from employee_demographics
group  by gender
having avg_age > 40