/*
	Developer:	Floyd, Connor
	Course: B320-001
	Assignment: ICE 5.1
*/

-- Problem 1
--SELECT *
--FROM Vendors
--	INNER JOIN Invoices
--		ON Vendors.VendorID = Invoices.VendorID

-- Problem 2
--SELECT	VendorName, 
--		InvoiceNumber, 
--		InvoiceDate,
--		InvoiceTotal - (PaymentTotal + CreditTotal) AS [Balance]
--FROM Vendors
--	INNER JOIN Invoices
--		ON Vendors.VendorID = Invoices.VendorID
--WHERE InvoiceTotal - (PaymentTotal + CreditTotal) <> 0
--ORDER BY VendorName

-- Problem 3
--SELECT VendorName, DefaultAccountNo, AccountDescription
--FROM Vendors
--	INNER JOIN GLAccounts
--		ON Vendors.DefaultAccountNo = GLAccounts.AccountNo
--ORDER BY AccountDescription, VendorName

-- Problem 5
SELECT	VendorName as [Name],
		InvoiceDate as [Date],
		InvoiceNumber as [Number],
		InvoiceSequence as [#],
		InvoiceLineItemAmount as [Line Item]
FROM Vendors v
	INNER JOIN Invoices i
		ON v.VendorID = i.VendorID
	INNER JOIN InvoiceLineItems ili
		ON i.InvoiceID = ili.InvoiceID
ORDER BY [Name], [Date], [Number], [#]
