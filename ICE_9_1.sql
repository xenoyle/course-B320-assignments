/*
	Developer:	Floyd, Connor
	Semester: Fall 2024
	Course: B320-001
	Assignment: ICE 9.1
*/

-- Problem 1
DROP TABLE IF EXISTS VendorsCopy
GO
DROP TABLE IF EXISTS InvoicesCopy
GO

SELECT *
INTO VendorsCopy
FROM Vendors
GO

SELECT *
INTO InvoicesCopy
FROM Invoices
GO

-- Problem 2
SELECT *
FROM InvoicesCopy

INSERT INTO InvoicesCopy (
	VendorID, InvoiceNumber, InvoiceDate,
	InvoiceTotal, PaymentTotal, CreditTotal, 
	TermsID, InvoiceDueDate, PaymentDate
) VALUES (
	32, 'AX-014-027', '2023-04-21',
	434.58, 0.00, 0.00,
	2, '2023-05-08', NULL
)

-- Problem 3
INSERT INTO VendorsCopy (
	VendorName, VendorAddress1, VendorAddress2, VendorCity, VendorState, VendorZipCode, VendorPhone, VendorContactLName, VendorContactFName, DefaultTermsID, DefaultAccountNo
) 
SELECT *
FROM VendorsCopy
WHERE VendorState != 'CA'

-- Problem 4
SELECT *
FROM VendorsCopy
WHERE DefaultAccountNo = 400

UPDATE VendorsCopy
SET DefaultAccountNo = 403
WHERE DefaultAccountNo = 400

-- Problem 5
SELECT *
FROM Invoices
WHERE (InvoiceTotal-PaymentTotal-CreditTotal) > 0

UPDATE InvoicesCopy
SET PaymentDate = GETDATE(), 
	PaymentTotal = (InvoiceTotal-PaymentTotal-CreditTotal)
WHERE (InvoiceTotal-PaymentTotal-CreditTotal) > 0

-- Problem 6

UPDATE InvoicesCopy
SET TermsID = 2
WHERE VendorID IN (	
	SELECT *
	FROM VendorsCopy
	WHERE DefaultTermsID = 2
)
