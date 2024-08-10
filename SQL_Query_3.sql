-- Amir Ahmed Shehata
-- lab 3

--1
use iti

create proc Stds 
as 
select COUNT(St_Fname + ' ' + St_Lname as FULL_NAME)
from Student S
join Department D on D.Dept_Id = S.Dept_Id

--2
USE Company_SD;

CREATE PROCEDURE Check
AS
BEGIN DECLARE @Emp_c INT;
    SET @Emp_c = (SELECT COUNT(*) FROM Employee WHERE ProjectID = 'p1')
    IF @Emp_c >= 3
        PRINT 'ءءءءء'
    ELSE
    BEGIN SELECT FirstName, LastName
	FROM Employees 
	WHERE ProjectID = 'p1'
    END

--3
CREATE PROCEDURE U_pdate
    @Old VARCHAR(15), @New VARCHAR(10), @Project_Num VARCHAR(15)
AS
BEGIN
    UPDATE Works_for
    SET ESSN = @New
    WHERE Pno = @Project_Num AND ESSN = @Old
    PRINT 'Emp ' + @Oldr + 'replaced by ' + @New + ' in project ' + @Project_Num
END

--4
USE Company;

CREATE TABLE Audit (
    ProjectNo VARCHAR(15),
    UserName VARCHAR(60),
    ModifiedDate DATE,
    Budget_Old DECIMAL(10,1),
    Budget_New DECIMAL(10,1)
);

--5
USE ITI;

CREATE TRIGGER Prevent
ON Department
INSTEAD OF INSERT
AS
BEGIN PRINT 'You are not allowed to insert new records in the Department table.'
END


--6
CREATE TRIGGER A_udit
ON Project
AFTER UPDATE
AS BEGIN
    IF UPDATE(Budget)
    BEGIN
        INSERT INTO Audit (ProjectNo, UserName, ModifiedDate, Budget_Old, Budget_New)
        SELECTi.ProjectNo,d.Budget AS Budget_Old,i.Budget AS Budget_New
        FROM inserted i
        JOIN deleted d ON i.ProjectNo = d.ProjectNo
    END





