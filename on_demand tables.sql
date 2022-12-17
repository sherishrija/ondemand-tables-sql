create database car1;




Create table UserTable (Id int PRIMARY KEY IDENTITY(1,1),
FirstName varchar(20) NOT NULL,
LastName varchar(20) NULL,
PhoneNumber varchar(20) NOT NULL,
Email varchar(50) NOT NULL,
Password varchar(20) NOT NULL,
Role varchar(50) NOT NULL check(Role = 'Customer' or Role = 'Washer'),
Status varchar(50) NOT NULL CHECK(Status = 'Active' or Status = 'Inactive'));


Create table Admin (Id int PRIMARY KEY,
Email varchar(50) unique,
Password varchar(20) unique,
)

Create table Orders (Id int PRIMARY KEY,
PackageId int NOT NULL,
AddressId int NOT NULL,
WashInstructions varchar(250) NULL,
DateofWash DATETIME NOT NULL,
Status varchar(50) NOT NULL check(Status = 'Accepted' OR Status = 'Rejected' OR Status = 'Ongoing' OR Status = 'Pending'),
CustomerId int NOT NULL)

Create table Package (Id int PRIMARY KEY,
Name varchar(20) NOT NULL,
Description varchar(250) NULL,
Price Decimal(10,2) check( Price>0 AND Price<10000),
Status varchar(50) NOT NULL
)

Create table PromoCode (Id int PRIMARY KEY NOT NULL,
Name varchar(20) NOT NULL,
Discount decimal(10,2) check( Discount>0 AND Discount<70),
Status varchar(50) NOT NULL
)

Create table Car (Id int PRIMARY KEY,
CarModel varchar(20) NOT NULL,
Status varchar(20) NOT NULL
)

Create table Address (Id int ,
City varchar(20) NOT NULL,
State varchar(20) NOT NULL,
PinCode int NOT NULL,
AddressId int PRIMARY KEY NOT NULL
)

Create table Addon( Id int NOT NULL,
Name varchar(20) NOT NULL,
Description varchar(250) NOT NULL
)

Alter table Address add constraint address_Id_FK
Foreign Key(Id) references UserTable(Id)

Alter table UserTable
add Status int NOT NULL check(Status = 'Active' OR Status = 'Inactive')

Alter table Orders add constraint order_packageid_Fk
Foreign Key(PackageId) references Package(Id)

Alter table Orders add constraint order_addressIdFk
Foreign Key(AddressId) references Address(AddressId)


Alter table Orders
add PromoCodeId int NOT NULL

Alter table Orders add constraint orders_promocodeId_Fk
Foreign Key(PromoCodeId) references PromoCode(Id)

Select * from UserTable
Select * from Admin
Select * from Orders
Select * from Package
Select * from PromoCode
Select * from Car
Select * from Address
Select * from Addon

INSERT INTO UserTable VALUES('Shrija','Reddy',9234567809,'s@gmail.com','KSR@122334','Customer','Active');