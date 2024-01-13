CREATE DATABASE company;

USE company;

CREATE TABLE dept1(
empid INT,
name CHAR(25),
role VARCHAR(255)
);

CREATE TABLE dept2(
empid INT,
name CHAR(25),
role VARCHAR(255)
);

INSERT INTO dept1
VALUES (1 , 'A' , 'engineer'),
	   (2 , 'B' , 'salesman'),
       (3 , 'C' , 'manager'),
       (4 , 'D' , 'salesman'),
       (5 , 'E' , 'engineer');
       
INSERT INTO dept2
VALUES (3 , 'C' , 'manager'),
	   (6 , 'F' , 'marketing'),
       (7 , 'G' , 'salesman');
       
SELECT * FROM dept1;
SELECT * FROM dept2;

-- SET OPERATIONS

-- List out all the employees in the company
SELECT * FROM dept1
UNION
SELECT * FROM dept2;

-- List out all the employees in all departments who work as salesman
SELECT * FROM dept1 WHERE role = 'salesman'
UNION
SELECT * FROM dept2 WHERE role = 'salesman';

-- List out all the employees who work for both the departments.
-- INTERSECT
SELECT dept1.* FROM dept1 INNER JOIN dept2 USING(empid);

-- List out all the employees working in dept1 but not in dept2.
-- MINUS
SELECT dept1.* FROM dept1 LEFT JOIN dept2 USING(empid) 
WHERE dept2.empid IS NULL;
