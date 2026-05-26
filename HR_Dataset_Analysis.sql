create database hrdata;
use hrdata;

-- upload csv file as table employees
select *from employees;

-- total employees
select count(*) as total_employees
from employees;

-- total old employees
select count(*) as total_old_employees
from employees
where DateOFTermination !='';

-- total current employees
select count(*) as total_current_employees
from employees
where DateOfTermination = '';

-- average salary 
select avg(salary) as avg_salary
from employees;

-- average age
select avg(timestampdiff(year,str_to_date(DOB,'%d-%m-%Y'), curdate()))
as avg_age
from employees;

-- average year in company
select avg(timestampdiff(year,str_to_date(DateofHire,'%d-%m-%Y'),
curdate())) as avg_years_in_company
from employees;

-- adding new column for employees cureent status
alter table employees
add EmployeeCurrentStatus int;

-- updating values for new column 
set sql_safe_updates = 0;
update employees
set EmployeeCurrentStatus = case
when DateOFTermination = ''THEN 1
else 0
end;

-- calculate attrition rate based on custom EmpStatusID values
select 
(cast(count(case when EmployeeCurrentStatus = 0 then 1 end) as float) / count(*)) * 100 as attirition_rate
from employees;

-- get column names and data types
describe employees;
-- or
show columns from employees;

-- print 1st 5 rows
select *from employees
limit 5;

-- print last 5rows
select *from employees
order by EmpID desc
limit 5;




