/*
	Developer:	Floyd, Connor
	Semester: Fall 2024
	Course: B320-001
	Assignment: ICE 11.2
*/

-- Task 0
DROP TABLE IF EXISTS B320_P04
GO

-- Task 1a
SELECT VendorID, VendorName, VendorAddress1, VendorAddress2, VendorCity, VendorState, VendorZipCode, VendorPhone, VendorContactFName + ' ' + VendorContactLName AS Contact
INTO B320_P04
FROM Vendors
WHERE VendorID NOT IN
(
	SELECT VendorID FROM Invoices
)
AND VendorState IN ('ND', 'MN', 'SD', 'IA', 'NE', 'KS', 'WI', 'IL', 'MO', 'IN', 'MI', 'OH')

-- Task 2a
INSERT INTO B320_P04
(
	VendorName, VendorAddress1, 
	VendorAddress2, VendorCity, VendorState, 
	VendorZipCode, VendorPhone, Contact
)
VALUES
(
	'Paper Street Soap Company', '537 Paper Street', 
	NULL, 'Bradford', 'MI', 
	19808, '(288) 555-0153', 'Tyler Durden'
)

-- Task 2b
SELECT *
FROM B320_P04
WHERE VendorName = 'Paper Street Soap Company'

-- Task 3a
UPDATE B320_P04
SET Contact = 'The Narrator'
WHERE VendorName = 'Paper Street Soap Company'

-- Task 3b
SELECT *
FROM B320_P04
WHERE VendorName = 'Paper Street Soap Company'

-- Task 4a
DELETE B320_P04
WHERE VendorCity IN ('Marion','Columbus')

-- Task 4b
SELECT *
FROM B320_P04
WHERE VendorCity IN ('Marion','Columbus')