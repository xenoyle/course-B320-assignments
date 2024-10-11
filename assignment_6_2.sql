/* 
	Developer: Connor Floyd
	Semester: Fall 2024
	Assignment Name: Assignment 6.2 - Programming Exercises
	Course Number: B320-001
*/

-- Exercise 1
SELECT DISTINCT VendorName
FROM Vendors
WHERE Vendors.VendorID IN (	SELECT VendorID
							FROM Invoices);

-- Exercise 2
SELECT InvoiceNumber, InvoiceTotal
FROM Invoices
WHERE PaymentTotal > 
	  (	SELECT AVG(PaymentTotal)
		FROM Invoices
		WHERE PaymentTotal IS NOT NULL);

-- Exercise 4
SELECT AccountNo, AccountDescription
FROM GLAccounts
WHERE NOT EXISTS (	SELECT AccountNo
					FROM InvoiceLineItems
					WHERE InvoiceLineItems.AccountNo = GLAccounts.AccountNo)
ORDER BY AccountNo;

-- Exercise 5
SELECT	VendorName,
		Invoices.InvoiceID,
		InvoiceLineItems.InvoiceSequence,
		InvoiceLineItems.InvoiceLineItemAmount
FROM InvoiceLineItems
	INNER JOIN Invoices
		ON InvoiceLineItems.InvoiceID = Invoices.InvoiceID 
	INNER JOIN Vendors
		ON Invoices.VendorID = Vendors.VendorID 
WHERE InvoiceLineItems.InvoiceID IN (	SELECT InvoiceID
										FROM InvoiceLineItems
										WHERE InvoiceSequence > 1);

-- Exercise 7
SELECT VendorName, VendorCity, VendorState
FROM Vendors
GROUP BY VendorName, VendorCity, VendorState
HAVING COUNT(*) = 1;

-- Exercise 8
SELECT	Vendors.VendorName, 
		Invoices.InvoiceNumber, 
		Invoices.InvoiceDate, 
		Invoices.InvoiceTotal
FROM Vendors
	INNER JOIN Invoices 
		ON Vendors.VendorID = Invoices.VendorID
WHERE Invoices.InvoiceDate = (	SELECT MIN(InvoiceDate)
								FROM Invoices
								WHERE VendorID = Vendors.VendorID);