USE Temp;

CREATE TABLE Account(
id INT PRIMARY KEY,
name VARCHAR(255) UNIQUE,
balance INT,
CONSTRAINT acc_balance_chk CHECK(balance > 1000)
);

INSERT INTO Account(id , name , balance)
VALUES (1 , 'A' , 10000); 

INSERT INTO Account(id , name , balance)
VALUES (2 , 'B' , 1002); 

SELECT * FROM Account;

DROP TABLE Account;

CREATE TABLE Account(
id INT PRIMARY KEY,
name VARCHAR(255) UNIQUE,
balance INT NOT NULL DEFAULT 0
);

INSERT INTO Account(id , name)
VALUES (1 , 'A'); 

INSERT INTO Account(id , name)
VALUES (2 , 'B'); 

SELECT * FROM Account;