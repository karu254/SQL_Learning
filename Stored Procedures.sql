-- Stored Procedures
-- A stored procedure is a precompiled block of SQL code that can be stored in the database and executed multiple 
-- times with different parameters. It helps in automation, efficiency, security, and reusability.
select *
from employee_salary
where salary >= 50000;


create procedure large_salaries()
select *
from employee_salary
where salary >= 50000;

call  large_salaries();

-- more practical example
Delimiter $$
create procedure large_salaries2()
begin
	select *
	from employee_salary
	where salary >= 50000;
	select *
	from employee_salary
	where salary >= 10000;
end $$
Delimiter ;
call  large_salaries2();

Delimiter $$
create procedure large_salaries3(get_their_sal int)
begin
	select salary
	from employee_salary
	where employee_id = get_their_sal
    ;
end $$
Delimiter ;
call large_salaries3(1);