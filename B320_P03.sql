/*
	Developer:	Floyd, Connor
	Semester: Fall 2024
	Course: B320-001
	Assignment: Practical 03
*/


SELECT 
	VendorName, 
    MIN(Invoices.InvoiceDate) AS EarliestDate,
    Invoices.InvoiceNumber,
    Invoices.InvoiceTotal
FROM Invoices
	JOIN Vendors 
		ON Invoices.VendorID = Vendors.VendorID
	JOIN (
		SELECT VendorID, MIN(InvoiceDate) AS FirstDate
		FROM Invoices
		GROUP BY VendorID) AS EarliestInvoices 
			ON Invoices.VendorID = EarliestInvoices.VendorID 
				AND Invoices.InvoiceDate = EarliestInvoices.FirstDate
GROUP BY VendorName, Invoices.InvoiceNumber, Invoices.InvoiceTotal