
-- sql의 주석입니다. (한 줄 주석)
/*
 여러 줄 주석입니다.
*/

/*
    #SELECT
    - 원하는 데이터를 테이블(데이터베이스의 객체)
      로부터 조회할 수 있게 해주는 키워드
    - SELECT 키워드와 다른 키워드들을 조합하여
     조건을 걸거나 범위를 지정해서 원하는 데이터를
     조회하는 것이 가능합니다.
*/
-- SELECT: 조회하라.
-- * : 모든 컬럼을
-- FROM: 어느 테이블에서
-- employees: employees라는 테이블에서.
SELECT * FROM employees;

SELECT 
    employee_id, first_name, last_name
FROM 
    employees;
    
SELECT 
    email, phone_number, hire_date
FROM
    employees;

-- 컬럼을 조회하는 위치에서 + - * / 연산이 가능합니다.
-- 연산이 가능한 컬럼은 숫자 타입의 컬럼에서만 가능합니다.
SELECT
    employee_id, first_name, last_name, salary, salary + salary*0.1
FROM
    employees;

-- null값의 확인
-- null은 이용할 수 없거나 알 수 없거나 적용할 수 없는 값입니다.
-- 공백과 0이랑은 다른 겁니다.
SELECT department_id, commission_pct
FROM employees;

-- 앨리어스 (컬럼의 이름을 변경해서 조회합니다.)
SELECT first_name as 이름, last_name as 성, salary as 급여
FROM employees;

-- 앨리어스 대신 이중 인용부호("")를 통해서도 별칭 지정이 가능합니다.
SELECT first_name "이름", salary "급여"
FROM employees;

SELECT 
first_name || ' ' || last_name || ' ''s salary is $' || salary
AS "Employee Details"
FROM employees;
/*
오라클은 홑따옴표로 문자를 표현하고, 
문자열 안에 특수문자 '를 표현하고 싶다면 
''를 두 개 찍어서 표현합니다. (자바에서 %표현 위해 %% 쓰는 거와 비슷)

오라클에서는 문자를 연결하기 위해 ||를 사용합니다.
*/

SELECT 
'''' || first_name || ' ' || last_name || '''' 
AS "full_name"
FROM employees;

-- DISTINCT (중복 행의 제거)
-- 컬럼 내의 데이터의 종류 파악에 유리.
SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;

-- ROWNUM, ROWID(얘는 잘 안써용)
-- ROWNUM은 쿼리의 결과에 대한 행 번호입니다.
-- 검색된 순서대로 차례로 번호를 붙이기 때문에 
-- 일정한 데이터의 순서를 파악해서 활용하기 좋습니다.
SELECT 
ROWNUM, ROWID, employee_id 
FROM employees;

-- 데이터 행 제한
-- where절 비교 (데이터 값은 대소문자를 구분합니다.)
SELECT
    first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG';

SELECT * FROM employees 
WHERE last_name = 'King';

SELECT * FROM employees
WHERE department_id = 90;

SELECT * FROM employees
WHERE salary >= 15000;

-- 17 05 2021

SELECT * FROM employees
WHERE hire_date = '04/01/30';

-- BETWEEN 연산자 (범위를 지정)
SELECT * FROM employees
WHERE salary BETWEEN 15000 AND 20000;

SELECT * FROM employees
WHERE salary >= 15000 AND salary <= 20000;

SELECT * FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

-- IN연산자의 사용 (특정 값들과 비교할 때 사용)
SELECT * FROM employees
WHERE manager_id in (100,101,102);

SELECT * FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP');

-- LIKE연산자는 %는 모든, _는 데이터의 위치를 찾아낼 때
-- %는 문자가 없거나 또는 하나 이상일 때
-- _는 하나의 문자를 뜻합니다.
SELECT first_name, hire_date FROM employees
WHERE hire_date LIKE '04%';

SELECT first_name, hire_date FROM employees
WHERE hire_date LIKE '%15';

SELECT first_name, hire_date FROM employees
WHERE hire_date LIKE '%05%';

SELECT * FROM employees 
WHERE email LIKE '____A%';

SELECT first_name, hire_date FROM employees
WHERE hire_date LIKE '___05%';

-- IS NULL (null값을 찾음)
-- NULL은 값이 없거나 알 수 없는 형태이기 때문에
-- 대/소 비교도 불가능하고, 같은지 (=) 연산도 불가능합니다.
SELECT * FROM employees
WHERE manager_id IS NULL;

SELECT * FROM employees
WHERE commission_pct IS NULL;

SELECT * FROM employees
WHERE commission_pct IS NOT NULL;

-- AND, OR
-- AND가 OR보다 연산속도가 빠릅니다.
-- 괄호를 이용하여 우선순위를 적절히 배치할 수 있습니다.
SELECT * FROM employees
WHERE job_id = 'IT_PROG' 
    OR job_id = 'FI_MGR' 
    AND salary >= 6000;

SELECT * FROM employees
WHERE (job_id = 'IT_PROG' 
    OR job_id = 'FI_MGR')
    AND salary >= 6000;

-- 데이터 정렬 (SELECT 구문의 가장 마지막에 옵니다.)
-- ASC: ascending -> 상승 (오름차)
-- DESC: descending -> 하강 (내림차)

SELECT * FROM employees
ORDER BY hire_date ASC;

SELECT * FROM employees
ORDER BY hire_date DESC;

SELECT * FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY first_name ASC;

SELECT * FROM employees
WHERE salary >= 5000 
ORDER BY employee_id DESC;










