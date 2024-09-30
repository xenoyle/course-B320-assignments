/*
	Developers: Connor Floyd
	Course: B320-001 Fall 2024
	Assignment: Practical 01
*/


-- Problem 1
SELECT	VendorName, 
		VendorID,
		VendorState, 
		VendorContactLName + ', ' + VendorContactFName AS VendorContact
FROM Vendors
WHERE VendorState IN ('IL','IN','IA','KS','MI','MN','MO','NE','ND','OH','SD','WI')
ORDER BY VendorName, VendorID