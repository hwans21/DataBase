
-- sql�� �ּ��Դϴ�. (�� �� �ּ�)
/*
 ���� �� �ּ��Դϴ�.
*/

/*
    #SELECT
    - ���ϴ� �����͸� ���̺�(�����ͺ��̽��� ��ü)
      �κ��� ��ȸ�� �� �ְ� ���ִ� Ű����
    - SELECT Ű����� �ٸ� Ű������� �����Ͽ�
     ������ �ɰų� ������ �����ؼ� ���ϴ� �����͸�
     ��ȸ�ϴ� ���� �����մϴ�.
*/
-- SELECT: ��ȸ�϶�.
-- * : ��� �÷���
-- FROM: ��� ���̺���
-- employees: employees��� ���̺���.
SELECT * FROM employees;

SELECT 
    employee_id, first_name, last_name
FROM 
    employees;
    
SELECT 
    email, phone_number, hire_date
FROM
    employees;

-- �÷��� ��ȸ�ϴ� ��ġ���� + - * / ������ �����մϴ�.
-- ������ ������ �÷��� ���� Ÿ���� �÷������� �����մϴ�.
SELECT
    employee_id, first_name, last_name, salary, salary + salary*0.1
FROM
    employees;

-- null���� Ȯ��
-- null�� �̿��� �� ���ų� �� �� ���ų� ������ �� ���� ���Դϴ�.
-- ����� 0�̶��� �ٸ� �̴ϴ�.
SELECT department_id, commission_pct
FROM employees;

-- �ٸ�� (�÷��� �̸��� �����ؼ� ��ȸ�մϴ�.)
SELECT first_name as �̸�, last_name as ��, salary as �޿�
FROM employees;

-- �ٸ�� ��� ���� �ο��ȣ("")�� ���ؼ��� ��Ī ������ �����մϴ�.
SELECT first_name "�̸�", salary "�޿�"
FROM employees;

SELECT 
first_name || ' ' || last_name || ' ''s salary is $' || salary
AS "Employee Details"
FROM employees;
/*
����Ŭ�� Ȭ����ǥ�� ���ڸ� ǥ���ϰ�, 
���ڿ� �ȿ� Ư������ '�� ǥ���ϰ� �ʹٸ� 
''�� �� �� �� ǥ���մϴ�. (�ڹٿ��� %ǥ�� ���� %% ���� �ſ� ���)

����Ŭ������ ���ڸ� �����ϱ� ���� ||�� ����մϴ�.
*/

SELECT 
'''' || first_name || ' ' || last_name || '''' 
AS "full_name"
FROM employees;

-- DISTINCT (�ߺ� ���� ����)
-- �÷� ���� �������� ���� �ľǿ� ����.
SELECT department_id FROM employees;
SELECT DISTINCT department_id FROM employees;

-- ROWNUM, ROWID(��� �� �Ƚ��)
-- ROWNUM�� ������ ����� ���� �� ��ȣ�Դϴ�.
-- �˻��� ������� ���ʷ� ��ȣ�� ���̱� ������ 
-- ������ �������� ������ �ľ��ؼ� Ȱ���ϱ� �����ϴ�.
SELECT 
ROWNUM, ROWID, employee_id 
FROM employees;

-- ������ �� ����
-- where�� �� (������ ���� ��ҹ��ڸ� �����մϴ�.)
SELECT
    first_name, last_name, job_id
FROM employees
WHERE job_id = 'IT_PROG';

SELECT * FROM employees 
WHERE last_name = 'King';

SELECT * FROM employees
WHERE department_id = 90;

SELECT * FROM employees
WHERE salary >= 15000;

-- 17 05 2021

SELECT * FROM employees
WHERE hire_date = '04/01/30';

-- BETWEEN ������ (������ ����)
SELECT * FROM employees
WHERE salary BETWEEN 15000 AND 20000;

SELECT * FROM employees
WHERE salary >= 15000 AND salary <= 20000;

SELECT * FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';

-- IN�������� ��� (Ư�� ����� ���� �� ���)
SELECT * FROM employees
WHERE manager_id in (100,101,102);

SELECT * FROM employees
WHERE job_id IN ('IT_PROG', 'AD_VP');

-- LIKE�����ڴ� %�� ���, _�� �������� ��ġ�� ã�Ƴ� ��
-- %�� ���ڰ� ���ų� �Ǵ� �ϳ� �̻��� ��
-- _�� �ϳ��� ���ڸ� ���մϴ�.
SELECT first_name, hire_date FROM employees
WHERE hire_date LIKE '04%';

SELECT first_name, hire_date FROM employees
WHERE hire_date LIKE '%15';

SELECT first_name, hire_date FROM employees
WHERE hire_date LIKE '%05%';

SELECT * FROM employees 
WHERE email LIKE '____A%';

SELECT first_name, hire_date FROM employees
WHERE hire_date LIKE '___05%';

-- IS NULL (null���� ã��)
-- NULL�� ���� ���ų� �� �� ���� �����̱� ������
-- ��/�� �񱳵� �Ұ����ϰ�, ������ (=) ���굵 �Ұ����մϴ�.
SELECT * FROM employees
WHERE manager_id IS NULL;

SELECT * FROM employees
WHERE commission_pct IS NULL;

SELECT * FROM employees
WHERE commission_pct IS NOT NULL;

-- AND, OR
-- AND�� OR���� ����ӵ��� �����ϴ�.
-- ��ȣ�� �̿��Ͽ� �켱������ ������ ��ġ�� �� �ֽ��ϴ�.
SELECT * FROM employees
WHERE job_id = 'IT_PROG' 
    OR job_id = 'FI_MGR' 
    AND salary >= 6000;

SELECT * FROM employees
WHERE (job_id = 'IT_PROG' 
    OR job_id = 'FI_MGR')
    AND salary >= 6000;

-- ������ ���� (SELECT ������ ���� �������� �ɴϴ�.)
-- ASC: ascending -> ��� (������)
-- DESC: descending -> �ϰ� (������)

SELECT * FROM employees
ORDER BY hire_date ASC;

SELECT * FROM employees
ORDER BY hire_date DESC;

SELECT * FROM employees
WHERE job_id = 'IT_PROG'
ORDER BY first_name ASC;

SELECT * FROM employees
WHERE salary >= 5000 
ORDER BY employee_id DESC;










