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
EGN varchar(10) check (Len(EGN)=10 and IsNumeric(EGN) = 1),
PhoneNum varchar(10) check (Len(PhoneNum)=10 and IsNumeric(PhoneNum) = 1),
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

Create Table tblClass(
Id int primary key identity(1,1),
Grade int not null check (Grade <= 12 and Grade >= 1),
Letter nvarchar(1) not null,
SpecializationId int not null,
ClassTeacherId int unique not null,
Constraint FK_ClassTeacherId Foreign Key (ClassTeacherId)
References tblTeacherInfo(Id),
Constraint FK_SpecializationId Foreign Key (SpecializationId)
References tblSpecialization(Id)
)

Create Table tblTeacherAbsence(
AbsentTeacherId int,
LessonsAbsent varchar(30),
OnDate smalldatetime,
SubstituteTeacherId int,
Constraint FK_AbsentTeacherId Foreign Key (AbsentTeacherId)
References tblTeacherInfo(Id),
Constraint FK_SubstituteTeacherId Foreign Key (SubstituteTeacherId)
References tblTeacherInfo(Id)
)

Create Table tblTeacherLesson(
LessonId int primary key identity(1,1),
TeacherId int,
LessonName nvarchar(50),
LessonDate smalldatetime,
SubjectId int,
ClassId int,
MissingStudent varchar(150),
LateStudent varchar(150),
Constraint FK_TeacherId Foreign Key (TeacherId)
References tblTeacherInfo(Id),
Constraint FK_ClassId Foreign Key (ClassId)
References tblClass(Id)
)

Create Table tblSpecialization(
Id int primary key identity(1,1),
Specialization nvarchar(50)
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
Values (N'Иван',N'Иванов',2,'0987654321','0885551234',N'бул. Княгиня Мария Луйза №20',2)
Insert into tblTeacherInfo
Values (N'Григор',N'Тошев',3,'2345678901','0889123124',N'ул. Алеко Константинов №2',2)
Insert into tblTeacherInfo
Values (N'Иван',N'Иванов',4,'3456789012','0982341234',N'бул. Княз Борис №5',3)
Insert into tblTeacherInfo
Values (N'Александър',N'Атанасов',5,'0046789012','0982671234',N'бул. Руски №23',3)

Insert into tblTeacherAccount
Values (1,'director','40BD001563085FC35165329EA1FF5C5ECBDBBEEF')
Insert into tblTeacherAccount
Values (4,'teacher','40BD001563085FC35165329EA1FF5C5ECBDBBEEF')

Insert into tblSpecialization
Values (N'Стопански мениджмънт')
Insert into tblSpecialization
Values (N'Хуманитарна')

Insert into tblClass
Values (12,N'Б',1,3)
Insert into tblClass
Values (11,N'A',2,4)

Insert into tblTeacherAbsence
Values (3,'1, 2, 3, 4',SYSDATETIME(),4)

Insert into tblTeacherLesson
Values (4,N'Картознание и история',SYSDATETIME(),2,1,'1,2,3,4','1,2,3,4')


