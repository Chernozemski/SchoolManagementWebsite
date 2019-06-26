Use SchoolManagementDB
Go

Create Table tblSubject
(
Id int identity(1,1) primary key,
SubjectName nvarchar(50)
)

Create Table tblPosition
(
Id int identity(1,1) primary key,
Position nvarchar(50) not null,
Salary int not null
)

Create Table tblTeacherInfo
(
Id int identity(1,1) primary key,
FirstName nvarchar(20) Not null,
FamilyName nvarchar(20) Not null,
SubjectId int not null,
--Check EGN and PhoneNum if valid
EGN varchar(10) Not null check (Len(EGN)=10 and IsNumeric(EGN) = 1),
PhoneNum varchar(10) Not null check (Len(PhoneNum)=10 and IsNumeric(PhoneNum) = 1),
Adress nvarchar(50) Not null,
PositionId int not null,
--Connect teacherInfo to subject and position
Constraint FK_SubjectId Foreign Key (SubjectId)
References tblSubject(Id),
Constraint FK_PositionId Foreign Key (PositionId)
References tblPosition(Id)
)

Create Table tblTeacherAccount
(
Id int primary key,
UserName nvarchar(20) not null,
PasswordKey nvarchar(max) not null
)

Insert into tblSubject
Values (N'Български език и литература')
Insert into tblSubject
Values (N'География и икономика')
Insert into tblSubject
Values (N'Английски език')
Insert into tblSubject
Values (N'Счетоводство')
Insert into tblSubject
Values (N'Фирмено право')

Insert into tblPosition
Values (N'Директор', 2400)
Insert into tblPosition
Values (N'Заместник директор', 2000)
Insert into tblPosition
Values (N'Старши учител', 1500)
Insert into tblPosition
Values (N'Учител', 1000)

Insert into tblTeacherInfo
Values (N'Гергана',N'Манова',1,'1234567890','0891234567',N'ул. Дунава №1',1)
Insert into tblTeacherInfo
Values (N'Иван',N'Иванов',2,'0987654321','0885551234',N'бул. Княгиня Мария Луйза №20',1)
Insert into tblTeacherInfo
Values (N'Григор',N'Тошев',3,'2345678901','0889123124',N'ул. Алеко Константинов №2',2)
Insert into tblTeacherInfo
Values (N'Иван',N'Иванов',4,'3456789012','0982341234',N'бул. Княз Борис №5',3)
Insert into tblTeacherInfo
Values (N'Александър',N'Атанасов',5,'0046789012','0982671234',N'бул. Руски №23',4)