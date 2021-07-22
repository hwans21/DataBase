
/*
Dual 테이블
- 오라클 자체에서 제공되는 간단한 테스트 테이블
- 간단하게 함수를 이용해서 계산 결과값을 확인할 때 사용하는 테이블
- Dual 테이블에는 dummy라는 컬럼이 존재하며, 해당 컬럼은 의미없는 컬럼이고
 함수를 사용할 때, 직접 컬럼이름을 지정해서 확인할 수 있다.
*/

SELECT * FROM dual;

-- lower(소문자), initcap(앞글자만 대문자), upper(대문자)
SELECT 'abcDEF', lower('abcDEF'), upper('abcDEF')
FROM dual;

SELECT 
last_name, lower(last_name), initcap(last_name), upper(last_name)
FROM employees;

SELECT last_name FROM employees
WHERE lower(last_name)='austin';

-- length(길이), instr(문자 찾기)
SELECT 'abcdef' as ex, length('abcdef'), instr('abcdef', 'a')
FROM dual;

SELECT first_name FROM employees;
SELECT first_name, length(first_name), instr(first_name, 'a')
FROM employees;

-- substr(문자열 추출), concat(문자 연결)
SELECT 'abcdef' as ex, substr('abcdef',1,3), concat('abc', 'def')
FROM dual;

SELECT 
first_name, substr(first_name,1,4), concat(first_name, last_name)
FROM employees;

-- LPAD, RPAD (좌, 우측을 지정문자열로 채우기)
SELECT LPAD('abc', 10, '*') FROM dual;
SELECT RPAD('abc', 10, '*') FROM dual;

-- LTRIM, RTRIM, TRIM (공백 제거)
SELECT LTRIM('   javascript_java') FROM dual;

















