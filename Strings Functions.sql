-- String Functions
select length('Henry');

select first_name, LENGTH(first_name) as length
from employee_demographics
order by length;

select first_name, Upper(first_name) as upper_case
from employee_demographics;

select trim('        henry   ');
select rtrim('       henry   ');
select ltrim('       henry   ');

select first_name,
left(first_name, 4) as first_4 ,
right(first_name, 4) as last_4,
birth_date,
substring(birth_date,6,2) as birth_Month
/* lets say I want to get the birth_month of every member, using substring, i'll specify
the column, the the 6 in this case stand for the number of steps I want it to skip until
here it starts to cut the string, then the 2 stands for the number for strings that will be 
displayed in then output */
from employee_demographics;

select first_name, replace(first_name, 'a', 'z') -- used to replace specified characheters with the new assigned charachers
from employee_demographics;

select first_name, locate('An', first_name) as An -- locates the specified character(s) from the specified column
from employee_demographics;

select first_name, last_name,
concat(first_name,' ', last_name) as full_name -- combines the names into one
from employee_demographics;