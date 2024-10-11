/*
	Developer:	Floyd, Connor
	Semester: Fall 2024
	Course: B320-001
	Assignment: Assignment 8.1 - Programming Exercises (Ch. 7)
*/

-- Exercise 1
--SELECT *
--INTO VendorCopy
--FROM Vendors

--SELECT *
--INTO InvoiceCopy
--FROM Invoices

-- Exercise 2
--INSERT
--INTO InvoiceCopy (	
--	VendorID,		InvoiceTotal, 
--	TermsID,		InvoiceNumber,
--	PaymentTotal,	InvoiceDueDate,
--	InvoiceDate,	CreditTotal,
--	PaymentDate)
--VALUES (
--	32,				434.58,
--	2,				'AX-014-027',
--	0.00,			'2023-05-08',
--	'2023-04-21',	0.00,
--	NULL)

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
SET PaymentDate = GETDATE(), PaymentTotal = InvoiceTotal