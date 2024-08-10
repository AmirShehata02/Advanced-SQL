--DB Schema
--Object -->  [SchemaName].ObjectName
use iti

select * from HR.Student

create schema HR

create schema Sales

alter schema HR transfer Student

alter schema HR transfer Instructor

alter schema Sales transfer Department

create table Student(
id int,
sname varchar(20)
)

create table Sales.Student(
id int,
sname varchar(20)
)

select * from HR.Student

---------------------------------------
--Secuirty
----Authentication [UserName+Password] => Who are you?
-------Windows Auth
-------Sql Server Auth
----Authorization => why are you do?
----USer --> Tables[Student - Instructor] --> Grant [Select Insert]
                                          --> Deny [Update]
select * from Student

select * from Instructor

update Student 
set St_age += 1

delete from Student
where St_Age = 20
-----Secuirty Levels
--------Server --> Login [Pass+Username]
-----------Database --> Add User
--------------Schema --> Add Permession
-----------------Columns

-----------------------------------------------
--Object [ServerName].[DBName].[SchemaName].[ObjectName]

select * from Course

select * from hr.Student

select dname
from [IPServer].Company_SD.dbo.Departments
union all
select dept_name
from  [IPServer].iti.sales.department
--------------------------------------------------
--select into [DDL]

select * into t2
from Course

select * into t2
from Course

select * into sales.t2
from Course

select * into Company_sd.dbo.Dept
from sales.department

select st_id,st_fname into t3
from hr.student
where st_address = 'alex'

select * into t4
from hr.student
where 1 = 2

---insert based on select 

insert into t3 
values(100,'Ali')

insert into t3
select st_id , st_fname 
from hr.student
where st_address = 'Cairo'


-------------------------------
alter schema dbo transfer HR.Student

---------------------------------------------------
---top

select top(2) * 
from Student

select top(2) St_Fname
from Student

select top(2) * 
from Student
where st_address = 'alex'

select max(Salary)
from Instructor 

select top(2) salary
from instructor 
order by salary desc

select top(2) with ties* 
from instructor 
order by salary desc

----------Built in funs
select NEWID() --GUID

select top(5) * , NEWID()
from Student
order by NEWID()

---------------

select st_fname + ' ' +convert(varchar(20),st_age)
from Student

select st_fname + ' ' +cast(st_age as varchar(20))
from Student

select convert(varchar(20),getdate())

select convert(varchar(20),getdate(),101)

select convert(varchar(20),getdate(),102)

select convert(varchar(20),getdate(),103)

select convert(varchar(20),getdate(),111)

select convert(varchar(20),getdate(),107)

select convert(varchar(20),getdate(),110)

select format(getdate(),'dd-MM-yyyy')
select format(getdate(),'dddd MMMM yyyy')
select format(getdate(),'ddd MMM yy')
select format(getdate(),'dddd')
select format(getdate(),'MMMM')
select format(getdate(),'hh:mm:ss')
select format(getdate(),'hh tt')
select format(getdate(),'HH')
select format(getdate(),'dd-MM-yyyy hh:mm:ss')
select format(getdate(),'dd-MM-yyyy hh:mm:ss tt')
select format(getdate(),'dd')
select day(getdate())
select eomonth(GETDATE(),-2)
select format(eomonth(getdate(),2),'dd')
select format(eomonth(getdate()),'dddd')

select UPPER(st_fname) , LOWER(st_Lname)
from student

select substring(st_fname,2,3)
from Student

select DB_NAME()

select SUSER_NAME()

--sin  cos tan log


select power(salary,2)
from Instructor

select top(2) *
from student
order by len(st_fname) desc

select * from (
select * , ROW_NUMBER() over(order by st_age desc) as RN
from student) as NewTable
where RN <= 2

select * from (
select * , DENSE_RANK() over(order by st_age desc) as DR
from student) as NewTable
where DR <= 3


select * from (
select * , ROW_NUMBER() over(partition by dept_id order by st_age desc) as RN
from student) as NewTable
where RN <= 2

select * from (
select * , DENSE_RANK() over(partition by dept_id order by st_age desc) as DR
from student) as NewTable
where DR <= 2








