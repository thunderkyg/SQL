--그룹함수

--단일행함수
select first_name, round(salary,-4)
from employees;

--그룹함수 --> 오류발생
select first_name, avg(salary)
from employees;

--그룹함수 Count
select  count(*), 
        count(commission_pct),
        count(first_name)
from employees;

select count(*), round(avg(salary), 2)
from employees
where salary > 16000;

--그룹함수 Sum
select sum(salary), count(*)
from employees;

--그룹함수 avg() null일때 0으로 변환해서 사용

select  count(*),    --개수 107
        count(commission_pct),  --35 commission_pct 값이 있는 직원
        sum(commission_pct), -- 전체 합계
        
        avg(commission_pct),
        sum(commission_pct)/count(commission_pct),
        
        avg(nvl(commission_pct, 0)),
        sum(commission_pct)/count(*)
from employees;

--그룹함수 max() min()
select  max(salary), min(commission_pct)
from employees;

select first_name, salary
from employees  
order by salary desc;


--Group By 절
select  department_id,
        salary
from employees
order by department_id asc;

select department_id, round(avg(salary), 0)
from employees
group by department_id
order by department_id asc;

select count(*), sum(salary)
from employees
group by department_id; 

--그룹을 더 세분화
select department_id, job_id, avg(salary)
from employees
group by department_id, job_id
order by department_id asc;

select *
from employees;

--연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 급여합계를 출력하세요
select department_id, count(*), sum(salary)
from employees
where sum(salary) >= 20000
group by department_id;


--Group은 where 대신 'Having'을 사용
select department_id, count(*), sum(salary)
from employees
where department_id = 90
group by department_id
having sum(salary) >= 20000
order by department_id asc;

--Case ~ End 문
select  employee_id,
        job_id,
        salary,
        case 
            when job_id = 'AC_ACCOUNT' then salary*1.1
            when job_id = 'SA_REP' then salary*1.2
            when job_id = 'ST_CLERK' then salary*1.3
            else salary
        end rSalary    
from employees;

--Decode 문
select employee_id,
        job_id,
        salary,
        decode( job_id, 'AC_ACCOUNT', salary*1.1,
                        'SA_REP', salary*1.2,
                        'ST_CLERK', salary * 1.3,
                salary) rSalary
from employees;