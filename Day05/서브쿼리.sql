
/*
# ��������

- ���������� ��� ����� ()�ȿ� �����. 
 ������������ �������� 1�� ���Ͽ��� �մϴ�.
- �������� ������ ���� ����� �ϳ� �ݵ�� ���� �մϴ�.
- �ؼ��� ���� ������������ ���� �ؼ��ϸ� �˴ϴ�.
*/


-- 'nancy'�� �޿����� �޿��� ���� ����� �˻��ϴ� ����.
SELECT salary FROM employees WHERE first_name = 'Nancy';
SELECT * FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE first_name = 'Nancy');

-- employee_id�� 103���� ����� job_id�� ������ ����� �˻��ϴ� ����.
SELECT job_id FROM employees WHERE employee_id=103;
SELECT *
    FROM employees
    WHERE job_id = (SELECT job_id 
                    FROM employees 
                    WHERE employee_id=103);

-- ������ ���������� ���� ���� ���� ���� ����� �� �����ϴ�.
-- �̷� ��쿡�� ������ �����ڸ� ����մϴ�.
SELECT job_id FROM employees WHERE job_id='IT_PROG';
SELECT * 
FROM employees
WHERE job_id = (SELECT job_id 
                FROM employees 
                WHERE job_id='IT_PROG'); --����

-- ������ ������ 
-- IN: ����� � ���� ������ Ȯ���մϴ�.
SELECT * 
FROM employees
WHERE job_id IN (SELECT job_id 
                FROM employees 
                WHERE job_id='IT_PROG');  
                
-- first_name�� David�� ��� �� ���� ���� ������ �޿��� ū ����� ��ȸ
SELECT salary FROM employees WHERE first_name='David';

-- ANY: ���� ���������� ���� ���ϵ� ������ ���� ���մϴ�. 
-- �ϳ��� �����ϸ� �˴ϴ�.
SELECT *
FROM employees
WHERE salary > ANY (SELECT salary
                FROM employees
                WHERE first_name='David');

-- ���� ���������� ���� ���ϵ� ��� ���� ���ؼ�
-- ��� �����ؾ� �մϴ�.
SELECT *
FROM employees
WHERE salary > ALL (SELECT salary
                FROM employees
                WHERE first_name='David');

-- ��Į�� ��������
-- SELECT ������ ���������� ���� ��. LEFT OUTER ���ΰ� ���� ���)

SELECT first_name, department_name
FROM employees e
LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
ORDER BY first_name ASC;

-- ��Į��
SELECT 
    first_name,
    (SELECT department_name
    FROM departments d
    WHERE d.department_id = e.department_id) department_name
FROM employees e
ORDER BY first_name ASC;

/*
- ��Į�� ���������� ���κ��� ���� ���
: �Լ�ó�� �� ���ڵ�� ��Ȯ�� �ϳ��� ������ ������ ��

- ������ ��Į�� ������������ ���� ���
: ��ȸ�� �����Ͱ� ��뷮�� ���, �ش� �����Ͱ� 
 ������ ����� ���.
*/

-- �� �μ��� �Ŵ��� ���� �̸�
-- left join
SELECT 
    d.*, e.first_name
FROM departments d
LEFT OUTER JOIN employees e
ON d.manager_id = e.employee_id
ORDER BY d.manager_id ASC;

-- ��Į��
SELECT
    d.*,
    (SELECT first_name
    FROM employees e
    WHERE e.employee_id = d.manager_id) as manager_name
FROM departments d
ORDER BY d.manager_id ASC;

-- �� �μ��� ����� �̱�
SELECT count(*) FROM employees
GROUP BY department_id;

SELECT 
    d.*,
    (SELECT COUNT(*) FROM employees e
    WHERE e.department_id = d.department_id
    GROUP BY department_id) as �����
FROM departments d;

-- �ζ��� �� (FROM ������ ���������� ���� ��)
-- ������ ���س��� ��ȸ �ڷḦ ������ �����ؼ� ������ ���� ���.


-- salary�� ������ �����ϰ� ROWNUM�� ���̸�
-- ROWNUM�� ������ ���� �ʴ� ���°� �߻��մϴ�.
-- (ROWNUM�� ���̰� ������ �����Ѵ�. ORDER BY�� �׻� �������� ����.)
-- ������ �̸� �� ���� �ڷῡ ROWNUM�� �ٿ��� �� �� ���ƿ�.
SELECT first_name, salary
FROM employees
ORDER BY salary DESC;

-- ROWNUM�� ���̰� ���� ������ �����ؼ� ��ȸ�Ϸ��� �ϴµ�,
-- ROWNUM�� ��Ī�� ���� ���� ����, ROWNUM�� ������ ������ �Ұ����ϴ���.
-- (WHERE������ ���� �����ϰ� ���� ROWNUM�� SELECT �Ǳ� ������
-- WHERE������ ������ �� ��, 1������ �������� ������ �ƿ� ��ȸ�� �Ұ���.)
-- ROWNUM������ �ٿ� ���� ������ �����ؼ� ��ȸ�ؾ� �ǰڱ���.
SELECT ROWNUM, first_name, salary
        FROM 
            (SELECT  first_name, salary
            FROM employees
            ORDER BY salary DESC)
WHERE ROWNUM = 1;   

-- ���� ���� SELECT������ �ʿ��� ���̺� ������ ����.
-- �ٱ��� SELECT������ ROWNUM�� �ٿ��� �ٽ� ��ȸ.
-- ���� �ٱ��� SELECT������ �̹� �پ��ִ� ROWNUM�� ������ �����ؼ� ��ȸ.
SELECT * FROM
    (SELECT ROWNUM as rn, first_name, salary
        FROM 
            (SELECT first_name, salary
            FROM employees
            ORDER BY salary DESC)
    )
WHERE rn <= 20 AND rn > 10;

-- SQL ���� ����
-- FROM -> WHERE -> GROUP BY -> HAVING -> SELECT -> ORDER BY

SELECT * FROM
    (
    SELECT TO_CHAR(TO_DATE(test, 'YY/MM/DD'), 'MMDD') as mm, name
        FROM
        (
        SELECT 'ȫ�浿' as name, '20210524' as test FROM dual UNION ALL
        SELECT '��ö��', '20210301' FROM dual UNION ALL
        SELECT '�ڿ���', '20210401' FROM dual UNION ALL
        SELECT '��ǻ�', '20210501' FROM dual UNION ALL
        SELECT '�ڶѶ�', '20210301' FROM dual UNION ALL
        SELECT '���׽�Ʈ', '20210201' FROM dual
        )
    )
WHERE mm = '0301';














