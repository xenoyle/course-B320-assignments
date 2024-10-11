/* 
	Developer:			Connor Floyd
	Semester:			Fall 2024
	Assignment Name:	ICE 6.2
	Course Number:		B320-001
*/

-- Problem 8 (cont.)
SELECT VendorName, COUNT(DISTINCT AccountNo) AS NumberOfAccountNos
FROM Vendors
	JOIN Invoices
		ON Vendors.VendorID = Invoices.VendorID
	JOIN InvoiceLineItems
		ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
GROUP BY VendorName
HAVING COUNT(DISTINCT AccountNo) > 1

-- Problem 8 (Using a subquery)
SELECT VendorName, COUNT(AccountNo) AS NumberOfAccountsUsed
FROM(
	SELECT DISTINCT VendorName, AccountNo
	FROM Vendors
		JOIN Invoices
			ON Vendors.VendorID = Invoices.VendorID
		JOIN InvoiceLineItems
			ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
) AS DistinctVendorAccounts
GROUP BY VendorName
HAVING COUNT(AccountNo) > 1

/*
	Identify all of the vendors from whom we have NOT received any invoices
	(i.e., we have NOT purchased from them yet *or* maybe we have but they havent billed us yet)
*/

SELECT *
FROM Vendors
WHERE VendorID NOT IN
(
	SELECT VendorID
	FROM Invoices
)