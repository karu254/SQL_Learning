-- Triggers and Events
select *
from employee_demographics;

select *
from employee_salary;



/* 
   This trigger automatically inserts a new record into the `employee_demographics` table 
   whenever a new row is added to the `employee_salary` table.
   
   - It runs AFTER an INSERT operation on `employee_salary`.
   - It retrieves the `employee_id`, `first_name`, and `last_name` from the new record.
   - It inserts these values into the `employee_demographics` table.

   Note: Ensure that `employee_salary` contains `first_name` and `last_name`, 
   or modify the trigger to avoid errors.
*/
Delimiter $$
create trigger employee_insert
	after insert on employee_salary
    for each row
begin
	insert into employee_demographics (employee_id, first_name, last_name)
    values(new.employee_id, New.first_name, new.last_name);
end $$
Delimiter ;

insert into employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
values(13, 'Ruth w', 'wanjiru', 'phacial therapist', 40000, null);

-- Events
-- SQL Events are scheduled tasks that run automatically at a specified time or interval. 
-- They are similar to cron jobs in Linux or scheduled tasks in Windows.
select *
from employee_demographics;




/*
   This event automatically deletes records from `employee_demographics`
   where the employee's age is 60 or above.

   - It runs **every 30 seconds**.
   - It removes all employees aged **60 or older**.
   - Helps in **automating database cleanup** for retired employees.

    **Important Considerations:**
   - Ensure the `age` column is **updated dynamically** in the table, or this may not work as expected.
   - Running this every 30 seconds might be **too frequent**, depending on system requirements.
   - Use a **backup** or **logs** before enabling automatic deletions.
*/
delimiter $$
create event delete_retirees
on schedule every 30 second
do
begin
	delete
	from employee_demographics
    where  age >= 60;
end $$
delimiter ;

show variables like 'event%';
 