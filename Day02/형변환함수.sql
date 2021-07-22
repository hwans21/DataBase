-- 형 변환함수 TO_CHAR, TO_NUNMBER, TO_DATE

-- 날짜를 문자로 변환하는 TO_CHAR(값, 형식)
SELECT TO_CHAR(sysdate) FROM dual; -- 기존 형식대로 출력.
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD HH:MI:SS') FROM dual;
SELECT TO_CHAR(sysdate, 'YY-MM-DD HH24:MI:ss') FROM dual;

SELECT first_name, TO_CHAR(hire_date, 'YYYY"년" MM"월" DD"일"')
FROM employees;

-- 숫자를 문자로 변환하는 TO_CHAR(값, 형식)
-- '9' -> 숫자 위치 (출력 폭을 결정하는 기호)
SELECT TO_CHAR(20000, '99999') FROM dual;
SELECT TO_CHAR(20000, '9999') FROM dual; --자리수가 부족.
SELECT TO_CHAR(20000.21, '99999.99') FROM dual;
SELECT TO_CHAR(20000, '99,999') FROM dual;

SELECT TO_CHAR(salary, '$99,999') AS salary
FROM employees;

-- 문자를 숫자로 변경하는 함수 TO_NUMBER(값, 형식)
SELECT '2000' + 2000 FROM dual; -- 자동 형변환
SELECT TO_NUMBER('2000') + 2000 FROM dual; -- 명시적 형변환
SELECT '$3,300' + 2000 FROM dual;
SELECT TO_NUMBER('$3,300', '$9,999') + 2000
FROM dual;

-- 문자를 날짜로 변환하는 함수 TO_DATE(값, 형식)
SELECT TO_DATE('2021-05-18') FROM dual;
SELECT sysdate - TO_DATE('2021-03-25') FROM dual;
SELECT TO_DATE('2020/12/12', 'YYYY-MM-DD') FROM dual;
SELECT TO_DATE('2020/12/12 12:34:45', 'YYYY-MM-DD HH:MI:SS') 
FROM dual; -- 주어진 문자열을 모두 변환해야 합니다.

-- XXXX년 XX월 XX일 문자열 형식으로 변환해 보세요.
SELECT '20050102' FROM dual;
SELECT 
    TO_CHAR(
        TO_DATE('20050102', 'YYYY/MM/DD')
        , 'YYYY"년" MM"월" DD"일"'
    ) AS dateInfo
FROM dual;

-- NULL제거 함수 NVL(컬럼, 변환할 타겟값)
SELECT null FROM dual;
SELECT NVL(null, 0) FROM dual;

SELECT * FROM employees;
SELECT first_name, NVL(commission_pct, 0) AS comm_pct
FROM employees;

-- NULL 제거 함수 NVL2(컬럼, null이 아닐 경우 값, null일 경우 값)
SELECT NVL2(null, '널아님', '널')FROM dual;
SELECT first_name, NVL2(commission_pct, 'true', 'false')
FROM employees;

SELECT first_name, commission_pct,
NVL2(commission_pct, salary+(salary*commission_pct), salary)
AS "real salary"
FROM employees;

SELECT first_name, salary+(salary*commission_pct) as "real salary"
FROM employees;

-- DECODE(컬럼 혹은 표현식, 항목1, 결과1, 항목2, 결과2 ...... default)
SELECT 
DECODE('F', 'A', 'A입니다.', 'B', 'B입니다.', 'C', 'C입니다.', '모르겠는데요.')
FROM dual;

SELECT 
    job_id,
    salary,
    DECODE(job_id, 'IT_PROG', salary*1.1, 'FI_MGR', salary*1.2, 'AD_VP', salary*1.3, salary)
FROM employees;
    













