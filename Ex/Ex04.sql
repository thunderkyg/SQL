--Basic
select *
from employees;

select *
from departments;

select *
from jobs;

--Catesian Product
select *
from employees, departments;

--PK FP
select  employee_id,
        first_name,
        e.department_id,
        d.department_name
from employees e, departments d
where e.department_id = d.department_id;

--예제) 모든 직원이름, 부서이름, 업무명을 출력하세요.
select  em.first_name 직원이름,
        de.department_name 부서이름,
        jo.job_title 업무명
from employees em, departments de, jobs jo
where em.department_id = de.department_id
and em.job_id = jo.job_id;

--Null 표현하기 위함 left outer join 문
select  em.department_id,
        em.first_name,
        em.department_id,
        de.department_name
from employees em left outer join departments de
on em.department_id = de.department_id;

--right outer join
select  em.department_id,
        em.first_name,
        em.department_id,
        de.department_name
from employees em right outer join departments de
on em.department_id = de.department_id;

--right join --> left join
select  em.department_id,
        em.first_name,
        em.department_id,
        de.department_name
from departments de right outer join employees em 
on em.department_id = de.department_id;

--full outer join
select  em.department_id,
        em.first_name,
        em.department_id,
        de.department_name
from employees em full outer join departments de
on em.department_id = de.department_id;

--JOIN (+) 문
select *
from employees em, departments de
where em.department_id = de.department_id(+);

--Self join
select  ma.employee_id,
        ma.first_name,
        em.first_name manager,
        ma.manager_id
from employees em, employees ma
where em.employee_id(+) = ma.manager_id
order by employee_id asc;