/* 
	Developer:			Connor Floyd
	Semester:			Fall 2024
	Assignment Name:	ICE 6.1
	Course Number:		B320-001
*/

-- Problem 1
SELECT VendorID, SUM(PaymentTotal) AS PaymentSum
FROM Invoices
GROUP BY VendorID;

-- Problem 2
SELECT TOP 10 VendorName, SUM(PaymentTotal) AS PaymentSum
FROM Vendors
	JOIN Invoices
		ON Vendors.VendorID = Invoices.VendorID
GROUP BY VendorName
ORDER BY SUM(PaymentTotal) DESC;

-- Problem 3
SELECT VendorName, COUNT(*) AS InvoiceCount, SUM(InvoiceTotal) AS InvoiceSum
FROM Vendors
	JOIN Invoices
		ON Vendors.VendorID = Invoices.VendorID
GROUP BY VendorName
ORDER BY InvoiceCount DESC;

-- Problem 4
SELECT AccountDescription, COUNT(*) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum
FROM GLAccounts
	JOIN InvoiceLineItems
		ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo
GROUP BY AccountDescription
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

-- Problem 5
SELECT AccountDescription, COUNT(*) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum
FROM GLAccounts
	JOIN InvoiceLineItems
		ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo
	JOIN Invoices
		ON InvoiceLineItems.InvoiceID = Invoices.InvoiceID
WHERE InvoiceDate >= '2022-10-01' AND InvoiceDate <= '2022-12-31'
GROUP BY AccountDescription
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC;

-- Problem 7
SELECT VendorName, AccountDescription, COUNT(*) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum
FROM Vendors
	JOIN Invoices
		ON Vendors.VendorID = Invoices.VendorID
	JOIN InvoiceLineItems
		ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
	JOIN GLAccounts
		ON InvoiceLineItems.AccountNo = GLAccounts.AccountNo
GROUP BY VendorName, AccountDescription
ORDER BY VendorName, AccountDescription
