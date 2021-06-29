--SubQuery
--> Query within another query

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

select  first_name,
        salary,
        employee_id
from employees
where salary = (select min(salary)
                from employees);
                
--예제) 각 부서별 

3.식을 조합한다
select  first_name,
        salary
from employees
where salary < (select avg(salary)
                from employees);
                
--다중행 SubQuery
select  first_name,
        salary
from employees
where salary = 12008,
or salary = 8300;

select  first_name,
        salary
from employees
where salary in (12008. 8300);

--두식 조합
select  first_name,
        salary
from employees
where salary in (select salary
                 from employees 
                 where department_id = 110);
        
--각 부서별로 최고급여를 받는 사원을 출력하세요. 사원테이블에서 그룹번호와 급여가 같은 직원의 정보를 구한다.
select  first_name,
        salary,
        department_id
from employees
where (department_id, salary) in (  select department_id, max(salary)
                                    from employees 
                                    group by department_id)
order by department_id asc;


--department_id = 110
select salary
from employees
where department_id = 110;
--부서번호가 110인 직원의 급여 보다 큰 모든 직원의 사번, 이름, 급여를 출력하세요.(or연산--> 8300보다 큰)
select employee_id,
        first_name,
        salary
from employees
where salary >ANY (select salary
                from employees
                where department_id = 110);

--부서번호가 110인 직원의 급여 보다 큰 모든 직원의 사번, 이름, 급여를 출력하세요.(and연산--> 12008보다 큰)
select employee_id,
        first_name,
        salary
from employees
where salary >ALL (select salary
                from employees
                where department_id = 110);

--예제
--각 부서별로 최고급여를 받는 사원을 출력하세요 
select  em.first_name 이름,
        de.department_name 부서명,
        em.salary 월급
from employees em, departments de
where em.department_id = de.department_id
and (em.department_id, salary) in  (select department_id, max(salary)
                                    from employees
                                    group by department_id)
order by salary asc;

--예제 Join
--각 부서별로 최고급여를 받는 사원을 출력하세요 
--1. 각 부서별 최고 급여 테이블 s
        select department_id, max(salary)
        from employees
        group by department_id;
        
--2. 직원 테이블과 조인한다 e
        --e.부서번호 = s.부서번호    e.급여 = s.급여(최고급여)
        select *
        from employees e, (select department_id, max(salary) mSalary
                            from employees
                            group by department_id) s
        where e.department_id = s.department_id
        and e.salary = s.mSalary;
        
        
--Rownum
--급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오.
--정렬을 하면 rownum이 섞인다.
select  rownum,
        employee_id,
        first_name,
        salary
from employees
order by salary desc;

-->정렬후 rownum

select  rownum,
        employee_id,
        first_name,
        salary
from (select *
      from employees
      order by salary desc)
where rownum <= 5;




select  ort.rn
        ort.employee_id,
        ort.first_name,
        ort.salary
from (select rownum rn,
        ot.employee_id,
        ot.first_name,
        ot.salary
from (select  employee_id,
        first_name,
        salary
      from employees
      order by salary desc) ot
      )ort
where rn >=2
and rn >=5;

--예제) 07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은?

select  ort.rn,
        ort.employee_id,
        ort.first_name,
        ort.salary,
        ort.hire_date
from (select rownum rn,
        ot.employee_id,
        ot.first_name,
        ot.salary,
        ot.hire_date
from (select  employee_id,
              first_name,
              salary,
              hire_date
      from employees
      where hire_date > '07/01/01'
      and hire_date < '07/12/31'     
      order by salary desc) ot
      )ort
where rn >=3
and rn <=7;
