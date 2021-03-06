/****** Object:  UserDefinedTableType [dbo].[MedicineList]    Script Date: 5/1/2020 5:05:01 PM ******/
CREATE TYPE [dbo].[MedicineList] AS TABLE(
	[MedicineId] [uniqueidentifier] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL
)
GO
/****** Object:  Table [dbo].[Agency]    Script Date: 5/1/2020 5:05:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agency](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PublicId] [uniqueidentifier] NOT NULL,
	[AgencyName] [nvarchar](250) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[Pincode] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[SubscriptionExpiryDate] [datetime] NULL,
	[GstNo] [nvarchar](50) NULL,
	[PrimaryContactNo] [nvarchar](20) NULL,
	[SecondaryContactNo] [nvarchar](20) NULL,
	[EmailId] [nvarchar](250) NULL,
	[StateGst] [decimal](18, 0) NULL,
	[CenterGst] [decimal](18, 0) NULL,
	[Logo] [nvarchar](250) NULL,
 CONSTRAINT [PK_Agency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationException]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationException](
	[Logid] [bigint] IDENTITY(1,1) NOT NULL,
	[ExceptionMsg] [varchar](100) NULL,
	[ExceptionType] [varchar](100) NULL,
	[ExceptionSource] [nvarchar](max) NULL,
	[ExceptionURL] [varchar](100) NULL,
	[Logdate] [datetime] NULL,
 CONSTRAINT [PK_ApplicationException] PRIMARY KEY CLUSTERED 
(
	[Logid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BilledMedicine]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BilledMedicine](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[PublicId] [uniqueidentifier] NOT NULL,
	[MedicineId] [decimal](18, 0) NOT NULL,
	[BillingId] [decimal](18, 0) NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_BilledMedicine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Billing]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billing](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[PublicId] [uniqueidentifier] NOT NULL,
	[CustomerId] [decimal](18, 0) NOT NULL,
	[RecomendedByDr] [decimal](18, 0) NOT NULL,
	[BilllingDate] [datetime] NOT NULL,
	[AgencyId] [int] NOT NULL,
	[AmountPaid] [decimal](18, 0) NOT NULL,
	[PaidDateTime] [datetime] NOT NULL,
	[InvoiceNo] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Billing] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[PublicId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](150) NULL,
	[MobileNo] [decimal](12, 0) NULL,
	[EmailId] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Pincode] [int] NULL,
	[AgencyId] [int] NOT NULL,
	[CreatedDateTime] [datetime] NULL,
	[UpdatedDateTime] [datetime] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorsDetail]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorsDetail](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[PublicId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Speciality] [nvarchar](150) NULL,
	[HospitalClinicName] [nvarchar](150) NULL,
	[Address] [nvarchar](150) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Pincode] [int] NULL,
	[ContactNo] [decimal](12, 0) NULL,
	[EmailId] [nvarchar](150) NULL,
	[AgencyId] [int] NULL,
 CONSTRAINT [PK_DoctorsDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalRepresentative]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalRepresentative](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[PublicId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PrimaryContactNo] [decimal](12, 0) NULL,
	[SecondaryContactNo] [decimal](12, 0) NULL,
	[EmailId] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Pincode] [int] NULL,
	[AgencyId] [int] NOT NULL,
 CONSTRAINT [PK_MedicalRepresentative] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medicine]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medicine](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[PublicId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[ManufacturerId] [int] NOT NULL,
	[Mg] [decimal](18, 0) NULL,
	[ExpiryDate] [datetime] NOT NULL,
	[InitialQuantity] [int] NOT NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[MedicalRepresentativeId] [decimal](18, 0) NOT NULL,
	[AgencyId] [int] NOT NULL,
	[Description] [nvarchar](1050) NULL,
	[LastUpdatedDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Medicine] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicineManufacturer]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicineManufacturer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PublicId] [uniqueidentifier] NOT NULL,
	[ManufacturerName] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](1050) NULL,
	[AgencyId] [int] NULL,
 CONSTRAINT [PK_MedicineManufacturer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TempMedicineTable]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempMedicineTable](
	[MedicineId] [uniqueidentifier] NULL,
	[Quantity] [int] NULL,
	[Price] [decimal](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PublicId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](550) NOT NULL,
	[EmailId] [nvarchar](150) NULL,
	[MobileNo] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](250) NULL,
	[City] [nvarchar](50) NULL,
	[State] [nvarchar](50) NULL,
	[Pincode] [int] NULL,
	[AgencyId] [int] NOT NULL,
	[IsActive] [bit] NULL,
	[DeactivationDate] [datetime] NULL,
 CONSTRAINT [PK_UserDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserDetails] ADD  CONSTRAINT [DF_UserDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[BilledMedicine]  WITH CHECK ADD  CONSTRAINT [FK_BilledMedicine_Billing] FOREIGN KEY([BillingId])
REFERENCES [dbo].[Billing] ([Id])
GO
ALTER TABLE [dbo].[BilledMedicine] CHECK CONSTRAINT [FK_BilledMedicine_Billing]
GO
ALTER TABLE [dbo].[Billing]  WITH CHECK ADD  CONSTRAINT [FK_Billing_Agency] FOREIGN KEY([AgencyId])
REFERENCES [dbo].[Agency] ([Id])
GO
ALTER TABLE [dbo].[Billing] CHECK CONSTRAINT [FK_Billing_Agency]
GO
ALTER TABLE [dbo].[Billing]  WITH CHECK ADD  CONSTRAINT [FK_Billing_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Billing] CHECK CONSTRAINT [FK_Billing_Customer]
GO
ALTER TABLE [dbo].[Billing]  WITH CHECK ADD  CONSTRAINT [FK_Billing_DoctorsDetail] FOREIGN KEY([RecomendedByDr])
REFERENCES [dbo].[DoctorsDetail] ([Id])
GO
ALTER TABLE [dbo].[Billing] CHECK CONSTRAINT [FK_Billing_DoctorsDetail]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Agency] FOREIGN KEY([AgencyId])
REFERENCES [dbo].[Agency] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Agency]
GO
ALTER TABLE [dbo].[DoctorsDetail]  WITH CHECK ADD  CONSTRAINT [FK_DoctorsDetail_Agency] FOREIGN KEY([AgencyId])
REFERENCES [dbo].[Agency] ([Id])
GO
ALTER TABLE [dbo].[DoctorsDetail] CHECK CONSTRAINT [FK_DoctorsDetail_Agency]
GO
ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_Agency] FOREIGN KEY([AgencyId])
REFERENCES [dbo].[Agency] ([Id])
GO
ALTER TABLE [dbo].[Medicine] CHECK CONSTRAINT [FK_Medicine_Agency]
GO
ALTER TABLE [dbo].[Medicine]  WITH CHECK ADD  CONSTRAINT [FK_Medicine_MedicalRepresentative] FOREIGN KEY([MedicalRepresentativeId])
REFERENCES [dbo].[MedicalRepresentative] ([Id])
GO
ALTER TABLE [dbo].[Medicine] CHECK CONSTRAINT [FK_Medicine_MedicalRepresentative]
GO
ALTER TABLE [dbo].[MedicineManufacturer]  WITH CHECK ADD  CONSTRAINT [FK_MedicineManufacturer_Agency] FOREIGN KEY([AgencyId])
REFERENCES [dbo].[Agency] ([Id])
GO
ALTER TABLE [dbo].[MedicineManufacturer] CHECK CONSTRAINT [FK_MedicineManufacturer_Agency]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_Agency] FOREIGN KEY([AgencyId])
REFERENCES [dbo].[Agency] ([Id])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_Agency]
GO
/****** Object:  StoredProcedure [dbo].[AddCustomer]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddCustomer](
@Name nvarchar(250),
@EmailId nvarchar(150),
@MobileNo nvarchar(20),
@Address nvarchar(250),
@City nvarchar(50),
@State nvarchar(50),
@PinCode int,
@Agencyid uniqueidentifier,
@msg nvarchar(50) output
)
as
begin
 SET NOCOUNT ON
 DECLARE @ErrorMessage NVARCHAR(MAX)
 declare @agencyNumericId int = 0
 declare @userAlreadyExistsId int = 0
	BEGIN TRY
	set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
	set @userAlreadyExistsId = (select Id from dbo.Customer where MobileNo=@MobileNo and AgencyId = @agencyNumericId )
			if (@agencyNumericId <> 0)
				begin
					if(@userAlreadyExistsId <> 0)
						begin
							set @msg = 'Customer already exists.'
						end
					else
						begin
							insert into dbo.Customer
							(PublicId,Name,EmailId,MobileNo,Address,City,State,Pincode,AgencyId, CreatedDateTime, UpdatedDateTime) values
							(NEWID(),@Name,@EmailId,@MobileNo,@Address,@City,@State,@PinCode,@agencyNumericId, GETDATE(),GETDATE())
							set @msg = 'Customer Added Successfuly.'
						end
				end
			else
				set @msg = 'Incorrect Agency!'
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE()
		RAISERROR (@ErrorMessage, 10, 1)
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[AddDoctors]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddDoctors](
@Name nvarchar(250),
@EmailId nvarchar(150),
@Speciality nvarchar(150),
@HospitalClinicName nvarchar(150),
@MobileNo nvarchar(20),
@Address nvarchar(250),
@City nvarchar(50),
@State nvarchar(50),
@PinCode int,
@Agencyid uniqueidentifier,
@msg nvarchar(50) output
)
as
begin
 SET NOCOUNT ON
 DECLARE @ErrorMessage NVARCHAR(MAX)
 declare @agencyNumericId int = 0
 declare @doctorAlreadyExistsId int = 0
	BEGIN TRY
	set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
	set @doctorAlreadyExistsId = (select Id from dbo.DoctorsDetail where ContactNo=@MobileNo and AgencyId = @agencyNumericId )
			if (@agencyNumericId <> 0)
				begin
					if(@doctorAlreadyExistsId <> 0)
						begin
							set @msg = 'Doctor already exists.'
						end
					else
						begin
							insert into dbo.DoctorsDetail
							(PublicId,Name,EmailId,ContactNo,Address,City,State,Pincode,AgencyId, Speciality,HospitalClinicName) values
							(NEWID(),@Name,@EmailId,@MobileNo,@Address,@City,@State,@PinCode,@agencyNumericId,@Speciality,@HospitalClinicName)
							set @msg = 'Doctor Added Successfuly.'
						end
				end
			else
				set @msg = 'Incorrect Agency!'
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE()
		RAISERROR (@ErrorMessage, 10, 1)
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[AddMedicine]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[AddMedicine](
@Name nvarchar(250),
@Mg decimal(18,0),
@ExpiryDate datetime,
@InitialQuantity int,
@Price decimal(18,0),
@MRid uniqueidentifier,
@Description nvarchar(1050),
@LastUpdatedDateTime datetime,
@Manufacturerid uniqueidentifier,
@Agencyid uniqueidentifier,
@msg nvarchar(50) output
)
as
begin
 SET NOCOUNT ON
 DECLARE @ErrorMessage NVARCHAR(MAX)
 declare @agencyNumericId int = 0
 declare @MedicalRepresentativeId int = 1
 declare @ManufacturerNumericId int =1
	BEGIN TRY
	set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
	set @MedicalRepresentativeId = (select Id from dbo.MedicalRepresentative where PublicId=@MRid)
	set @ManufacturerNumericId = (select Id from dbo.MedicineManufacturer where PublicId=@MRid)
			if (@agencyNumericId <> 0)
				begin
					insert into dbo.Medicine
					(
						PublicId,
						Name,
						Description,
						ManufacturerId,
						AgencyId,
						MedicalRepresentativeId,
						Mg,
						ExpiryDate,
						Price,
						InitialQuantity,
						LastUpdatedDateTime
					) values
					(
						NEWID(),
						@Name,
						@Description,
						@ManufacturerNumericId,
						@agencyNumericId,
						@MedicalRepresentativeId,
						@Mg,
						@ExpiryDate,
						@Price,
						@InitialQuantity,
						GETDATE()
					)
					set @msg = 'Medicine Added Successfuly.'
				end
			else
				set @msg = 'Incorrect Agency!'
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE()
		RAISERROR (@ErrorMessage, 10, 1)
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[AddMedicineManufacturer]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddMedicineManufacturer]
(
@Name nvarchar(250),
@description nvarchar(1050),
@agencyId uniqueidentifier,
@msg nvarchar(50) output
)
as
begin
SET NOCOUNT ON
 DECLARE @ErrorMessage NVARCHAR(MAX)
 declare @agencyNumericId int = 0
 	BEGIN TRY
	set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
			if (@agencyNumericId <> 0)
				begin
					insert into dbo.MedicineManufacturer
					(PublicId,ManufacturerName, Description,AgencyId) values
					(NEWID(),@Name,@description,@agencyNumericId)
					set @msg = 'Medicine Manufacturer Added Successfuly.'
				end
			else
				set @msg = 'Incorrect Agency!'
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE()
		RAISERROR (@ErrorMessage, 10, 1)
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddUser](
@Name nvarchar(250),
@UserName nvarchar(50),
@Password nvarchar(550),
@EmailId nvarchar(150),
@MobileNo nvarchar(20),
@Address nvarchar(250),
@City nvarchar(50),
@State nvarchar(50),
@PinCode int,
@Agencyid uniqueidentifier,
@msg nvarchar(50) output
)
as
begin
 SET NOCOUNT ON
 DECLARE @ErrorMessage NVARCHAR(MAX)
 declare @agencyNumericId int = 0
	BEGIN TRY
	set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
			if (@agencyNumericId <> 0)
				begin
					insert into dbo.UserDetails
					(PublicId,Name,UserName,Password,EmailId,MobileNo,Address,City,State,Pincode,AgencyId) values
					(NEWID(),@Name,@UserName,@Password,@EmailId,@MobileNo,@Address,@City,@State,@PinCode,@agencyNumericId)
					set @msg = 'User Created Successfuly.'
				end
			else
				set @msg = 'Incorrect Agency!'
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE()
		RAISERROR (@ErrorMessage, 10, 1)
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[AgencySummery]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AgencySummery](
@agencyId uniqueidentifier
)
as
begin
 SET NOCOUNT ON
 DECLARE @ErrorMessage NVARCHAR(MAX)
 declare @agencyNumericId int = 0
 declare @medicineCount int = 0
 declare @medicineManufacturerCount int = 0
 declare @customerCount int = 0
 declare @doctorCount int = 0
 declare @mrCount int = 0
 declare @totalBillCount int = 0
 declare @billTodayCount int = 0
	BEGIN TRY
	set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
			if (@agencyNumericId <> 0)
				begin
					set @medicineCount =(select count(*) from dbo.Medicine where AgencyId = @agencyNumericId)
					set @medicineManufacturerCount =(select count(*) from dbo.MedicineManufacturer where AgencyId = @agencyNumericId)
					set @customerCount =(select count(*) from dbo.Customer where AgencyId = @agencyNumericId)
					set @doctorCount =(select count(*) from dbo.DoctorsDetail where AgencyId = @agencyNumericId)
					set @mrCount =(select count(*) from dbo.MedicalRepresentative where AgencyId = @agencyNumericId)
					set @totalBillCount =(select count(*) from dbo.Billing where AgencyId = @agencyNumericId)
					set @billTodayCount =(select count(*) from dbo.Billing where AgencyId = @agencyNumericId and DATEDIFF(DAY,GETDATE(),dbo.Billing.BilllingDate)=0)
					select @medicineCount as TotalMedicine,@customerCount as TotalCustomer,@doctorCount as TotalDoctors,
					@mrCount as TotalMR,@totalBillCount as TotalBills, @billTodayCount as TotalBillsToday, @medicineManufacturerCount
					as TotalManufacturer
				end
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE()
		RAISERROR (@ErrorMessage, 10, 1)
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[CreateBilling]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[CreateBilling]
(
@CutomerId uniqueidentifier,
@recomendedByDrId uniqueidentifier,
@AgencyId uniqueidentifier,
@AmountPaid decimal(18,0),
@medicine MedicineList readonly,
@msg nvarchar(50) output
)
as
begin
SET NOCOUNT ON
 DECLARE @ErrorMessage NVARCHAR(MAX)
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DeleteUser](
@Agencyid uniqueidentifier,
@Userid uniqueidentifier,
@msg nvarchar(50) output
)
as
begin
 SET NOCOUNT ON
 DECLARE @ErrorMessage NVARCHAR(MAX)
 declare @agencyNumericId int = 0
 declare @userNumericId int = 0
	BEGIN TRY
	set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
	set @userNumericId = (select Id from dbo.UserDetails where PublicId=@Userid and AgencyId = @agencyNumericId)
			if (@agencyNumericId <> 0 and @userNumericId <> 0)
				begin
					update dbo.UserDetails
					set isActive = 0, DeactivationDate = GETDATE() where Id = @userNumericId
					set @msg ='User Deleted Successfuly!'
				end
			else
				set @msg ='Incorrect User!'
	
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE()
		RAISERROR (@ErrorMessage, 10, 1)
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[ExceptionLoggingToDataBase]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ExceptionLoggingToDataBase]  
(  
@ExceptionMsg varchar(100)=null,  
@ExceptionType varchar(100)=null,  
@ExceptionSource nvarchar(max)=null,  
@ExceptionURL varchar(100)=null  
)  
as  
begin  
Insert into ApplicationException  
(  
ExceptionMsg ,  
ExceptionType,   
ExceptionSource,  
ExceptionURL,  
Logdate  
)  
select  
@ExceptionMsg,  
@ExceptionType,  
@ExceptionSource,  
@ExceptionURL,  
getdate()  
End 
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerById]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetCustomerById]
(
@agencyId uniqueidentifier,
@customerId uniqueidentifier
)
as
begin
SET NOCOUNT ON
declare @agencyNumericId int = 0
set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
if (@agencyNumericId <> 0)
begin
	select PublicId,Name, EmailId, MobileNo, Address,City,State,Pincode,CreatedDateTime
	from Customer where AgencyId= @agencyNumericId and PublicId=@customerId
end
end
GO
/****** Object:  StoredProcedure [dbo].[GetCustomers]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GetCustomers]
(
@agencyId uniqueidentifier
)
as
begin
SET NOCOUNT ON
declare @agencyNumericId int = 0
set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
if (@agencyNumericId <> 0)
begin
	select PublicId, Name, EmailId, MobileNo, Address,City,State,Pincode,CreatedDateTime
	from Customer where AgencyId= @agencyNumericId order by id desc
end
end
GO
/****** Object:  StoredProcedure [dbo].[GetMedicinemanufacturers]    Script Date: 5/1/2020 5:05:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetMedicinemanufacturers]
(
@agencyId uniqueidentifier
)
as
begin
SET NOCOUNT ON
declare @agencyNumericId int = 0
set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
if (@agencyNumericId <> 0)
begin
	select ManufacturerName, Description, PublicId
	from MedicineManufacturer where AgencyId= @agencyNumericId order by id desc
end
end
GO
/****** Object:  StoredProcedure [dbo].[GetMedicines]    Script Date: 5/1/2020 5:05:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetMedicines]
(
@agencyId uniqueidentifier
)
as
begin
SET NOCOUNT ON
declare @agencyNumericId int = 0
set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
if (@agencyNumericId <> 0)
	begin
		select M.PublicId, M.Name, M.Mg, M.ExpiryDate, M.InitialQuantity, M.Price, M.Description, Mfg.ManufacturerName, Mfg.PublicId as MfgId,
		Mr.Name as MrName,Mr.PrimaryContactNo as MrContactNo, Mr.PublicId as MrId from dbo.Medicine M inner join dbo.MedicineManufacturer mfg on M.ManufacturerId = mfg.Id
		inner join dbo.MedicalRepresentative Mr on Mr.Id = M.MedicalRepresentativeId where M.AgencyId=@agencyNumericId
	end
end
GO
/****** Object:  StoredProcedure [dbo].[GetSettings]    Script Date: 5/1/2020 5:05:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GetSettings]
(
@agencyId uniqueidentifier
)
as
begin
SET NOCOUNT ON
declare @agencyNumericId int = 0
set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
if (@agencyNumericId <> 0)
begin
	select AgencyName, EmailId, PrimaryContactNo,SecondaryContactNo, Address,City,State,Pincode,SubscriptionExpiryDate,
	GstNo,StateGst,CenterGst,Logo
	from Agency where Id= @agencyNumericId
end
end
GO
/****** Object:  StoredProcedure [dbo].[GetUserData]    Script Date: 5/1/2020 5:05:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[GetUserData]
(
@userName nvarchar(150),
@password nvarchar(150)
)
as
begin
	select U.Name,U.PublicId as UserId,A.PublicId as AgencyId, A.AgencyName as AgencyName from UserDetails as U inner join Agency A on A.Id
	= U.AgencyId where U.UserName = @userName and U.Password = @password
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 5/1/2020 5:05:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[UpdateCustomer](
@Name nvarchar(250),
@EmailId nvarchar(150),
@MobileNo nvarchar(20),
@Address nvarchar(250),
@City nvarchar(50),
@State nvarchar(50),
@PinCode int,
@Agencyid uniqueidentifier,
@Customerid uniqueidentifier,
@msg nvarchar(50) output
)
as
begin
 SET NOCOUNT ON
 DECLARE @ErrorMessage NVARCHAR(MAX)
 declare @agencyNumericId int = 0
 declare @userNumericId int = 0
	BEGIN TRY
	set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
	set @userNumericId = (select Id from dbo.Customer where PublicId=@Customerid and AgencyId = @agencyNumericId)
			if (@agencyNumericId <> 0 and @userNumericId <> 0)
				begin
					update dbo.Customer
					set Name = @Name, EmailId = @EmailId, MobileNo= @MobileNo, Address = @Address, City = @City,
					State = @State, Pincode = @PinCode, UpdatedDateTime = GETDATE() where Id = @userNumericId
					set @msg ='Data Updated Successfuly!'
				end
			else
				set @msg ='Incorrect Customer!'
	
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE()
		RAISERROR (@ErrorMessage, 10, 1)
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateDoctor]    Script Date: 5/1/2020 5:05:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[UpdateDoctor](
@Name nvarchar(250),
@EmailId nvarchar(150),
@MobileNo nvarchar(20),
@Address nvarchar(250),
@City nvarchar(50),
@State nvarchar(50),
@PinCode int,
@Agencyid uniqueidentifier,
@Doctorid uniqueidentifier,
@Speciality nvarchar(150),
@HospitalClinicName nvarchar(150),
@msg nvarchar(50) output
)
as
begin
 SET NOCOUNT ON
 DECLARE @ErrorMessage NVARCHAR(MAX)
 declare @agencyNumericId int = 0
 declare @docNumericId int = 0
	BEGIN TRY
	set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
	set @docNumericId = (select Id from dbo.DoctorsDetail where PublicId=@Doctorid and AgencyId = @agencyNumericId)
			if (@agencyNumericId <> 0 and @docNumericId <> 0)
				begin
					update dbo.DoctorsDetail
					set Name = @Name, EmailId = @EmailId, ContactNo= @MobileNo, Address = @Address, City = @City,
					State = @State, Pincode = @PinCode, Speciality= @Speciality,HospitalClinicName=@HospitalClinicName
					where Id = @docNumericId
					set @msg ='Data Updated Successfuly!'
				end
			else
				set @msg ='Incorrect Data!'
	
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE()
		RAISERROR (@ErrorMessage, 10, 1)
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateMedicine]    Script Date: 5/1/2020 5:05:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[UpdateMedicine](
@MedicinePublicid uniqueidentifier,
@Name nvarchar(250),
@Mg decimal(18,0),
@ExpiryDate datetime,
@InitialQuantity int,
@Price decimal(18,0),
@MRid uniqueidentifier,
@Description nvarchar(1050),
@LastUpdatedDateTime datetime,
@Manufacturerid uniqueidentifier,
@Agencyid uniqueidentifier,
@msg nvarchar(50) output
)
as
begin
 SET NOCOUNT ON
 DECLARE @ErrorMessage NVARCHAR(MAX)
 declare @agencyNumericId int = 0
 declare @MedicalRepresentativeId int = 1
 declare @ManufacturerNumericId int =1
	BEGIN TRY
	set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
	set @MedicalRepresentativeId = (select Id from dbo.MedicalRepresentative where PublicId=@MRid)
	set @ManufacturerNumericId = (select Id from dbo.MedicineManufacturer where PublicId=@MRid)
			if (@agencyNumericId <> 0)
				begin
				update dbo.Medicine set
					Name = @Name,
					Description = @Description ,
					ManufacturerId = @ManufacturerNumericId,
					AgencyId = @agencyNumericId,
					MedicalRepresentativeId = @MedicalRepresentativeId,
					Mg = @Mg,
					ExpiryDate = @ExpiryDate,
					Price = @Price,
					InitialQuantity = @InitialQuantity,
					LastUpdatedDateTime = GETDATE() where PublicId = @MedicinePublicid
					set @msg = 'Medicine Updated Successfuly.'
				end
			else
				set @msg = 'Incorrect Agency!'
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE()
		RAISERROR (@ErrorMessage, 10, 1)
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateSetting]    Script Date: 5/1/2020 5:05:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[UpdateSetting](
@Name nvarchar(250),
@EmailId nvarchar(150),
@PMobileNo nvarchar(20),
@SMobileNo nvarchar(20),
@Address nvarchar(250),
@City nvarchar(50),
@State nvarchar(50),
@GstId nvarchar(250),
@SGst decimal(18,0),
@CGst decimal(18,0),
@PinCode int,
@Agencyid uniqueidentifier,
@msg nvarchar(50) output
)
as
begin
 SET NOCOUNT ON
 DECLARE @ErrorMessage NVARCHAR(MAX)
 declare @agencyNumericId int = 0
	BEGIN TRY
	set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
	
			if (@agencyNumericId <> 0)
				begin
					update dbo.Agency
					set AgencyName = @Name, EmailId = @EmailId, PrimaryContactNo= @PMobileNo,
					SecondaryContactNo=@SMobileNo, Address = @Address, City = @City,GstNo=@GstId, CenterGst=@CGst,
					StateGst = @SGst,
					State = @State, Pincode = @PinCode where Id = @agencyNumericId
					set @msg ='Data Updated Successfuly!'
				end
			else
				set @msg ='Incorrect Agency!'
	
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE()
		RAISERROR (@ErrorMessage, 10, 1)
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 5/1/2020 5:05:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateUser](
@Name nvarchar(250),
@EmailId nvarchar(150),
@MobileNo nvarchar(20),
@Address nvarchar(250),
@City nvarchar(50),
@State nvarchar(50),
@PinCode int,
@Agencyid uniqueidentifier,
@Userid uniqueidentifier,
@msg nvarchar(50) output
)
as
begin
 SET NOCOUNT ON
 DECLARE @ErrorMessage NVARCHAR(MAX)
 declare @agencyNumericId int = 0
 declare @userNumericId int = 0
	BEGIN TRY
	set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
	set @userNumericId = (select Id from dbo.UserDetails where PublicId=@Userid and AgencyId = @agencyNumericId)
			if (@agencyNumericId <> 0 and @userNumericId <> 0)
				begin
					update dbo.UserDetails
					set Name = @Name, EmailId = @EmailId, MobileNo= @MobileNo, Address = @Address, City = @City,
					State = @State, Pincode = @PinCode where Id = @userNumericId
					set @msg ='Data Updated Successfuly!'
				end
			else
				set @msg ='Incorrect User!'
	
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE()
		RAISERROR (@ErrorMessage, 10, 1)
	END CATCH
end

