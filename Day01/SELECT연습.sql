--1.��� ����� �����ȣ, �̸�, �Ի���, �޿��� ����ϼ���.
SELECT employee_id, first_name, hire_date, salary
FROM employees;

--2.��� ����� �̸��� ���� �ٿ� ����ϼ���. �� ��Ī�� name���� �ϼ���.
SELECT first_name || last_name AS name FROM employees;

--3.50�� �μ� ����� ��� ������ ����ϼ���.
SELECT * FROM employees
WHERE department_id = 50;

--4.50�� �μ� ����� �̸�, �μ���ȣ, �������̵� ����ϼ���.
SELECT first_name, department_id, job_id
FROM employees
WHERE department_id = 50;

--5.��� ����� �̸�, �޿� �׸��� 300�޷� �λ�� �޿��� ����ϼ���.
SELECT first_name, salary, salary + 300
FROM employees;








