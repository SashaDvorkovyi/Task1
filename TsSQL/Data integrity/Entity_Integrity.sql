************************************************************************/

USE ITVDNdb
GO

IF OBJECT_ID('Employees') IS NOT NULL
  DROP TABLE Employees;
GO

CREATE TABLE Employees (
	Id int NOT NULL --IDENTITY --CONSTRAINT PK_Employees_Id PRIMARY KEY --CLUSTERED
	,FName varchar(50) --NOT NULL
	,LName varchar(50) --NOT NULL
	,Phone char(15) --CONSTRAINT UQ_Employees_Phone UNIQUE --NONCLUSTERED
	--,CONSTRAINT UQ_Employees_FullName UNIQUE (FName, LName)
	--,CONSTRAINT PK_Employees_FName_LName PRIMARY KEY (FName, LName)
);
GO

INSERT Employees VALUES
(1, 'Robert', 'Wu', '(000) 100-20-30')
GO

INSERT Employees VALUES
(2, 'Dmitry', 'Yang', '(000) 100-20-33')
GO

ALTER TABLE Employees
DROP CONSTRAINT PK_Employees_Id
GO

ALTER TABLE Employees
ADD CONSTRAINT PK_Employees_FName_LName PRIMARY KEY (FName, LName) --CLUSTERED 
GO

INSERT Employees VALUES
('Sarah', 'Lee', '(000) 100-20-30')
GO

INSERT Employees VALUES
('Mary', 'Lee', '(001) 100-20-30')
GO

ALTER TABLE Employees
DROP CONSTRAINT UQ_Employees_FullName
GO

ALTER TABLE Employees
ADD CONSTRAINT UQ_Employees_FullName UNIQUE (FName, LName)
GO