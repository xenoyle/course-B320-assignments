/*
	Developer: Floyd, Connor
	Course: B320-001 Fall 2024
	Assignment: ICE 2.3
*/

SELECT	VendorID,
		InvoiceID,
		InvoiceDate,
		InvoiceDueDate,
		InvoiceTotal,
		(InvoiceTotal - (PaymentTotal + CreditTotal)) as OutstandingBalance,
		PaymentDate
FROM Invoices
WHERE PaymentDate is NULL
AND (InvoiceTotal - PaymentTotal - CreditTotal) > 0