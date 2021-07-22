
/*
# 서브쿼리

- 서브쿼리의 사용 방법은 ()안에 명시함. 
 서브쿼리절의 리턴행이 1줄 이하여야 합니다.
- 서브쿼리 절에는 비교할 대상이 하나 반드시 들어가야 합니다.
- 해석할 때는 서브쿼리절을 먼저 해석하면 됩니다.
*/


-- 'nancy'의 급여보다 급여가 많은 사람을 검색하는 문장.
SELECT salary FROM employees WHERE first_name = 'Nancy';
SELECT * FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE first_name = 'Nancy');

-- employee_id가 103번인 사람과 job_id가 동일한 사람을 검색하는 문장.
SELECT job_id FROM employees WHERE employee_id=103;
SELECT *
    FROM employees
    WHERE job_id = (SELECT job_id 
                    FROM employees 
                    WHERE employee_id=103);

-- 다음은 서브쿼리의 리턴 행이 여러 개라서 사용할 수 없습니다.
-- 이런 경우에는 다중행 연산자를 사용합니다.
SELECT job_id FROM employees WHERE job_id='IT_PROG';
SELECT * 
FROM employees
WHERE job_id = (SELECT job_id 
                FROM employees 
                WHERE job_id='IT_PROG'); --에러

-- 다중행 연산자 
-- IN: 목록의 어떤 값과 같은지 확인합니다.
SELECT * 
FROM employees
WHERE job_id IN (SELECT job_id 
                FROM employees 
                WHERE job_id='IT_PROG');  
                
-- first_name이 David인 사람 중 가장 작은 값보다 급여가 큰 사람을 조회
SELECT salary FROM employees WHERE first_name='David';

-- ANY: 값을 서브쿼리에 의해 리턴된 각각의 값과 비교합니다. 
-- 하나라도 만족하면 됩니다.
SELECT *
FROM employees
WHERE salary > ANY (SELECT salary
                FROM employees
                WHERE first_name='David');

-- 같은 서브쿼리에 의해 리턴된 모든 값과 비교해서
-- 모두 만족해야 합니다.
SELECT *
FROM employees
WHERE salary > ALL (SELECT salary
                FROM employees
                WHERE first_name='David');

-- 스칼라 서브쿼리
-- SELECT 구문에 서브쿼리가 오는 것. LEFT OUTER 조인과 같은 결과)

SELECT first_name, department_name
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
ORDER BY first_name ASC;

-- 스칼라
SELECT 
    first_name,
    (SELECT department_name
    FROM departments d
    WHERE d.department_id = e.department_id) department_name
FROM employees e
ORDER BY first_name ASC;

/*
- 스칼라 서브쿼리가 조인보다 좋은 경우
: 함수처럼 한 레코드당 정확히 하나의 값만을 리턴할 때

- 조인이 스칼라 서브쿼리보다 좋은 경우
: 조회할 데이터가 대용량인 경우, 해당 데이터가 
 수정이 빈번한 경우.
*/

-- 각 부서의 매니저 장의 이름
-- left join
SELECT 
    d.*, e.first_name
FROM departments d
LEFT OUTER JOIN employees e
ON d.manager_id = e.employee_id
ORDER BY d.manager_id ASC;

-- 스칼라
SELECT
    d.*,
    (SELECT first_name
    FROM employees e
    WHERE e.employee_id = d.manager_id) as manager_name
FROM departments d
ORDER BY d.manager_id ASC;

-- 각 부서별 사원수 뽑기
SELECT count(*) FROM employees
GROUP BY department_id;

SELECT 
    d.*,
    (SELECT COUNT(*) FROM employees e
    WHERE e.department_id = d.department_id
    GROUP BY department_id) as 사원수
FROM departments d;

-- 인라인 뷰 (FROM 구문에 서브쿼리가 오는 것)
-- 순번을 정해놓은 조회 자료를 범위를 지정해서 가지고 오는 경우.


-- salary로 정렬을 진행하고 ROWNUM을 붙이면
-- ROWNUM이 정렬이 되지 않는 사태가 발생합니다.
-- (ROWNUM을 붙이고 정렬을 진행한다. ORDER BY는 항상 마지막에 진행.)
-- 정렬을 미리 해 놓은 자료에 ROWNUM을 붙여야 할 것 같아요.
SELECT first_name, salary
FROM employees
ORDER BY salary DESC;

-- ROWNUM을 붙이고 나서 범위를 지정해서 조회하려고 하는데,
-- ROWNUM에 별칭을 붙일 수가 없고, ROWNUM의 범위도 지정이 불가능하더라.
-- (WHERE절부터 먼저 실행하고 나서 ROWNUM이 SELECT 되기 때문에
-- WHERE절에서 조건을 걸 때, 1번부터 시작하지 않으면 아예 조회가 불가능.)
-- ROWNUM까지도 붙여 놓고 범위를 지정해서 조회해야 되겠구나.
SELECT ROWNUM, first_name, salary
        FROM 
            (SELECT  first_name, salary
            FROM employees
            ORDER BY salary DESC)
WHERE ROWNUM = 1;   

-- 가장 안쪽 SELECT절에서 필요한 테이블 형식을 생성.
-- 바깥쪽 SELECT절에서 ROWNUM을 붙여서 다시 조회.
-- 가장 바깥쪽 SELECT절에서 이미 붙어있는 ROWNUM의 범위를 지정해서 조회.
SELECT * FROM
    (SELECT ROWNUM as rn, first_name, salary
        FROM 
            (SELECT first_name, salary
            FROM employees
            ORDER BY salary DESC)
    )
WHERE rn <= 20 AND rn > 10;

-- SQL 실행 순서
-- FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY

SELECT * FROM
    (
    SELECT TO_CHAR(TO_DATE(test, 'YY/MM/DD'), 'MMDD') as mm, name
        FROM
        (
        SELECT '홍길동' as name, '20210524' as test FROM dual UNION ALL
        SELECT '김철수', '20210301' FROM dual UNION ALL
        SELECT '박영희', '20210401' FROM dual UNION ALL
        SELECT '김뽀삐', '20210501' FROM dual UNION ALL
        SELECT '박뚜띠', '20210301' FROM dual UNION ALL
        SELECT '김테스트', '20210201' FROM dual
        )
    )
WHERE mm = '0301';














