/*
	Developer:	Floyd, Connor
	Semester: Fall 2024
	Course: B320-001
	Assignment: Assignment 8.1 - Programming Exercises (Ch. 7)
*/

-- Exercise 1
SELECT *
INTO VendorCopy
FROM Vendors

SELECT *
INTO InvoiceCopy
FROM Invoices

-- Exercise 2
INSERT
INTO InvoiceCopy (	
	VendorID,		InvoiceTotal, 
	TermsID,		InvoiceNumber,
	PaymentTotal,	InvoiceDueDate,
	InvoiceDate,	CreditTotal,
	PaymentDate)
VALUES (
	32,				434.58,
	2,				'AX-014-027',
	0.00,			'2023-05-08',
	'2023-04-21',	0.00,
	NULL)

-- Exercise 3
INSERT INTO VendorCopy
SELECT *
FROM Vendors
WHERE VendorState != 'CA'

-- Exercise 4
UPDATE VendorCopy
SET DefaultAccountNo = 403
WHERE DefaultAccountNo = 400

-- Exercise 5
UPDATE InvoiceCopy
SET PaymentDate = GETDATE(), PaymentTotal = (InvoiceTotal - CreditTotal - PaymentTotal)
WHERE (InvoiceTotal - CreditTotal - PaymentTotal) > 0

-- Exercise 6
UPDATE InvoiceCopy
SET TermsID = 2
WHERE VendorID IN (	
	SELECT *
	FROM VendorCopy
	WHERE DefaultTermsID = 2
)

-- Exercise 7
UPDATE InvoiceCopy
SET TermsID = 2
FROM InvoiceCopy
	INNER JOIN VendorCopy ON InvoiceCopy.VendorID = VendorCopy.VendorID
WHERE DefaultTermsID = 2

-- Exercise 8
DELETE
FROM VendorCopy
WHERE VendorState = 'MN'

-- Exercise 9
DELETE FROM VendorCopy
WHERE VendorState NOT IN (	
	SELECT DISTINCT VendorState
	FROM VendorCopy
		JOIN InvoiceCopy ON VendorCopy.VendorID = InvoiceCopy.VendorID
)

