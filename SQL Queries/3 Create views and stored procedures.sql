Use SchoolManagementDB
Go

Create view vwTeacherInfoId_tblTeacherInfo As
	Select tblTeacherInfo.Id,FirstName + ' ' + MiddleName + ' ' + FamilyName As FullName
	, tblSubject.SubjectName,  STUFF(STUFF(PhoneNumber,7,0,'-'),4,0,'-') as PhoneNumber
	, Adress, tblPosition.Position, Photo, Convert(varchar,tblClass.Grade) + ' ' + tblClass.Letter as Class
	From tblTeacherInfo
	Left join tblSubject
	On SubjectId = tblSubject.Id
	Left join tblPosition
	On tblPosition.Id = tblTeacherInfo.PositionId
	Left join tblClass
	On tblClass.ClassTeacherEGN = tblTeacherInfo.EGN
Go

Create View vwTeacherInfo_tblTeacherInfo As
	Select FirstName + ' ' + MiddleName + ' ' + FamilyName As FullName
	, tblSubject.SubjectName,  STUFF(STUFF(PhoneNumber,7,0,'-'),4,0,'-') as PhoneNumber
	, Adress, tblPosition.Position, Photo, Convert(varchar,tblClass.Grade) + ' ' + tblClass.Letter as Class
	From tblTeacherInfo
	Left join tblSubject
	On SubjectId = tblSubject.Id
	Left join tblPosition
	On tblPosition.Id = tblTeacherInfo.PositionId
	Left join tblClass
	On tblClass.ClassTeacherEGN = tblTeacherInfo.EGN
Go

Create View vwTeacherInfoFull_tblteacherInfo As
Select a.Id,FirstName,MiddleName,FamilyName,b.SubjectName,EGN,PhoneNumber,Adress,c.Position,Photo
From tblTeacherInfo a

Left Join tblSubject b
On b.Id = a.SubjectId
Left Join tblPosition c
On c.Id = a.PositionId
Go

Create View vwTeacherInfoNameAndSubjectId_tblTeacherInfo As
	Select SubjectId,tblSubject.SubjectName,FirstName + ' ' + MiddleName + ' ' + FamilyName As FullName From tblTeacherInfo
	Inner Join tblSubject
	On tblSubject.Id = tblTeacherInfo.SubjectId
Go

Create View vwClass_tblClass As 
	Select tblClass.Id
	,(Convert(nvarchar,Grade)) + ' ' + Letter as FullClassName, tblSpecialization.Specialization
	, tblTeacherInfo.FirstName + ' ' + tblTeacherInfo.MiddleName + ' ' +tblTeacherInfo.FamilyName As FullTeacherName

	From tblClass
	Inner Join tblSpecialization
	On tblSpecialization.Id = tblClass.SpecializationId
	Left Join tblTeacherInfo
	On tblTeacherInfo.EGN = tblClass.ClassTeacherEGN
Go

Create View vwSubject_tblSubject As
	Select a.Id,SubjectName, Count(b.SubjectId) As NumberOfTeachers From tblSubject a
	Left Join tblTeacherInfo b
	On a.Id = b.SubjectId
	Group By a.Id,SubjectName
Go

Create View vwStudentInfo_tblStudentInfo AS
	Select a.Id
	,a.FirstName + ' ' + a.MiddleName + ' ' + a.FamilyName as FullName
	, STUFF(STUFF(a.PhoneNumber,7,0,'-'),4,0,'-') as PhoneNumber
	, Adress, a.Photo
	, Convert(nvarchar,b.Grade) + ' ' + b.Letter as Grade
	, c.FirstName + ' ' + c.FamilyName as DoctorFullName
	, ParentFullName, ParentPhoneNumber, ParentAdress

	From tblStudentInfo a
	Left Join tblClass b
	On b.Id = a.ClassId
	Left Join tblDoctor c
	On c.Id = a.DoctorId
Go

Create view vwAbsentTeacherInfo_tblTeacherAbsence As
	SELECT tblTeacherAbsence.Id, a.FirstName + ' ' + a.MiddleName + ' ' + a.FamilyName as FullName,
	OnDate, tblTeacherAbsence.LessonsAbsent,  b.FirstName + ' ' + b.MiddleName + ' ' + b.FamilyName as SubstituteTeacherFullName FROM [tblTeacherAbsence]
	Left Join tblTeacherInfo a
	On a.Id = tblTeacherAbsence.AbsentTeacherId
	Left Join tblTeacherInfo b
	On b.Id = tblTeacherAbsence.SubstituteTeacherId
Go

Create view vwPublisherInfo_tblAuthor As
	Select a.Id, a.Publisher
	,(Select Count(PublisherId) From tblBook Where PublisherId = a.Id) As BookCount
	From tblAuthor a
Go

Create View vwDoctor_tblDoctor As
	SELECT [Id], [FirstName]+ ' ' + [FamilyName] As FullName
	,  STUFF(STUFF([PhoneNumber],7,0,'-'),4,0,'-') As PhoneNumber 
	FROM [tblDoctor]
Go

Create Procedure spAddTeacher_tblTeacherInfo

@FirstName nvarchar(20),
@MiddleName nvarchar(20),
@FamilyName nvarchar(20),
@SubjectId int,
@EGN varchar(10),
@PhoneNumber varchar(10),
@Adress nvarchar(50),
@Position int,
@Photo varbinary(max) = null

AS
Begin
	--Check if director position already established and return 0.
If ((select COUNT(PositionId) from tblTeacherInfo Where PositionId=1) > 0 And @Position=1)
		Begin
			Select 0 --Director position is taken
		End
Else
	Begin
		--Check if teacher already has registered with the same position.
	If ((Select COUNT(Id) from tblTeacherInfo Where EGN = @EGN And SubjectId = @SubjectId) > 0)
		Begin
			Select -1 --Already registered with same EGN and subject.
		End
	Else
		Begin
			Insert into tblTeacherInfo
			Values (@FirstName,@MiddleName,@FamilyName,@SubjectId,@EGN,@Phonenumber,@Adress,@Position,@Photo)
			Select 1
		End
	End
End
Go

Create Procedure spUpdateTeacherInfo_tblTeacherInfo
(
@Id int
,@FirstName nvarchar(20)
,@MiddleName nvarchar(20)
,@FamilyName nvarchar(20)
,@SubjectId int
,@EGN varchar(10)
,@PhoneNumber varchar(10)
,@Adress nvarchar(50)
,@PositionId int
,@Photo varbinary(max) = null
,@ResultNumber int OUTPUT
)
As
Begin
	If ((Select Count(Id) From tblSubject Where Id = @SubjectId) < 1)
		Begin
			Set @ResultNumber = 0 --Subject ID is not valid.
		End
	Else
		Begin
			If ((Select Count(Id) From tblPosition Where Id = @PositionId) < 1)
				Begin
					Set @ResultNumber = -1 --Position does not exist.
				End
			Else
				Begin
					If (@PositionId = 1 And (Select Count(Id) From tblTeacherInfo Where PositionId = 1) > 1)
						Begin
							Set @ResultNumber = -2 --Director position already taken.
						End
					Else
						Begin
							If (IsNull(DATALENGTH(@Photo),0) = 0)
								Begin
									Update tblTeacherInfo
									Set FirstName = @FirstName,MiddleName=@MiddleName,FamilyName = @FamilyName,SubjectId=@SubjectId,EGN =@EGN,Adress=@Adress,PositionId=@PositionId
									Where Id = @Id

									Set @ResultNumber = 2 --Successes !without! changed photo.
								End
							Else
								Begin
									Update tblTeacherInfo
									Set FirstName = @FirstName,MiddleName=@MiddleName,FamilyName = @FamilyName,SubjectId=@SubjectId,EGN =@EGN,Adress=@Adress,PositionId=@PositionId,Photo=@Photo
									Where Id = @Id

									Set @ResultNumber = 1 --Successes with changed photo.
								End
						End
				End
		End
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
			Select 1 --Successes.
		End
	Else
		Begin
			Select 0 --No such user.
		End
End
Go

Create Procedure spGetTeacherEGNByFullName_tblTeacherInfo
@TeacherName nvarchar(50)
As
Begin
	If ((Select COUNT(Id) From tblTeacherInfo Where @TeacherName = (FirstName + ' ' + MiddleName + ' ' + FamilyName)) > 0)
		Begin
			(Select Top 1 EGN From tblTeacherInfo Where @TeacherName = (FirstName + ' ' + MiddleName + ' ' + FamilyName))
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
@ClassTeacherEGN varchar(10)
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
					If((Select COUNT(Id) From tblTeacherInfo Where EGN=@ClassTeacherEGN) > 0)
						Begin
							--Check if class does NOT exits
							If((Select COUNT(Id) From tblClass Where Grade = @ClassGrade And Letter = @ClassLetter) = 0)
								Begin
									--Check if there is specialization matching this id
									If((Select COUNT(Id) From tblSpecialization Where Id = @SpecializationId) > 0)
										Begin
											--Check if teacher has NOT been registered in a class
											If ((Select COUNT(Id) From tblClass Where ClassTeacherEGN = @ClassTeacherEGN) = 0)
												Begin
													Insert Into tblClass
													Values (@ClassGrade,@ClassLetter,@SpecializationId,@ClassTeacherEGN)
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

Create Procedure spAddAbsentTeacher_tblTeacherAbsence
@SenderEGN varchar(10),
@SenderRank int,
@AbsentTeacherEGN varchar(10),
@LessonsAbsent nvarchar(100),
@OnDate date,
@SubstituteTeacherEGN varchar(10)
As
Begin
	--Check if sender is authorized OR is actually substitute teacher
	If(@SenderRank < 3 Or @SenderEGN = @SubstituteTeacherEGN)
		Begin
			--Check if sender is authorized AND has selected more than 1 lesson
			--The substitute teacher should NOT be able to select more than 1 hour
			If ((Len(@LessonsAbsent) >= 1 And @SenderRank < 3) Or (LEN(@LessonsAbsent)=1))
				Begin
					Insert into tblTeacherAbsence
					Values (@AbsentTeacherEGN,@LessonsAbsent,@OnDate,@SubstituteTeacherEGN)
					Select 1
				End
			Else
				Begin
					Select -1 --Substitute teacher selected more than 1 column
				End
		End
	Else
		Begin
			Select 0 --Not authorized or not actual substitute teacher
		End
End
Go

Create Procedure spGetEGNByUserName_tblTeacherInfo 
@UserName nvarchar(20)
As
Begin
	Declare @Id int
	Set @Id = (Select Id From tblTeacherAccount Where UserName = @UserName)

	--Directly return the EGN as BigInt, otherwise int overflow error
	Select Convert(BigInt,(Select EGN From tblTeacherInfo Where Id = @Id))
End
Go

Create Procedure spAddStudent_tblStudentInfo
(
@FirstName nvarchar(20)
,@MiddleName nvarchar(20)
,@FamilyName nvarchar(20)
,@EGN varchar(10)
,@Phone varchar(10)
,@Adress nvarchar(50)

,@ClassId int
,@Photo varbinary(max) = null
,@DoctorId int

,@ParentFullName nvarchar(60)
,@ParentPhoneNumber varchar(10)
,@ParentAdress nvarchar(50)

,@ResultNumber int Output
)
AS
Begin
	If ((Select Count(Id) From tblClass Where tblClass.Id = @ClassId) = 0)
		Begin
			Set @ResultNumber = -1 --The class does not exist.
		End

	Else
		Begin
			If ((Select Count(Id) From tblDoctor Where tblDoctor.Id = @DoctorId) = 0)
				Begin
					Set @ResultNumber =  -2 --The doctor does not exist.
				End
			Else
				Begin
					If (Len(@EGN) <> 10)
						Begin
							Set @ResultNumber =  -3 --EGN is not 10 chars long.
						End
					Else
						If (Len(@Phone) <>10)
							Begin
								Set @ResultNumber =  -4 --Student phone is not 10 chars long.
							End
						Else
							Begin
								If (LEN(@ParentPhoneNumber) <> 10)
									Begin
										Set @ResultNumber =  -5 --The parent phone number is not 10 chars long.
									End
								Else
									Begin
										If((Select Count(Id) From tblStudentInfo Where EGN = @EGN) = 0)
											Begin
												Insert Into tblStudentInfo
												Values (@FirstName,@MiddleName,@FamilyName,@Egn,@Phone,@Adress,@Photo,@ClassId,@DoctorId,@ParentFullName,@ParentPhoneNumber,@ParentAdress)
												Set @ResultNumber =  1 --Successes.
											End
										Else
											Begin
												Set @ResultNumber =  -6 --Student already registered
											End
									End
							End
				End
		End
End
Go

Create Procedure spAddDoctor_tblDoctor
(
@FirstName nvarchar(20)
,@FamilyName nvarchar(20)
,@PhoneNumber varchar(10)
)
As
Begin
	If(Len(@PhoneNumber) <> 10)
		Begin
			Select 0 --Number not 10 digits
		End
	Else
		Begin
			Insert Into tblDoctor
			values (@FirstName,@FamilyName,@PhoneNumber)
			Select 1 -- Success
		End
End
Go

Create Procedure spAddAuthor_tblAuthor
(
@Name nvarchar(20)
)
As
Begin
	If ((Select Count(Id) From tblAuthor Where Publisher = @Name) > 0)
		Begin
			Select 0 --Already exist with this name
		End
	Else
		Begin
			Insert into tblAuthor
			Values (@Name)
			Select 1 --Success
		End
End
Go

Create Procedure spUpdateSubject_tblSubject
(
@Id int
,@SubjectName nvarchar(50)
,@ResultNumber int Output
)
As
Begin
	If ((Select COUNT(Id) From tblSubject Where Id=@Id) = 0)
		Begin
			Set @ResultNumber = 0 --Id dosen't exist.
		End
	Else
		Begin
			If ((Select Count(Id) From tblSubject Where SubjectName= @SubjectName) > 0 )
				Begin
					Set @ResultNumber = -1 --Subject already exist.
				End
			Else
				Begin
					Update tblSubject 
					Set SubjectName = @SubjectName
					Where Id = @Id

					Set @ResultNumber = 1 --Success.
				End
		End
End
Go

Create Procedure spAddSubject_tblSubject
(
@SubjectName nvarchar(50)
,@ResultNumber int Output
)
As
Begin
	If ((Select Count(Id) From tblSubject Where Lower(Replace(SubjectName,' ','')) = Lower(Replace(@SubjectName,' ',''))) > 0)
		Begin
			Set @ResultNumber = 0 --Subject with this name exist.
		End
	Else
		Begin
			Insert into tblSubject
			Values (@SubjectName)

			Set @ResultNumber = 1 --Success.
		End
End