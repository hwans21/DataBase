--1.모든 사원의 사원번호, 이름, 입사일, 급여를 출력하세요.
SELECT employee_id, first_name, hire_date, salary
FROM employees;

--2.모든 사원의 이름과 성을 붙여 출력하세요. 열 별칭은 name으로 하세요.
SELECT first_name || last_name AS name FROM employees;

--3.50번 부서 사원의 모든 정보를 출력하세요.
SELECT * FROM employees
WHERE department_id = 50;

--4.50번 부서 사원의 이름, 부서번호, 직무아이디를 출력하세요.
SELECT first_name, department_id, job_id
FROM employees
WHERE department_id = 50;

--5.모든 사원의 이름, 급여 그리고 300달러 인상된 급여를 출력하세요.
SELECT first_name, salary, salary + 300
FROM employees;








