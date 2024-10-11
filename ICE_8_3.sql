/*
	Developer:	Floyd, Connor
	Semester: Fall 2024
	Course: B320-001
	Assignment: ICE 8.3
*/

-- shorthand cheat: using the results of a query, 
-- create a table & load those results
DROP TABLE IF EXISTS VendorCopy;
GO

SELECT *
	INTO VendorCopy -- this is the shorthand cheat
FROM Vendors



INSERT INTO VendorCopy
VALUES
(
	'Dunkin', '123 University Blvd', NULL,
	'Bluffton', 'SC', 29909,
	'843-123-4567', NULL, NULL, 
	3, 591
);

SELECT *
FROM VendorCopy
ORDER BY VendorID DESC

SELECT * -- select *
FROM VendorCopy
WHERE VendorID IN (125, 126);
