-- ���� �Լ�
-- round(�ݿø�)
SELECT 45.923 FROM dual;
SELECT ROUND(45.923, 1), ROUND(45.923, 0), ROUND(45.923, -1)
FROM dual;

-- TRUNC(�ݳ���)
SELECT TRUNC(45.923, 1), TRUNC(45.923, 0), TRUNC(45.923, -1)
FROM dual;

-- ABS(���밪)
SELECT ABS(-34) FROM dual;

-- ceil(�ø�), floor(����)
SELECT CEIL(3.14), FLOOR(3.14) FROM dual;

-- MOD(������)
SELECT 10 / 2, MOD(10, 2) FROM dual;

-- ��¥ �Լ� (�߿�)
-- sysdate: ���� ��¥�� ��ȯ
-- systimestamp: ���� ��¥�� �ð��� ��ȯ.
SELECT sysdate FROM dual;
SELECT systimestamp FROM dual;

-- ��¥�� ������ �����մϴ�.
-- ��¥ - ��¥: � ��¥���� ��¥�� �� ���� �ϼ��� ��Ÿ���ϴ�.

SELECT first_name, sysdate - hire_date 
FROM employees; -- �ϼ�

SELECT first_name, (sysdate - hire_date) / 7 as week 
FROM employees; -- �ּ�

SELECT first_name, (sysdate - hire_date) / 365 as week 
FROM employees; -- ���

-- ��¥ �ݿø�, ����
-- ROUND�Լ��� ���� �� fmt�� ��õ� ������ ���� �ݿø��� date�� 
-- ǥ���մϴ�.
-- ���� ����� ��¥�� �ݿø� �˴ϴ�.
SELECT ROUND(sysdate) FROM dual;
SELECT ROUND(sysdate, 'year') FROM dual;
SELECT ROUND(sysdate, 'month') FROM dual;
-- �� �������� �ݿø� �ϴµ�, �ش� ���� �Ͽ��� ��¥��.
SELECT ROUND(sysdate, 'day') FROM dual;

SELECT TRUNC(sysdate) FROM dual;
SELECT TRUNC(sysdate, 'year') FROM dual;
SELECT TRUNC(sysdate, 'month') FROM dual;
SELECT TRUNC(sysdate, 'day') FROM dual;






