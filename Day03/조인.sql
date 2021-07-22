
-- �����̶�?
-- ���� �ٸ� ���̺��� ������ ���谡 �����Ͽ� 1�� �̻���
-- ���̺��� �����͸� ��ȸ�ϱ� ���� ���˴ϴ�.
-- SELECT �÷�����Ʈ FROM ���δ���� �Ǵ� ���̺�
-- WHERE ���� ����

-- employees���̺��� �μ� id�� ��ġ�ϴ� departments ���̺��� �μ� id��
-- ã�Ƽ� SELECT ���Ͽ� �ִ� �÷����� ����ϴ� ������.
SELECT e.first_name, e.last_name, e.hire_date,
    e.salary, e.job_id, e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

SELECT e.first_name, e.last_name, e.hire_date,
    e.salary, e.job_id, e.department_id, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id;


-- ������ ���̺� ���������� �����ϴ� �÷��� ����
-- ������ �ص� �����մϴ�. �׷���, �ؼ��� ��Ȯ���� ����
-- ���̺� �̸��� �ۼ��ؼ� �Ҽ��� ǥ���� �ִ� ���� �ٶ����մϴ�.
-- ���̺� �̸��� �ʹ� �� �ÿ��� ALIAS�� �ۼ��ؼ� Ī�մϴ�.
-- �� ���̺� ��� ������ �ִ� �÷��� ��� �ݵ�� ����� �ּž� �մϴ�.

-- 3���� ���̺��� �̿��� ���� ����
SELECT 
    e.first_name, e.last_name, e.department_id,
    d.department_name,
    j.job_title
FROM employees e, departments d, jobs j
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;

-- �������ǰ� �Բ� ���Ǵ� �Ϲ� ������ ���� ���
SELECT
    e.first_name, e.last_name, e.department_id,
    d.department_name, e.job_id, j.job_title, loc.city
FROM employees e, departments d, jobs j, locations loc
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id -- 3
AND d.location_id = loc.location_id -- 2
AND loc.state_province = 'California'; -- 1
/*
1. locations ���̺��� province='California' ���ǿ� �´� ���� �������
2. location_id���� ���� ���� ������ �����͸� 
 departments���� ã�Ƽ� ����.
3. ���� ����� ������ department_id�� ���� 
 employees ���̺��� �����͸� ã�� ����.
4. ���� ����� jobs ���̺��� ���Ͽ� �����ϰ� ���� ����� ���
*/

-- �ܺ� ����
/*
    ��ȣ ���̺��� ��ġ�Ǵ� ������ ����Ǵ� ���� ���ΰ��� �ٸ���
    ��� �� ���̺� ���� ���� ������ �ش� �ο���� ��ȸ �����
    ���Եǿ� �ϴ� ������ ���մϴ�.
*/
SELECT 
    e.employee_id, e.first_name,
    e.department_id, d.department_name
FROM employees e, departments d, locations loc
WHERE e.department_id = d.department_id(+)
AND d.location_id = loc.location_id;

-- employees ���̺��� �����ϰ�, departments ���̺��� �������� �ʾƵ�
-- (+)�� ���� ���� ���̺��� �������� �Ͽ� departments���̺��� ���ο�
-- �����϶�� �ǹ̸� �ο��ϱ� ���� ��ȣ�� ���Դϴ�.
-- �ܺ� ������ ����ߴ��� ���Ŀ� ���������� ����ϸ� ����������
-- �켱������ �ν��մϴ�.


-- �ܺ� ���� ���� �� ��� ���ǿ� (+)�� �ٿ��� �ϸ�, 
-- �Ϲ� ���ǿ��� (+)�� ������ ������ �����Ͱ� �����Ǵ� ������ �߻�.
SELECT 
    e.employee_id, e.first_name,
    e.department_id,
    j.start_date, j.end_date, j.job_id
FROM employees e, job_history j
WHERE e.employee_id = j.employee_id(+)
AND j.department_id(+) = 80;

-- ���̺� �ڽſ� (+)�� ���� �� �����ϴ�.
SELECT employee_id, manager_id
FROM employees
WHERE manager_id(+) = employee_id; -- ����

SELECT e1.employee_id, e1.manager_id, e2.employee_id
FROM employees e1, employees e2
WHERE e1.manager_id(+) = e2.employee_id; -- ���� ����

-- (+)�� �÷����� ���� �� ������, OR�����ڿ� ���� ��� �Ұ�
SELECT 
    e.employee_id, e.first_name,
    e.department_id,
    j.start_date, j.end_date, j.job_id
FROM employees e, job_history j
WHERE e.employee_id = j.employee_id(+)
OR e.department_id = j.department_id;

-- ������ ������ ���ʿ� ���� ��� ���� �߻�
SELECT 
    e.employee_id, e.first_name,
    e.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
AND e.department_id(+) = d.department_id;











