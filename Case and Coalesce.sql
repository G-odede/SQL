use companydb;
-- simple case
select 
employeeID,
firstname,
lastname,
departmentID,
case DepartmentID 
when 101 then "HR"
when 102 then "IT"
when 103 then "Finance"
else "other"
end as DepartmentName 
from employees;


-- Search case
select 
employeeID,
firstname,
lastname,
salary,
case 
when salary <50000 then "Low"
when salary between 50000 and 70000 then "Medium"
else "High"
end as salary_level 
from employees;

-- Conditional Aggregation
select
departmentID,
	sum(case
	when departmentID = 101 then salary
	else 0
	end) as spent_101,
	sum(case
	when departmentID = 102 then salary
	else 0
	end) as spent_102,
    
	sum(case
	when departmentID = 103 then salary
	else 0
	end) as spent_103
from employees
group by departmentid;

alter table employees add column PhoneNumber varchar(256);

select 
employeeID,
FirstName,
LastName,
coalesce(phoneNumber, "No phone number") as contact_number
from employees
limit 10;

alter table departments add column email varchar(256);
alter table departments add column PhoneNumber varchar (256);

-- combining case and coalesce
select
depname,
case departmentid
when 101 then coalesce (phonenumber,"No Phone")
when 102 then coalesce(email,"No email")
else "Contact admin"
end as contact_info
from departments;

create table datascience;


use companydb;

delimiter $$

create function function1(in minsalary decimal(10,2) )
returns table
returns (select employeeid,salary from employees where salary>5000)

delimiter $$
