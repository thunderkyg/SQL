--1. 담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의 이름, 매니저아이디, 커미션 비율, 월급 을 출력하세요.
--(45건)

select  first_name 이름,
        manager_id 매니저아이디,
        commission_pct 커미션비율,
        salary 월급
from employees
where manager_id is not null
and commission_pct is null
and salary > 3000;

--2. 각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name), 급여(salary), 입사일(hire_date), 전화번호(phone_number), 부서번호(department_id) 를 조회하세요 
---조건절비교 방법으로 작성하세요
---급여의 내림차순으로 정렬하세요
---입사일은 2001-01-13 토요일 형식으로 출력합니다.
---전화번호는 515-123-4567 형식으로 출력합니다.
--(11건)
select  employee_id 직원번호,
        first_name 이름,
        salary 급여,
        to_char(hire_date, 'YYYY-MM-DD DAY') 입사일,
        replace(phone_number, '.', '-') 전화번호,
        department_id 부서번호
from employees
where (department_id, salary) in (select department_id, max(salary) maxsal
                                  from employees
                                  group by department_id)
order by salary desc;

--매니저별 담당직원들의 평균급여 최소급여 최대급여를 알아보려고 한다.
---통계대상(직원)은 2005년 이후(2005년 1월 1일 ~ 현재)의 입사자 입니다.
---매니저별 평균급여가 5000이상만 출력합니다.
---매니저별 평균급여의 내림차순으로 출력합니다.
---매니저별 평균급여는 소수점 첫째자리에서 반올림 합니다.
---출력내용은 매니저아이디, 매니저이름(first_name), 매니저별평균급여, 매니저별최소급여, 매니저별최대급여 입니다.
--(9건)

select  ma.manager_id 매니저아이디,
        em.first_name 매니저이름,
        avgsal 매니저별편균급여,
        minsal 매니저별최소급여,
        maxsal 매니저별최대급여
from (select  manager_id, 
        round(avg(salary), 1) avgsal, 
        min(salary) minsal, 
        max(salary) maxsal
      from employees
      where hire_date > '05/01/01'
      group by manager_id
      having round(avg(salary)) > 5000) ma, employees em
where ma.manager_id = em.employee_id;

--4. 각 사원(employee)에 대해서 사번(employee_id), 이름(first_name), 부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요. 부서가 없는 직원(Kimberely)도 표시합니다.
--(106명)

select  em.employee_id 사번,
        em.first_name 이름,
        de.department_name 부서명,
        ma.first_name 매니저이름
from employees em, employees ma, departments de
where em.manager_id = ma.employee_id
and em.department_id = de.department_id(+);

--5. 2005년 이후 입사한 직원중에 입사일이 11번째에서 20번째의 직원의 사번, 이름, 부서명, 급여, 입사일을 입사일 순서로 출력하세요
select ort.rn,
       employee_id 사번,
       first_name 이름,
       department_name 부서명,
       salary 급여,
       hire_date 입사일
from (select rownum rn,
             ot.employee_id,
             ot.first_name,
             ot.department_name ,
             ot.salary,
             ot.hire_date
      from (select employee_id,
                   first_name,
                   department_name ,
                   salary,
                   hire_date
            from employees em, departments de
            where em.department_id = de.department_id
            order by hire_date asc) ot) ort
where rn >= 11
and rn <= 20;

--6. 가장 늦게 입사한 직원의 이름(first_name last_name)과 연봉(salary)과 근무하는 부서 이름(department_name)은?
select first_name || ' ' ||last_name 이름,
       salary 연봉,          
       department_name 부서이름,
       hire_date
from employees em, departments de
where em.department_id = de.department_id
and hire_date in (select max(hire_date)
                  from employees);
                  
--7. 평균연봉(salary)이 가장 높은 부서 직원들의 직원번호(employee_id), 이름(firt_name), 성(last_name)과  업무(job_title), 연봉(salary)을 조회하시오.
select  employee_id 사번,
        first_name 이름,
        last_name 성,
        salary 급여,
        avgsalary 평균급여,
        job_title 업무
from jobs jo, employees em, (select department_id, avgsalary
                             from (select department_id,
                                          avg(salary) avgsalary
                                   from employees
                                   group by department_id)
                             where avgsalary = (select max(avgsal)
                                                from (select avg(salary) avgsal
                                                      from employees
                                                      group by department_id)))de
where em.department_id = de.department_id
and em.job_id = jo.job_id;
      
--8. 평균 급여(salary)가 가장 높은 부서는? 
select department_name
from departments de,   (select department_id
                        from (select department_id,
                                      avg(salary) avgsalary
                               from employees
                               group by department_id)
                        where avgsalary = (select max(avgsal)
                                            from (select avg(salary) avgsal
                                                  from employees
                                                  group by department_id))) avg
where de.department_id = avg.department_id;

--9. 평균 급여(salary)가 가장 높은 지역은? 
select region_name
from departments de,   
    (select department_id
     from (select department_id,
                   avg(salary) avgsalary
            from employees
            group by department_id)
     where avgsalary = (select max(avgsal)
                         from (select avg(salary) avgsal
                               from employees
                               group by department_id))) avg,
     locations lo,
     countries co,
     regions re
where de.department_id = avg.department_id
and de.location_id = lo.location_id
and lo.country_id = co.country_id
and co.region_id = re.region_id;

--10. 평균 급여(salary)가 가장 높은 업무는? 
select job_title
from   jobs jo,
       (select job_id, avgsalary
        from (select job_id, avg(salary) avgsalary
              from employees
              group by job_id)
        where avgsalary = (select max(avgsalary)
                           from (select avg(salary) avgsalary
                                 from employees
                                 group by job_id)))em
where em.job_id = jo.job_id;