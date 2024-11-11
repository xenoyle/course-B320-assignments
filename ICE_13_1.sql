/*
	Developer:	Floyd, Connor
	Semester: Fall 2024
	Course: B320-001
	Assignment: ICE 8.3
*/

-- Professors View
drop view if exists vLoadProfessors
go

create view vLoadProfessors
as
select distinct Professor, 
		SUBSTRING(professor , 1 , CHARINDEX(',' , professor)-1) as name_first, 
		SUBSTRING(professor , CHARINDEX(',' , professor)+1, len(professor)) as name_last, 
		CHARINDEX(',', Professor) as comma_location
from USCB_Course_Offerings
where Professor is not null
go


select *
from vLoadProfessors;

Create table Professors(

ProfessorID int IDENTITY(1,1) not null,
LastName varchar(50) null,
FirstName varchar(50) null,
Email varchar(50) null
)
go

insert into Professors
(LastName , FirstName, Email)

select name_last , name_first, lower(name_last) + '@uscb.edu'as email
from vLoadProfessors
order by name_last , name_first

select *
from Professors