
USE ITVDNdb
GO

IF OBJECT_ID('Employees') IS NOT NULL
  DROP TABLE Employees;
GO

CREATE TABLE Employees (
	Id int IDENTITY NOT NULL,
	FName varchar(50),
	LName varchar(50),
	Phone char(15) CONSTRAINT CK_Employees_Phone CHECK (Phone LIKE '([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]'),
	Salary decimal(10,4),
	Bonus decimal(10,4),
	Sex varchar(6) CHECK (Sex IN ('male', 'female', 'm', 'f'))
	,StartDate date CONSTRAINT DF_Employees_StartDate DEFAULT GETDATE()
);
GO

INSERT Employees
(FName, LName, Phone, Salary, Sex)
 VALUES
('Alex', 'Po', '(000) 100-20-30', 1000, 'm')
GO

ALTER TABLE Employees WITH NOCHECK
ADD CONSTRAINT CK_Employees_Bonus
CHECK (Bonus <= Salary*0.1)

INSERT Employees VALUES
('Linda', 'Wong', '(000) 300-20-10', 1000, 190, 'female')
GO

ALTER TABLE Employees
DROP CONSTRAINT CK__Employees__69FBBC1F
GO

ALTER TABLE Employees
NOCHECK CONSTRAINT CK_Employees_Bonus
GO

ALTER TABLE Employees
ADD 
DEFAULT 0 FOR Bonus
GO

ALTER TABLE Employees
DROP CONSTRAINT DF__Employees__Bonus__0A688BB1
GO