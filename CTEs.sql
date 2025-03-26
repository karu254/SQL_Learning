-- Advanced SQL 😄
-- CTEs
-- CTEs (Common Table Expressions) in SQL
-- A Common Table Expression (CTE) is a temporary result set that you can reference within a SELECT, 
-- INSERT, UPDATE, or DELETE statement. It makes queries more readable, modular, and efficient.


with CTE_Example as
(
select gender, avg(salary) avg_sal, max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
from employee_demographics dem
join employee_salary sal
	on dem.employee_id = sal.employee_id
group by gender
)
select avg(avg_sal)
from CTE_Example
;



-- This query uses two Common Table Expressions (CTEs) to filter data before performing a join.
-- The first CTE (`CTE_Example`) selects employees born after January 1, 1985.
-- The second CTE (`CTE_Example2`) selects employees earning more than 50,000.
-- The final `SELECT` statement joins these two filtered datasets on `employee_id`,
-- ensuring only employees who meet both conditions appear in the results.
with CTE_Example as
(
select employee_id, gender, birth_date
from employee_demographics 
where birth_date > '1985-01-01'
),
CTE_Example2 as
(
select employee_id, salary
from employee_salary
where salary > 50000
)
select *
from CTE_Example
join CTE_Example2
	on CTE_Example.employee_id = CTE_Example2.employee_id
;

