Use SchoolManagementDB
Go

Create View vw_tblTeacherInfo As
Select tblTeacherInfo.Id, FirstName + ' ' + FamilyName 
As FullName, tblSubject.SubjectName, PhoneNum, Adress, tblPosition.Position
From tblTeacherInfo
Left join tblSubject
On SubjectId = tblSubject.Id
Left join tblPosition
On tblPosition.Id = tblTeacherInfo.Id
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
Set @Id = IsNull((select Count(Id) from tblTeacherInfo Where EGN = @EGN),-1)

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
	If ((Select Count(Id) from tblTeacherAccount Where UserName=@UserName) = 0)
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