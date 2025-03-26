-- Window Functions
select gender, avg(salary) avg_salary
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender;

-- This query joins `employee_demographics` and `employee_salary` on `employee_id`.
-- It selects all columns from `employee_demographics` and calculates the overall average salary.
-- The `AVG(salary) OVER()` function computes the average salary across all employees and displays it in every row.
-- Unlike `GROUP BY`, this approach retains individual records while adding an aggregate value.
select dem.*, avg(salary) over() as avg_sal -- this display the avg of all since we didn't partition
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;

select dem.*, avg(salary) over(partition by gender) as avg_sal -- this will display the avg based on genders
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;

select dem.*, sum(salary) over(partition by gender) as total_sal
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;

select dem.*, sum(salary) over(partition by gender order by dem.employee_id) as rolling_total
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;

select dem.*, salary,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) as rank_num,
dense_rank() over(partition by gender order by salary desc) as dense_rank_num -- this one considers duplicates but the next number is the next number numerically (does not skip)
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id;