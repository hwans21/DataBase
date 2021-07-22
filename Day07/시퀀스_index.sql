
-- 시퀀스(시퀀스란 순차적으로 증가하는 값을 만들어 주는 객체)
SELECT * FROM user_sequences; -- 사용중인 시퀀스 객체 조회

-- 시퀀스 생성
CREATE SEQUENCE dept3_seq 
    START WITH 1 -- 시작값
    INCREMENT BY 1 -- 증가값
    MAXVALUE 10 -- 최대값
    NOCYCLE -- 사이클 사용 안함.
    NOCACHE; -- 캐시메모리 사용 안함.
    
-- 테이블 생성
CREATE TABLE DEPT3 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca VARCHAR2(13),
    dept_date DATE
);

SELECT * FROM dept3;

ALTER TABLE dept3
MODIFY dept_no NUMBER(4);

-- 시퀀스 사용하기 (NEXTVAL, CURRVAL)
INSERT INTO dept3
VALUES(dept3_seq.NEXTVAL, 'test', 'test', sysdate);

SELECT dept3_seq.CURRVAL FROM dual;

-- 시퀀스 수정(직접 수정 가능)
ALTER SEQUENCE dept3_seq MAXVALUE 9999; --최대값 증가
ALTER SEQUENCE dept3_seq INCREMENT BY -1;
ALTER SEQUENCE dept3_seq MINVALUE 1; -- 최소값 지정.

-- 시퀀스 값을 다시 처음으로 돌리는 방법.
SELECT dept3_seq.CURRVAL FROM dual;
ALTER SEQUENCE dept3_seq INCREMENT BY -416;
SELECT dept3_seq.NEXTVAL FROM dual;
ALTER SEQUENCE dept3_seq INCREMENT BY 1;

-- 시퀀스를 활용하여 PK의 값을 올려보세요.
-- PK의 값: 20210526-시퀀스값
-- dept3 테이블을 DROP하시고 다시 생성하세요.
-- (dept_no VARCHAR2() -> PK
--  dept_name VARCHAR2() -> 아무값이나 넣으세요.
-- 1. dept3_seq를 DROP으로 지우고 다시 생성하세요.
-- 2. PK를 VARCHAR2로 선언
-- 3. INSERT시에 to_char() || 시퀀스
DROP SEQUENCE dept3_seq;
CREATE SEQUENCE dept3_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 100
    NOCYCLE
    NOCACHE;

DROP TABLE dept3;
CREATE TABLE dept3(
    dept_no VARCHAR2(30) CONSTRAINT dept3_no_pk PRIMARY KEY,
    dept_name VARCHAR2(30)
);

INSERT INTO dept3 
VALUES (TO_CHAR(sysdate, 'YYYYMMDD') || '-' || dept3_seq.NEXTVAL, '테스트');
SELECT * FROM dept3;

/*
- index
- index는 primary key, unique 제약 조건에서 자동으로 생성되고
 조회를 빠르게 해 주는 hint 역할을 합니다.
- index는 조회를 빠르게 하지만, 무작위하게 많은 인덱스를 생성해서
 사용하면 오히려 성능 부하를 일으킬 수 있습니다.
- 정말 필요할 때 index를 사용하는 것이 바릅니다.
*/
SELECT * FROM employees WHERE first_name = 'Nancy';
-- 인덱스 추가
CREATE INDEX emp_first_name_idx ON employees(first_name);

SELECT * FROM employees WHERE salary = 12000;

-- 인덱스 삭제
DROP INDEX emp_first_name_idx;

















