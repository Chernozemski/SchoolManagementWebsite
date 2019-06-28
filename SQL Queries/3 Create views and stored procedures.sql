﻿Use SchoolManagementDB
Go

Create View vw_tblTeacherInfo As
Select tblTeacherInfo.Id, FirstName + ' ' + FamilyName 
As FullName, tblSubject.SubjectName, PhoneNum, Adress, tblPosition.Position
From tblTeacherInfo
Left join tblSubject
On SubjectId = tblSubject.Id
Left join tblPosition
On tblPosition.Id = tblTeacherInfo.PositionId
Go

Create View vw_tblClass As
Select Grade + Letter as FullClassName, tblSpecialization.Specialization, tblTeacherInfo.FirstName + ' ' +tblTeacherInfo.FamilyName As FullTeacherName
From tblClass
Inner Join tblSpecialization
On tblSpecialization.Id = tblClass.SpecializationId
Inner Join tblTeacherInfo
On tblTeacherInfo.Id = tblClass.ClassTeacherId
Go

Create View vwGetSpecialization_tblSpecialization As
Select Id,Specialization from tblSpecialization
Go

Create Procedure spAddTeacher_tblTeacherInfo

@FirstName nvarchar(20),
@FamilyName nvarchar(20),
@SubjectId int,
@EGN varchar(10),
@Phonenum varchar(10),
@Adress nvarchar(50),
@Position int

AS
Begin
	--Check if director position already established and return 0.
If ((select COUNT(PositionId) from tblTeacherInfo Where PositionId=1) > 0 And @Position=1)
		Begin
			Select 0
		End
	--Insert new teacher
Else
	Begin
		Insert into tblTeacherInfo(FirstName,FamilyName,SubjectId,EGN,PhoneNum,Adress,PositionId)
		Values (@FirstName,@FamilyName,@SubjectId,@EGN,@Phonenum,@Adress,@Position)
		Select 1
	End
End
Go

Create Procedure spUpdateTeacher_tblTeachers
(
@Id int,
@FirstName nvarchar(20),
@FamilyName nvarchar(20),
@SubjectId int,
@EGN varchar(10),
@Phonenum varchar(10),
@Adress nvarchar(50),
@Position int
)
As
Begin
	Update tblTeacherInfo
	Set FirstName = @FirstName, FamilyName = @FamilyName, SubjectId = @SubjectId, EGN = @EGN, PhoneNum = @Phonenum, Adress = @Adress, PositionId=@Position
	Where Id = @Id
End
Go

Create Procedure spDeleteTeacher_tblTeacher
(
@Id int
)
As
Begin
	Delete from tblTeachers Where Id=@Id
End
Go

Create Procedure spGetSubjects_tblSubject
As
Begin
	Select SubjectName, Id From tblSubject
End
Go

Create Procedure spDeleteSubject_tblSubject 
@Id int
As
Begin
	Delete from tblSubject Where Id=@Id
End
Go 

Create Procedure spAddPosition_tblPosition
@Position nvarchar(20),
@Salary int
As
Begin
	Insert into tblPosition 
	Values (@Position,@Salary)
End
Go 

Create Procedure spGetPosition_tblPosition
As
Begin
	Select Id,Position From tblPosition
End
Go 

Create Procedure spUpdatePosition_tblPosition
@Id int,
@Position nvarchar(20),
@Salary int
As
Begin
	Update tblPosition
	Set Position = @Position, Salary = @Salary
	Where Id = @Id
End
Go 

Create Procedure spCreateTeacherAccount_tblTeacherAccount
@UserName nvarchar(20),
@Password nvarchar(max),
@EGN varchar(10)
As
Begin

Declare @Id int
Set @Id = IsNull((select Id from tblTeacherInfo Where EGN = @EGN),-1)

Declare @ResultNum int
	--Check if Id is null and return -1
If (@Id = -1)
	Begin
		Set @ResultNum = -1
	End
	--Check if Id has an account.
Else If  ((Select Count(Id) from tblTeacherAccount Where Id = @Id) = 0)
	Begin
	--Check if username exist. Return 1 for successful registration.
	If ((Select Count(UserName) from tblTeacherAccount Where UserName=@UserName) = 0)
		Begin
			Insert into tblTeacherAccount
			Values (@Id,@UserName,@Password)
			Set @ResultNum = 1
		End
	--If the username is taken return -2;
	Else
		Begin
			Set @ResultNum = -2
		End
	End
	--If user already exists return 0.
Else
	Begin
		Set @ResultNum = 0
	End
Select @ResultNum
End
Go

Create Procedure spGetTeacherPositionId_tblTeacherAccount
@UserName nvarchar(20)
As
Begin
	Declare @Id int
	Set @Id = (Select Id from tblTeacherAccount Where UserName=@UserName)

	Select PositionId from tblTeacherInfo Where Id = @Id
End
Go

Create Procedure spLoginTeacher_tblTeacherAccount

@UserName nvarchar(20),
@Password nvarchar(max)

As
Begin
	--Check if user exists and return 1 for yes.
	If ((Select Count(UserName) From tblTeacherAccount Where @UserName = UserName and @Password = PasswordKey) = 1)
		Begin
			Select 1
		End
	--Else return 0 for no.
	Else
		Begin
			Select 0
		End
End
Go

Create Procedure spGetTeacherId_tblTeacherInfo

@TeacherName nvarchar(50)

As
Begin
	If ((Select COUNT(Id) From tblTeacherInfo Where @TeacherName = (FirstName + ' ' + FamilyName)) > 0)
		Begin
			(Select Id From tblTeacherInfo Where @TeacherName = (FirstName + ' ' + FamilyName))
		End
	Else
		Begin
			Select 0 --Name not found
		End
End
Go

Create Procedure spCreateClass_tblClass
@ClassGrade int,
@ClassLetter nvarchar(1),
@SpecializationId int,
@ClassTeacherId int
As
Begin
	If (@ClassGrade > 12 Or @ClassGrade < 1)
		Begin
			Select -5
		End
	Else
		Begin
			--Check if class grade is other than capital letter
			If (@ClassLetter Like N'[А-Я]')
				Begin
					--Check if teacher exists
					If((Select COUNT(Id) From tblTeacherInfo Where Id=@ClassTeacherId) > 0)
						Begin
							--Check if class does NOT exits
							If((Select COUNT(Id) From tblClass Where Grade = @ClassGrade And Letter = @ClassLetter) = 0)
								Begin
									--Check if there is specialization matching this id
									If((Select COUNT(Id) From tblSpecialization Where Id = @SpecializationId) > 0)
										Begin
											--Check if teacher has NOT been registered in a class
											If ((Select COUNT(Id) From tblClass Where ClassTeacherId = @ClassTeacherId) = 0)
												Begin
													Insert Into tblClass
													Values (@ClassGrade,@ClassLetter,@SpecializationId,@ClassTeacherId)
													Select 1 --Successesful registation
												End
											Else
												Begin
													Select 0 --Teacher already registered
												End
										End
									Else
										Begin
											Select -1 --Wrong specialization id
										End
								End
							Else
								Begin
									Select -2 --Class already exists
								End
						End
					Else
						Begin
							Select -3 --Teacher dosent exist
						End
				End
			Else
				Begin
					Select -4 --No proper letter chosen
				End
		End
End
Go