CREATE DATABASE ORG;
SHOW DATABASES; 
USE ORG; 

CREATE TABLE Worker ( 
	WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT(15),
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker
	(WORKER_ID, FIRST_NAME , LAST_NAME , SALARY , JOINING_DATE , DEPARTMENT) VALUES
    (001 , 'Reeti' , 'Bharadwaj' , 100000 , '30-09-01 06.00.00' , 'HR'),
    (002 , 'Chhavi' , 'Bharadwaj' , 200000 , '23-11-02 08.08.00' , 'HR'),
    (003 , 'Dhruv' , 'Sharma' , 1000000000 , '08-03-02 07.20.00' , 'Account'),
    (004 , 'Hemlata' , 'Sharma' , 100802390 , '23-05-03 02.35.00' , 'Admin'),
    (005 , 'Puneet' , 'Sharma' , 1000000000 , '24-06-08 05.46.00' , 'Admin'),
    (006 , 'Himanshu' , 'Sharma' , 1000000000 , '06-11-09 09.30.00' , 'Account'),
    (007 , 'Seeya' , 'Bharadwaj' , 10000000 , '20-08-05 06.00.00' , 'HR'),
    (008 , 'Gargi' , 'Bharadwaj' , 10000000 , '03-02-10 07.00.30' , 'HR'),
    (009 , 'Krishna' , 'Bharadwaj' , 100000000 , '05-08-13 06.00.00' , 'HR');
    
SELECT * FROM Worker;

CREATE TABLE Bonus(
	WORKER_REF_ID INT,
    BONUS_AMOUNT INT(10),
    BONUS_DATE DATETIME,
    FOREIGN KEY(WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO Bonus
	(WORKER_REF_ID , BONUS_AMOUNT , BONUS_DATE) VALUES
    (001 , 2000 , '23-02-15'),
    (002 , 4000 , '31-12-16'),
    (003 , 5000 , '04-11-17'),
    (004 , 8000 , '09-11-17'),
    (005 , 6000 , '15-11-17');
    
SELECT * FROM Bonus;

CREATE TABLE TITLE(
	WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY(WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE
);

INSERT INTO TITLE
	(WORKER_REF_ID , WORKER_TITLE , AFFECTED_FROM) VALUES
    (001 , 'Manager' , '08-03-04 00:00:00'),
    (002 , 'Executive' , '08-04-04 00:00:00'),
    (003 , 'Executive' , '08-03-09 00:00:00'),
    (004 , 'Manager' , '08-03-14 00:00:00'),
    (005 , 'Asst. Manager' , '10-03-04 00:00:00'),
    (006 , 'Executive' , '08-04-12 00:00:00'),
    (006 , 'Lead' , '13-05-04 00:00:00'),
    (006 , 'Lead' , '08-09-04 00:00:00');
    
SELECT * FROM Worker;

SELECT SALARY FROM Worker;

SELECT FIRST_NAME , SALARY FROM Worker;
    