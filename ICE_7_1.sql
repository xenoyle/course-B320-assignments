/*
	Developer:	Floyd, Connor
	Semester: Fall 2024
	Course: B320-001
	Assignment: ICE 7.1
*/

-- Exercise 1
--SELECT VendorName
--FROM Vendors
--WHERE VendorID IN
--(
--	SELECT VendorID
--	FROM Invoices
--)
--ORDER BY VendorName

-- Exercise 2
--SELECT *
--FROM Invoices
--WHERE PaymentTotal > -- avg = 1733.73
--(
--	SELECT AVG(PaymentTotal)
--	FROM Invoices
--	WHERE (InvoiceTotal - PaymentTotal - CreditTotal) = 0
--)

-- Exercise 4 (WENT TO BATHROOM)

-- Exercise 5
--SELECT VendorName, Invoices.InvoiceID, InvoiceSequence, InvoiceLineItemAmount
--FROM Vendors
--	INNER JOIN Invoices
--		ON Vendors.VendorID = Invoices.VendorID
--	INNER JOIN InvoiceLineItems
--		ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
--WHERE InvoiceID NOT IN 
--(
--	SELECT InvoiceID--, COUNT(*)
--	FROM InvoiceLineItems
--	GROUP BY InvoiceID
--	HAVING COUNT(*) > 1
--)

-- Exercise 7
SELECT Vendors.VendorName, Vendors.VendorCity, Vendors.VendorState
FROM Vendors
	INNER JOIN (	SELECT VendorCity, VendorState, COUNT(*) AS NumberOfVendors
					FROM Vendors
					GROUP BY VendorCity, VendorState
					HAVING COUNT(*) = 1) AS CitiesWithOnlyOneVendor
		ON Vendors.VendorCity = CitiesWithOnlyOneVendor.VendorCity AND Vendors.VendorState = CitiesWithOnlyOneVendor.VendorState