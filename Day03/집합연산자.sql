
-- ���� ������
-- UNION(������ �ߺ�x), UNION ALL(������ �ߺ�o)
-- INTERSECT(������), MINUS(������)
SELECT employee_id, first_name FROM employees
WHERE hire_date LIKE '04%'
UNION
SELECT employee_id, first_name FROM employees
WHERE department_id = 20;

SELECT employee_id, first_name FROM employees
WHERE hire_date LIKE '04%'
UNION ALL
SELECT employee_id, first_name FROM employees
WHERE department_id = 20;

SELECT employee_id, first_name FROM employees
WHERE hire_date LIKE '04%'
INTERSECT
SELECT employee_id, first_name FROM employees
WHERE department_id = 20;

SELECT employee_id, first_name FROM employees
WHERE hire_date LIKE '04%'
MINUS
SELECT employee_id, first_name FROM employees
WHERE department_id = 20;

-- UNION, UNION ALL�� ������̺�� ���� ����ϴ� ��찡 ����.

SELECT employee_id, first_name, salary FROM employees
WHERE department_id = 100
UNION ALL
SELECT employee_id, first_name, salary FROM employees
WHERE salary > 10000
UNION ALL
SELECT employee_id, first_name, salary FROM employees
WHERE manager_id = 120
UNION ALL
SELECT 300, 'hong', 10000 FROM dual
UNION ALL
SELECT 400, 'kim', 20000 FROM dual;










