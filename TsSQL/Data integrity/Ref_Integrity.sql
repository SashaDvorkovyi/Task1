
USE ITVDNdb
GO

IF OBJECT_ID('Employees') IS NOT NULL
  DROP TABLE Employees;
GO

CREATE TABLE Employees (
	Id int NOT NULL IDENTITY PRIMARY KEY
	,FName varchar(50) 
	,LName varchar(50)
	,Phone char(15)
);
GO

IF OBJECT_ID('Orders') IS NOT NULL
  DROP TABLE Orders;
GO

CREATE TABLE Orders (
	Id int NOT NULL IDENTITY PRIMARY KEY
	,[Date] date --DEFAULT GETDATE()
	,TotalSum decimal(10,4) --DEFAULT 0
	--,EmployeeId int CONSTRAINT FK_Orders_Employees FOREIGN KEY 
	--	REFERENCES Employees(Id)
	--	ON DELETE NO ACTION    
	--	ON UPDATE NO ACTION
	,EmployeeId int --FOREIGN KEY REFERENCES Employees(Id)
);
GO

INSERT Employees VALUES
('Robert', 'Wu', '(000) 100-20-30')
,('Sarah', 'Lee', '(002) 100-20-30')
,('Mary', 'Lee', '(001) 100-20-30')
GO

INSERT Orders (EmployeeId)
VALUES (1),(3),(1),(2)
GO

INSERT Orders (EmployeeId)
VALUES (4)
GO

ALTER TABLE Orders
NOCHECK CONSTRAINT FK__Orders__Employee__477199F1
GO

ALTER TABLE Orders
DROP CONSTRAINT FK_Orders_Employees
GO

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Employees FOREIGN KEY (EmployeeId)
	REFERENCES Employees(Id)
GO

ALTER TABLE Orders
DROP COLUMN TotalSum
GO

ALTER TABLE Orders
DROP COLUMN Id
GO

ALTER TABLE Orders
DROP COLUMN EmployeeId
GO

CREATE TABLE Products (
	Id int NOT NULL IDENTITY PRIMARY KEY
	,Name varchar(30)	
);
GO

CREATE TABLE ProductDescr (
	Id int UNIQUE FOREIGN KEY REFERENCES Products(Id)
	,Color varchar(20)
	,[Weight] decimal(10,4)
);
GO

CREATE TABLE Stock (
	Id int NOT NULL IDENTITY PRIMARY KEY
	,QTY int 
	,ProductId int UNIQUE FOREIGN KEY REFERENCES Products(Id)
);
GO

INSERT Products VALUES
('Product1'), ('Product2'), ('Product3')
GO

INSERT ProductDescr VALUES
(1, 'red', 2.2), (2, 'black', 3.1), (3, 'yellow', 1.7)
GO

INSERT Stock VALUES
(117, 1), (124, 2), (86, 3)
GO

CREATE TABLE OrderProducts (
	OrderId int NOT NULL
	,ProductId int NOT NULL
	,PRIMARY KEY (OrderId, ProductId)
	,FOREIGN KEY (OrderId) REFERENCES Orders(Id)
	,FOREIGN KEY (ProductId) REFERENCES Products(Id)
);
GO

INSERT OrderProducts VALUES
(1, 1), (1, 3), (2, 3), (3,2)
GO

ALTER TABLE Employees
ADD EmployeeId int FOREIGN KEY REFERENCES Employees(Id)
GO

DELETE Employees
WHERE Id = 1
GO

ALTER TABLE Orders
DROP CONSTRAINT FK_Orders_Employees
GO

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Employees FOREIGN KEY (EmployeeId)
	REFERENCES Employees(Id)
	ON DELETE SET DEFAULT

ALTER TABLE Orders
DROP CONSTRAINT FK_Orders_Employees
GO

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Employees FOREIGN KEY (EmployeeId)
	REFERENCES Employees(Id)
	ON DELETE CASCADE    

SELECT * FROM Orders
SELECT * FROM Employees

ALTER TABLE Orders
DROP CONSTRAINT FK_Orders_Employees
GO

ALTER TABLE Orders
ADD CONSTRAINT FK_Orders_Employees FOREIGN KEY (EmployeeId)
	REFERENCES Employees(Id)
	ON DELETE SET NULL
