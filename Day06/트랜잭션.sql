
-- 오토커밋 확인
SHOW AUTOCOMMIT;
-- 오토커밋 온
SET AUTOCOMMIT ON;
-- 오토커밋 오프
SET AUTOCOMMIT OFF;

SELECT * FROM depts;

INSERT INTO depts
VALUES('300', '개발', 200, 1700);

ROLLBACK;

DELETE FROM depts WHERE department_id = 300;

-- 세이브포인트 생성
SAVEPOINT delete_300;

INSERT INTO depts
VALUES('310', '총무', 200, 1700);

ROLLBACK; -- > 개발 부서가 지워지기 이전으로 이동.
ROLLBACK TO SAVEPOINT delete_300; -- 개발부서가 지워진 후로 이동.

-- 커밋한 이후에는 어떤 방법을 하더라도 되돌릴 수 없습니다.
COMMIT;






