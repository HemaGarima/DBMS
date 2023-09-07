USE Temp;

SELECT * FROM Customer;

-- REPLACE
REPLACE INTO Customer(id , cname , City)
	SELECT id, cname , City
    FROM Customer WHERE id = 500;
    
REPLACE INTO Customer SET id = 1300 , cname = 'Mac' , City = 'Utah';

REPLACE INTO Customer(id , City)
	VALUES(1251 , 'Colony');
    
REPLACE INTO Customer(id , cname , City)
	VALUES(133 , 'CodeHelp' , 'Colony');