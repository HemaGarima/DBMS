USE temp;

SELECT * from Customer;
SELECT * from Order_details;


-- REPLACE
REPLACE INTO Customer(id , cname , City)
VALUES(1251 ,'RamKumar' , 'Indrapuri');

REPLACE INTO Customer(id , cname , City)
VALUES(420 ,'RamKumar' , 'Indrapuri');

REPLACE INTO Customer(id , cname)
	SELECT id , cname
    FROM customer WHERE id = 500;

SELECT id, cname , City
FROM Customer WHERE id = 500;

SELECT id, cname , City
FROM Customer;
    
REPLACE INTO Customer SET id = 1300 , cname = 'Mac' , City = 'Utah';

REPLACE INTO Customer(id , cname , City)
	VALUES(133 , 'CodeHelp' , 'Colony');