use iti 

CREATE VIEW CourseView AS
SELECT
    CONCAT(s.St_Fname, ' ', s.St_Lname) AS 'Student Full Name',
    c.Crs_Name AS 'Course Name'
FROM
    Student s
JOIN
    Stud_Course sc ON s.St_Id = sc.St_Id
JOIN
    Course c ON sc.Crs_Id = c.Crs_Id
WHERE
    sc.Grade > 50;


CREATE VIEW EncryptedView AS
SELECT ENCRYPTBYKEY(KEY_GUID('EncryptionKey'), i.Ins_Name) AS encrypted_manager_name,
       t.Top_Name
FROM Instructor i
JOIN Topic t ON i.Ins_Id = t.Top_Id;

-- Create the view V1
CREATE VIEW V1 AS
SELECT
    St_Id,St_Fname,St_Lname,St_Address,St_Age ,dept_id, st_super
FROM
    Student
WHERE
   St_Address IN ('Alex', 'Cairo');
UPDATE Student
SET St_Address = 'Tanta'
WHERE St_Address = 'Alex';


use Company_SD
 

CREATE VIEW ProjectEmployeeCount AS
SELECT
    p.Pname AS 'Project Name',
    COUNT(e.SSN) AS 'Number of Employees'
FROM
    Project p
LEFT JOIN
    Works_for w ON p.Pnumber = w.Pno
LEFT JOIN
    Employee e ON w.ESSn = e.SSN
GROUP BY
    p.Pname;


	 
CREATE SCHEMA Company;
ALTER SCHEMA Company TRANSFER dbo.Departments;
CREATE SCHEMA [Human Resource];
ALTER SCHEMA [Human Resource] TRANSFER dbo.Employee;
 

 create nonclustered index I1
on Company.Departments(MGRStart_Date)

create nonclustered index I2
on dbo.Student(St_Age)
  

  use ITI
 SELECT
     St_Id,
    LEFT(St_Fname, LEN(St_Fname) - 1) AS 'Student First Name Without Last Character'
FROM
   Student ;  

   DELETE FROM Stud_Course
WHERE St_Id IN (
    SELECT St_Id
    FROM Department
    WHERE Dept_Name = 'SD'
);

MERGE INTO LastTransaction AS Target
USING DailyTransaction AS Source
ON (Target.[User ID] = Source.[User ID])
WHEN MATCHED THEN
    UPDATE SET Target.[Transaction Amount] = Source.[Transaction Amount]
WHEN NOT MATCHED BY TARGET THEN
    INSERT ([User ID], [Transaction Amount])
    VALUES (Source.[User ID], Source.[Transaction Amount]);


	USE master;
	CREATE LOGIN ITIStud WITH PASSWORD = '1234';
	use ITI
	 GRANT SELECT, INSERT ON dbo.Student TO ITIStud;
	 GRANT SELECT, INSERT ON dbo.Course TO ITIStud;
	 DENY DELETE, UPDATE ON dbo.Student TO ITIStud;
	 DENY DELETE, UPDATE ON dbo.course  TO ITIStud;




