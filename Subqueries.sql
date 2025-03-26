-- Subqueries
-- its a query within another query
select * 
from employee_demographics
where employee_id IN 
				(select employee_id
					from employee_salary
					where dept_id = 1)
                    
/*Inner Subquery (SELECT employee_id FROM employee_salary WHERE dept_id = 1)
Retrieves all employee_ids from employee_salary where dept_id = 1.
This means it selects the IDs of employees working in department 1.
Outer Query (SELECT * FROM employee_demographics WHERE employee_id IN (...))
Fetches all records from employee_demographics where the employee_id matches one of the IDs from the subquery.
Essentially, it retrieves details (e.g., name, age, gender) of employees working in department 1.
*/
;


-- Alternatively you can use...
SELECT dem.* -- the dem. * means you select everything from dem table
FROM employee_demographics dem
JOIN employee_salary sal 
    ON dem.employee_id = sal.employee_id
WHERE sal.dept_id = 1;


select first_name, last_name, salary,
(select avg(salary)
from employee_salary) as avg_salary
from employee_salary
;


select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender;



-- This query calculates the average of the maximum ages across all gender groups.  
-- The subquery first groups employees by gender and finds the avg, max, min, and count of ages per gender.  
-- The outer query then computes AVG(max_age), giving the average of the highest ages for each gender.  
select avg(max_age)
from
(select gender, 
avg(age) avg_age, 
max(age) max_age, 
min(age) min_age, 
count(age)
from employee_demographics
group by gender) agg_table
;



SELECT gender, AVG(age) AS avg_age, MAX(age) AS max_age
FROM employee_demographics
GROUP BY gender;



