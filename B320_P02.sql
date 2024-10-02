/*
	Developer:	Floyd, Connor
	Semester: Fall 2024
	Course: B320-001
	Assignment: Practical 02
*/

 -- Problem 1
SELECT	Vendors.VendorID AS [Vendor ID], 
		VendorName AS [Vendor Name], 
		COUNT(InvoiceLineItems.InvoiceID) AS [Items Invoiced]
FROM Vendors
	INNER JOIN Invoices
		ON Vendors.VendorID = Invoices.VendorID
	INNER JOIN InvoiceLineItems
		ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
WHERE (InvoiceDate >= '2022-01-01' AND InvoiceDate <= '2022-12-31')
GROUP BY Vendors.VendorID, VendorName
HAVING COUNT(InvoiceLineItems.InvoiceID) >= 4
ORDER BY [Items Invoiced] DESC