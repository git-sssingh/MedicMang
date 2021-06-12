USE [GoldenAuto]
GO
/****** Object:  UserDefinedTableType [dbo].[ServiceDetails]    Script Date: 6/12/2021 11:19:36 AM ******/
CREATE TYPE [dbo].[ServiceDetails] AS TABLE(
	[ServiceDetail] [nvarchar](250) NULL,
	[Quantity] [float] NULL,
	[Price] [float] NULL,
	[Comment] [nvarchar](650) NULL
)
GO
/****** Object:  Table [dbo].[Agency]    Script Date: 6/12/2021 11:19:36 AM ******/
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
/****** Object:  Table [dbo].[ApplicationException]    Script Date: 6/12/2021 11:19:37 AM ******/
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
/****** Object:  Table [dbo].[CustomBilling]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomBilling](
	[Id] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CustomInfo] [nvarchar](250) NOT NULL,
	[Quantity] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[AgencyId] [int] NOT NULL,
	[CustomerId] [decimal](18, 0) NOT NULL,
	[UserId] [int] NOT NULL,
	[LastUpdateDateTime] [datetime] NOT NULL,
	[PublicId] [uniqueidentifier] NOT NULL,
	[Comment] [nvarchar](650) NULL,
	[CustomerVehicleId] [decimal](18, 0) NULL,
 CONSTRAINT [PK_CustomBilling] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 6/12/2021 11:19:37 AM ******/
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
/****** Object:  Table [dbo].[CustomerVehicleDetails]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerVehicleDetails](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[CustomerId] [decimal](18, 0) NOT NULL,
	[VehicleNo] [nvarchar](50) NULL,
	[VehicleBrand] [decimal](18, 0) NULL,
	[Description] [nvarchar](550) NULL,
	[PublicId] [uniqueidentifier] NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_CustomerVehicleDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 6/12/2021 11:19:37 AM ******/
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
/****** Object:  Table [dbo].[VehicleBrand]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VehicleBrand](
	[Id] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](50) NULL,
	[SubBrand] [nvarchar](50) NULL,
	[PublicId] [uniqueidentifier] NOT NULL,
	[VehicleType] [int] NULL,
 CONSTRAINT [PK_VehicleBrand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[UserDetails] ADD  CONSTRAINT [DF_UserDetails_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CustomBilling]  WITH CHECK ADD  CONSTRAINT [FK_CustomBilling_Agency] FOREIGN KEY([AgencyId])
REFERENCES [dbo].[Agency] ([Id])
GO
ALTER TABLE [dbo].[CustomBilling] CHECK CONSTRAINT [FK_CustomBilling_Agency]
GO
ALTER TABLE [dbo].[CustomBilling]  WITH CHECK ADD  CONSTRAINT [FK_CustomBilling_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[CustomBilling] CHECK CONSTRAINT [FK_CustomBilling_Customer]
GO
ALTER TABLE [dbo].[CustomBilling]  WITH CHECK ADD  CONSTRAINT [FK_CustomBilling_CustomerVehicleDetails] FOREIGN KEY([CustomerVehicleId])
REFERENCES [dbo].[CustomerVehicleDetails] ([Id])
GO
ALTER TABLE [dbo].[CustomBilling] CHECK CONSTRAINT [FK_CustomBilling_CustomerVehicleDetails]
GO
ALTER TABLE [dbo].[CustomBilling]  WITH CHECK ADD  CONSTRAINT [FK_CustomBilling_UserDetails] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserDetails] ([Id])
GO
ALTER TABLE [dbo].[CustomBilling] CHECK CONSTRAINT [FK_CustomBilling_UserDetails]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Agency] FOREIGN KEY([AgencyId])
REFERENCES [dbo].[Agency] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Agency]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_Agency] FOREIGN KEY([AgencyId])
REFERENCES [dbo].[Agency] ([Id])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [FK_UserDetails_Agency]
GO
/****** Object:  StoredProcedure [dbo].[AddBrands]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AddBrands](
@brandName nvarchar(250),
@modelName nvarchar(50),
@vehicleType int,
@msg nvarchar(50) output
)
as
begin
	SET NOCOUNT ON
	DECLARE @ErrorMessage NVARCHAR(MAX)
	BEGIN TRY
	if not exists (select * from VehicleBrand where BrandName =@brandName and SubBrand = @modelName and VehicleType = @vehicleType)
		begin
			insert into VehicleBrand (BrandName,SubBrand,VehicleType, PublicId) values(@brandName,@modelName,@vehicleType, NEWID())
			set @msg = 'Created Successfuly.'
		end
	else
		set @msg = 'Already Exists!.'
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE()
		RAISERROR (@ErrorMessage, 10, 1)
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[AddCustomer]    Script Date: 6/12/2021 11:19:37 AM ******/
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
 declare @userGeneratedId uniqueidentifier
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
							set @userGeneratedId = NEWID()
							insert into dbo.Customer
							(PublicId,Name,EmailId,MobileNo,Address,City,State,Pincode,AgencyId, CreatedDateTime, UpdatedDateTime) values
							(@userGeneratedId,@Name,@EmailId,@MobileNo,@Address,@City,@State,@PinCode,@agencyNumericId, GETDATE(),GETDATE())
							set @msg = @userGeneratedId
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
/****** Object:  StoredProcedure [dbo].[AddServicing]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddServicing]
(
@vehicleNo nvarchar(50),
@brandDetail uniqueidentifier,
@userId uniqueidentifier,
@customerId uniqueidentifier,
@vehicleType int,
@serviceingData ServiceDetails readonly,
@Agencyid uniqueidentifier,
@msg nvarchar(50) output
)
as
begin
if exists (select Name from Customer where PublicId = @customerId)
begin
    declare @agencyNumericId int = 0
    declare @customerNumericId decimal(18,0)
	declare @vehicleBrandNumericId decimal(18,0)
	declare @totalData int
	declare @publicIdForVehicle uniqueidentifier
	declare @numericForVehicle decimal(18,0)
	set @publicIdForVehicle = NEWID()
	set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
	set @customerNumericId = (select Id from customer where PublicId=@customerId)
	set @vehicleBrandNumericId = (select Id from VehicleBrand where PublicId=@brandDetail)
	insert into CustomerVehicleDetails (CustomerId,VehicleNo, VehicleBrand,CreatedDate,PublicId) 
	values(@customerNumericId,@vehicleNo,@vehicleBrandNumericId,GETDATE(),@publicIdForVehicle)
	set @numericForVehicle = (select Id from CustomerVehicleDetails where PublicId = @publicIdForVehicle)
	DECLARE @CustomInfo NVARCHAR(250)  
	DECLARE @Quantity float 
	DECLARE @Price float  
	DECLARE @Comment NVARCHAR(650)
	DECLARE SERVICE_CURSOR CURSOR  
	LOCAL  FORWARD_ONLY  FOR  
	SELECT * FROM @serviceingData  
	OPEN SERVICE_CURSOR  
	FETCH NEXT FROM SERVICE_CURSOR INTO  @CustomInfo ,@Quantity,@Price,@Comment  
		WHILE @@FETCH_STATUS = 0  
			BEGIN  
				insert into CustomBilling 
					(CustomInfo,Quantity,Price,AgencyId,CustomerId,UserId,LastUpdateDateTime,PublicId,Comment,CustomerVehicleId)
					values (
					@CustomInfo,
					@quantity,
					@price,
					@agencyNumericId,
					@customerNumericId,
					2,
					GETDATE(),
					NEWID(),
					@comment,
					@numericForVehicle) 
				FETCH NEXT FROM SERVICE_CURSOR INTO  @CustomInfo ,@Quantity,@Price,@Comment   
			END  
	CLOSE SERVICE_CURSOR  
	DEALLOCATE SERVICE_CURSOR 
end
end
GO
/****** Object:  StoredProcedure [dbo].[AddUser]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------------

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
/****** Object:  StoredProcedure [dbo].[AgencySummery]    Script Date: 6/12/2021 11:19:37 AM ******/
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
 declare @vehicleCount int = 0
 declare @customerCount int = 0
	BEGIN TRY
	set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
			if (@agencyNumericId <> 0)
				begin
					set @vehicleCount =(select count(*) from dbo.CustomerVehicleDetails)
					set @customerCount =(select count(*) from dbo.Customer where AgencyId = @agencyNumericId)
					select @vehicleCount as TotalVehicle,@customerCount as TotalCustomer
				end
	END TRY
	BEGIN CATCH
		SELECT @ErrorMessage = ERROR_MESSAGE()
		RAISERROR (@ErrorMessage, 10, 1)
	END CATCH
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------------

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
/****** Object:  StoredProcedure [dbo].[ExceptionLoggingToDataBase]    Script Date: 6/12/2021 11:19:37 AM ******/
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
/****** Object:  StoredProcedure [dbo].[GenerateInvoice]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GenerateInvoice]
(
@agencyId uniqueidentifier,
@customerId uniqueidentifier,
@vehicleId nvarchar(20),
@date nvarchar(20)
)
as
begin
exec GetSettings @agencyId
exec GetCustomerById @agencyId, @customerId
exec GetCustomerBilling @vehicleId,@date
select BrandName, SubBrand, case 
		when VehicleType = 0 then 'Two Wheeler' 
		when VehicleType = 1 then 'Three Wheeler' 
		when VehicleType = 2 then 'Four Wheeler'
		else 'Heavy Vehicle'
		end as VehicleType  from VehicleBrand where id=(select top(1) vehicleBrand from CustomerVehicleDetails where VehicleNo=@vehicleId)
end
GO
/****** Object:  StoredProcedure [dbo].[GetBrandsDetail]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetBrandsDetail] as 
begin
	select BrandName,SubBrand,
	case 
		when VehicleType = 0 then 'Two Wheeler' 
		when VehicleType = 1 then 'Three Wheeler' 
		when VehicleType = 2 then 'Four Wheeler'
		else 'Heavy Vehicle'
		end as VehicleType, PublicId from VehicleBrand
end
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerBilling]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetCustomerBilling]
(
@vehicleNumber nvarchar(20),
@serviceDate datetime
)
as
begin
declare @vehicleIdNumeric decimal(18,0)
set @vehicleIdNumeric = (select top(1) Id from CustomerVehicleDetails where VehicleNo=@vehicleNumber and DATEDIFF(day, @serviceDate, CreatedDate) = 0)
select CustomInfo,Quantity,Comment,price,LastUpdateDateTime from CustomBilling where CustomerVehicleId=@vehicleIdNumeric
end
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerById]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------
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
/****** Object:  StoredProcedure [dbo].[GetCustomers]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------
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
/****** Object:  StoredProcedure [dbo].[GetCustomerVehicles]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[GetCustomerVehicles](
  @customerId uniqueidentifier
  )
  as
  begin
  select distinct VehicleNo from CustomerVehicleDetails where CustomerId =(select Id from customer where PublicId=@customerId)
  end
GO
/****** Object:  StoredProcedure [dbo].[GetModels]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetModels] (
@brandId uniqueidentifier
)
as
begin
select SubBrand from VehicleBrand where BrandName = ( select BrandName from VehicleBrand where PublicId =@brandId)
end
GO
/****** Object:  StoredProcedure [dbo].[GetSettings]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------
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
/****** Object:  StoredProcedure [dbo].[GetUserById]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------
CREATE procedure [dbo].[GetUserById]
(
@agencyId uniqueidentifier,
@userId uniqueidentifier
)
as
begin
SET NOCOUNT ON
declare @agencyNumericId int = 0
set @agencyNumericId = (select Id from dbo.Agency where PublicId=@Agencyid)
if (@agencyNumericId <> 0)
begin
	select PublicId, Name, EmailId, MobileNo, Address,City,State,Pincode,IsActive,DeactivationDate,Password
	from UserDetails where AgencyId= @agencyNumericId and PublicId=@userId
end
end
GO
/****** Object:  StoredProcedure [dbo].[GetUserData]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-------------------------------------
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
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------
CREATE procedure [dbo].[GetUsers]
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
	select PublicId, Name, EmailId, MobileNo, Address,City,State,Pincode,IsActive,DeactivationDate,Password
	from UserDetails where AgencyId= @agencyNumericId order by id desc
end
end
GO
/****** Object:  StoredProcedure [dbo].[GetVehicleServiceBillingDate]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  create procedure [dbo].[GetVehicleServiceBillingDate](
  @vehicleNumber nvarchar(20)
  )
  as
  begin
  select a.CreatedDate, b.BrandName, b.SubBrand,b.VehicleType from CustomerVehicleDetails a inner join 
  VehicleBrand b on a.VehicleBrand = b.Id where a.VehicleNo=@vehicleNumber
  end
GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------
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
/****** Object:  StoredProcedure [dbo].[UpdateSetting]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------

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
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 6/12/2021 11:19:37 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------
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
GO
