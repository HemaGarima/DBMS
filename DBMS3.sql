USE ORG;

SELECT FIRST_NAME , SALARY FROM Worker;

SELECT 44+11;

SELECT now();

SELECT lcase('HEMA');

SELECT ucase('hema');

SELECT * FROM Worker;

SELECT * FROM Worker WHERE SALARY > 1800000;

SELECT * FROM Worker WHERE DEPARTMENT = 'HR';

-- SALARY [100000 , 10000000]
SELECT * FROM Worker WHERE SALARY BETWEEN 100000 AND 10000000;

-- REDUCE OR statements
SELECT * FROM Worker WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'ADMIN';

-- better way IN
SELECT * FROM Worker WHERE DEPARTMENT IN ('HR' , 'ADMIN' , 'ACCOUNT');

SELECT * FROM Worker WHERE DEPARTMENT NOT IN ('HR' , 'ADMIN');

-- SELECT * FROM Worker WHERE DEPARTMENT is NULL;

-- WILDCARD
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%i%';
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_i%';

-- SORTING USING ORDER BY
-- default is ascending or i can use ASC
SELECT * FROM Worker ORDER BY SALARY;
SELECT * FROM Worker ORDER BY SALARY DESC;

-- DISTINCT
SELECT DEPARTMENT FROM Worker;
SELECT DISTINCT DEPARTMENT FROM Worker;

-- GROUP BY
-- GROUP BY by default treated as DISTINCT if aggregation is not mentioned
SELECT DEPARTMENT FROM Worker GROUP BY DEPARTMENT;
SELECT DEPARTMENT , COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT;
-- AVG SALARY by department
SELECT DEPARTMENT , AVG(SALARY) FROM Worker GROUP BY DEPARTMENT;
-- MIN SALARY per department
SELECT DEPARTMENT , MIN(SALARY) FROM Worker GROUP BY DEPARTMENT;
-- MAX SALARY per department
SELECT DEPARTMENT , MAX(SALARY) FROM Worker GROUP BY DEPARTMENT;
-- SUM of SALARY per department
SELECT DEPARTMENT , SUM(SALARY) FROM Worker GROUP BY DEPARTMENT;

-- GROUP BY HAVING
SELECT DEPARTMENT , COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT HAVING COUNT(DEPARTMENT) > 2;