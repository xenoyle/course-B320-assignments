/*
	Developer:	Floyd, Connor
	Semester: Fall 2024
	Course: B320-001
	Assignment: ICE 10.1a
*/

SELECT VendorName, InvoiceNumber, InvoiceDate, InvoiceTotal
FROM Vendors
	INNER JOIN Invoices
		ON Vendors.VendorID = Invoices.VendorID
	INNER JOIN (	SELECT VendorID, MIN(InvoiceDate) AS EarliestInvoiceDate
					FROM Invoices
					GROUP BY VendorID) AS EarliestInvoiceDateTable
		ON Invoices.InvoiceDate = EarliestInvoiceDateTable.EarliestInvoiceDate
		AND Vendors.VendorID = EarliestInvoiceDateTable.VendorID
ORDER BY VendorName