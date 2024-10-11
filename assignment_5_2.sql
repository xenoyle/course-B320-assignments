/* 
	Developer: Connor Floyd
	Semester: Fall 2024
	Assignment Name: Assignment 5.2 - Programming Exercises
	Course Number: B320-001
*/

-- Exercise 1
SELECT VendorID, SUM(PaymentTotal) AS PaymentSum
FROM Invoices
GROUP BY VendorID;

-- Exercise 2
SELECT TOP 10 VendorName, SUM(PaymentTotal) AS PaymentSum
FROM Invoices
	JOIN Vendors
		ON Invoices.VendorID = Vendors.VendorID
GROUP BY VendorName
ORDER BY PaymentSum DESC;

-- Exercise 3
SELECT VendorName, COUNT(InvoiceID) AS InvoiceCount, SUM(InvoiceTotal) AS InvoiceSum
FROM Vendors
	JOIN Invoices
		ON Vendors.VendorID = Invoices.VendorID
GROUP BY VendorName
ORDER BY InvoiceCount DESC;

-- Exercise 4
SELECT AccountDescription, COUNT(InvoiceLineItems.AccountNo) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum
FROM InvoiceLineItems
	JOIN GLAccounts
		ON InvoiceLineItems.AccountNo = GLAccounts.AccountNo
GROUP BY AccountDescription
HAVING COUNT(InvoiceLineItems.AccountNo) > 1
ORDER BY LineItemCount DESC;

-- Exercise 5
SELECT AccountDescription, COUNT(InvoiceLineItems.AccountNo) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum
FROM InvoiceLineItems
	JOIN GLAccounts
		ON InvoiceLineItems.AccountNo = GLAccounts.AccountNo
	JOIN Invoices
		ON InvoiceLineItems.InvoiceID = Invoices.InvoiceID
WHERE (Invoices.InvoiceDate >= '2022-10-01') AND (Invoices.InvoiceDate <= '2022-12-31')
GROUP BY AccountDescription
HAVING COUNT(InvoiceLineItems.AccountNo) > 1
ORDER BY LineItemCount DESC;

-- Exercise 7
SELECT VendorName, AccountDescription, COUNT(*) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum
FROM InvoiceLineItems
	JOIN GLAccounts
		ON InvoiceLineItems.AccountNo = GLAccounts.AccountNo
	JOIN Vendors
		ON InvoiceLineItems.AccountNo = Vendors.DefaultAccountNo
GROUP BY VendorName, AccountDescription
ORDER BY VendorName, AccountDescription

-- Exercise 8
SELECT VendorName, COUNT(DISTINCT AccountNo) AS Accounts
FROM Vendors
	JOIN Invoices
		ON Vendors.VendorID = Invoices.VendorID
	JOIN InvoiceLineItems
		ON InvoiceLineItems.InvoiceID = Invoices.InvoiceID
GROUP BY VendorName
HAVING COUNT(DISTINCT AccountNo) > 1