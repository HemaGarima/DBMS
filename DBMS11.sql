CREATE DATABASE organisation;

USE organisation;

CREATE TABLE employee(
id INT NOT NULL PRIMARY KEY,
fname CHAR(25),
lname CHAR(25),
age INT,
emailID VARCHAR(255),
phoneNo INT,
City CHAR(20)
);

INSERT INTO employee
VALUES (1 , 'Aman' , 'Proto' , 32 , 'aman@gmail.com' , 898 , 'Delhi'),
	   (2 , 'Yagya' , 'Narayan' , 44 , 'yagya@gmail.com' , 222 , 'Palam'),
       (3 , 'Rahul' , 'BD' , 22 , 'rahul@gmail.com' , 444 , 'Kolkata'),
       (4 , 'Jatin' , 'Hermit' , 31 , 'jatin@gmail.com' , 666 , 'Raipur'),
       (5 , 'PK' , 'Pandey' , 21 , 'pk@gmail.com' , 555 , 'Jaipur');

CREATE TABLE client(
id INT NOT NULL PRIMARY KEY,
first_name CHAR(25),
last_name CHAR(25),
age INT,
emailID VARCHAR(255),
phoneNo INT,
City CHAR(25),
empID INT,
FOREIGN KEY(empID) REFERENCES employee(id)
);

INSERT INTO client
VALUES (1 , 'Mac' , 'Roggers' , 47 , 'mac@hotmail.com' , 333 , 'Kolkata' , 3),
	   (2 , 'Max' , 'Poirier' , 27 , 'max@gmail.com' , 222 , 'Kolkata' , 3),
       (3 , 'Peter' , 'Jain' , 24 , 'peter@abc.com' , 111 , 'Delhi' , 1),
       (4 , 'Sushant' , 'Aggarwal' , 23 , 'sushant@yahoo.com' , 45454 , 'Hyderabad' , 5),
       (5 , 'Pratap' , 'Singh' , 36 , 'p@xyz.com' , 7787 , 'Mumbai' , 2);

CREATE TABLE project(
id INT NOT NULL PRIMARY KEY,
empID INT,
name CHAR(25),
startdate DATE,
clientID INT,
FOREIGN KEY(empID) REFERENCES employee(id),
FOREIGN KEY(clientID) REFERENCES client(id)
);

INSERT INTO project
VALUES (1 , 1 , 'A' , '2021-04-21' , 3),
	   (2 , 2 , 'B' , '2021-03-12' , 1),
       (3 , 3 , 'C' , '2021-01-16' , 5),
       (4 , 3 , 'D' , '2021-04-27' , 2),
       (5 , 5 , 'E' , '2021-05-01' , 4);
       
-- INNER JOIN
-- Enlist all the employee ID's , names along with the Project allocated to them.
SELECT e.id , e.fname , e.lname , p.id , p.name FROM employee as e 
INNER JOIN project AS p ON e.id = p.empID;

SELECT e.id , e.fname , e.lname , p.id , p.name FROM employee as e,
project as p WHERE e.id = p.empID;

SELECT * FROM employee as e 
INNER JOIN project AS p ON e.id = p.empID;

-- Fetch out all the employee ID's and their contact detail who have been working from Jaipur with the client name working in Hyderabad
SELECT e.id , e.emailID , e.phoneNo , c.first_name , c.last_name FROM employee as e
INNER JOIN client as c ON e.id = c.empID;

SELECT e.id , e.emailID , e.phoneNo , c.first_name , c.last_name FROM employee as e
INNER JOIN client as c ON e.id = c.empID WHERE e.city = 'Jaipur' AND c.city = 'Hyderabad';

-- LEFT JOIN
-- Fetch out each project allocated to each employee
SELECT * FROM employee as e
LEFT JOIN project as p ON e.id = p.empID;

-- RIGHT JOIN
-- List out all the projects along with the employees name and their respective allocated emailID.
SELECT p.id , p.name , e.fname , e.lname , e.emailID FROM employee as e 
RIGHT JOIN project as p
ON e.id = p.empID;

-- CROSS JOIN
-- List out all the combination possible for the employee's name and projects that can exist.
SELECT e.fname , e.lname , p.id , p.name FROM employee as e
CROSS JOIN project as p;