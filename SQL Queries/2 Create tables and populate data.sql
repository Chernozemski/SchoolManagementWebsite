﻿Use SchoolManagementDB
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
MiddleName nvarchar(20) Not null,
FamilyName nvarchar(20) Not null,

SubjectId int not null,
--Check EGN and PhoneNum if valid
EGN varchar(10) check (Len(EGN)=10 and IsNumeric(EGN) = 1),
PhoneNum varchar(10) check (Len(PhoneNum)=10 and IsNumeric(PhoneNum) = 1),
Adress nvarchar(50) Not null,

PositionId int not null,
Photo varbinary(max) null Default null,

--Connect teacherInfo to subject and position
Constraint FK_SubjectId Foreign Key (SubjectId)
References tblSubject(Id) On Delete Cascade,
Constraint FK_PositionId Foreign Key (PositionId)
References tblPosition(Id) On Delete Cascade

)

Create Table tblTeacherAccount
(
Id int primary key,

UserName nvarchar(20) not null,
PasswordKey nvarchar(max) not null,

Constraint FK_Id Foreign Key (Id)
References tblTeacherInfo(Id) On Delete Cascade
)

Create Table tblTeacherAbsence(
Id int primary key identity(1,1),

AbsentTeacherEGN varchar(10) check (Len(AbsentTeacherEGN) = 10),
LessonsAbsent varchar(50),
OnDate date,

SubstituteTeacherEGN varchar(10) check (Len(SubstituteTeacherEGN) = 10)
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

Constraint FK_SpecializationId Foreign Key (SpecializationId)
References tblSpecialization(Id) On Delete Cascade
)

Create Table tblDoctor(
Id int primary key identity(1,1),

FirstName nvarchar(20),
FamilyName nvarchar(20),
PhoneNum varchar(10) check (Len(PhoneNum)=10 and IsNumeric(PhoneNum) = 1)

)

Create Table tblStudentInfo
(
Id int identity(1,1) primary key,

FirstName nvarchar(20) Not null,
MiddleName nvarchar(20) Not null,
FamilyName nvarchar(20) Not null,

EGN varchar(10) check (Len(EGN)=10 and IsNumeric(EGN) = 1),
PhoneNum varchar(10) check (Len(PhoneNum)=10 and IsNumeric(PhoneNum) = 1),
Adress nvarchar(50) Not null,
Photo varbinary(max) null Default null,

ClassId int null,
DoctorId int null,

ParentFullName nvarchar(60) not null,
ParentPhoneNumber nvarchar(50) not null,
ParentAdress nvarchar(50) null

Constraint Fk_ClassId Foreign Key (ClassId)
References tblClass (Id) On Delete Set Null,
Constraint Fk_DoctorId Foreign Key (DoctorId)
References tblDoctor (Id) On Delete Set Null
)

Create Table tblTeacherLesson(
LessonId int primary key identity(1,1),
TeacherId int,

LessonName nvarchar(50),
LessonDate smalldatetime,

SubjectId int,
ClassId int,

MissingStudentId varchar(150),
LateStudentId varchar(150),

Constraint FK_TeacherId Foreign Key (TeacherId)
References tblTeacherInfo(Id) On Delete Cascade,
Constraint FK_CurrentClassId Foreign Key (ClassId)
References tblClass(Id) On Delete Cascade
)

Insert into tblDoctor
Values (N'Ивана',N'Дамянова','0494953955')
Insert into tblDoctor
Values (N'Александър',N'Въпчев','0594953955')
Insert into tblDoctor
Values (N'Кирил',N'Карагиозов','0394953955')

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
Values (N'Гергана',N'Гергана',N'Манова',1,'1234567890','0891234567',N'ул. Дунава №1',1,0xFFD8FFED006E50686F746F73686F7020332E30003842494D04040000000000511C02E6004568747470733A2F2F666C69636B722E636F6D2F652F2532424253507337574A454D65737764565537487747797668594D62347058456E3048564A49416E454558414D2533441C02000002000400FFDB0043000302020302020303030304030304050805050404050A070706080C0A0C0C0B0A0B0B0D0E12100D0E110E0B0B1016101113141515150C0F171816141812141514FFDB00430103040405040509050509140D0B0D1414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414FFC0001108012C01A403002200011101021101FFC4001D000100010403010000000000000000000000060105070802040903FFC4004C1000010303020305050408030506060300010002030405110621071231132241516108718191A11432B1C1091523425262D1F02472823392A2B3E116263643B2F11734637375C293A3D2FFC4001B01010002030101000000000000000000000004050203060107FFC400331100020201030204050302070100000000000102031104213112410513225132617181B11433F03491232442A1C1E1F1D1FFDA000C03000001110211003F00F54D111004444011110044440111101C5DD55155DD55100444401111004444011110044440111100442709D50044440111100444401111004444011110044440111101C87455541D155004444011110044440111100444401111004444011110044440111101C5DD55155DD55100444401111004444011110045C5F2362639EF70631A399CE71C0007895A37ED49FA476D3A22AEAB4A70E6686E97C03B396F2C689E1A724E3F64DFBAF70F371E5E9B3B2B5CEC8D6B2CCE30737846DAF11F8C3A378496D35BAB750D159A32D2E6452BF334B8FE08DB973BE016BE4BFA46387F72B99A5B43656D3038FB75D0BE061DF1DD6C71CAE3E7DE0D5E5AEB7D6772D6176A8BC6A1BCD55EEE750EE792AAB66393E38DC900796361D3650B9AF72B5E7ECD718E11E6394E3E8557CB5164FE1D89D1D3C23F1EE7B215BEDBF6386C15D3C0FA2ABB8331F678A17BBB3981032E0E236C649C380240F9625D19ED3EFD57C60A8ACD55A96E16CD362091B0C7492BD8CA7931DD258CFBD8C13820E49037C6FE6AD9752DE295E1CDAA152D07396E3C3D029CDA359CD1BC4D2B9D9230581B9C8FFDC28F3B6DCACB24429AB0FE67A2B3FE91FA3B5DA295ADD175774AF602DA99454B29E171071CCCC871DC6F820632BBDA67F499692AEAD6437FD2972B344F38EDE9AAA2AA0DF7B7B87FDD0579FD6ED5B6CBDD1892BA4144E73718E7E6763CCB3987D078AE8DC65A58DB9A3AA8A78DC3673E37C59F8EE161FAABD77FF633FD2D2D1ED2F0EF8CBA2B8AD4827D2DA8A8AEA40CBA9D8FE49D9FE689D878F7E30A68BC1FB4EA3ABB1D5C1554724D49344EE78E5A79799D19F3058799A7D4616DCF02FF004816A5D2EFA5A1D6321D4B66FB86A247B4D4C2338CF6A002EF1DA4049FE20A4D7AF5C58B1F42359A192DE0F27A4E8A2FC3CE2669DE295821BBE9DB8C55B4CF00B981C3B488F939BE1F81F05285691929ACC5E515AD38BC30888B23C0888802222008888022220390E8AAA83A2AA0088880222200888802222008888022220088880222200888802222038BBAAA2ABBAAA20088880222200888802F8D656416EA49EAAAA68E9A9608DD2CB34AE0D646C68CB9CE276000C924AFB2F3A3F483FB564B77ABA8E1868FAEC5244EE5BCD641DE6BDE08FD964756B4F503A9F40B45B6AAA39EE6DAEB764B0882FB6D7B735CB89B5351A2741D4CB6DD220B99575AD718E5B981804B9C378A0DFA6CE778E3EEAD22AAB9C31D30143DFAA89A1924C461A5BE1CA3A80338DFD3E1DAB9D5D1DB207C3544BD9310E6440FEDA570CE1EE3D31F4C74F35608A691F538A8D99E14F4DDD696FABBAF4F8AAECB9FAA458A8AAFD313A158E9EAA7CD43B99C7AF31273F92EEDB2C42ADDCAE839B3B8C641C7A7F7E0A416CBAC76C93B38696941F0ED61127BB67677575825B854835262829A2CE0BE3A78C027FAEDE0BC736B836282EE5AFF00ECABACD2455B0547674C5C398BB20C673E23D33EBB2914D6DACEC9BFB105A581E1EDD86E7CC786D957475A28EB2D81F50F7CED777BFC34808C8CE016781F41BEE7D55B2D94D594B2D57D92692B296188B8C473D00E847BDC01F2D96A72C9BA31C1DED175314351C8E8767BB02481A1AEF5C38EFB7983EF523BADE2E2637B61A8AC7C0EFB82A232F1EEEA4F5F4504315658EECE7B27861A6631AFFB4D47DC008CF71BB971C67C3E4BBD57A8A8EFD031D1D5B454025A5DC9CA1DEA406E0676FA6EB5B8E77466A58D99D1B8DD657D511235BDA78E19CA49E9D3FE8BB76FBEF633095E0D46FB86FF00B503D5BFBDEEC9F82B1DD6DD5EC6B5D2461D1BF60EC87023F9719FC02B747CF11706BC9702323EF01F1F13E99C2C1C13325368CFDC2CE325EB86D7C8F50697BD4B4B246417B62C989E3C5B3459E9E1D17A6BECE5ED67A7F8E34B15B6ACC566D5AD665F6F73FB9518EAF85C7EF0D8F77A8F5C15E2F515CDEF9D92B26753D7B080D9D98E63FE619DC786FF003014EB46EB39292E54D24323ADB778241240EA7796B5EF0767447AB5D91F77D074E8BCAECB34CF31DD7B1E594C350B7D9FB9EF0A2D65F64FF6AC838A9431E9CD4752C8F53C3910CE7BADAD60E9EE7FE3EF5B34BA0A6D8DD1EA81416552AA5D320888B71A82222008888022220390E8AAA83A2AA0088880222200888802222008888022220088880222200888802222038BBAAA2ABBAAA2008888022220088ADFA86F94DA6AC95973AB70653D34664767C7C87C4E07C578DA8ACB3D4B2F08C2DED5DC6897879A465B359A60CD41718CB5B20DCD3C676E6C0EA49C003D57931AEEAA974EC53365789AA25712E74CEE67CD2139739C46C4649DBF1C92B3FF00B5371A7ED978B9D7D54FCD3CBCCDE50EDF39DA36E3A01B8273EEF05A3FA86F935EAE134F50F2483C800E83D00F00B9E5296AAC763E3B17918C74F0515CB3E151542AA79666B0073CF7E778CB8FBBCBE0BE71D6071EC9B96C7D3981D81FCD749F23E7009EE443A0E995C0481BD721BE4760A7608F92F51483B4686B395CC3BE064AC89A6EAAA6A228E2313E6832399B2BBBBF1F0F3F9AC5D413192468039874D86C1648D174B3472768DA612363FBDCF296823CBBA72A3599244305FEEF6AB4C713646B9944EFBBC90B9AF00F88EEE00F89254C3839A58DD6AAADF1015866A792166F979716F2E1DE9D064F400FBC412F3778AE3700D89CF87A6229FF006ECD87EEBDCDCB7CB00AD86F666D31352D7475F18848635CEE66E395CD00ECE03DC0FAE144B24C9B5AEE6BEF152CB3DBEE8FED65786F839A30D6B4743F77DDF0C63C95834BD6C75550D8314B5D839113C48C7FCDAE23E61655E3D402AB51CEDA5736A243212E10309E6F71E9EE03A67D54274CE98736AE3FD636612B01EE891A3AFA9CE41F76EB28CD2861984E0DCF289AD255DB28687ECF33DF48F972C7525CE001AEF3E5763BC3DFBFA1EAB16EB6B5D032BCB68A9DD6C9B396303F0C764F56BB240F0F11F0592F538B6D25A8D2F67590465B9EC5F23A5807F94B8F30E9D4803DF95852BAE4EA496481EDED289D92D04FDCF569FEC2CA1BEE8D72CAE4B799E46CFD9D482F734F2EEDE57B4FC15F6D75F0CD1B63AD73E5A7D836A59DE7C7F3EB8F23E03AAB25498E50D6CB2F3E47ECE6C631E87FBDBAEE3217C296B0D3D496CBFB378EEB9E7C7FCC3D7CFC7E2B64A39479196199D387BADEE3A76F56F7B2B036BA2773D257D3BB69C0F0FF0030F2233E041E8BD6EF66CE3AD3F1AB46B64A80CA7BF5086C75B4ED3B3BF8646EE7BAEC1F8E7AEC4F8A563AA6CD1F62FF00F645CD796E4031BBF89AE3B03D37E9E7B656CD7B3371AEE5C2BD6F6FAA9C49334F725E5D9B55038E091EF3BE3F75E07812A3556BD359D4B87C99DD4AD4578FF52E0F5C9174ACB77A5BFDA692E545289A96AA26CB14801196B8641DFDEBBABA84D3594736D636611117A7811110044440721D1555074554011110044440111100444401111004444011110044440111100444407177554557755440111100444400AD6BF6C7E24B6C1A723B343388DCE22698038F3E5CFA34E1C7DC16C75655C54149354CEE0C86163A47B8F4000C95E42FB5B71AA5D6B7CBBD4453387DAE47B232D76CD89B2398081E1DDCEFE3B2ACD74DF4AAA3CCBF04FD2413939BE11AD3C4ED6326ADD4F24A24C5253F318CE300E3279BE2EE9EF0A0186C403DE0FF002B3A6CBBF513026A6439118018079B89C81F00D2AC95333724B9EE73CF5247E0BC841462A28DD3965E59CA69E494820179FA2F947097BB0FE679FE11D176286DF3DC8811C6EE5F0E6DB2B26690E0E5F2FC237434E4B4F5EE6703CF2B1B2E854BD4CD95D33B5FA5108B553CEE91AC646E03C39401F5595345DB271330493C3BF42E7358E1B74EFE01F867A7A05943487B31574AC05EE979F39230D73738F22B24C5ECC91D652B62AA8617860C8C603B3EFC2A2B7C469CE11735E82696598469B4C8A9BB31B34CFAF7B9C39651206E0F877B18F8ACF126A6A3E0C70E9F2C147154DEEE0C31C3009399B8F17BB1D70718233924E4E371CACBECFCFD3758C9691B92D77318DEE25A46DD318DF6F1CFF495EA4E183355DC2DF2160305380D3038EE0677E83A7F450BF57193C937F4F84A393497525E3505CEE9354D4D43E49E4717B98CC81EE711D7E8BE76AD4F57452F2BA8892362406B07D43B3F15E8152FB3C69EAA8626CB46080D191D3240F1F77F45D6ABF673D3CE0DC50E06772D38DB2B196B30B1D2671D3C1BF88D298678AEDDE64FF6297F75BD932539FF0075AA35A8F45DEFB37BB9DCE8B1925AC3067E803BE056E5EACF65EB04CD7BA3A38B3E0E70CFE0B076AFF67DAED3EF91F6E923311FBAD79200F901F4FAACA9D6C1CB0F66797691B8E63B9ACF5325CAC7339B33AAE384ECE064763E1E45564BE55CD1379E7350437F66E98F68256FF0BB3FDE7DEA6D7EA3BBD8A5315639EC6679313864ACF50D7F51EEC12A3B574D04ADCC90B1D16798BE9798F67EBCA0E5BE1E055F42D52E4A3B29E9E0E5A6F53C8DEE3E3A78E3D9B91047961F882705648B2DE4810C556E89D031D88661188CD3C8721A5DCB8EEB80E577BB3BE02C472D145473F6E0930FDC7B87787C70072EDE614F74848EACA592925699888DCD1CA41E766075C788D8FC8F82C2F8AF89707B4C9F0CF54FD8578D035469BA9D1B739032E96D264A76B9C497C6492E6EFBE5AE0EFF00887EEADAE5E387B3DF10AAF465EED9A92095EFA9B0CED6D48CFF00B5A7240E63E858034FAB07F115EC2DA6E94B7CB652DC28A66D4525544D9A291BD1CD2320AB0D05BD51753E63F82AF5B5744D58B897E4ED2222B52B422220088880E43A2AAA0E8AA802222008888022220088880222200888802222008888022220088880E2EEAA8AAEEAA88022220088880D76F6E4E2E3F863C1BA8A5A2944774BDB9D491F9B620D2643F1D9BFEA5E376A4BD1A9865AB99EF792D6C51349C979EA4FC5D93F15B73FA44F8B4ED59C4CAFA4A69FB4A0B3C7FABE9B95D96193EF4AE03CF21A3E0B482EF23EA1D0C2D3CC18CE627C89FF00A78FAAA7CF9B639F6E0B78C7CAAD47BF25AA7A873E9A579C60BDA1A078EC73F885F6B5D9BB6707BC73C84E771B37DEB9D3D236A258226372D648474EAE3CB8FAFE014EF48E9C76A5BF0A48462921772BDE4E013E27E6BCBEE5541B36E9E976CD22FBC3BD16CABAA63B0E99DB64B761F9656DCF0DF4E0A2A688387660B401CEDDD58F40F0FEDF6AA1883223CFB65C7AACBD65A5FB216C6D0E2DF51D17CFF55AD95D3E4EDEAD3429861724A2C9451C51B7919D3C7AE7DEA5D494B1168CB327C7651EB51E48B1827DEA536C782D191BA8D5CB731B1611F47D8E09BBDC8DCF88E8BE51D8626BFF00D9827D42BC420861C0C0F42BEEC1DD07CD58C70F720B9347463A3642CC01CBB742B83E99A58E2361EA17DCC6EED8BB9B20EC0617290EFD365EB67A9E08DDD2931139BCB969F058FB515862963930C0F246395CDCB7FE8B26DC5D80E006FEF513B8B3B46B810078AAABDE1EC5854CD5EE2668486A219BFC30E473719E50E6FF00A9A73919F8FAAD56D53A61FA7EB4C91B3B3843883C8701B9FC01F8FC57A1B7CB7432C6F120073900AC1FC45E1B52DC69E47460365C120819CFA11E2A5E8FC42553E99F0657E9217C72B666A68648C8FB7A7FDA4380D7B23D9EC1D323D013D060FCF6EEE97AE6BEB1AC696992377303133BC1A7F936C8DFF773B1779E53505AE7D27777E623D98272D1D08E871E5E3E9E985C25B6C5591C370A32C748C3BB724891BE38F169EA0B4EE3071B00BB4AE71B219CECCE4ACAE55CF1DD196B49D54DA7356534EE77696EB831D1F3E799BCC5A72C24F91DF7C6775EA17B18EB48EF5C351603373C9682040D7BB99C699DBB0E7C70799B9F369F79F28B4EDDEA5B662EE6ED25A622A22320E7CB5A7BEC2739FBA0EC0E362B70FD8A78A11DBB58DADCEE6A7A69E16D3CEC69FD986BDFC9CDBF9481A7D03BC96BA66E8BA327C70CC3510F3A9697D4F471133945D51CC844440111101C87455541D155004444011110044440111100444401111004444011110044440111101C5DD55155DD55100444401477889AA20D19A1EF77AA89444CA3A57BC39DD39B186FD485225ADBEDDFAAC59384515AC4DD9BAE954D8DED0777463EF7D093FE951B53679754A46FA21E659189E4DF1B2FB35DEF4E74AE26A66CCF3F31C90F79E6393E83947C1628ACAC6B185AD3D7197789C2956B8B9BAB6B2B6A9EEE696A1E5C4FA1DD402790BBC72A1D10E982458DB3CCD928D2D0E603578CF61DA4B9FE6E501BF539F82CD7C0BB27611B2570DCE3C3C4F8AC4DA2689D5D4B53491B798BE31DD3E8E016CCF0DAC0DB5D345172069006F8E8A87C4EDC45C3DCBEF0CA9E54FD8CD7A721ECE9D80641F929D5BC6391C06FF450AB1BC3CB3007E0A7B6AA6739B1939F35C24936F63A793F72454841E53BE718380A4D6E8BB99EBE4A3D6F88B9E5A461A06CA5140031A3A6029B4C1CB9215AF0B62E74EC3C801D9770531E4C0E8B8D31E60371B7A2EDF3E1C41C63C15B420B0554A4F275451F31249C7A2EBD4D3F26E3A7AAB889C1C9C01E8BAB709DA1A37C93B80B6382E9C9E45CB3823B7581A075E9E2144EE31FDFDB214AEBE46B9BCB82EDBAA8FD744E9338186E3A0F254DA88753D8B6A9E3920F7680766FDBAA805FE30F8DE320ED8C2C9B78A4FD99037CEE163DBED290C7103233855EA124CB384960D70E2C68A17885E636384ACC90F6F8792C0F67AC974F5F1F4B5030C76799AE1DD3F01E1EE5BAD71B3B6A98E0E664F4D96B771DF43BED0C8AEB0465862930E2D18383D7F15D6F865ED7F833E1945E234A92F3A3CA2F5A42DD19AAEDA1CB63964697E705843BC7DE76DFA74E99C99B7B346A782C7AFA1B7D6663A6A7AE750D5C65C5B9A6A86963882770472E73E19CED858DF875AA29AC74F514B5FBC7574DCD4D2E3BA09EF023D011B8F0DCA89685D5F5573D55592077EDE58E5919293B86B1C26C67CC72380F7E15E4A9728B7EC502B126A3EE7BE7A46E525CACB1F6E41ABA67BE92A0B7A3A48C96970F4763987A382BCAC43ECCDAC86B4E1F5156E72F7D2D33A571392E9447D9C84FBCC59F8ACBCAFF004F679B546473D741D7638B0888A41A422220390E8AAA83A2AA0088880222200888802222008888022220088880222200888802222038BBAAA2ABBAAA200888802D08FD241AA65ED696DCEC320A685E6325A37796B0139EBB09CEDE8B7DD7979FA442F725C75E5452F387361CC180D031DE79F0F4733E41576B5E6318FBB27E897F88DFB2344350C666682327231BFBBFA2883A3224E523607E8B205D29F3827A0071EFC2AEA4E1D4B63D2B4378964ED1F51176879477403D07BD695746188C9F24D744E7D528AE392F9C11A6135C8970C97B704F96495B4965A07539665BB16E3A2D76F678B63EB2E12E00EEC6D763C7AE3FAADAC96CD33ADAD6B0963CB000F1B105729E23BEA1A3A8D03C69D1C06B7B3E963CB3CEC9AA9BB982320B86E363E477E87F22A456EE3D69EA72C33CF0B09DFF0065276B818DB21A091D3A632A3965B659AD7487F58D3327C1CB9D2EE32BE777E29E8EB5DA9D336CF42FA26827B699B1431BF1FC2F711CC7CB1927C157C698396145B64B9CDA596F633259B8BBA56B1A258AED4B8DBEF3F1D7D0E0FCD4B6835650D601252D5C52B1DE2C7020FC96846A9D6DA0EF52B8C11D241335E00A68EAE58C349230477397A1CFDEDB055C686DF71A5A78AE366756D0D21E92C33F6B0BBDEF6920796EA54E8752DD3468AE51B9E2324CF40E1D42D0773DD3B672BBCCBB0791970C2D4AE1BF13AE74CD650DD6A2492407674C4B891E59F13EAB60B4ED69B844D7B1E0823C4A89E63EAC1B254A8F24C65BB860CB4F4F2564BB6A88E0648F7CAD6343492E71C018EB95D7BC87C30F4DCFD16BD713F55D6C2F9ADEC7BDDDABBEE0EB8F2FEFCD78EC9670CF6BA537B13EBFF1F6C3A763CD63A5DFEEB9AC24387985069BDA7E3BDC869F4FDA6AEE13838E6EC9DC9EE271FF00B78AC4A743DDF5354CB55306C54AD18926AA79E46803A01E27AFA7AA8FEB1D6D55C2CAC65B994577A9A8742668C45CB463940CF39616BDE1BB12399AD246FD3ACCA68772C4164F2F95747AA72C19B1F5FC4AD4CE74869A8AD110D9AD9F777BF1B9F91F9E1592E3A5B5DDB992D447A9A92A2A33FF00CB184F2B87912723E2003EAB1459B8C5AAABF4D4B7BA7B6DCA7B640FE4A8AAA79DB3B6989191CECE40E031FBD939DFDCA5FA238AD36A8A70F926867839C31B3C7272B493D32D76083E9BAC2DD2DF4FA9C563FB8AB534DCF1196FFD8C816235B3D3305C608E1ACC1E70DC86939C6467C146B8C5A622BAE84B8F3441C58DE7D86FD54FA06BAB628496E4B48C12BB5A82C8CB9E90BA43CB9269DF81EB85AA125E62713C9A7D2F268C505A2E17CBE51D828E9239E38E218924693C80F500B483F0CED8F9F76E1C399B869AEED93095B53493CC46318E4246EC70C9F0247CD4AB46D75669FB9DE66A28735D571358C7F5303B043DD8F03803E6A9ABAD3259749D961AB9249EB25AD74B1F3B89E560041DCFF33BEAAF5EA2CF39569ECF6C7BE51023A4A9E95D925EA5BE7EFC1E8CFE8FBAE2ED1775A1924E792965742739C82C91C0FA742C3B7F12DB45A83FA3F6685F67D571B0734B1D64131901E6CB258797AF917401DF15B7CBA2D07F4EBEFF009391D6FEFCBF9D82222B120844440721D15550745540111100444401111004444011110044440111100444401111004444071775545577554401111005E4A7B6DCEEAEE2DDE5A5A47F887BB046366E19D3DC015EB5AF24BDB24638BF7F7340C36A26E5681805BCF8FC8FCD556B9EF0FB969A1E65F4354F53B0C7153B760E79E6F5008007E655FAEDA3EBDBC38A0BAD3553E7A0AB639B2C0E712D648C383B781C069566D5117F8885CDC9696F3373D40CACA5C197BB53E83D45A724EFC94D5114F0B0EE79643CAEF867F155B7CA50829C7B32EF4B18CEC9425DD1F1F65887B6BA54823BFD9347FC4E5B9D6FB3B6AE16343402E18F31FDEEB54B81769FFB33AC6E145230B1E1C36775C797D56E36977B4C4C2EEA4F975541AC92B2D725DCB5AA0EAA945F6314F12B42DC9F45522967790E69C42230EC9F00720E47A6DEF236509E02F01A8B5752D75F6FB3457EBBB61962A186A9FCD1524CC2791A59D1B8201C74DD6D9D551B2A29240180B9C31EAB045670B6BB4B6A89EE964AA9A88CBCCE73622794B8F891D0FB885B749A95A77966ABA8FD543CB6F0CD3BADD2F78B65F6B2C551A7A07574F550B9F515024FB6D33DA5E1F13581DCA7B4241396B8F75B823273E81DB783D35A34569EAB8BB1A4D412D044CBAD1CB81154BC372E73FCA4C1C39D8DF1BE7A8B5D960D4B04B15449757CD521BCA66740C2F23231B96F4DBA7A9538D3D6FAC96A239EBE41390DC132B038BB7CEEA5CF550BA3D0B7CFF3FB9AABD1CA99AB3AB18FF7FF00A20F70E1636E9452D4D046C1352B883C84131B86FCA48D9C08E846CA5DC3C0EFB3C0D9367336C1532A8A92E2E644E11870C3B94636C1DBEAA3FA7E38E9AE53B5B80D6EF90A9E75F41631B25665324FA9A0E5A32E00805B9F7AC216AE1FCFADB575548DC47146EE474AFDC3078BBDEB35DF2ABB6A42D24E03481950ED2CE928A5A8969C96BCB8B8807195ADC13999294ABAF2B92C70E89B6C171A0757CB232D94B3E1B4CE8CB5B316B861EE71D9CD241C01E5BE73858A7DAB7825AB354EBD9B5B682B9D4BE4AD88B2A0DBEA8453C2D30F61233720BA37C79071E6E0460AD8FBA446EF46D6BE473078007EEA845CB424B51213CCE745D0B5AE21A479103A8F456F45D2D347A56FDF621DD44354D4A6F0D2C7BAC1857831A1A97817A0AF2ED4D5B0D3D55D238E0FD58D7B65939630EC0700482E7179D86C36DD58784FC30756EA4BB5EED503ED54151527B2A40F70EE79E738CE3A9F53EE59A6AB84F1D648E6CF10E573C3F27776D8F153AD3BA661B1D1C70C1006319B0D946BB572B17425846CAB4F5D19945E5B2C1FA8194342DE5672B80EF64A51510A9A3AA89C0E5D19181D0ABCDF2A3B36BDAF1819C792A699A513F6EFFDCECC9FA15034E94ECD8CEE6E35E59A7D6EB0FEACD65A800DDA1A5A0F8021DF8A83F13752417CD7269691DCD476B6FD91A7C0BC6EF77CC63E0B2AEA60EB6B75D5E4B834530925667C5C3EE8F9E16BBDBA07325924738973B2E2E76724F2BB24FBF19577A4875C9DAFB6C46D5CDD55C695DF767A6BEC214B359EF6F8F634B77D31415A0B4E473B1DCC33EB89F1F05BA2B50FD881D14BA7741D435EC3249A66A69DED6801C1D15739BBE3F90C7F2F72DBC5D36836A9AF99C7EB5E6DCFF3D82222B220044440721D15550745540111100444401111004444011110044440111100444401111004444071775545577554401111005E5AFB70D9450714EBA76E036695E0E3C09273FF00A97A94BCD8FD207406935A54BB621CFED86074E60DFCDA5556BD7C0FE659E85FAE4BE468D6A46FF89048EEF66D23D0F5FCD49BD9F75545A4F8C96692B642CB75C5DF6398E70D05FB309CF93C3558751C39192305AD681F82B04F4C5F0538DC64E0380F5CA88E2A70717DD60B3EA75C949767936D35359CE91E28C5348DE5FB43B909E99DC907EAB3CE8EAFED1AD6F5DBAE56B3DB6F915F742D0CF573D4D4D7471B6586A657191CD92338922738FBB6CF8159DB41DCDAFA48E463B98387DECF55CA5B071D9F6D8EA65356E27EE669A17B256B5AEC0F1D976A6B532A4801A390F53EAAC567AA0FC0FBC481E2A514738008F06F89F151E394612583A2DB0C701CB400DCF5C2FB0A20C1DDDC0F1255D18D0F1DEC35BE4AAF89A2376460ADEB3D8D59F72337197ECD1B9BE63AAB059AA796BE423BBCC724E32BEDABEECCA091D197B5B33DAE735B9DC81D48F7642B66978DF565AF39CBB751E527925D71448EEB51FE1CE64CF861476C9564CCF7B4F7F2738EAA417BA07B69F1D362B1AD35F3F555F8C0E380EFEAB5B9352DCDFD0A50D8CB5460D441CC1A067C176D94714981DEC2E8E9EA864D4E5C087642BBB1BCACCEC0A9519BC6510251DF053F56C2D0D70193EABAB52E653B4EE005F496A4B19B9C80AC17AAF3D9673D46F958593CA33857B91ED4954D9250D23AF427C55CED534568D1B77AF908636181C493E1B63F3510ADAAFB456B230720BB03CB7F15F2E3BDEA4B070863B6C4E31D5DDAA84008D88634733FE1818F8ADBA458EAB3D91AF551EA71A977669EF19F56D6DD191D9E98B29E8AB2A4D4CEC67DF94348C071F2CF87A289D742594F49286F28A981AD0DEB8E53C87FF4ABA56D01B86ABB867BF1D1C6D6373BE7BB9FC5C575A4E6AAA464400ECE95E5AC38E9CC01EBEF057414C542B8C57F3253DF273B64FEDFD8F4D7D852C72BB475A2E4E88470535B7B189C5B82FED3B37923C31969F5D8E4F4C6D82C1DEC6504527B3CE8BAB11064BF617533881F78473C8CC9F7F2ACE2AFB470E8A57CF7399D54FAED7F20888A711022220390E8AAA83A2AA0088880222200888802222008888022220088880222200888802222038BBAAA2ABBAAA200888802F3C7F486074FAA439EC0C0D862630B47520BC9FC97A1CB4A7F48469932DBED35EC6827243B1E5CC7F2C2ABD7E7A22FE658E85AF371F23CE7D4B4C64A17CBCA31CB8F8823FAAB052C6DA9A1898D6664649CDEF04E3FFF003F553FAFB59AB82A69C1DFB32EE9D08F3F8050DD3D42EA8AFEC4025AE69EA37E9E1EAA0296C5BF4EF8339709A3A778BED81E23E4ED5B551093C9D18071F16FD54E786F747D351BE91E49969A474473E871F92D7BD5925CED775A1ABB34AFA6AB0C0D123307208CE083B11D1643E0D5EEBEAA195F5E7FC776CF138030339EB854DA8A9B4E79D9971A7B534ABC6E8DA4B05F791A391FBF913D14E6D77526305CEEBE0B0ADA2E0607B5E723D02C8563BB76D0340F0DFDCA8E4DC5967B3464AA6AEE6690372576277B8C5B1DFCB0A336EB8C61C017632A510C8C7401CE767232A4D73EA4459AC3311F11E088DD609A7677E9D8F7B5E7AEE3042B8686BBD09A76B9B2B1CE68EF03D57CF8C7A3AEDA8E08EA6C6F805544D2D314D90D7B4FA8F1047D56B9D96F3ABF8637A79D574EE14AF2432AA38B9790FF0036362DF5C6DE3E8C6F926C23D505B9B73AAAF948CA591CE7373CBD1609B94F15D2F44C4ECF75C799A7A7F780A1FAC38E105CA91F1D1E6BAADEDE5869E139323BC06DD0799569D0DA5B8A37C98BA7A1A5A7A693A38B0C4D8F3F124E16B9E66FA893541571C3365B8712D44B6486570E6C12DCF9E0E3214D5D2931E474F5565D156B1A734E515BA57896589803E4C639DDD49F99573B94ED8E16F2F29076CF922C46257CDE66CB5D6D538F334023F9B3D5452F75FD9C45AE7E7C3AABA5E2E0C8817038CED8CF558EAF974334A7948C81D14572EA64983DB25C6C79ABBBC7B1760F300B1CFB61713A8B49DDF4C5B6463AA6AE2A49678E168D8B9E5A0127C0777F159374602DA8ED1D80490307FBF72D3FF6B2BA3F51F1BAE4C68C8B7D3C34310CF577DE3F57FD15F692A8CA3D12E1949A9BA71B7CC8F28E9695A67D5E9FADB954973A7AC95A4969FBCE73F071F3D9766D566FB7CF70858301F238C63CC308FC07E2AF769B77EADB158E95C08FDB31DFEEF5FC8A9470C6C2DAAD4B6C8A42238DCE8FB57119C769206FE0429EE7CE086A0D6327A4DECA36E7DAB809A4E99EDE52DA6E6C79731E6FFF0062B2DA87F07ED8FB3F0C34CD24830F8E862C8F2EE8D94C174FA65D34C17C91CA5EF36C9FCD8444524D2111101C87455541D155004444011110044440111100444401111004444011110044440111101C5DD55155DD5510044440160EF6ADD2F15FF4644F78E6747CD81EEDFA2CE2B1DF1CE1CE8B9A63176DC8C95BCBE20BA2761DF020155FAF59D34BF9DC99A478BE2796B2E95FB1DDAAD8EC82DED22C79ECE23FA7C1627651496CBFD31C7235E0C8DC7A1DC7C96C85FE38E3BF995AD739CF3D93C92367349DFE3F9AC2DAB28A4A6A88E40CCC90D4388DBAB5DB63FE0FAAE6EAB1CA3867516430D34768D2B67B9770024401C32DC8079C6C3E015DF404C68F5856D33DD813E241EF3E2ADF61781718E6C9C470B9C3233E58FC95B9F73167D6147584F2B7BAD7EFE6B5CD75C5C7E46DADF44D3363696273583F781DD496C358E88F2736D851ED3B38AEA68CFDE0E031EAAF8C89B4D2B39863CF3D1504F72EF644CE0BA8A50D2E237529A3BC87336767206D950D6402BE8B318EF37A82BA12EA18AC2E719E1A9A92D3811D3C4E91DF200951E2DC5EC61CEDDCCA22B58F6E00DC752AD579D3D45A89A20AD8239E13D5AF6E410B11CFED0967A1AD929C415B2C807761FB3BDAF69F50467E8ADF71F684B935AD9286DD51001FBCEA679E6F7E429C9BC7A8DB1D1DB3798A32A58B84FA7AC77133D35AA9A371DC1118CB77F052788C34F0901818D6EC080B5CE5F69FBB5440C823ECA19CF75CE8E2FDA7CBC3E4BED4DED07571405B576EA9A98DDBF68CA77F33BE43D165DBD26D9682F5BCB7FB99D67B9B1BCCDC8F419563BEDF9B044DEF1C1DBAAC716DE3A50DF1DD9D1D96E53CACFBCD652BF0DF3E676303E242EFB1F53AA1E247C325247B131BC8CFC541B3A96CCD3E5B83F5AC1DABB5C5CE88BC127638C28B17F3CFCCEDDAA41798D94B14718DDC0615923804C4EC72B0AF6DCCDEEB08BF69CA9FB1F6B5921FD9C113A539F4DFF25A542A67D59C41B85C6A099E69AB1E4387438761A47A0032B6738CBAA23D1BC2CAF631FC959746FD8E268EBDE1DE3F019DD6BAF0BED7D9896BE5382C27949F3E99F5EA7E6BA1A1F97539328EE5D76E113F9695AF9E2710E73616F671C606FCC7FE81656E01591971D7942C9DA7B2988DDBFCB9E5C6DEE2B1BC70472D353B5AE3DAC9503903772EEE9C9F865AB65BD9C2C4D66B1D0D3F66DE5AA63A7EE6FCC0BA5073EE118DBD42D95B72C457735DDE88B7EC6F1DA68FF57DAA8A97AF610322FF0075A07E4BB488BBA4BA5248E21BCBC84445E9E044440721D155507455401111004444011110044440111100444401111004444011110044440717755455775544011110051AD7F6692FD66829236B5CE755464F338B463707247BD49575EBF029247B864463B423CF1BAD17C15954A2CD95C9C26A48F387897A40582F25B13811251D1D6C79046D24239BAFF334FCD609D4F4BCE1D3123BB51CAE38EB97642DD3F6A4B2B682FF00616B581C1F648A3040C026371DBE595A7B7BA3E53718FEF7248D78F90CFE0B8A6BCAB5C3D8ECEB979B5291F01669294C94B4D187CD253BA46803F71ADE639F760A80DE6DD25DABF960FBFC81CDE519E8DCFE4A732DD032ED4D2480BA38E9E76B806F3177EC5DE1FDF9F82FAF05ADD4F78E2DE96A5AE90B286AEE10D24CE0EC62391C233BF86CEC67C16D8F084B6C93AE1D5E5F153D3453BC626ED2481E4ECF63667C791B9F161EAB264F2769035CDFA2D67D5F25CB41F10A3B539EF6FEAB9AAA8DB4E64CF2304CE90B7FDE7BCFC7AACD5A4755C17CB5370F1DA72E48CEEA9F550E89E5169449D95A6CC89A76EA1A4C7E07CD76EE51C6DAA64ED1D7A80A256AAD8E39C37382E3E78536860FB6C6D391EE500DAF6792397A9E198F33DA39B6FDA81DE6ECA3F1DE62B7C863AA8E1A9603DD7483BDBE3AF9FF00D4A9FCBA51D5639B94FF00556CADE0E7EBBE5654BDEE8CFEE8001F9ADF0B6C5B1614EA635ED2E08D1BCD9983B5FB1D3073C7EEBF27AEFF004CFD15AE6BB45553073C88A28C63B181BB9C8C7C075DBD4F9A94CFECDB6A88931D3CD139BB8E59DC40F865561E14C96E0C8C3C9898338F359CAE9A5C129EB2A6BD3C967A3AE92A2898D633ECF011B478C103D4ABD504A6968E4734F2B9DE1E6176CD88D3491C40607882AD77BFF0A1CD0FCEF8C78150DC9CB76574E5D6CB1DC2B5F2CCE2E3924E02FA51481B82486E3724F40AD95D50D1DE7B807673B2C0FED0DC66759EDC34C59A62DB9560C55544670618BF847F33BE83DEA4E9A995F62844D37D8A9ADCE459F8A7C447F1335ECD1D14864B2DADBF66A703EEBDD9EFC9F1236F40B2D45C1DB9D87821FAFEA5ADA4E4AB86174520E59395ED6C81E47F0919C1F307D1604E10587ED5053923026AC861231D413D17A67ED4D6E82BF83CCBBD2C4DFB356DB20A670E821961735EC3F16F337E4BA0B211C4A29FC3FCFC940AC929433FEA34C34F47DB47F6B20B430F2479F003ABBE27F05BA9C06D22EB56ABD00FE6738BAD02A5C08EE80E64AE007FBFF35AB3596A8A8A928DB08DBB08CB8631B9C972DFEE1C69D8FF0058E8EB840D6363A7D3F1C6F0C24E1DC91B40DFC87E7EAB1D1C7CC9C71D9AFC8D74FA2B6BDD3FC196D11177271611110044440721D1555074554011110044440111100444401111004444011110044440111100444407177554557755440111100547B79D8E6F98C2AA235906AE7B623C53DC34DE08022A790EFE59C616956AD7B639EADEC1BB498F94789E6207E4B71FDB1A4754DD238DA7261A3000F525CEFE9F25AABAC34F3A974E5A2BBB37865C259082E6EC4B5C7C7DC5A71EA3CD70DAB69EA26D7B9D968B6A22998D98C99957486171E625D161A464F3000824F40412A79ECEDA4E5D4FA8EE6CA58B35141432DC6279CE58E80B640720ED9E5E5FF528AC90445C41E6698DD29E66E0F33B00007D3BAB36FB1ED7D358DFC40B9D53A26C7159668C35FDD2E7B81C007D48231EABCADA94945F06EBB3184A4B931AFB5A434B271EAE75543CAEA675C9E01600010F61713B7A9C287C7535BA6E51534C5C187EF342ECF12EE72D7EB48F9DE6490CF1B9C5C7C41C63E414D0E9715F6C8DED6870919D30AB7556E65D4FB967A487443A7DB1F83E165E20C570898FE60256639878ACC1A435632E149106BDB9C79AD59D47A66AECF54E9A98BA27B4F56F5F8AEDE91E2654596A8475A4C3DEFF00683769F78F0F87D142714D6624E94148DE1B5DE5A206B718767C949692BE1C073CE31B755AEDA5389B4F511C4E74AD7070C87076C7DDE0A734FABD8F6070A86B811E794858E06974FB99564BC52B8606C7CC151FBADCE3323F95DCCDCE72A1B1EA0681CEE94381F5C28F5F35CD3425C3B500E37DFAAF2774A6B73D852BB179D417A646E2FDBBBE5E6B196A5D501923C993BDE0AC3ACF89B4D6EA674B35408C3B3CB8EAEFF28F15837506B9B86A791D1C21D4D4A7C39BBEEF79FC87D56B841CB7242828F24AF5C7145D1B64A5B73C4B50416BA6EAD8FDDE67F05AD17F7CB59AA6592573A5939799CE71C9249597296C4F74592DE832B1B5DA81D1EA3B912DC7246D215FF86F4C652C7B153E249CA115F3334F03A073E8ED5860C7EB285E49F0193BFE0BD35D1D6F875670DB5368DBECA69E36C7352CAF91BB40F638F2BCF974CFC9797BA02B9F6BD2F04D4CF2268E58E418F20F25DF40BD72B953D3C3474DABA869DBF66D47491BABA11DE6FED63677C7C31F2F552209F54EDECB9FA32A350F0A10F7E3EAB06984963157A40D7B08FF000EE869E46BBA9CB5E79BDD9611F2F30B7BB8650496EB4DA448E2EA7AAB6C124047404B1A5C33F1FEF2B056A8E1A4762D2D7D9E8646565AEA1F3B0B5EE0D7C18944D19C6773D9E7E6ED9677E0C5536EDC2ED3AF7F7CC54FD8648C639096FE002D9E1B54A376389259F93FE223F885AA7565719C13A441D1176673011110044440721D1555074554011110044440111100444401111004444011110044440111100444407177554557755440111100444406A5FB4B53CD5D789A5ECDE04AD3C808EA00007D799618E25D866B55874BD35431CE7C14C672C76C1AD036F2F088FC82DBFD5FA41DAD7889430B9B8A4A401D2640C6065D9F5C93F55AFF00ED67574F3DFE4A2A2887630C6DA16BDA799AD7C980067A7DD639D8FE62B83BEB96676B7B671F57DCEBF4D6A7D15A5BE33F435A2CFA7CD451D4D54839638A17CA5EEF3DC8FC549B46E9FABB4DB6ED411CCD65555CB0C2C8F9B67B9C30093D300BC0CFAFA29B681D2B1DECDBED4F1CB0D454F3D4BFF829A16F6921F88047AAE86ADD5B436CB96A2BE53B9ECA6A0FD85BE101A0099EC21C7D1AD90B9C303E4545845C9753E0B09CF7E946BF6A573A7D76F85FBC825C388F31CDBFCD67FD094CCADB54513C02E6FE1D7F35AEBA7E192EFA95D564E5AC6B5993B92E2E39FC16C870E87613CF0B8E795C307D157EADEE92EC5854B10C95D4DC3D86BA27BC3373E202C1DAC3878FA295F88F607A81D56DF474ED9598036F5517D4DA522AF85C4C632E073B280A6E2C930B3B334CE3170B0C84D34D244339C03B1F81D95E29F89377A6686B835DEA320FE2B26EAAE1C16B9C638F0B1ED7E89A8A72E3D99F92DFD4A5C9313CF075A4E2DDDFEEF6648F579567B97106F3580F23E3833FBCD6F31FF8895D8974CCE1C7F66EF92AD2E90A9A9781D911F044E2BB192CE08A7D8EAAEF54649E492795DD5D212E2A75A6B40CB5058E730E0FA297E90E1C492CAC26324F990B30DB74847414E0166303AE1793B7B234B6A2620A9D211D05110E66F8F2588354E8F3546A6B208C733627C7201D70092D3F577D16CEEA7A4E6CB00DB7CAC7B55666534FCF2B7304A4B2403C4107FAA91A4B9C24DFB917530564164C67C313DA510A77F71BCA1AE9338C0773077FC24AF59FD94352C1AE3D9F74D4550593D450539B5D644EDF95F177794FFA797E6BCA5B54125BADB7784B1CF7D24AD958D03BA58E043B2719DCB1A37F32B777D89388D059354DCAC91CF0D55B750B7ED94CF849E51551B71335B9E9CC3BF823A16AE97497C6ABF32F865B3FB9CD6BE97653B731DCD9ABC69092DF5D5D49133B7B65CA9F1CAFDC3646023073E258E233E4D2BA9C0B9A4B3D9AE565A98E48E3A3AA2F8A490607249D01F8870F7ACA239278DAEC0703DE0A32DB136C5A9C57D380286BDA60A8871B35C776BBDD9C8FF5956FFA5F22D8DD53F4FE13FF008C9CFABFCDAE55CF9FFE7FD12945F1642E89F963CF667FF2DDBE3DC7C3DDF82FB2BA45704445E8088880E43A2AAA0E8AA802222008888022220088880222200888802222008888022220088880E2EEAA8AAEEAA880222200BE35551F6684B80E679D9ADF33E017D2491B1B4B9C7002EB44D7126AAA71186825AD276637C49F5C7C96A9C9FC31E7F064977659AF156DD2162ADBA3DAC96A1ADE771710D27A6464AD02D437993566B2BA563A573E95D56F921CED1979D9CFDFC9BB0F5700B397B49F1BA3BD524B61B1CEE7D112639E76B461E475E53E43A67C4E7C96B6378936CD0F5948FF00B23AADF0968C35C39C1E61BB01CB490012D2F047310482300F19AEB6375AAAA9FA63F9EE75BA1A65556EC9AF53FC19835DDCA2E1BE896E94B5D2197545EA91B5B7291A799D454AD6F335A3946412C0F2EC1D838E7AEDABBACEF71D6E99A0A489B23E47495124CE7C85C1CE2ED886F400340F52739F003B170E26D7D5BEEF511544AF9EE6F77DB6BA494BE591A5C0F665E71968237C019C790565A32DBA55C71C8D0465FCBEE38C7E0543BAC59DB85FCFFD2CB4F4B4B7E5973D05A7FECF4F49148C1DBBFF006B26DBE49381F5FA2CCF68A7FD577B71DF95C00518D116D1254C72C8D02491ED25AEEAD6B7FBFAAC952DA4FDB04C1A794609F915492939B6D96326A388929A1776AD693B03E4BBF5142C9A3E9BE30ADD6839C348F057D043464E71F45AFA7DCD7D5EC446E3A7A2AA6B83999518ACD0B1B9CEEE03E842C9D3C2C7631E3E2BAA636B5DD01F421618C1B633662C93877139B9EC87379632BE943C3A88381308681E4164E313481903217622863E98DFCC2C947264ED924462D7A562A18C72C4001E246172BA40D8A070C631E054AA668ECCE061462F2D2E6B8027C9251491A949B79663BAFA335752F3CA795BF5568BFE9DE6B43C729E71DE1EF591A1B5B4303DCD183F55D1BA5176CD2C231CC36CF8224E26CF33A9E11AC7766BEC7572D5869753C988AA233D1EC2E0FE53FEA6EC7C0AFA68CD6ADE166AF8EBAC5573BA829EAE3ADA29676E2404107703209009638670EE507D164EBCE95805C9D05447CF0CA795DB781E9F5FC42C75AA3854DB4CDCF139E2988763033C9BF5C7885695EA125891AA74A9BD8F593857C47B5F14F46D0DFAD7233966681340D764C3278B7DDE20F8820A973DA1EDC11B755E5CFB32F1A2EDC17BD4B472BC1A476FF679A42237B7C81FE1DF20FEEEF918257A2BA138AD61D7F6F6D4505488E51DD92094E1CC77883FDFBB2BB7D1EBEBBA2A137897E4E1B59A0B34F36E2BD3F8264880870C8208F308AE4A908888022220390E8AAA83A2AA0088880222200888802222008888022220088880222200888802222038BBAAA2B75EB515BEC4D06B2A1B1388E60CFDE23DCA215DC5FA1839BB0A5926037049C6546B3534D4F1396E48AF4F6DAB30893F73DAC0399C1B938DCA021C320820F92F3FF895ED81ABAE17B963A68E1B45346E73590999B9C03F7B248EBF1566D29C7EAFAA99D5771B9FEB6E566F4C257160CF99180540B7C43CADFA76FA936BD04ACDB3B9BF17ED6967D3CE22A2A1D5556067ECD48C334A07996B73CA3A778E07AAC0FC54E384576866A3AAAE162B47FE6764FED257B700EE1A473139D9B90D183924118D5BE20FB4C5FAFEC36BB69E5A46EC296DCDCB47CBBA3DEE24FA2C397CBDDC6B5E05CEB036477DDA18A52F38FF00EA3BC4FA6DEE54F7EBACB974ADA2CB7A3C3A35BCCB76641E267162DD79B8F2D969A4A6A1607461F3CBCF24FD00C8186868C03B0F13BAC6728A9D415249E6FB3BDDCEF91C7BF27BB1D01F3F5C055A3B1D45D1E5C62E681A473CD30C47EE1E7EE52EB6D2C34C581CEE60E3869EAF95DE181E5FDF454F3BA10F8792F6BA24F93A370D352FEA631C5188C118D9BB7900065534E59AB2C97265356C7CB248D05BCDB6C09FC33F5598F4BE8B92A1D0D556C82323BD1C180797D4FAFE0ADBC57D3A28E8A1BA4079E7A590171E9DDE8E1FDF92AD9DB296C4D84631928A263A234E17442A656073A4008F268F20B20535A5AD63C60B8F4C939515E18DDD974D3F4B2C6E69019823C5644A6E56B09C75F058C22B19215ADA96196A8687B1734355DA38DC621904E3C405CE38192677191BAB950C4DC600CAC92EC6192C72D3170C83F02BAD252BDA376E4F8292C946D339C8F5DB65C05B3727972329E4E7833F31A239F657737306EEBBB4F42F38C801A7C55E9B6A24740D6F967257660A28E3C0C731F328A9C18CADCF047ABA07323EE373B6159FF5419A52F9B0E6F979A97DCF94B4B4B41C7C9598C8D66738C85E4A2B2789B68B45450348EEB794346C1592BA91AF71763A6CA455B56C6C6797AE3DD9560A9AE863041DCE370B54B1C9B609E48A6A6B30969BED0C6E1CDFBD8FC5746D90417BA330CED0F701DEDF7F7A923EB1AFE768FBA723A7550EA832698B9B6AC83F617BB95C40FBA0EFF4EAB439932316D7CCEA5E385515546FEC8B5C33CCC0F04161F423A2F8696B06B9D1B726CD6AB930C41DCCD64AF271E409C6E3DE0F5F4595295AD963639B82D70C823C576E384308C81852AB9CA3C3344E5D4B125927FC37F68DBEDB69A3A3D47A79D311B76F472349FAE36F82CF7A7F5DDA75153B648263039C0131D40E523F2FAAD50A594326692C240574BE71126D31A6ABEB2388629A9E4988F13CAD2719F0E8BA5D178959525193CAF639DD5787D763EA82C3362F58718346E82AAA7A7BF6A1A3B74D50D7398C7B8B8E1BD73CA0E3E2BADA278E3A1B88B767DB34F6A1A6B8D7B63ED440D0E6B9CDF12DE60338F1C2F10754716AEFABEB61ACAFAB7CD2B23E46973B381CC4FE24FCCACC3EC5DABAE749C5F15F4752E8E5A2A291FCC3F98B5983EF0E2BB0B2E5541D92E11CDD743B24A11E59ECBA2D663C66D470B79BED5971F30AFF00A3B8FD72AEBFDB6D95D4D14CDACA98A9C4807296F3BC373F55590F17D34A4A2F2B24D9F85DF18B92C333E0E8AAA83A2AABB2A02222008888022220088880222200888802222008888022220088880C17C7499EDD5B4AC070DFB0B0FF00FD922C79707B85AEA4B65ECDC232724671B75C78AC8BC6FF00FC634BE1FE019FF32458CAEA0C56FA9738EDD9389C7B97CEB5D37FAC9AF99DCE917F9587D0F2DEF3AB2AA7B84F23A6CBCBDC418DA00EBE4B387B2F59DFC417EA28ABA7927ECA284461E72D69717E76CFA05ABB70AB3254C873905C4FD56E07E8F288544BAC6570C869A5681EBFB52BA9F118A5A693FA7E4A3D0CDF9E8CA507B3EB700D65CA5A6A424BBB18488FEAACD7AD21A4F49C6E868691B53559FBF2124E4FAFE4B3FDFAC12DDF9DB1CEEA718FBC064E3D028D51F0BA8295C642D74920397CF3BB9A477F41E8365C04FADBC23B58591E64CC0F0E93B8DFEE2218627C81BB77F6633CC91F975F72C91A7F8614D65676EFFDB563810EA8906FEE1FC23DCB254165A6B5C2228216C7B027013B31249CAE191958F4B7B312BB3C70439963A8881787BB1E5D301742E9A7A7BA5BE6A6981314A0821DEAB27B695AE6018CFBF7436A8EA5841C08FA9F55E4AA6B8662AE35D785370ACD37A82E3A6A727B4A7773C61DB17B33F787D3EAB38D2DD247068390A11C51D1B5169AAA6D5F6A8B9EE36A3DA4F081FEDE9FFF0031BF01B8F8AC8360149A82D54B72A091B35354303D8E1E47C0FAAD69493C64DD638CD29E3FF4ED514D2025FE1E6AF5475DD9B773D7C1759940626EECDBD17D5D06D818C7AADE934457865CE3A863DFB3B3EAAE11CC1AD3D3DEA2F148E81C41391E4576A3B9E5A0E71E18F35B2335DCD7287B1799AB40761AE07E0BE6272F040D863AAB3FDAC9CE3AF82EEC1296819046DD00CACD4948C1C7070AE639D1925DBFA28F56C2FC92D0401E7E2A4AF7B5E7C7A2EA4B442424B8F5DB016128A7C19C5E3920F574F34A08009E6EAADBFAA1E46E3753E9AD8DC918D87AAEB4B40D693D3971D54775923CC4B8218DB68660F283E6BE572B6455D4AEA79581CC3B74526AAA5693900923A01D15BE48C18DCB4B860CD4FB912D157096D7719B4E579CCB1304B4729E92427CBD5BD3FF006535635B238123042895FEC725EA829EA28DED86EF41219696523C41FB8EFE570D8ABDE9ABCC57DA28EAA306393764B0BFEF4520D9CD23D0FCF63E2B641E36135D5EA448238806E1BE5BA8271D6BC5B3845ABEA01E5ECED5518F798C81F52A7991CB86F5C6EB0F7B58DC7F56701355C9B83253B20181FC72B1BF9AB2D37AAD8C7E68AFB9F4C24FE479B8CAB218D195B49EC1F4C6AF566A6AAC67B1A48599FF0033DC7FFD56A4098E1BEEEAB73BF47DD238D0EB1ABC679A5A7841FF002B5E4FFEA5DB788CBA74B2FB7E4E4F45BDF136EE60486AECE8B8DA75DE9D7788B9D2FF00CE6AEB4EC734979EA7C176B484B1D1EADB0CF33F9228AE14F23DEFFDD6895A49F82F9EC7F7A3F547652CF972FA3372874555D7B7D74373A0A6ACA7773D3D444D963763196B8020FC8AEC2FAD279DD1F376B1B30888BD3C08888022220088880222200888802222008888022220088880C21C6D6076ADA538C9FB0B3FE648B15EAB67FDDABAEEE6E2965DDA704770F42B2EF199A3FED3D33BC7EC6C1FF1C8B0FEBE90C7A32FCF00645054119FFEDB97CDB5DFD6CFEA773A5FE921F43C769E7CBCEF9CE775BB7FA38999B76B4971D66A6683FE993FAAD187925F8F45BD9FA3847FDDCD5C7C4D6443E51FFD575FE26F1A67F639FD06F7A373CBFF0066D2460F9AE9CD36FD39BC7C97DA4279095D29B607D42E0E4CEBA2756625EE270307C8AA08C100E371D42F991B67C97D1BDD612362163167AD1D88616918276F16E55C5A3200C640E8ADA1C43C11E2177219DC5E06DB7A2CBAB73C68FBCB03666F248C6B9A4169047507A851BD1BA519A4A7A8A3A4CB68398BE38FA8009E9F0FEFA293309E603AAFB471B5AFC81B938DD78E1193523D53718B89D831F7760BAF55465C0969E5237EABB51807391D1719DC4076FE8B36611647EA19380ECB723CC2EA88E63D3242BBCC4F338236205467144952691D18229B9816E1A3C8AB8C14EE0065E4AA068006C0E57DA390E36DBDCB35B183DCFA319D9923A8F4FCD08E6C827DE72BE6C7B886EFD7C5524710E233E195B148D6D1F3988E8EEF0F05D1A821A08C75F05F67BCB1FB7BD752ADC773B65612665145BAA1A79481DD1EAAD72F41B78EE5776A09E671CAF896091E33BECB4672CDF83AD4D186869FBB924AB3CD689EDD7DFD6344008EA0725541D03C8FBAF1FCD8DB3E230A46D68EF0F5470C63C579D3B1E29E19CA3903A30E19CF5C1F15827DB66E4EA2E00DDA30CE7353554D0927F7476A1F9FF800F8ACE9CA0819F35AEDEDCF50F6F032A183187DC699A4FA65C7F20ACB40FF00CC56BE6881ABFD99BF933CF3E72DC11B616FD7E8F5A40386D7FA8E864BBB9A4F986C31FF0055A024F7BE0BD0FF00D1FE07FF00066B8FF15E2627FF00E3882EC3C5DE34BF74733E1DBDFF0063642A587C067D4AEACF11FB3C846C4349CF96CBBF21C977A1C05C278DBF6693FC84FD17CF1F27671D91B57C3DC8D03A6B3D7F56537FCA6A902B0E81FF00C09A73FF00C6D37FCA6ABF2FAE51FB50FA2FC1F37B7F725F5611116E3504444011110044440111101FFFD9)
Insert into tblTeacherInfo
Values (N'Иван',N'Иванов',N'Иванов',2,'0987654321','0885551234',N'бул. Княгиня Мария Луйза №20',2,null)
Insert into tblTeacherInfo
Values (N'Григор',N'Тошев',N'Тошев',3,'2345678901','0889123124',N'ул. Алеко Константинов №2',2,null)
Insert into tblTeacherInfo
Values (N'Иван',N'Тошев',N'Иванов',4,'3456789012','0982341234',N'бул. Княз Борис №5',3,null)
Insert into tblTeacherInfo
Values (N'Александър',N'Тошев',N'Атанасов',5,'0046789012','0982671234',N'бул. Руски №23',3,null)

Insert into tblTeacherAccount
Values (1,'director','40BD001563085FC35165329EA1FF5C5ECBDBBEEF')
Insert into tblTeacherAccount
Values (4,'teacher','40BD001563085FC35165329EA1FF5C5ECBDBBEEF')

Insert into tblSpecialization
Values (N'Стопански мениджмънт')
Insert into tblSpecialization
Values (N'Хуманитарна')

Insert into tblClass
Values (12,N'Б',1,1234567890)

Insert into tblTeacherAbsence
Values ('0987654321','1, 2, 3, 4',SYSDATETIME(),'2345678901')

Insert into tblStudentInfo
Values (N'Иван',N'Иванов',N'Иванов','0035673567','0035673567',N'ул.Княгиня Мона Лиза №20',null,1,1,N'Иво Иванов','0493499596',N'ул. Княгиня Мона Лиза №20')
Insert into tblStudentInfo
Values (N'Александър',N'Иванов',N'Иванов','5035673567','5035673567',N'ул. Граф Монте Кристо №200',null,1,1,N'Илиян Иванов','0493499596',N'ул. Граф Монте Кристо №200')

Insert into tblTeacherLesson
Values (4,N'Картознание и история',SYSDATETIME(),2,1,'1,2,3,4','1,2,3,4')
