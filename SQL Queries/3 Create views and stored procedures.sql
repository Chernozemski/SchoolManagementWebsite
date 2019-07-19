Use SchoolManagementDB
Go

Create view vwTeacherInfo_tblTeacherInfo As
	Select tblTeacherInfo.Id,FirstName + ' ' + MiddleName + ' ' + FamilyName As FullName
	,tblSubject.Id As SubjectId, tblSubject.SubjectName,  STUFF(STUFF(PhoneNumber,7,0,'-'),4,0,'-') as PhoneNumber
	, Adress,tblPosition.Id As PositionId, tblPosition.Position, Photo, Convert(varchar,tblClass.Grade) + ' ' + tblClass.Letter as Class
	From tblTeacherInfo
	Left join tblSubject
	On SubjectId = tblSubject.Id
	Left join tblPosition
	On tblPosition.Id = tblTeacherInfo.PositionId
	Left join tblClass
	On tblClass.ClassTeacherEGN = tblTeacherInfo.EGN
Go

Create View vwTeacherInfoFull_tblteacherInfo As
Select a.Id,FirstName,MiddleName,FamilyName,a.SubjectId,b.SubjectName,EGN,PhoneNumber,Adress,a.PositionId,c.Position,Photo
From tblTeacherInfo a

Left Join tblSubject b
On b.Id = a.SubjectId
Left Join tblPosition c
On c.Id = a.PositionId
Go

Create View vwBudgetTypeFull_tblBudgetType As
	Select a.Id,a.Item,a.OperationTypeId,b.Operation as OperationType,a.OperationLengthId,c.Payment as OperationLength
	From tblBudgetType a
	Left Join tblOperationType b
	On a.OperationTypeId = b.Id
	Left Join tblOperationLength c
	On a.OperationLengthId = c.Id
Go

Create View vwBudgetFull_tblBudget As
	Select a.Id,b.Id as ItemId,b.Item,c.Operation,d.Payment,a.DescriptionForItem,a.Amount,a.OnDate
	From tblBudget a
	Left Join tblBudgetType b
	On a.BudgetTypeId = b.Id
	Left Join tblOperationType c
	On b.OperationTypeId = c.Id
	Left Join tblOperationLength d
	On b.OperationLengthId = d.Id
Go


Create View vwClassFull_tblClass As 
	Select tblClass.Id
	,Grade, Letter
	,tblSpecialization.Id As SpecializationId, tblSpecialization.Specialization
	,tblTeacherInfo.EGN As ClassTeacherEGN, tblTeacherInfo.FirstName + ' ' + tblTeacherInfo.MiddleName + ' ' +tblTeacherInfo.FamilyName As FullTeacherName

	From tblClass
	Inner Join tblSpecialization
	On tblSpecialization.Id = tblClass.SpecializationId
	Left Join tblTeacherInfo
	On tblTeacherInfo.EGN = tblClass.ClassTeacherEGN
Go

Create View vwClassWithId_tblClass As
Select Id,Convert(nvarchar,Grade) + ' ' + Letter As FullClassName From tblClass
Go

Create View vwSpecializationWithClassCount_tblSpecialization As
	Select a.Id,a.Specialization, Count(b.Id) As NumberOfClasses From tblSpecialization a
	Left Join tblClass b
	On a.Id = b.SpecializationId
	Group By a.Id,a.Specialization
 Go

Create View vwSubject_tblSubject As
	Select a.Id,SubjectName, Count(b.SubjectId) As NumberOfTeachers From tblSubject a
	Left Join tblTeacherInfo b
	On a.Id = b.SubjectId
	Group By a.Id,SubjectName
Go

Create View vwStudentInfoWithId_tblStudentInfo AS
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

Create View vwStudentInfoFull_tblStudentInfo AS
	Select a.Id
	,a.FirstName,a.MiddleName,a.FamilyName
	,a.PhoneNumber
	, Adress,EGN, a.Photo, a.ClassId, a.DoctorId
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

Create View vwDoctorFull_tblDoctor As
	SELECT [Id], [FirstName], [FamilyName]
	,  STUFF(STUFF([PhoneNumber],7,0,'-'),4,0,'-') As PhoneNumber 
	FROM [tblDoctor]
Go

Create View vwDoctorWithId_tblDoctor As
	SELECT [Id], [FirstName]+ ' ' + [FamilyName] As FullDoctorName
	FROM [tblDoctor]
Go

Create View vwPositionWithStaffCount_tblPosition As
	Select a.Id,Position,Salary,Count(b.Id) as StaffCount
	From tblPosition a
	Left Join tblTeacherInfo b
	On a.Id = b.PositionId
	Group By a.Id,Position,Salary
Go

Create View vwAuthorWithBookCount_tblAuthor As
	Select a.Id,a.Publisher,Count(b.Id) as BookCount
	From tblAuthor a
	Left Join tblBook b
	On a.Id = b.PublisherId
	Group by a.Id,a.Publisher
Go

Create View vwBook_tblBook As
	Select a.Id,a.Name
	,b.Publisher,a.Grade,c.SubjectName
	,a.PublishedYear,a.Quantity
	From tblBook a
	Left Join tblAuthor b
	On a.PublisherId = b.Id
	Left Join tblSubject c
	On a.SubjectId = c.Id
Go

Create View vwBookFull_tblBook As
	Select a.Id,a.Name,a.PublisherId
	,b.Publisher,a.Grade,a.SubjectId,c.SubjectName
	,a.PublishedYear,a.Quantity
	From tblBook a
	Left Join tblAuthor b
	On a.PublisherId = b.Id
	Left Join tblSubject c
	On a.SubjectId = c.Id
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
If ((@Position=1) And Exists (Select PositionId from tblTeacherInfo Where PositionId=1))
		Begin
			Select 0 --Director position is taken
		End
Else
	Begin
	If Exists  (Select Id from tblTeacherInfo Where EGN = @EGN And SubjectId = @SubjectId)
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
	If Not Exists (Select Id From tblSubject Where Id = @SubjectId)
		Begin
			Set @ResultNumber = 0 --Subject ID is not valid.
		End
	Else
		Begin
			If Not Exists (Select Id From tblPosition Where Id = @PositionId)
				Begin
					Set @ResultNumber = -1 --Position does not exist.
				End
			Else
				Begin
					If ((@PositionId = 1) And Exists (Select Id From tblTeacherInfo Where PositionId = 1))
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

									Set @ResultNumber = 2 --Successes WITHOUT changed photo.
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
(
@Position nvarchar(20)
,@Salary decimal(9,2)

,@ResultNumber int Output
)
As
Begin
If Exists (Select Id From tblPosition Where Lower(Replace(Position,' ','')) = Lower(Replace(@Position,' ','')))
	Begin
		Set @ResultNumber = 0 --Position already exists.
	End
	Else
		Begin
			Insert into tblPosition 
			Values (@Position,@Salary)

			Set @ResultNumber = 1 --Success.
		End
End
Go

Create Procedure spUpdatePosition_tblPosition
(
@Id int
,@Position nvarchar(20)
,@Salary decimal(9,2)

,@ResultNumber int Output
)
As
Begin
If Exists (Select Id From tblPosition Where Lower(Replace(Position,' ','')) = Lower(Replace(@Position,' ','')) And Id <> @Id)
	Begin
		Set @ResultNumber = 0 --This position already exists.
	End
Else
	Begin
		Update tblPosition
		Set Position = @Position, Salary = @Salary
		Where Id = @Id

		Set @ResultNumber = 1 --Success.
	End
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
Else If Not Exists  (Select Id from tblTeacherAccount Where Id = @Id)
	Begin
	--Check if username exist. Return 1 for successful registration.
	If Not Exists (Select UserName from tblTeacherAccount Where UserName=@UserName)
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
	If Exists (Select Id From tblTeacherAccount Where @UserName = UserName and @Password = PasswordKey)
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
	If Exists (Select Id From tblTeacherInfo Where @TeacherName = (FirstName + ' ' + MiddleName + ' ' + FamilyName))
		Begin
			(Select Top 1 EGN From tblTeacherInfo Where @TeacherName = (FirstName + ' ' + MiddleName + ' ' + FamilyName))
		End
	Else
		Begin
			Select 0 --Name not found
		End
End
Go

Create Procedure spAddClass_tblClass
@ClassGrade int
,@ClassLetter nvarchar(1)
,@SpecializationId int
,@ClassTeacherEGN varchar(10)
,@ResultNumber int Output
As
Begin
	If (@ClassGrade > 12 Or @ClassGrade < 1)
		Begin
			Set @ResultNumber = -5
		End
	Else
		Begin
			--Check if class grade is other than capital letter
			If (@ClassLetter Like N'[А-Я]')
				Begin
					--Check if teacher exists
					If Exists (Select Id From tblTeacherInfo Where EGN=@ClassTeacherEGN)
						Begin
							--Check if class does NOT exits
							If Not Exists (Select Id From tblClass Where Grade = @ClassGrade And Letter = @ClassLetter)
								Begin
									--Check if there is specialization matching this id
									If Exists (Select Id From tblSpecialization Where Id = @SpecializationId)
										Begin
											--Check if teacher has NOT been registered in a class
											If Not Exists (Select Id From tblClass Where ClassTeacherEGN = @ClassTeacherEGN)
												Begin
													Insert Into tblClass
													Values (@ClassGrade,@ClassLetter,@SpecializationId,@ClassTeacherEGN)
													Set @ResultNumber =  1 --Successesful registation
												End
											Else
												Begin
													Set @ResultNumber =  0 --Teacher already registered
												End
										End
									Else
										Begin
											Set @ResultNumber =  -1 --Wrong specialization id
										End
								End
							Else
								Begin
									Set @ResultNumber =  -2 --Class already exists
								End
						End
					Else
						Begin
							Set @ResultNumber =  -3 --Teacher dosent exist
						End
				End
			Else
				Begin
					Set @ResultNumber =  -4 --No proper letter chosen
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
	If Not Exists (Select Id From tblClass Where tblClass.Id = @ClassId)
		Begin
			Set @ResultNumber = -1 --The class does not exist.
		End

	Else
		Begin
			If Not Exists (Select Id From tblDoctor Where tblDoctor.Id = @DoctorId)
				Begin
					Set @ResultNumber =  -2 --The doctor does not exist.
				End
			Else
				Begin
							If Not Exists (Select Id From tblStudentInfo Where EGN = @EGN)
								Begin
									Insert Into tblStudentInfo
									Values (@FirstName,@MiddleName,@FamilyName,@Egn,@Phone,@Adress,@Photo,@ClassId,@DoctorId,@ParentFullName,@ParentPhoneNumber,@ParentAdress)
					
									Set @ResultNumber =  1 --Successes.
								End
							Else
								Begin
									Set @ResultNumber =  0 --Student already registered
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

,@ResultNumber int Output
)
As
Begin
If Exists (Select Id From tblDoctor Where FirstName = @FirstName And FamilyName = @FamilyName And PhoneNumber = @PhoneNumber)
	Begin
		Set @ResultNumber = 0 --Doctor already exists
	End
		Else
			Begin
				Insert Into tblDoctor
				values (@FirstName,@FamilyName,@PhoneNumber)
				Set @ResultNumber = 1 -- Success
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
	If Not Exists (Select Id From tblSubject Where Id=@Id)
		Begin
			Set @ResultNumber = 0 --Id dosen't exist.
		End
	Else
		Begin
			If Exists (Select Id From tblSubject Where SubjectName= @SubjectName)
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
	If Exists (Select Id From tblSubject Where Lower(Replace(SubjectName,' ','')) = Lower(Replace(@SubjectName,' ','')))
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
Go

Create Procedure spUpdateStudentInfo_tblStudentInfo
(
@Id int

,@FirstName nvarchar(20)
,@MiddleName nvarchar(20)
,@FamilyName nvarchar(20)

,@EGN varchar(10)
,@PhoneNumber varchar(10)
,@Adress nvarchar(50)
,@Photo varbinary(max) = null

,@ClassId int
,@DoctorId int

,@ParentFullName nvarchar(60)
,@ParentPhoneNumber varchar(10)
,@ParentAdress nvarchar(50) = null

,@ResultNumber int Output
)
As
Begin
	If ((Select Count(EGN) From tblStudentInfo Where EGN = @EGN) > 1)
		Begin
			Set @ResultNumber = 0 -- Student with this EGN exists (more than 1 record with this EGN)
		End
	Else
		Begin
			If Not Exists (Select Id From tblDoctor Where Id = @DoctorId)
				Begin
					Set @ResultNumber = -1 --The input doctor id does NOT exist.
				End
			Else
				Begin
					If Not Exists (Select Id From tblClass Where Id = @ClassId)
						Begin
							Set @ResultNumber = -2  --The input class id does NOT exist.
						End
					Else
						Begin
							If (IsNull(DATALENGTH(@Photo),0) = 0)
								Begin
									Update tblStudentInfo
									Set FirstName = @FirstName, MiddleName = @MiddleName, FamilyName = @FamilyName, EGN = @EGN, PhoneNumber = @PhoneNumber, Adress = @Adress, ClassId = @ClassId, DoctorId = @DoctorId, ParentFullName = @ParentFullName, ParentPhoneNumber = @ParentPhoneNumber, ParentAdress = @ParentAdress
									Where Id = @Id

									Set @ResultNumber = 2 --Success WITHOUT changing photo.
								End
							Else
								Begin
									Update tblStudentInfo
									Set FirstName = @FirstName, MiddleName = @MiddleName, FamilyName = @FamilyName, EGN = @EGN, PhoneNumber = @PhoneNumber, Adress = @Adress, Photo = @Photo, ClassId = @ClassId, DoctorId = @DoctorId, ParentFullName = @ParentFullName, ParentPhoneNumber = @ParentPhoneNumber, ParentAdress = @ParentAdress
									Where Id = @Id

									Set @ResultNumber = 1 --Success with changing photo.
								End
						End
				End
		End
End
Go

Create Procedure spAddSpecialization_tblSpecialization
(
@Id int
,@Specialization nvarchar(50)
,@ResultNumber int Output
)
As
Begin
	If Exists (Select Id From tblSpecialization Where Lower(Replace(Specialization,' ','')) = Lower(Replace(@Specialization,' ','')))
		Begin
			Set @ResultNumber = 0 --Specialization with this name exists. 
		End
	Else
		Begin
			Insert into tblSpecialization
			Values (@Specialization)

			Set @ResultNumber = 1 --Success.
		End

End
Go

Create Procedure spUpdateSpecialization_tblSpecialization
(
@Id int
,@Specialization nvarchar(50)
,@ResultNumber int Output
)
As
Begin
	If Exists (Select Id From tblSpecialization Where Lower(Replace(Specialization,' ','')) = Lower(Replace(@Specialization,' ','')))
		Begin
			Set @ResultNumber = 0 --Specialization with this name exists. 
		End
	Else
		Begin
			Update tblSpecialization
			Set Specialization = @Specialization
			Where Id = @Id

			Set @ResultNumber = 1 --Success.
		End

End
Go

Create Procedure spDeleteSpecialization_tblSpecialization
(
@Id int
,@ResultNumber int Output
)
As
Begin
	Begin Try 
		Delete From tblSpecialization
		Where Id = @Id
		
		Set @ResultNumber = 1 -- Success.
	End Try
	Begin Catch
		Set @ResultNumber = 0 --There are classes that are bound to this id.
	End Catch
End
Go

Create Procedure spUpdateClass_tblClass
(
@Id int
,@Grade int
,@Letter nvarchar(1)
,@SpecializationId int
,@ClassTeacherEGN varchar(10)

,@ResultNumber int Output
)
As
Begin
If Exists (Select Id From tblClass Where Grade = @Grade And Letter=@Letter And Id<>@ID)
	Begin
		Set @ResultNumber = 0 -- Class already exists other than this class
	End
Else
	Begin
		If Not Exists (Select Id From tblTeacherInfo Where EGN = @ClassTeacherEGN)
			Begin
				Set @ResultNumber = -1 --Teacher with this EGN does not exist
			End
		Else
			Begin
				If ((Select Count(Id) From tblClass Where ClassTeacherEGN = @ClassTeacherEGN) > 1)
					Begin
						Set @ResultNumber = -2 --Teacher is already assigned to a class
					End 
				Else 
					Begin
						Update tblClass
						Set Grade = @Grade, Letter = @Letter, SpecializationId = @SpecializationId,ClassTeacherEGN = @ClassTeacherEGN
						Where Id = @Id

						Set @ResultNumber = 1 --Success.
					End
			End
	End
End
Go

Create Procedure spUpdateDoctor_tblDoctor
(
@Id int
,@FirstName nvarchar(20)
,@FamilyName nvarchar(20)
,@PhoneNumber nvarchar(20)

,@ResultNumber int Output
)
As
Begin
If Exists (Select Id From tblDoctor Where FirstName = @FirstName And FamilyName = @FamilyName And Id <> @ID)
	Begin
		Set @ResultNumber = 0 --Doctor with same info exists.
	End
Else
	Begin
		If Exists (Select Id From tblDoctor Where PhoneNumber = @PhoneNumber And Id <> @Id)
			Begin
				Set @ResultNumber = -1 --Doctor with this phone number exists
			End
		Else
			Begin
				Update tblDoctor
				Set FirstName = @FirstName, FamilyName = @FamilyName, PhoneNumber = @PhoneNumber
				Where Id = @Id

				Set @ResultNumber = 1 --Success.
			End
	End
End
Go

Create Procedure spAddAuthor_tblAuthor
(
@Publisher nvarchar(20)

,@ResultNumber int Output
)
As
Begin
IF Exists (Select Id From tblAuthor Where Lower(Replace(Publisher,' ','')) = Lower(Replace(@Publisher,' ','')))
	Begin
		Set @ResultNumber =  0 --Author already exists
	End
Else
	Begin
		Insert into tblAuthor
		Values (@Publisher)

		Set @ResultNumber = 1 --Success.
	End
End
Go

Create Procedure spUpdateAuthor_tblAuthor
(
@Id int
,@Publisher nvarchar(20)

,@ResultNumber int Output
)
As
Begin
If Exists (Select Id From tblAuthor Where Lower(Replace(Publisher,' ','')) = Lower(Replace(@Publisher,' ','')) And Id <> @Id)
	Begin
		Set @ResultNumber = 0 --Author already exists.
	End
Else 
	Begin
		Update tblAuthor
		Set Publisher = @Publisher
		Where Id = @Id

		Set @ResultNumber = 1 --Success.
	End
End
Go

Create Procedure spAddBook_tblBook
(
@Name nvarchar(20)
,@PublisherId int
,@Grade int
,@SubjectId int
,@PublishedYear int
,@Quantity int

,@ResultNumber int Output
)
As
Begin
If Exists (Select Id From tblBook Where Lower(Replace(Name,' ','')) = Lower(Replace(@Name,' ','')))
	Begin
		Set @ResultNumber = 0 --This book already exists
	End
Else
	Begin
		If Not Exists (Select Id From tblAuthor Where Id = @PublisherId)
			Begin
				Set @ResultNumber = -1 --This publisher does not exist.
			End
		Else
			Begin
				If Not Exists (Select Id From tblSubject Where Id = @SubjectId)
					Begin
						Set @ResultNumber = -2 --This subject does not exist.
					End
				Else
					Begin
						If (@Quantity < 0)
							Begin
								Set @ResultNumber = -3 --Quantity cannot be negative.
							End
						Else
							Begin
								Insert into tblBook
								Values (@Name,@PublisherId,@Grade,@SubjectId,@PublishedYear,@Quantity)

								Set @ResultNumber = 1 --Success.
							End
					End
			End
	End
End
Go

Create Procedure spUpdateBook_tblBook
(
@Id int
,@Name nvarchar(20)
,@PublisherId int
,@Grade int
,@SubjectId int
,@PublishedYear int
,@Quantity int

,@ResultNumber int Output
)
As
Begin
If Exists (Select Id From tblBook Where Lower(Replace(Name,' ','')) = Lower(Replace(@Name,' ','')) And Id <> @Id)
	Begin
		Set @ResultNumber = 0 --This book already exists
	End
Else
	Begin
		If Not Exists (Select Id From tblAuthor Where Id = @PublisherId)
			Begin
				Set @ResultNumber = -1 --This publisher does not exist.
			End
		Else
			Begin
				If Not Exists (Select Id From tblSubject Where Id = @SubjectId)
					Begin
						Set @ResultNumber = -2 --This subject does not exist.
					End
				Else
					Begin
						If (@Quantity < 0)
							Begin
								Set @ResultNumber = -3 --Quantity cannot be negative.
							End
						Else
							Begin
								Update tblBook
								Set Name = @Name, PublisherId=@PublisherId,Quantity = @Quantity,SubjectId = @SubjectId,Grade = @Grade,PublishedYear = @PublishedYear

								Set @ResultNumber = 1 --Success.
							End
					End
			End
	End
End
Go

Create Procedure spAddBudgetType_tblBudgetType
(
@Item nvarchar(50)
,@OperationTypeId int
,@OperationLengthId int

,@ResultNumber int Output
)
As
Begin
	If Exists (Select Id From tblBudgetType Where Lower(Replace(Item,' ','')) = Lower(Replace(@Item,' ','')))	
		Begin
			Set @ResultNumber = 0 -- This item already exists.
		End
	Else
		Begin
			If Not Exists (Select Id From tblOperationType Where Id = @OperationTypeId)
				Begin
					Set @ResultNumber = -1 -- this operation does NOT exist.
				End
			Else
				Begin
					If Not Exists (Select Id From tblOperationLength Where Id = @OperationLengthId)
						Begin
							Set @ResultNumber = -2 --This length does NOT exist.
						ENd
					Else
						Begin
							Insert into tblBudgetType
							Values (@Item,@OperationTypeId,@OperationLengthId)

							Set @ResultNumber = 1 --Success.
						End
				End
		End
End
Go

Create Procedure spUpdateBudgetType_tblBudgetType
(
@Id int
,@Item nvarchar(50)
,@OperationTypeId int
,@OperationLengthId int

,@ResultNumber int Output
)
As
Begin
	If Exists (Select Id From tblBudgetType Where Lower(Replace(Item,' ','')) = Lower(Replace(@Item,' ',''))And Id <> @Id)	
		Begin
			Set @ResultNumber = 0 -- This item already exists.
		End
	Else
		Begin
			If Not Exists (Select Id From tblOperationType Where Id = @OperationTypeId)
				Begin
					Set @ResultNumber = -1 -- this operation does NOT exist.
				End
			Else
				Begin
					If Not Exists (Select Id From tblOperationLength Where Id = @OperationLengthId)
						Begin
							Set @ResultNumber = -2 --This length does NOT exist.
						ENd
					Else
						Begin
							Update tblBudgetType
							Set Item=@Item,OperationTypeId = @OperationTypeId,OperationLengthId = @OperationLengthId
							Where Id = @Id
							
							Set @ResultNumber = 1 --Success.
						End
				End
		End
End
Go

Create Procedure spAddBudgetItem_tblBudget
(
@ItemId int
,@DescriptionForItem nvarchar(500)
,@Amount decimal(9,2)
,@OnDate smallDateTime

,@ResultNumber int Output
)
As
Begin
	If Not Exists (Select Id From tblBudgetType Where Id=@ItemId)	
		Begin
			Set @ResultNumber = 0 -- This item does NOT exist.
		End
	Else
		Begin
			Insert into tblBudget
			Values (@ItemId,@DescriptionForItem,@Amount,@OnDate)

			Set @ResultNumber = 1 --Success.
		End
End
Go

Create Procedure spUpdateBudgetItem_tblBudget
(
@Id int
,@ItemId int
,@DescriptionForItem nvarchar(500)
,@Amount decimal(9,2)
,@OnDate smallDateTime

,@ResultNumber int Output
)
As
Begin
	If Not Exists (Select Id From tblBudgetType Where Id=@ItemId)	
		Begin
			Set @ResultNumber = 0 -- This item does NOT exist.
		End
	Else
		Begin
			Update tblBudget
			Set BudgetTypeId=@ItemId,DescriptionForItem=@DescriptionForItem,Amount =@Amount,OnDate = @OnDate
			Where Id = @Id

			Set @ResultNumber = 1 --Success.
		End
End
Go