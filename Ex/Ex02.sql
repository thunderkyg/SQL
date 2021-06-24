--Basic
select*
from employees;

--Between 문
select first_name, salary, commission_pct, salary*commission_pct
from employees
where salary between 13000 and 15000;

--Null
select first_name, salary, commission_pct
from employees
where commission_pct is null;

--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select first_name, salary, commission_pct
from employees
where commission_pct is not null;

--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select first_name
from employees
where manager_id is null
and commission_pct is null;

--Order By 절   // desc - 내림차순   
select first_name, salary
from employees
order by salary desc;

select first_name, salary
from employees
where salary >= 9000
order by salary desc;

--// asc - 오름차순
select first_name, salary
from employees
order by salary asc, first_name asc;

--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select first_name, salary, department_id
from employees
order by department_id asc;

--급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select first_name, salary
from employees
where salary >= 10000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요  
select first_name, salary, department_id
from employees
order by department_id asc, salary desc;

--initcap 문 Initial Alphabet Capital
select email, initcap(email), department_id
from employees
where department_id = 100;

--가상의 테이블 dual
select initcap('aaaaaa')
from dual;

--Lower and Upper 문
select first_name, lower(first_name), upper(first_name)
from employees
where department_id = 100;

--substr
select substr('abcdefg', 4, 3)
from dual;

select first_name, substr(first_name, 1, 3), substr(first_name, -3, 2)
from employees
where department_id = 100;

--lpad rpad
select  first_name, 
        lpad(first_name, 10, '*'),
        rpad(first_name, 10, '*')
from employees;

--Replace
select  first_name,
        replace (first_name, 'a', '*'),
        replace (first_name,substr(first_name, 2,3),'****')
from employees;

select first_name, substr(first_name, 2,3)
from employees;
        
--숫자함수 round
select  round(123.345, 2) "r2",
        round(123.456, 0) "r0",
        round(123.456, -1) "r-1"
from dual;

--trunc        
select  trunc(123.345, 2) "r2",
        trunc(123.456, 0) "r0",
        trunc(123.456, -1) "r-1"
from dual;   

--abs
select abs(-5)
from dual;

--날짜 함수
select sysdate
from dual;

--Month Between
Select  sysdate,
        hire_date,
        round (months_between(sysdate, hire_date), 0)
from employees
where department_id = 110;

--to_char
select first_name, salary*12, to_char(salary*12, '$999,999.99') "Annual Salary"
from employees
where department_id = 110;

select  to_char(9876, '99999'),
        to_char(9876, '099999'),
        to_char(9876, '$9999'),
        to_char(9876, '9999.99'),
        to_char(987654321, '99,999,999,999'),
        to_char(987654321, '99,999,999.999')
from dual;

--달력
select  sysdate, 
        to_char(sysdate, 'YYYY-MM-DD HH:MI:SS'),
        to_char(sysdate, 'YYYY"년" MM"월" DD"일"'),
        to_char(sysdate, 'MM'),
        to_char(sysdate, 'MON'),
        to_char(sysdate, 'MONTH'),
        to_char(sysdate, 'DD'),
        to_char(sysdate, 'DAY'),
        to_char(sysdate, 'DDTH'),
        to_char(sysdate, 'HH'),
        to_char(sysdate, 'HH24'),
        to_char(sysdate, 'MI'),
        to_char(sysdate, 'SS')
        
from dual;

--nvl() nvl2
select  first_name, 
        nvl(commission_pct, 0),
        nvl2 (commission_pct, '값있음', '널')
from employees;
        
--Average
select  
        avg(salary)
from employees;
        
