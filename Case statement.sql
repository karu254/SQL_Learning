-- Case Statements
select first_name, last_name, age, 
case
	when age <= 30 Then 'Young'
    when age between 31 and 50 then 'Old'
    when age >=50 then 'very old'
    end as age_bracket
from employee_demographics;

-- pay increases and bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus
select first_name, last_name, salary,
Case
	when salary < 50000 then salary + (salary * 0.05) -- or after then you can do salary * 1.05, its the same, see below
    when salary > 50000 then salary * 1.07 
end as new_salary,
Case
	when dept_id = 6 then salary * .10
end as bonus
from employee_salary