USE Temp;

CREATE TABLE Account(
id INT PRIMARY KEY,
name VARCHAR(255) UNIQUE,
balance INT NOT NULL DEFAULT 0
);

-- ADD NEW COLUMN
ALTER TABLE Account ADD interest FLOAT NOT NULL DEFAULT 0;

SELECT * FROM Account;

-- MODIFY
ALTER TABLE Account MODIFY interest DOUBLE NOT NULL DEFAULT 0;

DESC Account;

-- CHANGE COLUMN - RENAME THE COLUMN
ALTER TABLE Account CHANGE COLUMN interest saving_interest FLOAT NOT NULL DEFAULT 0;

-- DROP COLUMN
ALTER TABLE Account DROP COLUMN saving_interest;

-- RENAME THE TABLE
ALTER TABLE Account RENAME TO account_details;