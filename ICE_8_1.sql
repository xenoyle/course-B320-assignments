/*
	Developer:	Floyd, Connor
	Semester: Fall 2024
	Course: B320-001
	Assignment: ICE 8.1
*/



INSERT INTO Vendors (
	--VendorID, 
	VendorName,			VendorAddress1, 
	VendorAddress2,		VendorCity, 
	VendorState,		VendorZipCode, 
	VendorPhone,		VendorContactLName, 
	VendorContactFName,	DefaultTermsID, 
	DefaultAccountNo	
)
VALUES (
	--VendorID, 
	'Target',			'123 Main Street', 
	NULL,				'Bluffton', 
	'SC',				29909, 
	NULL,				'Jones', 
	'Bob',				4, 
	160	
)

SELECT * FROM Vendors

