
-- NUMBER(5, 2) -> 정수부, 실수부를 합친 총 자리수 5자리, 소수점 2자리
-- NUMBER -> 괄호를 생략할 시 (38,0)으로 자동 지정됩니다.
-- VARCHAR2(byte) -> 괄호 안에 들어올 문자열의 최대 길이를 지정.

CREATE TABLE dept2(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca VARCHAR2(15),
    dept_date DATE,
    dept_bonus NUMBER(10)
);

DESC dept2;
SELECT * FROM dept2;

-- NUMBER타입에 들어가는 자리수를 확인.
INSERT INTO dept2
VALUES(99, '영업', '서울', sysdate, 2000000);

-- 컬럼 추가
ALTER TABLE dept2
ADD (dept_count NUMBER(3));

SELECT * FROM dept2;

-- 열 이름 변경
ALTER TABLE dept2
RENAME COLUMN dept_count TO emp_count;

-- 열 속성 수정
ALTER TABLE dept2
MODIFY (emp_count NUMBER(4));

DESC dept2;

-- 열 삭제
ALTER TABLE dept2
DROP COLUMN emp_count;

SELECT * FROM dept3;

--테이블 이름 수정
ALTER TABLE dept2
RENAME TO dept3;

-- 테이블 삭제
DROP TABLE dept2;

-- 테이블 생성과 제약 조건

-- 테이블 열레벨 제약조건 (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY)
-- PRIMARY KEY: 테이블의 고유식별 컬럼입니다.
-- UNIQUE: 유일한 값을 갖게 하는 컬럼(중복값 방지)
-- NOT NULL: null을 허용하지 않음.
-- FOREIGN KEY: 참조하는 테이블의 PRIMARY KEY를 저장하는 컬럼.
-- CHECK: 사용자 정의 형식만 들어오도록 허용.

CREATE TABLE dept2(
    dept_no NUMBER(2) CONSTRAINT dept2_deptno_pk PRIMARY KEY,
    dept_name VARCHAR2(14) NOT NULL CONSTRAINT dept2_deptname_uk UNIQUE,
    loca NUMBER(4) CONSTRAINT dept2_loca_locid_fk REFERENCES locations(location_id),
    dept_date DATE CONSTRAINT dept2_deptdate_uk UNIQUE,
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M','F'))
);

DROP TABLE dept2;

-- 테이블레벨 제약조건 (모든 열 선언 후에 제약조건을 추가하는 방식)
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

-- 외래키(foreign key)가 부모테이블에 없다면 INSERT 불가능.
INSERT INTO dept2 VALUES(10, 'gg', 4000, sysdate, 100000, 'M');

-- 외래키가 부모테이블에 있다면 INSERT 가능
INSERT INTO dept2 VALUES(20, 'aa', 2000, sysdate, 100000, 'F');

SELECT * FROM locations;

-- 제약 조건 변경
-- 제약 조건은 추가, 삭제가 가능합니다. 변경은 안됩니다.
-- 변경하시려면 삭제하고 새로운 내용으로 추가하셔야 합니다.
DROP TABLE dept2;

CREATE TABLE dept2(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca NUMBER(4),
    dept_date DATE,
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1)
);
-- pk 추가
ALTER TABLE dept2 ADD CONSTRAINT dept_no_pk PRIMARY KEY(dept_no);
-- fk 추가
ALTER TABLE dept2 ADD CONSTRAINT detp_loca_fk FOREIGN KEY(loca) REFERENCES locations(location_id);
-- check 추가
ALTER TABLE dept2 ADD CONSTRAINT dept_gender_ck CHECK(dept_gender IN('M', 'F'));
-- unique 추가
ALTER TABLE dept2 ADD CONSTRAINT dept_name_uk UNIQUE(dept_name);
-- not null은 열 수정형태로 변경합니다.
ALTER TABLE dept2 MODIFY dept_name VARCHAR2(14) NOT NULL;

-- 제약조건 삭제 (제약조건 이름으로)
ALTER TABLE dept2 DROP CONSTRAINT dept_no_pk;
-- 제약 조건 확인
SELECT * FROM user_constraints
WHERE table_name='DEPT2';

---------------------------------------------------------

-- 연습문제
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











