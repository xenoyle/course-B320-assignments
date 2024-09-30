/*
	Developers: Connor Floyd
	Course: B320-001 Fall 2024
	Assignment: ICE 3.1
*/


-- Problem 1
SELECT VendorContactFName, VendorContactLName, VendorName
FROM Vendors
ORDER BY VendorContactLName, VendorContactFName

-- Problem 2
SELECT	InvoiceNumber AS [Number], 
		InvoiceTotal AS [Total],
		PaymentTotal + CreditTotal AS [Credits],
		InvoiceTotal - (PaymentTotal + CreditTotal) AS [Balance]
FROM Invoices

-- Problem 3
SELECT VendorContactLName + ',' + VendorContactFName AS [Full Name]
FROM Vendors
ORDER BY VendorContactLName, VendorContactFName

-- Problem 4
SELECT	InvoiceTotal,
		InvoiceTotal * 0.1 AS [10%],
		InvoiceTotal * 1.1 AS [Plus 10%]
FROM Invoices
WHERE (InvoiceTotal - (PaymentTotal + CreditTotal)) > 1000
ORDER BY InvoiceTotal DESC

-- Problem 7
SELECT	InvoiceNumber, PaymentTotal, PaymentDate,
		InvoiceTotal - (PaymentTotal + CreditTotal) AS [Balance]
FROM Invoices
WHERE 
( -- BAD Condition #1
	(InvoiceTotal - (PaymentTotal + CreditTotal)) = 0 
	AND PaymentDate IS NULL
)
OR
( -- BAD Condition #2
	(InvoiceTotal - (PaymentTotal + CreditTotal)) > 0 
	AND PaymentDate IS NOT NULL
)