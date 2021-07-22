-- 숫자 함수
-- round(반올림)
SELECT 45.923 FROM dual;
SELECT ROUND(45.923, 1), ROUND(45.923, 0), ROUND(45.923, -1)
FROM dual;

-- TRUNC(반내림)
SELECT TRUNC(45.923, 1), TRUNC(45.923, 0), TRUNC(45.923, -1)
FROM dual;

-- ABS(절대값)
SELECT ABS(-34) FROM dual;

-- ceil(올림), floor(내림)
SELECT CEIL(3.14), FLOOR(3.14) FROM dual;

-- MOD(나머지)
SELECT 10 / 2, MOD(10, 2) FROM dual;

-- 날짜 함수 (중요)
-- sysdate: 현재 날짜를 반환
-- systimestamp: 현재 날짜와 시간을 반환.
SELECT sysdate FROM dual;
SELECT systimestamp FROM dual;

-- 날짜도 연산이 가능합니다.
-- 날짜 - 날짜: 어떤 날짜에서 날짜를 뺀 값을 일수로 나타냅니다.

SELECT first_name, sysdate - hire_date 
FROM employees; -- 일수

SELECT first_name, (sysdate - hire_date) / 7 as week 
FROM employees; -- 주수

SELECT first_name, (sysdate - hire_date) / 365 as week 
FROM employees; -- 년수

-- 날짜 반올림, 절삭
-- ROUND함수는 포맷 모델 fmt에 명시된 단위에 대해 반올림한 date를 
-- 표시합니다.
-- 가장 가까운 날짜로 반올림 됩니다.
SELECT ROUND(sysdate) FROM dual;
SELECT ROUND(sysdate, 'year') FROM dual;
SELECT ROUND(sysdate, 'month') FROM dual;
-- 일 기준으로 반올림 하는데, 해당 주의 일요일 날짜로.
SELECT ROUND(sysdate, 'day') FROM dual;

SELECT TRUNC(sysdate) FROM dual;
SELECT TRUNC(sysdate, 'year') FROM dual;
SELECT TRUNC(sysdate, 'month') FROM dual;
SELECT TRUNC(sysdate, 'day') FROM dual;






