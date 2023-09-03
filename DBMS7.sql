CREATE DATABASE Temp;
USE Temp;

CREATE TABLE Customer(
id INTEGER PRIMARY KEY,
cname  VARCHAR(225),
Address VARCHAR(225),
Gender CHAR(2),
City VARCHAR(225),
Pincode INTEGER
);

INSERT INTO Customer (id , cname)
VALUES (121 , 'Bob');

INSERT INTO Customer
VALUES (1251 , 'Ram Kumar' , 'Dilbagh Nagar' , 'M' , 'Jalandhar' , 144002),
	   (1300 , 'Shayam Singh' , 'Ludhiana H.O' , 'M' , 'Ludhiana' , 141001),
       (245 , 'Neelabh Shukla' , 'Ashok Nagar' , 'M' , 'Jalandhar' , 144003),
       (210 , 'Barkha Singh' , 'Dilbagh Nagar' , 'F' , 'Jalandhar' , 144002),
       (500 , 'Rohan Arora' , 'Ludhiana H.O' , 'M' , 'Ludhiana' , 141001);
      
SELECT * FROM Customer;
       
INSERT INTO Customer
VALUES (1252 , 'Ram Kumar3' , 'Dilbagh Nagar' , 'M' , 'Jalandhar' , NULL);

SELECT * FROM Customer;

CREATE TABLE Order_details(
Order_id INTEGER PRIMARY KEY,
delivery_date DATE,
cust_id INT,
FOREIGN KEY(cust_id) REFERENCES Customer(id)
);

INSERT INTO Order_details
VALUES (1 , '2019-03-11' , 245);

DELETE FROM Customer WHERE id = 245;

-- UPDATE
UPDATE Customer SET Address = 'Mumbai' , Gender = 'M' WHERE id = '121';

-- UPDATE MULTIPLE ROWS
SET SQL_SAFE_UPDATES = 0;
UPDATE Customer SET Pincode = 234542;
UPDATE Customer SET Pincode = Pincode + 1;