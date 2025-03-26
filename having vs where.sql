-- having vs where 
select gender, avg(age) 
from employee_demographics
group by gender
having avg(age) > 40;
/* GROUP BY gender → Groups all employees by their gender.
AVG(age) → Calculates the average age for each gender group.
HAVING avg(age) > 40 → Filters out groups where the average age is ≤ 40.
*/


select gender, avg(age) 
from employee_demographics
group by gender
having avg(age) > 40;

select occupation, avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) > 75000
/*WHERE occupation LIKE '%manager%'
Filters rows where occupation contains the word "manager" (e.g., "Sales Manager", "Project Manager").
GROUP BY occupation
Groups the filtered employees by their specific occupation (e.g., "Sales Manager", "HR Manager").
AVG(salary)
Calculates the average salary for each occupation group.
HAVING avg(salary) > 75000
Filters out occupations where the average salary is ≤ 75,000, keeping only those earning more.
*/
;


