-- �׷��Լ� AVG, MAX, MIN, SUM, COUNT
SELECT * FROM employees;

SELECT 
AVG(salary), MAX(salary), MIN(salary), SUM(salary), COUNT(*)
FROM employees;

-- �׷��Լ��� NULL���� �ִ� �÷��� ��ȸ�� �������� �ʽ��ϴ�.
SELECT COUNT(*) FROM employees; -- �� �� �������� ��
SELECT COUNT(first_name) FROM employees;
SELECT COUNT(commission_pct) FROM employees;
SELECT COUNT(manager_id) FROM employees;

SELECT SUM(commission_pct) FROM employees;

-- �μ����� �׷�ȭ, �׷��Լ��� ���
SELECT department_id, avg(salary)
FROM employees
GROUP BY department_id;

-- ������ ��.
-- �׷��Լ��� �Ϲ� �÷��� ���ÿ� ����� �� �����ϴ�.
SELECT department_id, avg(salary)
FROM employees; -- ����
-- GROUP BY���� ����� �� GROUP���� ������ ������ 
-- �ٸ� �÷��� ��ȸ�� �� �����ϴ�.
SELECT job_id, department_id FROM employees
GROUP BY department_id;

-- GROUP BY�� 2�� ���.
SELECT department_id FROM employees
GROUP BY department_id
ORDER BY department_id;

SELECT department_id, job_id FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;

SELECT department_id, job_id, avg(salary)
FROM employees
GROUP BY department_id, job_id;

-- employees ���̺��� ��ü ����鿡 ���� �μ���ȣ����
-- �ο����� ����ϼ���.
SELECT 
    department_id AS �μ���ȣ,
    COUNT(*) AS �����
FROM employees
GROUP BY department_id;

-- employees ���̺��� ��ü ����鿡 ����
-- �μ���ȣ���� ������ �հ踦 ��Ÿ������.
SELECT
    department_id AS �μ���ȣ,
    SUM(NVL(salary*commission_pct, salary)) AS "������ �հ�"
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- COUNT(*) �������� ���������� �÷��� �� ���� ���� �ٿ���
-- Ȯ���� �����մϴ�.

SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;

SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id
HAVING count(*) >= 20;

-- employees ���̺��� �μ���ȣ�� ������ ���ġ��
-- 8000 �̻��� �μ��� �μ���ȣ, ��տ���, �ο����� ��Ÿ������.

SELECT department_id AS �μ���ȣ,
       TRUNC(AVG(NVL(salary+salary*commission_pct, salary))) AS ��տ���,
       COUNT(*) AS �ο���
FROM employees
GROUP BY department_id
HAVING TRUNC(AVG(NVL(salary+salary*commission_pct, salary))) >= 8000
ORDER BY department_id;

-- ��������1-1
SELECT job_id, count(*) AS �����
FROM employees
GROUP BY job_id;

-- �������� 1-2
SELECT job_id, AVG(salary) AS ��տ���
FROM employees
GROUP BY job_id
ORDER BY AVG(salary) DESC;

-- �������� 2
SELECT
    TO_CHAR(hire_date, 'YY') AS �Ի翬��,
    COUNT(*)
FROM employees
GROUP BY TO_CHAR(hire_date, 'YY');

-- �������� 3
SELECT department_id, AVG(salary)
FROM employees
WHERE salary >= 1000
GROUP BY department_id
HAVING AVG(salary) >= 2000;

-- �������� 4
SELECT department_id,
       TRUNC(AVG(salary + salary*commission_pct), 2) AS ��տ���,
       SUM(salary + salary*commission_pct) AS �հ�,
       COUNT(*)
FROM employees
WHERE commission_pct IS NOT NULL
GROUP by department_id;













