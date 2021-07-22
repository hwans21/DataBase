-- ����� ���� Ȯ��
SELECT * FROM all_users;

-- ���� ���� ���
CREATE USER user1 IDENTIFIED BY user1;
-- DCL: GRANT(���� �ο�), REVOKE(���� ȸ��)
GRANT CREATE SESSION TO user1;
GRANT CONNECT, RESOURCE TO user1;

SELECT * FROM dba_tablespaces;

-- USERS ���̺� �����̽��� �⺻���� ����.
ALTER USER user1 DEFAULT TABLESPACE users
QUOTA UNLIMITED on users;

/*
���̺� �����̽��� ������ ���̽� ��ü �� ���� �����Ͱ� ����Ǵ� �����Դϴ�.
�����ͺ�� -> �ͽ���Ʈ -> ���׸�Ʈ -> ���̺����̽�
���̺� �����̽��� �����ϸ� ������ ��ο� ���� ���Ϸ� ������ �뷮��ŭ��
������ ������ �ǰ�, �����Ͱ� ���������� ����˴ϴ�.
���� ���̺����̽��� �뷮�� �ʰ��Ѵٸ� ���α׷��� ������������ �����մϴ�.
*/

ALTER USER user1 DEFAULT TABLESPACE MYTS
QUOTA UNLIMITED on MYTS;

-- ���̺����̽� ���� ��ü�� ��ü ����
DROP TABLESPACE MYTS INCLUDING CONTENTS;

-- ���������ϱ��� �ѹ��� �����ϴ� ��.
DROP TABLESPACE MYTS INCLUDING CONTENTS AND DATAFILES;









