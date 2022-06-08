/* aditional task */

use master

create database CompanyDB
on
(
	name = 'CompanyDB',
	filename = 'D:\hardWork\courses\SQL\lesson3\CompanyDB.mdf',
	size = 1mb,
	maxsize = 5mb,
	filegrowth = 1mb
)
log on
(
	name = 'LogCompanyDB',
	filename = 'D:\hardWork\courses\SQL\lesson3\CompanyDB.ldf',
	size = 1mb,
	maxsize = 5mb,
	filegrowth = 1mb
)
collate cyrillic_general_ci_as

use CompanyDB

create table Employees
(
	Id int identity(1,1) not null primary key,
	Name nvarchar(15) not null,
	Surname nvarchar(15) not null,
	INN char(10) unique not null,
	Passport char(8) unique not null,
	Citizenship varchar(20) not null
)

create table EmployeesInfo
(
	EmpId int unique not null 
		foreign key references Employees(Id),
	Salary money not null,
	Position varchar(20) not null,
	StartOfWork date not null
)

create table EmployeesOtherInfo
(
	EmpId int unique not null 
		foreign key references Employees(Id),
	PhoneNumber char(12) not null,
	MaritalStatus varchar(5) null,
	Residence nvarchar(30) not null
)

/* task 2 */

use master

create database OtherDB
on
(
	name = 'OtherDB',
	filename = 'D:\bla\bla\bla\OtherDB.mdf',
	size = 30mb,
	maxsize = 100mb,
	filegrowth = 10mb
)
log on
(
	name = 'LogOtherDB',
	filename = 'C:\SystemDataLog\OtherDB.ldf',
	size = 15mb,
	maxsize = 50mb,
	filegrowth = 5mb
)
collate cyrillic_general_ci_as

/* task 3 */

use master

create database StockDB
on
(
	name = 'StockDB',
	filename = 'D:\bla\bla\bla\StockDB.mdf',
	size = 30mb,
	maxsize = 100mb,
	filegrowth = 10mb
)
log on
(
	name = 'LogStockDB',
	filename = 'D:\bla\bla\bla\StockDB.ldf',
	size = 15mb,
	maxsize = 50mb,
	filegrowth = 5mb
)
collate cyrillic_general_ci_as

use StockDB

create table Suppliers
(
	SupId smallint identity not null primary key,
	Name nvarchar(20) not null,
	PhoneNumber char(12) not null
)

create table Goods
(
	GoodsId int identity not null primary key,
	NameOfProduct nvarchar(15) not null,
	Count int null,
	Cost money not null,
	SupId smallint not null foreign key references Suppliers(SupId)
)

create table Customers
(
	CustId smallint identity not null primary key,
	Name nvarchar(20) not null default 'unknown',
	PhoneNumber char(12) not null
)

create table Workers
(
	WorkerId smallint identity not null primary key,
	Name nvarchar(20) not null,
	PhoneNumber char(12) not null
)

create table Orders
(
	OrderId int identity not null primary key,
	CustId smallint not null foreign key references Customers(CustId),
	OrderDate date not null,
	GoodsId int not null foreign key references Goods(GoodsId),
	WorkerId smallint not null foreign key references Workers(WorkerId),
	Count int not null
)