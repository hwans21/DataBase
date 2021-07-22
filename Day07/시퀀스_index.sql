
-- ������(�������� ���������� �����ϴ� ���� ����� �ִ� ��ü)
SELECT * FROM user_sequences; -- ������� ������ ��ü ��ȸ

-- ������ ����
CREATE SEQUENCE dept3_seq 
    START WITH 1 -- ���۰�
    INCREMENT BY 1 -- ������
    MAXVALUE 10 -- �ִ밪
    NOCYCLE -- ����Ŭ ��� ����.
    NOCACHE; -- ĳ�ø޸� ��� ����.
    
-- ���̺� ����
CREATE TABLE DEPT3 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca VARCHAR2(13),
    dept_date DATE
);

SELECT * FROM dept3;

ALTER TABLE dept3
MODIFY dept_no NUMBER(4);

-- ������ ����ϱ� (NEXTVAL, CURRVAL)
INSERT INTO dept3
VALUES(dept3_seq.NEXTVAL, 'test', 'test', sysdate);

SELECT dept3_seq.CURRVAL FROM dual;

-- ������ ����(���� ���� ����)
ALTER SEQUENCE dept3_seq MAXVALUE 9999; --�ִ밪 ����
ALTER SEQUENCE dept3_seq INCREMENT BY -1;
ALTER SEQUENCE dept3_seq MINVALUE 1; -- �ּҰ� ����.

-- ������ ���� �ٽ� ó������ ������ ���.
SELECT dept3_seq.CURRVAL FROM dual;
ALTER SEQUENCE dept3_seq INCREMENT BY -416;
SELECT dept3_seq.NEXTVAL FROM dual;
ALTER SEQUENCE dept3_seq INCREMENT BY 1;

-- �������� Ȱ���Ͽ� PK�� ���� �÷�������.
-- PK�� ��: 20210526-��������
-- dept3 ���̺��� DROP�Ͻð� �ٽ� �����ϼ���.
-- (dept_no VARCHAR2() -> PK
--  dept_name VARCHAR2() -> �ƹ����̳� ��������.
-- 1. dept3_seq�� DROP���� ����� �ٽ� �����ϼ���.
-- 2. PK�� VARCHAR2�� ����
-- 3. INSERT�ÿ� to_char() || ������
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
VALUES (TO_CHAR(sysdate, 'YYYYMMDD') || '-' || dept3_seq.NEXTVAL, '�׽�Ʈ');
SELECT * FROM dept3;

/*
- index
- index�� primary key, unique ���� ���ǿ��� �ڵ����� �����ǰ�
 ��ȸ�� ������ �� �ִ� hint ������ �մϴ�.
- index�� ��ȸ�� ������ ������, �������ϰ� ���� �ε����� �����ؼ�
 ����ϸ� ������ ���� ���ϸ� ����ų �� �ֽ��ϴ�.
- ���� �ʿ��� �� index�� ����ϴ� ���� �ٸ��ϴ�.
*/
SELECT * FROM employees WHERE first_name = 'Nancy';
-- �ε��� �߰�
CREATE INDEX emp_first_name_idx ON employees(first_name);

SELECT * FROM employees WHERE salary = 12000;

-- �ε��� ����
DROP INDEX emp_first_name_idx;

















