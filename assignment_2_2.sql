/* 
	Developer: Connor Floyd
	Semester: Fall 2024
	Assignment Name: Assignment 2.2 - Coding Exercises (Ch. 3)
	Course Number: B320-001
*/

-- Exercise 1
SELECT VendorContactFName, VendorContactLName, VendorName
FROM Vendors
ORDER BY VendorContactLName, VendorContactFName

-- Exercise 2
SELECT	InvoiceNumber AS Number, 
		InvoiceTotal AS Total, 
		PaymentTotal + CreditTotal AS Credits, 
		InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
FROM Invoices

-- Exercise 3
SELECT VendorContactLName + ',' + VendorContactFName AS [Full Name]
FROM Vendors
ORDER BY VendorContactLName, VendorContactFName

-- Exercise 4
SELECT	InvoiceTotal, 
		InvoiceTotal / 10 AS [10%],
		InvoiceTotal * 1.1 AS [Plus 10%]
FROM Invoices
ORDER BY InvoiceTotal DESC

-- Exercise 5
SELECT	InvoiceNumber AS Number, 
		InvoiceTotal AS Total, 
		PaymentTotal + CreditTotal AS Credits, 
		InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
FROM Invoices
WHERE (InvoiceTotal >= 500) AND (InvoiceTotal <= 10000)

-- Exercise 6
SELECT VendorContactLName + ',' + VendorContactFName AS [Full Name]
FROM Vendors
WHERE (VendorContactLName < 'F') AND (VendorContactLName NOT LIKE '[D]%')
ORDER BY VendorContactLName, VendorContactFName

-- Exercise 7
SELECT PaymentDate
FROM Invoices
WHERE ((PaymentDate IS NULL) AND ((InvoiceTotal - (PaymentTotal + CreditTotal)) > 0)) OR ((PaymentDate IS NOT NULL) AND ((InvoiceTotal - (PaymentTotal + CreditTotal)) <= 0))