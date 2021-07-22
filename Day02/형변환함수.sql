-- �� ��ȯ�Լ� TO_CHAR, TO_NUNMBER, TO_DATE

-- ��¥�� ���ڷ� ��ȯ�ϴ� TO_CHAR(��, ����)
SELECT TO_CHAR(sysdate) FROM dual; -- ���� ���Ĵ�� ���.
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD HH:MI:SS') FROM dual;
SELECT TO_CHAR(sysdate, 'YY-MM-DD HH24:MI:ss') FROM dual;

SELECT first_name, TO_CHAR(hire_date, 'YYYY"��" MM"��" DD"��"')
FROM employees;

-- ���ڸ� ���ڷ� ��ȯ�ϴ� TO_CHAR(��, ����)
-- '9' -> ���� ��ġ (��� ���� �����ϴ� ��ȣ)
SELECT TO_CHAR(20000, '99999') FROM dual;
SELECT TO_CHAR(20000, '9999') FROM dual; --�ڸ����� ����.
SELECT TO_CHAR(20000.21, '99999.99') FROM dual;
SELECT TO_CHAR(20000, '99,999') FROM dual;

SELECT TO_CHAR(salary, '$99,999') AS salary
FROM employees;

-- ���ڸ� ���ڷ� �����ϴ� �Լ� TO_NUMBER(��, ����)
SELECT '2000' + 2000 FROM dual; -- �ڵ� ����ȯ
SELECT TO_NUMBER('2000') + 2000 FROM dual; -- ����� ����ȯ
SELECT '$3,300' + 2000 FROM dual;
SELECT TO_NUMBER('$3,300', '$9,999') + 2000
FROM dual;

-- ���ڸ� ��¥�� ��ȯ�ϴ� �Լ� TO_DATE(��, ����)
SELECT TO_DATE('2021-05-18') FROM dual;
SELECT sysdate - TO_DATE('2021-03-25') FROM dual;
SELECT TO_DATE('2020/12/12', 'YYYY-MM-DD') FROM dual;
SELECT TO_DATE('2020/12/12 12:34:45', 'YYYY-MM-DD HH:MI:SS') 
FROM dual; -- �־��� ���ڿ��� ��� ��ȯ�ؾ� �մϴ�.

-- XXXX�� XX�� XX�� ���ڿ� �������� ��ȯ�� ������.
SELECT '20050102' FROM dual;
SELECT 
    TO_CHAR(
        TO_DATE('20050102', 'YYYY/MM/DD')
        , 'YYYY"��" MM"��" DD"��"'
    ) AS dateInfo
FROM dual;

-- NULL���� �Լ� NVL(�÷�, ��ȯ�� Ÿ�ٰ�)
SELECT null FROM dual;
SELECT NVL(null, 0) FROM dual;

SELECT * FROM employees;
SELECT first_name, NVL(commission_pct, 0) AS comm_pct
FROM employees;

-- NULL ���� �Լ� NVL2(�÷�, null�� �ƴ� ��� ��, null�� ��� ��)
SELECT NVL2(null, '�ξƴ�', '��')FROM dual;
SELECT first_name, NVL2(commission_pct, 'true', 'false')
FROM employees;

SELECT first_name, commission_pct,
NVL2(commission_pct, salary+(salary*commission_pct), salary)
AS "real salary"
FROM employees;

SELECT first_name, salary+(salary*commission_pct) as "real salary"
FROM employees;

-- DECODE(�÷� Ȥ�� ǥ����, �׸�1, ���1, �׸�2, ���2 ...... default)
SELECT 
DECODE('F', 'A', 'A�Դϴ�.', 'B', 'B�Դϴ�.', 'C', 'C�Դϴ�.', '�𸣰ڴµ���.')
FROM dual;

SELECT 
    job_id,
    salary,
    DECODE(job_id, 'IT_PROG', salary*1.1, 'FI_MGR', salary*1.2, 'AD_VP', salary*1.3, salary)
FROM employees;
    













