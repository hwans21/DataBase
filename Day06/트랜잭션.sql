
-- ����Ŀ�� Ȯ��
SHOW AUTOCOMMIT;
-- ����Ŀ�� ��
SET AUTOCOMMIT ON;
-- ����Ŀ�� ����
SET AUTOCOMMIT OFF;

SELECT * FROM depts;

INSERT INTO depts
VALUES('300', '����', 200, 1700);

ROLLBACK;

DELETE FROM depts WHERE department_id = 300;

-- ���̺�����Ʈ ����
SAVEPOINT delete_300;

INSERT INTO depts
VALUES('310', '�ѹ�', 200, 1700);

ROLLBACK; -- > ���� �μ��� �������� �������� �̵�.
ROLLBACK TO SAVEPOINT delete_300; -- ���ߺμ��� ������ �ķ� �̵�.

-- Ŀ���� ���Ŀ��� � ����� �ϴ��� �ǵ��� �� �����ϴ�.
COMMIT;






