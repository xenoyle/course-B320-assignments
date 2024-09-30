/*
	Developer:	Floyd, Connor
	Semester: Fall 2024
	Course: B320-001
	Assignment: ICE 7.1
*/

-- Exercise 1
SELECT VendorName
FROM Vendors
WHERE VendorID IN
(
	SELECT VendorID
	FROM Invoices
)
ORDER BY VendorName

-- Exercise 2
SELECT *
FROM Invoices
WHERE (InvoiceTotal - PaymentTotal - CreditTotal) = 0
