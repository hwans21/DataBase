
/*
Dual ���̺�
- ����Ŭ ��ü���� �����Ǵ� ������ �׽�Ʈ ���̺�
- �����ϰ� �Լ��� �̿��ؼ� ��� ������� Ȯ���� �� ����ϴ� ���̺�
- Dual ���̺��� dummy��� �÷��� �����ϸ�, �ش� �÷��� �ǹ̾��� �÷��̰�
 �Լ��� ����� ��, ���� �÷��̸��� �����ؼ� Ȯ���� �� �ִ�.
*/

SELECT * FROM dual;

-- lower(�ҹ���), initcap(�ձ��ڸ� �빮��), upper(�빮��)
SELECT 'abcDEF', lower('abcDEF'), upper('abcDEF')
FROM dual;

SELECT 
last_name, lower(last_name), initcap(last_name), upper(last_name)
FROM employees;

SELECT last_name FROM employees
WHERE lower(last_name)='austin';

-- length(����), instr(���� ã��)
SELECT 'abcdef' as ex, length('abcdef'), instr('abcdef', 'a')
FROM dual;

SELECT first_name FROM employees;
SELECT first_name, length(first_name), instr(first_name, 'a')
FROM employees;

-- substr(���ڿ� ����), concat(���� ����)
SELECT 'abcdef' as ex, substr('abcdef',1,3), concat('abc', 'def')
FROM dual;

SELECT 
first_name, substr(first_name,1,4), concat(first_name, last_name)
FROM employees;

-- LPAD, RPAD (��, ������ �������ڿ��� ä���)
SELECT LPAD('abc', 10, '*') FROM dual;
SELECT RPAD('abc', 10, '*') FROM dual;

-- LTRIM, RTRIM, TRIM (���� ����)
SELECT LTRIM('   javascript_java') FROM dual;

















