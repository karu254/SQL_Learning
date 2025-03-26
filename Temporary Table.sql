-- Temporary Tables
-- Break down complex queries into manageable steps.
-- Store intermediate results without affecting actual tables.
-- Improve query performance by reducing repetitive calculations.
-- Facilitate debugging by analyzing temporary data.
create temporary table temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100));

select *
from temp_table;

insert into temp_table
values('Henry', 'Karu', 'La Brea');

-- delete from temp_table
-- where first_name > 'Henry';

select * 
from employee_demographics;

create temporary table salary_over_50k
select * 
from employee_salary
where salary >=50000;

select *
from salary_over_50k;


