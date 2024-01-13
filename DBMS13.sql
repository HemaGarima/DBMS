USE organisation;

-- SUB QUERRIES
-- WHERE clause same table
-- emplyees with age > 30
SELECT * FROM employee WHERE age IN (SELECT age FROM employee WHERE age > 30);

-- WHERE clause different table
-- emp details working in more than 1 project.
SELECT * FROM employee WHERE id in (
SELECT empID FROM project group by empID having count(empID) > 1
);

-- single value subquery
-- emp details having age > avg(age)
SELECT * FROM employee WHERE age > (SELECT AVG(age) FROM employee);

-- FROM clause - derived tables 
-- select max age person whose first name contains 'a'.
SELECT max(age) FROM (SELECT * FROM employee WHERE fname like '%a%') AS temp;

-- Corelated subquery
-- Find 3rd oldest employee
SELECT * 
FROM employee e1
WHERE 3 = (
	SELECT COUNT(e2.age)
    FROM employee e2
    WHERE e2.age >= e1.age
);

-- VIEW
SELECT * FROM employee;

-- CREATING  a view
CREATE VIEW custom_view AS SELECT fname , age FROM employee;

-- VIEWING FROM custom_view
SELECT * FROM custom_view;

-- ALTERING THE VIEW
ALTER VIEW custom_view AS SELECT fname , lname , age FROM employee;

-- DROPING THE VIEW
DROP VIEW IF EXISTS custom_view;