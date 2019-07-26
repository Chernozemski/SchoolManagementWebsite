Use SchoolManagementDB
Go

Create Table tblSubject
(
Id int identity(1,1) primary key,
SubjectName nvarchar(50) unique not null
)

Create Table tblPosition
(
Id int identity(1,1) primary key,

Position nvarchar(50) not null,
Salary decimal(9,2) not null
)

Create Table tblTeacherInfo
(
Id int identity(1,1) primary key,

FirstName nvarchar(20) Not null,
MiddleName nvarchar(20) Not null,
FamilyName nvarchar(20) Not null,

SubjectId int not null,
--Check EGN and PhoneNumber if valid
EGN varchar(10) Not null check (Len(EGN)=10 and IsNumeric(EGN) = 1),
PhoneNumber varchar(10) check (Len(PhoneNumber)=10 and IsNumeric(PhoneNumber) = 1),
Adress nvarchar(50) Not null,

PositionId int not null,
Photo varbinary(max) null Default null,

--Connect teacherInfo to subject and position
Constraint FK_SubjectId_tblSubject Foreign Key (SubjectId)
References tblSubject(Id) On Delete No Action,
Constraint FK_PositionId_tblPosition Foreign Key (PositionId)
References tblPosition(Id) On Delete No Action

)

Create Table tblTeacherAccount
(
Id int primary key,

UserName nvarchar(20) not null,
PasswordKey nvarchar(max) not null,

Constraint FK_Id_tblTeacherInfo Foreign Key (Id)
References tblTeacherInfo(Id) On Delete Cascade
On Update Cascade
)

Create Table tblTeacherAbsence(
Id int primary key identity(1,1),

AbsentTeacherId int not null,
LessonsAbsent varchar(50),
OnDate date,

SubstituteTeacherId int not null

,Constraint FK_AbsentTeacher_tblTeacherInfo Foreign Key (AbsentTeacherId)
References tblTeacherInfo(Id) On Delete Cascade
)


Create Table tblSpecialization(
Id int primary key identity(1,1),
Specialization nvarchar(50)
)

Create Table tblClass(
Id int primary key identity(1,1),

Grade int not null check (Grade <= 12 and Grade >= 1),
Letter nvarchar(1) not null,
SpecializationId int not null,

ClassTeacherEGN varchar(10) unique not null

Constraint FK_SpecializationId_tblSpecialization Foreign Key (SpecializationId)
References tblSpecialization(Id) On Delete No Action
)

Create Table tblDoctor(
Id int primary key identity(1,1),

FirstName nvarchar(20),
FamilyName nvarchar(20),
PhoneNumber varchar(10) check (Len(PhoneNumber)=10 and IsNumeric(PhoneNumber) = 1)

)

Create Table tblStudentInfo
(
Id int identity(1,1) primary key,

FirstName nvarchar(20) Not null,
MiddleName nvarchar(20) Not null,
FamilyName nvarchar(20) Not null,

EGN varchar(10) unique check (Len(EGN)=10 and IsNumeric(EGN) = 1),
PhoneNumber varchar(10) check (Len(PhoneNumber)=10 and IsNumeric(PhoneNumber) = 1),
Adress nvarchar(50) Not null,
Photo varbinary(max) null Default null,

DoctorId int null,

ParentFullName nvarchar(60) not null,
ParentPhoneNumber varchar(10) not null,
ParentAdress nvarchar(50) null,

Constraint Fk_DoctorId_tblDoctor Foreign Key (DoctorId)
References tblDoctor (Id) On Delete Set Null
)

Create Table tblAuthor(
Id int primary key identity(1,1)
,Publisher nvarchar(20)
)

Create Table tblBook(
Id int primary key identity(1,1)
,Name nvarchar(20) not null
,PublisherId int  not null
,Grade int check (Grade > 0 And Grade < 13)  not null
,SubjectId int not null
,PublishedYear int check (PublishedYear > 1950 And PublishedYear <= GetDate())  not null
,Quantity int not null

,Constraint FK_Subject_tblSubject Foreign Key (SubjectId)
References tblSubject(Id) 
On Delete Cascade
,Constraint Fk_PublisherId_tblAuthor Foreign Key (PublisherId)
References tblAuthor(Id)
On Delete No Action 
)

Create Table tblOperationType(
Id int primary key identity(1,1)
,Operation nvarchar(10) unique not null
)

Create Table tblOperationLength(
Id int primary key identity(1,1)
,Payment nvarchar(20) unique not null
)

Create Table tblBudgetType(
Id int primary key identity(1,1)
,Item nvarchar(50) unique not null
,OperationTypeId int not null
,OperationLengthId int not null

Constraint FK_OperationTypeId_tblOperationType Foreign Key (OperationTypeId)
References tblOperationType(Id)
,Constraint FK_OperationLengthId_tblOperationLength Foreign Key (OperationLengthId)
References tblOperationLength(Id)
)

Create Table tblBudget(
Id int primary key identity(1,1)
,BudgetTypeId int not null
,DescriptionForItem nvarchar(500) null
,Amount decimal(9,2) not null
,OnDate smalldatetime null

Constraint FK_BudgetTypeId Foreign Key (BudgetTypeId)
References tblBudgetType(Id)
)

Create Table tblShift(
ShiftType int primary key,
ShiftName nvarchar(10)
)

Create Table tblDay(
Id int primary key,
NameDay nvarchar(10)
)

--The time table for each programme (hours with their time ex. 1 hour 45 min lesson) 
Create Table tblTimeTable(
Id int primary key identity(1,1)
,LessonHour int not null
,LessonTime time(0) not null unique
,ShiftType int not null

,Foreign Key (ShiftType)
References tblShift(ShiftType)
)

Create Table tblStudentInfoInClass
(
Id int primary key identity(1,1)
,StudentInClassId int not null
,ClassId int not null
,StudentId int unique not null
,TimesAbsent int Default 0
,TimesExcused int Default 0
,TimesLate decimal(5,1) Default 0.0

,Foreign key (ClassId) References tblClass(Id) On Delete Cascade
,Foreign Key (StudentId) References tblStudentInfo(Id) On Delete Cascade
)

Create Table tblProgramme
(
Id int primary key identity(1,1)
,ClassId int not null
,DayId int not null
,HourId int not null
,SubjectId int not null
,RoomId int not null
,TeacherEGN varchar(10) check (IsNumeric(TeacherEGN) = 1 And Len(TeacherEGN) = 10)

,Foreign key (ClassId) References tblClass(Id) On Delete Cascade
,Foreign Key (HourId) References tblTimeTable(Id) On Delete No Action
,Foreign Key (SubjectId) References tblSubject(Id) On Delete No Action
,Foreign Key (DayId) References tblDay(Id) On Delete No Action
)

Create Table tblLesson
(
Id int primary key identity(1,1)
,ProgrammeId int not null
,LessonName nvarchar(50) not null
,OnDate smallDateTime not null
,TeacherEGN varchar(10) check (IsNumeric(TeacherEGN) = 1 And Len(TeacherEGN) = 10)
,MissingStudentId varchar(150)
,LateStudentId varchar(150)

,Foreign Key (ProgrammeId) References tblProgramme(Id) On Delete Cascade
)

Create Table tblGrade
(
Id int primary key identity(1,1)
,Grade int not null
,ClassId int not null
,LessonId int null
,StudentInClassId int not null
,TeacherEGN varchar(10) check (Len(teacherEGN) = 10 And IsNumeric(TeacherEGN) = 1)

,Foreign key (ClassId) References tblClass(Id) On Delete Cascade
,Foreign Key (LessonId) References tblLesson(Id) On Delete No Action
)
