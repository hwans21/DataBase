-- 그룹함수 AVG, MAX, MIN, SUM, COUNT
SELECT * FROM employees;

SELECT 
AVG(salary), MAX(salary), MIN(salary), SUM(salary), COUNT(*)
FROM employees;

-- 그룹함수는 NULL값이 있는 컬럼은 조회에 포함하지 않습니다.
SELECT COUNT(*) FROM employees; -- 총 행 데이터의 수
SELECT COUNT(first_name) FROM employees;
SELECT COUNT(commission_pct) FROM employees;
SELECT COUNT(manager_id) FROM employees;

SELECT SUM(commission_pct) FROM employees;

-- 부서별로 그룹화, 그룹함수의 사용
SELECT department_id, avg(salary)
FROM employees
GROUP BY department_id;

-- 주의할 점.
-- 그룹함수는 일반 컬럼과 동시에 출력할 수 없습니다.
SELECT department_id, avg(salary)
FROM employees; -- 에러
-- GROUP BY절을 사용할 때 GROUP절에 묶이지 않으면 
-- 다른 컬럼을 조회할 수 없습니다.
SELECT job_id, department_id FROM employees
GROUP BY department_id;

-- GROUP BY절 2개 사용.
SELECT department_id FROM employees
GROUP BY department_id
ORDER BY department_id;

SELECT department_id, job_id FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

SELECT department_id, job_id, avg(salary)
FROM employees
GROUP BY department_id, job_id;

-- employees 테이블에서 전체 사원들에 대해 부서번호별로
-- 인원수를 출력하세요.
SELECT 
    department_id AS 부서번호,
    COUNT(*) AS 사원수
FROM employees
GROUP BY department_id;

-- employees 테이블에서 전체 사원들에 대해
-- 부서번호별로 월급의 합계를 나타내세요.
SELECT
    department_id AS 부서번호,
    SUM(NVL(salary*commission_pct, salary)) AS "월급의 합계"
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- COUNT(*) 구문에서 예외적으로 컬럼에 총 행의 수를 붙여서
-- 확인이 가능합니다.

SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;

SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id
HAVING count(*) >= 20;

-- employees 테이블에서 부서번호별 월급의 평균치가
-- 8000 이상인 부서만 부서번호, 평균월급, 인원수를 나타내세요.

SELECT department_id AS 부서번호,
       TRUNC(AVG(NVL(salary+salary*commission_pct, salary))) AS 평균월급,
       COUNT(*) AS 인원수
FROM employees
GROUP BY department_id
HAVING TRUNC(AVG(NVL(salary+salary*commission_pct, salary))) >= 8000
ORDER BY department_id;

-- 연습문제1-1
SELECT job_id, count(*) AS 사원수
FROM employees
GROUP BY job_id;

-- 연습문제 1-2
SELECT job_id, AVG(salary) AS 평균월급
FROM employees
GROUP BY job_id
ORDER BY AVG(salary) DESC;

-- 연습문제 2
SELECT
    TO_CHAR(hire_date, 'YY') AS 입사연도,
    COUNT(*)
FROM employees
GROUP BY TO_CHAR(hire_date, 'YY');

-- 연습문제 3
SELECT department_id, AVG(salary)
FROM employees
WHERE salary >= 1000
GROUP BY department_id
HAVING AVG(salary) >= 2000;

-- 연습문제 4
SELECT department_id,
       TRUNC(AVG(salary + salary*commission_pct), 2) AS 평균월급,
       SUM(salary + salary*commission_pct) AS 합계,
       COUNT(*)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP by department_id;













