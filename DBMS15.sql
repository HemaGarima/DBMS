USE temp;

CREATE TABLE pairs(
A INT,
B int
);

INSERT INTO pairs VALUES(1,2) , (2,4) , (2,1) , (3,2) , (4,2) , (5,6) , (6,5) , (7,0);

SELECT * FROM pairs;

-- REMOVE REVERSED PAIRS

-- METHOD 1 : JOINS
SELECT lt.* FROM pairs lt LEFT JOIN pairs rt ON lt.A = rt.B AND lt.B = rt.A WHERE rt.A IS NULL OR lt.A < rt.A;

-- METHOD 2 : CO-RELATED SUBQUERY
SELECT * FROM pairs p1 WHERE NOT EXISTS (SELECT * FROM pairs p2 WHERE p1.B = p2.A AND p1.A = p2.B AND p1.A > p2.A);