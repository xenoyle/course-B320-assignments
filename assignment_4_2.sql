/*
	Developers: Connor Floyd
	Course: B320-001 Fall 2024
	Assignment: Assignment 4.2 - Programming Exercises (Ch. 4)
*/

-- Exercise 1
SELECT *
FROM Vendors
JOIN Invoices ON Vendors.VendorID = Invoices.InvoiceID

-- Exercise 2
SELECT	VendorName, 
		InvoiceNumber, 
		InvoiceDate, 
		InvoiceTotal - (PaymentTotal + CreditTotal) AS Balance
FROM Invoices, Vendors
WHERE (InvoiceTotal - (PaymentTotal + CreditTotal))<>0
ORDER BY VendorName

-- Exercise 3
SELECT VendorName, DefaultAccountNo, AccountDescription
FROM Vendors
JOIN GLAccounts ON Vendors.DefaultAccountNo = GLAccounts.AccountNo
ORDER BY AccountDescription, VendorName

-- Exercise 5
SELECT	
	v.VendorName AS Vendor,
	i.InvoiceDate AS Date,
	i.InvoiceNumber AS Number,
	li.InvoiceSequence AS '#',
	li.InvoiceLineItemAmount AS LineItem
FROM Vendors v
JOIN Invoices i ON i.InvoiceID = v.VendorID
JOIN InvoiceLineItems li ON i.InvoiceID = li.InvoiceID
ORDER BY Vendor, Date, Number, '#'

-- Exercise 6
SELECT	v1.VendorID,
		v1.VendorName,
		v1.VendorContactFName + ' ' + v1.VendorContactLName AS Name
FROM Vendors v1
JOIN Vendors v2 ON v1.VendorContactFName = v2.VendorContactFName
	AND v1.VendorID <> v2.VendorID
ORDER BY Name

-- Exercise 8
SELECT	VendorName, 
		VendorState
FROM Vendors
WHERE VendorState = 'CA'
UNION
SELECT	VendorName,
		'Outside CA' AS VendorState
FROM Vendors
WHERE VendorState <> 'CA'
ORDER BY VendorName

