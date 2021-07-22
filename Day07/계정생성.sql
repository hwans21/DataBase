-- 사용자 계정 확인
SELECT * FROM all_users;

-- 계정 생성 명령
CREATE USER user1 IDENTIFIED BY user1;
-- DCL: GRANT(권한 부여), REVOKE(권한 회수)
GRANT CREATE SESSION TO user1;
GRANT CONNECT, RESOURCE TO user1;

SELECT * FROM dba_tablespaces;

-- USERS 테이블 스페이스를 기본으로 지정.
ALTER USER user1 DEFAULT TABLESPACE users
QUOTA UNLIMITED on users;

/*
테이블 스페이스는 데이터 베이스 객체 내 실제 데이터가 저장되는 공간입니다.
데이터블록 -> 익스텐트 -> 세그먼트 -> 테이블스페이스
테이블 스페이스를 생성하면 지정된 경로에 실제 파일로 정의한 용량만큼의
파일이 생성이 되고, 데이터가 물리적으로 저장됩니다.
만약 테이블스페이스의 용량을 초과한다면 프로그램이 비정상적으로 동작합니다.
*/

ALTER USER user1 DEFAULT TABLESPACE MYTS
QUOTA UNLIMITED on MYTS;

-- 테이블스페이스 내의 객체를 전체 삭제
DROP TABLESPACE MYTS INCLUDING CONTENTS;

-- 물리적파일까지 한번에 삭제하는 법.
DROP TABLESPACE MYTS INCLUDING CONTENTS AND DATAFILES;









