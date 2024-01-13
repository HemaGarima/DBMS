CREATE DATABASE interview_org;

SHOW DATABASES;

USE interview_org;

CREATE TABLE worker(
	worker_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name CHAR(25),
    last_name CHAR(25),
    salary INT(15),
    joining_date DATETIME,
    department CHAR(25)
);

INSERT INTO worker
VALUES (001 , 'Monika' , 'Arora' , 100000 , '14-02-20 09.00.00' , 'HR'),
	   (002 , 'Niharika' , 'Verma' , 80000 , '14-06-11 09.00.00' , 'Admin'),
       (003 , 'Vishal' , 'Singhal' , 300000 , '14-02-20 09.00.00' , 'HR'),
       (004 , 'Amitabh' , 'Singh' , 500000 , '14-02-20 09.00.00' , 'Admin'),
       (005 , 'Vivek' , 'Bhati' , 500000 , '14-06-11 09.00.00' , 'Admin'),
       (006 , 'Vipul' , 'Diwan' , 200000 , '14-06-11 09.00.00' , 'Account'),
       (007 , 'Satish' , 'Kumar' , 75000 , '14-01-20 09.00.00' , 'Account'),
       (008 , 'Geetika' , 'Chauhan' , 90000 , '14-04-11 09.00.00' , 'Admin');
       
SELECT * FROM worker;

CREATE TABLE Bonus(
	worker_ref_id INT,
    bonus_amount INT(10),
    bonus_date DATETIME,
    FOREIGN KEY(worker_ref_id)
		REFERENCES worker(worker_id)
        ON DELETE CASCADE
);

DROP TABLE Bonus;

INSERT INTO Bonus
VALUES (001 , 5000 , '16-02-20'),
	   (002 , 3000 , '16-06-11'),
       (003 , 4000 , '16-02-20'),
       (004 , 4500 , '16-02-20'),
       (005 , 3500 , '16-06-11');
       
SELECT * FROM Bonus;

CREATE TABLE Title(
	worker_ref_id INT,
    worker_title CHAR(25),
    affected_from DATETIME,
    FOREIGN KEY(worker_ref_id)
		REFERENCES worker(worker_id)
        ON DELETE CASCADE
);

INSERT INTO Title
VALUES (001 , 'Manager' , '2016-02-20 00.00.00'),
	   (002 , 'Executive' , '2016-06-11 00.00.00'),
       (008 , 'Executive' , '2016-06-11 00.00.00'),
       (005 , 'Manager' , '2016-06-11 00.00.00'),
       (004 , 'Asst. Manager' , '2016-06-11 00.00.00'),
       (007 , 'Executive' , '2016-06-11 00.00.00'),
       (006 , 'Lead' , '2016-06-11 00.00.00'),
       (003 , 'Lead' , '2016-06-11 00.00.00');
       
SELECT * FROM Title;

-- Q-1 Write an SQL query to fetch "FIRST_NAME" from worker table using the alias name as <WORKER_NAME>.
SELECT first_name as worker_name FROM worker ;

-- Q-2 Write an SQL query to fetch "FIRST_NAME" from worker table in upper case.
SELECT UPPER(first_name) FROM worker;

-- Q-3 Write an SQL query to fetch unique values of department FROM worker table.
SELECT DISTINCT department from WORKER;
-- write the above query using group by

-- Q-4 Write an SQL query to print the first three characters of first_name from worker table.
SELECT SUBSTRING(first_name , 1 , 3) AS name FROM worker;

-- Q-5 Write an SQL query to find the position of the alphabet 'b' in the first_name column 'Amitabh' from worker table.
SELECT INSTR(first_name , 'b') FROM worker WHERE first_name = 'Amitabh';

-- Q-6 Write an SQL query to print the first_name from worker table after removing white spaces from the right side.
SELECT RTRIM(first_name) FROM worker;

-- Q-7 Write an SQL query to print the department from worker table after removing white spaces from the left side.
SELECT LTRIM(department) FROM worker;

-- Q-8 Write an SQL query that fetches the unique values of the department from the worker table and prints its length.
SELECT DISTINCT department , LENGTH(department) FROM worker;

-- Q-9 Write an SQL query to print the first_name from worker table after replacing 'a' with 'A'.
SELECT REPLACE(first_name , 'a' , 'A') FROM worker;

-- Q-10 Write an SQL query to print the first_name , last_name from worker table into a single column complete_name.
-- a space char should separate them.
SELECT CONCAT(first_name , ' ' , last_name) AS complete_name FROM worker;

-- Q-11 Write an SQL query to print all worker details from the worker table order by first_name ascending.
SELECT * FROM worker ORDER BY first_name;

-- Q-12 Write an SQL query to print all worker details from the worker table order by first_name ascending and department descending.
SELECT * FROM worker ORDER BY first_name , department DESC;

-- Q-13 Write an SQL query to print all details of worker with the first_name as 'Vipul' and 'Satish' from the worker table.
SELECT * FROM worker WHERE first_name IN ('Vipul' , 'Satish');

-- Q-14 Write an SQL query to print all worker details excluding first_name , 'Vipul' and 'Satish' from the worker table.
SELECT * FROM worker WHERE first_name NOT IN ('Vipul' , 'Satish');

-- Q-15 Write an SQL query to print details of workers with department name as 'Admin*'.
SELECT * FROM worker WHERE department LIKE 'Admin%';

-- Q-16 Write an SQL query to print details of workers whose first_name contains 'a'.
SELECT * FROM worker WHERE first_name LIKE '%a%';

-- Q-17 Write an SQL query to print details of workers whose first_name ends with 'a'.
SELECT * FROM worker WHERE first_name LIKE '%a';

-- Q-18 Write an SQL query to print details of workers whose first_name ends with 'h' and contains 6 alphabets.
SELECT * FROM worker WHERE first_name LIKE '_____h';

-- Q-19 Write an SQL query to print details of workers whose salary lies between 100000 and 500000.
SELECT * FROM worker WHERE salary BETWEEN 100000 AND 500000; 

-- Q-20 Write an SQL query to print details of worker who have joined in FEB 2014.
SELECT * FROM worker WHERE YEAR(joining_date) = 2014 AND MONTH(joining_date) = 02;

-- Q-21 Write an SQL query to fetch the count of employees working in the department 'Admin'.
SELECT department , COUNT(*) FROM worker WHERE department = 'Admin';

-- Q-22 Write an SQL query to fetch worker full names with salaries <= 500000 and  >= 100000.
SELECT CONCAT(first_name , ' ' , last_name) AS complete_name FROM worker WHERE salary BETWEEN 100000 AND 500000;

-- Q-23 Write an SQL query to fetch the no. of workers for each department in descending order.
SELECT department , COUNT(worker_id) FROM worker GROUP BY department ORDER BY COUNT(worker_id) DESC;

-- Q-24 Write an SQL query to print the details of workers who are also managers.
SELECT w.* FROM worker AS w INNER JOIN title AS t ON worker_id = worker_ref_id WHERE t.worker_title = 'manager';

-- Q-25 Write an SQL query to fetch no. (more than 1) of same titles in the interview_org of different types.
SELECT worker_title , COUNT(*) FROM title GROUP BY worker_title HAVING COUNT(*) > 1;

-- Q-26 Write an SQL query to show only odd rows from the table.
-- SELECT * FROM worker WHERE MOD(worker_id , 2) != 0; 
SELECT * FROM worker WHERE MOD(worker_id , 2) <> 0;

-- Q-27 Write an SQL query to show only even rows from the table.
SELECT * FROM worker WHERE MOD(worker_id , 2) = 0;

-- Q-28 Write an SQL query to clone a new table from another table.
CREATE TABLE worker_clone LIKE worker;

SELECT * FROM worker_clone;

INSERT INTO worker_clone SELECT * FROM worker;

-- Q-29 Write an SQL query to fetch intersecting records of two tables.
SELECT worker.* FROM worker INNER JOIN worker_clone USING(worker_id);

-- Q-30 Write an SQL query to show records from one table that another table does not have.
SELECT worker.* FROM worker LEFT JOIN worker_clone USING(worker_id) WHERE worker_id IS NULL;

-- Q-31 Write an SQL query to show the current date and time.
SELECT CURDATE();
SELECT NOW();

-- Q-32 Write an SQL query to show the top n (say 5) records of a table order by descending salary.
SELECT * FROM worker ORDER BY salary DESC LIMIT 5;

-- Q-33 Write an SQL query to determine the nth (say n = 5) highest salary from the table.
SELECT * FROM worker ORDER BY salary DESC LIMIT 4,1;

-- Q-34 Write an SQL query to determine the 5th highest salary without using the LIMIT keyword.
SELECT salary FROM worker w1 WHERE 4 = (SELECT COUNT(DISTINCT (W2.salary)) FROM worker w2 WHERE w2.salary >= w1.salary);

-- Q-35 Write an SQL query to fetch the list of employees with the same salary.
SELECT w1.* FROM worker w1 , worker w2 WHERE w1.salary = w2.salary AND w1.worker_id != w2.worker_id;

-- Q-36 Write an SQL query to show the second highest salary from the table using sub-query.
SELECT MAX(salary) FROM worker WHERE salary NOT IN (SELECT MAX(salary) FROM worker);

-- Q-37 Write an SQL query to show one row twice in results from a table.
SELECT * FROM worker UNION ALL SELECT * FROM worker ORDER BY worker_id;

-- Q-38 Write an SQL query to list worker_id who does not get bonus. 
SELECT worker_id FROM worker WHERE worker_id NOT IN (SELECT worker_ref_id FROM bonus);

-- Q-39 Write an SQL query to fetch the first 50% records from a table.
SELECT * FROM worker WHERE worker_id <= (SELECT COUNT(worker_id)/2 FROM worker);

-- Q-40 Write an SQL query to fetch the departments that have less than 4 people in it.
SELECT department , COUNT(department) AS deptCount FROM worker GROUP BY department HAVING deptCount < 4;

-- Q-41 Write an SQL query to show all departments along with the number of people in there.
SELECT department , COUNT(department) AS deptCount FROM worker GROUP BY department;

-- Q-42 Write an SQL query to show the last record from a table.
SELECT * FROM worker WHERE worker_id = (SELECT MAX(worker_id) FROM worker);

-- Q-43 Write an SQL query to fetch the first row of a table.
SELECT * FROM worker WHERE worker_id = (SELECT MIN(worker_id) FROM worker);

-- Q-44 Write an SQL query to fetch the last five records from the table.
(SELECT * FROM worker ORDER BY worker_id DESC LIMIT 5) ORDER BY worker_id;

-- Q-45 Write an SQL query to print the name of employees having the highest salary in each department.
SELECT w.department , w.first_name , w.salary FROM (SELECT MAX(salary) AS maxsal , department FROM worker GROUP BY department) temp INNER JOIN worker w ON temp.department = w.department AND temp.maxsal = w.salary;

-- Q-46 Write an SQL query to fetch three max salaries from a table using co-related subquery. 
SELECT DISTINCT salary FROM worker w1 WHERE 3 >= (SELECT COUNT(DISTINCT salary) FROM worker w2 WHERE w1.salary <= w2.salary) ORDER BY w1.salary DESC;
SELECT DISTINCT salary FROM worker ORDER BY salary DESC LIMIT 3;

-- Q-47 Write an SQL query to fetch three min salaries from a table using co-related subquery. 
SELECT DISTINCT salary FROM worker w1 WHERE 3 >= (SELECT COUNT(DISTINCT salary) FROM worker w2 WHERE w1.salary >= w2.salary) ORDER BY w1.salary;

-- Q-48 Write an SQL query to fetch nth max salaries from a table using co-related subquery. 
SELECT DISTINCT salary FROM worker w1 WHERE n >= (SELECT COUNT(DISTINCT salary) FROM worker w2 WHERE w1.salary <= w2.salary) ORDER BY w1.salary DESC;

-- Q-49 Write an SQL query to fetch departments along with the total salaries paid for each of them.
SELECT department , SUM(salary) AS deptsal FROM worker GROUP BY department ORDER BY deptsal DESC;

-- Q-50 Write an SQL query to fetch the names of workers who own the highest salary.
SELECT first_name , salary FROM worker WHERE salary = (SELECT MAX(salary) FROM worker);
