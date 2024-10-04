use companydb;
select distinct 
employeeid,
TRIM(firstname) as firstname,
TRIM(lastname) as lastname
from employees;

select * from employees
where PhoneNumber is not null;