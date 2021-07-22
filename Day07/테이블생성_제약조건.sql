
-- NUMBER(5, 2) -> ������, �Ǽ��θ� ��ģ �� �ڸ��� 5�ڸ�, �Ҽ��� 2�ڸ�
-- NUMBER -> ��ȣ�� ������ �� (38,0)���� �ڵ� �����˴ϴ�.
-- VARCHAR2(byte) -> ��ȣ �ȿ� ���� ���ڿ��� �ִ� ���̸� ����.

CREATE TABLE dept2(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca VARCHAR2(15),
    dept_date DATE,
    dept_bonus NUMBER(10)
);

DESC dept2;
SELECT * FROM dept2;

-- NUMBERŸ�Կ� ���� �ڸ����� Ȯ��.
INSERT INTO dept2
VALUES(99, '����', '����', sysdate, 2000000);

-- �÷� �߰�
ALTER TABLE dept2
ADD (dept_count NUMBER(3));

SELECT * FROM dept2;

-- �� �̸� ����
ALTER TABLE dept2
RENAME COLUMN dept_count TO emp_count;

-- �� �Ӽ� ����
ALTER TABLE dept2
MODIFY (emp_count NUMBER(4));

DESC dept2;

-- �� ����
ALTER TABLE dept2
DROP COLUMN emp_count;

SELECT * FROM dept3;

--���̺� �̸� ����
ALTER TABLE dept2
RENAME TO dept3;

-- ���̺� ����
DROP TABLE dept2;

-- ���̺� ������ ���� ����

-- ���̺� ������ �������� (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY)
-- PRIMARY KEY: ���̺��� �����ĺ� �÷��Դϴ�.
-- UNIQUE: ������ ���� ���� �ϴ� �÷�(�ߺ��� ����)
-- NOT NULL: null�� ������� ����.
-- FOREIGN KEY: �����ϴ� ���̺��� PRIMARY KEY�� �����ϴ� �÷�.
-- CHECK: ����� ���� ���ĸ� �������� ���.

CREATE TABLE dept2(
    dept_no NUMBER(2) CONSTRAINT dept2_deptno_pk PRIMARY KEY,
    dept_name VARCHAR2(14) NOT NULL CONSTRAINT dept2_deptname_uk UNIQUE,
    loca NUMBER(4) CONSTRAINT dept2_loca_locid_fk REFERENCES locations(location_id),
    dept_date DATE CONSTRAINT dept2_deptdate_uk UNIQUE,
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M','F'))
);

DROP TABLE dept2;

-- ���̺��� �������� (��� �� ���� �Ŀ� ���������� �߰��ϴ� ���)
CREATE TABLE dept2(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4),
    dept_date DATE,
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1),
    
    CONSTRAINT dept2_deptno_pk PRIMARY KEY (dept_no),
    CONSTRAINT dept2_deptname_uk UNIQUE(dept_name),
    CONSTRAINT dept2_loca_locid_fk FOREIGN KEY (loca) REFERENCES locations(location_id),
    CONSTRAINT dept2_deptdate_uk UNIQUE(dept_date),
    CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M','F'))
);

DESC dept2;

SELECT * FROM dept2;

-- �ܷ�Ű(foreign key)�� �θ����̺� ���ٸ� INSERT �Ұ���.
INSERT INTO dept2 VALUES(10, 'gg', 4000, sysdate, 100000, 'M');

-- �ܷ�Ű�� �θ����̺� �ִٸ� INSERT ����
INSERT INTO dept2 VALUES(20, 'aa', 2000, sysdate, 100000, 'F');

SELECT * FROM locations;

-- ���� ���� ����
-- ���� ������ �߰�, ������ �����մϴ�. ������ �ȵ˴ϴ�.
-- �����Ͻ÷��� �����ϰ� ���ο� �������� �߰��ϼž� �մϴ�.
DROP TABLE dept2;

CREATE TABLE dept2(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca NUMBER(4),
    dept_date DATE,
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1)
);
-- pk �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept_no_pk PRIMARY KEY(dept_no);
-- fk �߰�
ALTER TABLE dept2 ADD CONSTRAINT detp_loca_fk FOREIGN KEY(loca) REFERENCES locations(location_id);
-- check �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept_gender_ck CHECK(dept_gender IN('M', 'F'));
-- unique �߰�
ALTER TABLE dept2 ADD CONSTRAINT dept_name_uk UNIQUE(dept_name);
-- not null�� �� �������·� �����մϴ�.
ALTER TABLE dept2 MODIFY dept_name VARCHAR2(14) NOT NULL;

-- �������� ���� (�������� �̸�����)
ALTER TABLE dept2 DROP CONSTRAINT dept_no_pk;
-- ���� ���� Ȯ��
SELECT * FROM user_constraints
WHERE table_name='DEPT2';

---------------------------------------------------------

-- ��������
CREATE TABLE members(
    m_name VARCHAR2(20) NOT NULL,
    m_num NUMBER(3) CONSTRAINT mem_memnum_pk PRIMARY KEY,
    reg_date DATE NOT NULL CONSTRAINT mem_regdate_uk UNIQUE,
    gender VARCHAR2(5),
    loca NUMBER(4) CONSTRAINT mem_loca_loc_locid_fk REFERENCES locations(location_id)
    
    -- CONSTRAINT mem_loca_loc_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id)
);

SELECT * FROM user_constraints
WHERE table_name='MEMBERS';

INSERT INTO members
VALUES('AAA', '1', '18/07/01', 'M', 1800);

INSERT INTO members
VALUES('BBB', '2', '18/07/02', 'F', 1900);

INSERT INTO members
VALUES('CCC', '3', '18/07/03', 'M', 2000);

INSERT INTO members
VALUES('DDD', '4', sysdate, 'M', 2000);

SELECT * FROM members;

COMMIT;

SELECT
    m.m_name, m.m_num, loc.street_address, loc.location_id
FROM members m JOIN locations loc
ON m.loca = loc.location_id
ORDER BY m_num ASC;











