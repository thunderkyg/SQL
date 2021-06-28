--SubQuery

-- Salary > 11000
select *
from employees
where salary > 11000;

--Salary > DEN(Salary)
select first_name, salary
from employees
where salary >= (select salary
                 from employees
                 where first_name ='Den')
order by salary asc;