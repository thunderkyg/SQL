SELECT
    *
FROM
    employees;

--원하는 컬럼만 조회하기
     SELECT
      employee_id,
      first_name,
      last_name
  FROM
      employees


--예제)
select
    first_name,
    phone_number,
    hire_date
, SALARY FROM EMPLOYEES;


select employee_id as empNo,
        first_name as "f-name",
        salary as "급 여"
from employees

select employee_id as 사원번호,
    first_name as 이름,
    last_name as 성,
    salary as 급여,
    phone_number as ,
    email as ,
    hire_date as ,
from employees;

연결 연산자(Concatenation)로 컬럼들 붙이기
select first_name || ' ' || last_name as 이름
from employees;

select first_name || ' hired date is ' || hire_date as "입사일"
from employees;

--산술 연산자 사용하기
select first_name,
       salary,
       salary*12,
       (salary+300)*12
from employees;

select job_id*12
from employees;

select  first_name || '-' || last_name as "성명",
        salary as "급여",
        salary*12 as "연봉",
        (salary+5000)*12 as "연봉2",
        phone_number as "전화번호"
from employees;

select first_name
from employees
where department_id = 10;

select  first_name,
        salary
from employees
where  salary >= 15000;

select  first_name,
        hire_date
from employees
where hire_date > '07/01/01';

select  first_name,
        salary
from employees
where first_name = 'Lex';

select first_name, salary
from employees
where salary >= 14000
and salary <=17000;

select first_name, hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';

select first_name, last_name, salary
from employees
where first_name in ('Neena', 'Lex', 'John');

select first_name, last_name, salary
from employees
where salary in (2100, 3100, 4100, 5100);

select first_name, last_name, salary
from employees
where salary = 2100
or salary = 3100
or salary = 4100
or salary = 5100;

select *
from employees
where first_name like '%l';

select  first_name,
        salary
from employees
where first_name like '%am%';

select  first_name,
        salary
from employees
where first_name like '_a%';

select  first_name
from employees
where first_name like '___a%';

select  first_name,
        salary
from employees
where first_name like '__a_'