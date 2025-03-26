-- Group By--
select *
from employee_demographics;

select gender, count(*) as total_genders
from employee_demographics
group by gender;

select gender, avg(age) as avg_age, max(age) as max_age, min(age) as min_age, count(age) as total_age
from employee_demographics
group by gender;

-- order by--
select *
from employee_demographics
order by gender, age desc
/* if you start with age then gender, the gender will not be used
since it only contains unique values which are not easy to order
therefore, it will only order by age only */
;