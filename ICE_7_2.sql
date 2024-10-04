/*
	Developer:	Floyd, Connor
	Semester: Fall 2024
	Course: B320-001
	Assignment: ICE 7.2
*/


-- Practical 2
SELECT Vendors.VendorID AS [Vendor ID], VendorName AS [Vendor Name], COUNT(*) AS [Items Invoiced]
FROM Vendors
	INNER JOIN Invoices
		ON Vendors.VendorID = Invoices.VendorID
	INNER JOIN InvoiceLineItems
		ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
WHERE InvoiceDate BETWEEN '2022-01-01' AND '2022-12-31'
GROUP BY Vendors.VendorID, VendorName
HAVING COUNT(*) >= 4
ORDER BY COUNT(*) DESC;


-- Homework #8
SELECT *
FROM Vendors
	INNER JOIN Invoices
		ON Vendors.VendorID = Invoices.VendorID
	INNER JOIN (	SELECT VendorID, MIN(InvoiceDate) AS FirstInvoiceDate
					FROM Invoices
					GROUP BY VendorID) AS FirstInvoices
		ON Vendors.VendorID = FirstInvoices.VendorID
		AND Invoices.InvoiceDate = FirstInvoices.FirstInvoiceDate
