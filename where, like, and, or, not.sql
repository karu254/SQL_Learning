-- WHERE clause
select *
from parks_and_recreation.employee_salary
where first_name = 'leslie';


select *
from parks_and_recreation.employee_salary
where salary > 50000;


select *
from parks_and_recreation.employee_demographics
where birth_date > '1985-01-01'; 

-- logical operators--  AND OR NOT--
select *
from parks_and_recreation.employee_demographics
where birth_date > '1985-01-01'
and gender = 'Male'; -- both conditions must be met --


select *
from parks_and_recreation.employee_demographics
where birth_date > '1985-01-01'
or gender = 'Male'; -- either birthdate or gender has to be true --

select *
from employee_demographics
where (first_name = 'leslie' and age = 45) or age > 55
; /* Note: the parenthisis will execute first, then if condition is met, the next condition 
which is outside the parenthisis is executed. BUT even if either of the conditions is not met 
the other one will execute */

-- like statement--
select *
from employee_demographics
where first_name LIKE 'jer%' ;
/* must start with jer and end with anything, 
if the % sign come before, then you can start with 
anything and end with whichever specified value */

select *
from employee_demographics
where first_name LIKE 'a__' 
/* when you use the _, it means specific, lets take an example Ann
a__ "those are 2 underscores" means that we are looking for a name that starts with a and 
ends with only 2 characters */
-- % = anything, _ = specific value--
