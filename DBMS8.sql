USE temp;

SELECT * FROM customer;

-- DELETE
DELETE FROM Customer WHERE id = 210;
DELETE FROM Customer;

INSERT INTO Customer (id , cname)
VALUES (121 , 'Bob');

INSERT INTO Customer
VALUES (1251 , 'Ram Kumar' , 'Dilbagh Nagar' , 'M' , 'Jalandhar' , 144002),
	   (1300 , 'Shayam Singh' , 'Ludhiana H.O' , 'M' , 'Ludhiana' , 141001),
       (245 , 'Neelabh Shukla' , 'Ashok Nagar' , 'M' , 'Jalandhar' , 144003),
       (210 , 'Barkha Singh' , 'Dilbagh Nagar' , 'F' , 'Jalandhar' , 144002),
       (500 , 'Rohan Arora' , 'Ludhiana H.O' , 'M' , 'Ludhiana' , 141001);

SET SQL_SAFE_UPDATES = 0;

SELECT * FROM Order_details;

CREATE TABLE Order_details(
Order_id INTEGER PRIMARY KEY,
delivery_date DATE,
cust_id INT,
FOREIGN KEY(cust_id) REFERENCES Customer(id) ON DELETE CASCADE
);

CREATE TABLE Order_details(
Order_id INTEGER PRIMARY KEY,
delivery_date DATE,
cust_id INT,
FOREIGN KEY(cust_id) REFERENCES Customer(id) ON DELETE SET NULL
);

INSERT INTO Order_details
VALUES (9 , '2014-03-11' , 210);

INSERT INTO Order_details
VALUES (10 , '2003-12' , 210);