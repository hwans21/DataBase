
-- 문제 1
SELECT AVG(salary) FROM employees;
SELECT * FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT COUNT(*) FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT AVG(salary) FROM employees
WHERE job_id = 'IT_PROG';
SELECT * FROM employees
WHERE salary > (
                SELECT AVG(salary) FROM employees
                WHERE job_id = 'IT_PROG'
                );

-- 문제 2
SELECT * FROM employees
WHERE department_id = (SELECT department_id FROM departments 
                        WHERE manager_id = 200 
                      );

-- 문제 3
SELECT manager_id FROM employees 
WHERE first_name = 'Pat';
SELECT * FROM employees
WHERE manager_id > (SELECT manager_id FROM employees 
                    WHERE first_name = 'Pat');

SELECT * FROM employees
WHERE manager_id IN(
                    SELECT manager_id FROM employees
                    WHERE first_name = 'James'
                    );

-- 문제 4
SELECT * FROM
    (
    SELECT ROWNUM AS rn, first_name FROM
        (
        SELECT first_name FROM employees
        ORDER BY first_name DESC
        )
    )
WHERE rn > 40 AND rn <= 50;

-- 문제 5
SELECT * FROM
    (
    SELECT ROWNUM AS rn, employee_id, first_name, phone_number, hire_date
    FROM
        (
        SELECT * FROM employees
        ORDER BY hire_date ASC
        )
    )
WHERE rn > 30 AND rn <= 40;
    
-- 문제 6
SELECT 
    e.employee_id,
    CONCAT(first_name, last_name) AS 이름,
    e.department_id,
    d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
ORDER BY employee_id ASC;

-- 문제 7
SELECT
    employee_id,
    CONCAT(first_name, last_name) AS 이름,
    department_id,
    (SELECT department_name FROM departments d
    WHERE d.department_id = e.department_id) AS department_name
FROM employees e
ORDER BY employee_id ASC;

-- 문제 8
SELECT 
    d.department_id,
    d.department_name,
    d.manager_id,
    d.location_id,
    l.street_address,
    l.postal_code,
    l.city
FROM departments d LEFT OUTER JOIN locations l
ON d.location_id = l.location_id
ORDER BY department_id ASC;

-- 문제 9
SELECT
    department_id,
    department_name,
    manager_id,
    location_id,
    (SELECT street_address FROM locations l WHERE l.location_id = d.location_id) AS street_address,
    (SELECT postal_code FROM locations l WHERE l.location_id = d.location_id) AS postal_code,
    (SELECT city FROM locations l WHERE l.location_id = d.location_id) AS city
FROM departments d
ORDER BY department_id ASC;

-- 문제 10
SELECT
    l.location_id,
    l.street_address,
    l.city,
    c.country_id,
    c.country_name
FROM locations l LEFT OUTER JOIN countries c
ON l.country_id = c.country_id
ORDER BY c.country_name ASC;

-- 문제 11
SELECT
    location_id,
    street_address,
    city,
    (SELECT country_id FROM countries c WHERE c.country_id = l.country_id) AS country_id,
    (SELECT country_name FROM countries c WHERE c.country_id = l.country_id) AS country_name
FROM locations l
ORDER BY country_name ASC;

-- 문제 12
SELECT * FROM
    (
    SELECT ROWNUM rn, a.* FROM
        (
        SELECT
            employee_id,
            first_name,
            phone_number,
            hire_date,
            d.department_id,
            d.department_name
        FROM employees e LEFT OUTER JOIN departments d
        ON d.department_id = e.department_id
        ORDER BY hire_date ASC
        ) a
    )
WHERE rn > 0 AND rn <= 10;

-- 문제 13
SELECT a.*,
       d.department_name FROM
    (
    SELECT last_name, job_id, department_id
    FROM employees
    WHERE job_id = 'SA_MAN'
    ) a
JOIN departments d
ON a.department_id = d.department_id;

-- 문제 14
SELECT 
    d.department_id,
    d.department_name,
    d.manager_id,
    a.total
    FROM departments d
    JOIN (
         SELECT department_id, COUNT(*) AS total
         FROM employees
         GROUP BY department_id
         ) a
    ON d.department_id = a.department_id
    ORDER BY total DESC;








