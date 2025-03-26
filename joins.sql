-- Join
select *
from employee_demographics;

select *
from employee_salary;

-- INNER JOIN
select *
from employee_demographics dem
inner join employee_salary sal
	ON dem.employee_id = sal.employee_id
;

select dem.employee_id, age, occupation
from employee_demographics dem
inner join employee_salary sal
	ON dem.employee_id = sal.employee_id
/* INNER JOIN employee_salary sal ON dem.employee_id = sal.employee_id
Joins the employee_salary table (sal) with employee_demographics based on the employee_id column.
Only rows with matching employee_id values in both tables will be included. */
;

-- Outer Join
select *
from employee_demographics as dem
right join employee_salary as sal
	ON dem.employee_id = sal.employee_id
;

select *
from employee_demographics as dem
left join employee_salary as sal
	ON dem.employee_id = sal.employee_id
;

-- self join
select 
emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as emp_name,
emp2.first_name as first_name_emp,
emp2.last_name as last_name_emp
from employee_salary emp1
join employee_salary emp2
	on emp1.employee_id + 1 = emp2.employee_id
/* JOIN employee_salary emp2 ON emp1.employee_id + 1 = emp2.employee_id
Joins the same employee_salary table, but with a different alias (emp2).
The condition emp1.employee_id + 1 = emp2.employee_id ensures that each row 
(emp1) is matched with the next row (emp2) where the employee_id is exactly 1 greater.
The result pairs each employee (emp1) with the next employee (emp2).
*/
;

-- Joining multiple tables together
select *
from employee_demographics dem
inner join employee_salary sal
	ON dem.employee_id = sal.employee_id
inner join parks_departments pd
	on sal.dept_id = pd.department_id 
;

select * 
from parks_departments;

