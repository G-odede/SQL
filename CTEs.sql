use companydb;

with EmployeesSalaries as (
select employeeID,firstname,lastname,salary,departmentid
from employees
where salary > 50000 -- additonal filter
)
select 
departmentid,
avg(salary) as avg_salary
from EmployeesSalaries
group by departmentid;