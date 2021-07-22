
-- MERGE: 테이블 병합
/*
 UPDATE와 INSERT를 한방에 처리.
 
 한 테이블에 해당하는 데이터가 있으면 UPDATE
 없으면 INSERT로 처리해라.
 만약 MERGE가 없었다면 해당 데이터의 존재 유무를 일일히 확인하고
 if문을 사용해서 데이터가 있다면 UPDATE, 없다면 else문 사용해서
 INSERT를 하라고 일일히 얘기해야 하는데, MERGE를 통해 쉽게 처리 가능.
*/

CREATE TABLE emps_it AS SELECT * FROM employees WHERE 1 = 2;
SELECT * FROM emps_it;
SELECT * FROM employees
WHERE job_id = 'IT_PROG';

INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(105, '데이비드', '김', 'DAVIDKIM', '06/03/04', 'IT_PROG');    

MERGE INTO emps_it a -- (머지를 할 타겟 테이블)
    USING 
        (SELECT * FROM employees WHERE job_id = 'IT_PROG') b --조인구문
    ON
        (a.employee_id = b.employee_id) --조인 조건
WHEN MATCHED THEN -- 조건에 일치할 경우 타겟테이블에 실행
    UPDATE SET
        a.phone_number = b.phone_number,
        a.hire_date = b.hire_date,
        a.salary = b.salary,
        a.commission_pct = b.commission_pct,
        a.manager_id = b.manager_id,
        a.department_id = b.department_id
WHEN NOT MATCHED THEN -- 조건에 일치하지 않을 경우 타겟테이블에 실행.
    INSERT VALUES
        (b.employee_id, b.first_name, b.last_name,
         b.email, b.phone_number, b.hire_date, b.job_id,
         b.salary, b.commission_pct, b.manager_id, b.department_id);

SELECT * FROM emps_it
ORDER BY employee_id ASC;

----------------------------------------------------------
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(102, '렉스', '박', 'LEXPARK', '01/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(101, '니나', '최', 'NINA', '20/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(103, '흥민', '손', 'HMSON', '20/04/06', 'AD_VP');

-- employees 테이블을 매번 수정되는 테이블이라고 가정하자.
-- 기존의 데이터는 email, phone, salary, commission, man_id, dept_id는
-- 는 업데이트 하도록 처리
-- 새로 유입된 데이터는 그대로 추가.

MERGE INTO emps_it a
    USING (SELECT * FROM employees) b
    ON (a.employee_id = b.employee_id)
WHEN MATCHED THEN
    UPDATE SET
    a.email = b.email,
    a.phone_number = b.phone_number,
    a.salary = b.salary,
    a.commission_pct = b.commission_pct,
    a.manager_id = b.manager_id,
    a.department_id = b.department_id
WHEN NOT MATCHED THEN
    INSERT VALUES --컬럼만 지정 가능.
    (b.employee_id, b.first_name, b.last_name,
         b.email, b.phone_number, b.hire_date, b.job_id,
         b.salary, b.commission_pct, b.manager_id, b.department_id);

-- 사본 테이블
CREATE TABLE depts AS (SELECT * FROM departments);
SELECT * FROM depts; 

-- 문제 1
INSERT INTO depts (department_id, department_name, location_id)
VALUES(280, '개발', 1800);
INSERT INTO depts (department_id, department_name, location_id)
VALUES(290, '회계', 1800);
INSERT INTO depts
VALUES(300, '재정', 301, 1800);
INSERT INTO depts
VALUES(310, '인사', 302, 1800);
INSERT INTO depts
VALUES(320, '영업', 303, 1700);

COMMIT;

--문제 2
-- 2-1
UPDATE depts SET department_name = 'IT bank'
WHERE department_name = 'IT Support';

SELECT * FROM depts;

-- 2-2
UPDATE depts SET manager_id = 301
WHERE department_id = 290;

-- 2-3
UPDATE depts 
SET department_name = 'IT Help', manager_id = 303, location_id = 1800
WHERE department_name = 'IT Helpdesk';

-- 2-4
UPDATE depts
SET manager_id = 301
WHERE department_id IN (290, 300, 310, 320);

COMMIT;

-- 문제 3
DELETE FROM depts WHERE department_id = 320;
DELETE FROM depts WHERE department_id = 220;

SELECT * FROM depts;

-- 문제 4
-- 4-1
DELETE FROM depts WHERE department_id > 200;
-- 4-2
UPDATE depts SET manager_id = 100
WHERE manager_id IS NOT NULL;

-- 4-4
MERGE INTO depts a
    USING (SELECT * FROM departments) b
    ON(a.department_id = b.department_id)
WHEN MATCHED THEN
    UPDATE SET
    a.department_name = b.department_name,
    a.manager_id = b.manager_id,
    a.location_id = b.location_id
WHEN NOT MATCHED THEN
    INSERT VALUES
    (b.department_id, b.department_name, b.manager_id, b.location_id);

SELECT * FROM depts;

COMMIT;

-- 문제 5
-- 5-1
CREATE TABLE jobs_it AS
(SELECT * FROM jobs WHERE min_salary >= 6000);

SELECT * FROM jobs_it;

INSERT INTO jobs_it VALUES('IT_DEV', '아이티개발팀', 6000, 20000);
INSERT INTO jobs_it VALUES('NET_DEV', '네트워크 개발팀', 5000, 20000);
INSERT INTO jobs_it VALUES('SEC_DEV', '보안개발팀', 6000, 19000);

-- 5-4
MERGE INTO jobs_it a
    USING (SELECT * FROM jobs WHERE min_salary >= 0) b
    ON (a.job_id = b.job_id)
WHEN MATCHED THEN 
    UPDATE SET
    a.min_salary = b.min_salary,
    a.max_salary = b.max_salary
WHEN NOT MATCHED THEN
    INSERT VALUES
    (b.job_id, b.job_title, b.min_salary, b.max_salary);

SELECT * FROM jobs_it;








