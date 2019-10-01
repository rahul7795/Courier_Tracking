use [Courier_Tracking_System]

create database [Courier_Tracking_System]

create table RoleMaster
(
  RoleID int identity primary key,
  RoleDescription varchar(50),
  CreatedOn Datetime,
  CreatedBy varchar(50),
  IsActive bit
)
insert into RoleMaster (RoleDescription,CreatedOn,CreatedBy,IsActive)
values
('SuperAdmin',getdate(),'System',1),
('Admin',getdate(),'System',1),
('Staff',getdate(),'System',1),
('User',getdate(),'System',1)

create table [Cts_User_Master]
(um_id int primary key identity(1,1),
um_userId varchar(15) unique, 
um_password varchar(15), 
um_firstName varchar(50), 
um_lastName varchar(50), 
um_gender varchar(6),
um_contact varchar(10),
um_emailId varchar(50),
um_isActive bit,
um_emp_cid as 'CTS200000' + convert(varchar, um_id),
um_Salary bigint,
um_Designation varchar(15),
um_PerAddress varchar(100),
um_CorAddress varchar(100),
um_created_On date, 
um_created_by varchar(20),
um_IsApprovedOn datetime,
um_IsApprovedBy varchar(50),
um_RoleId int References RoleMaster(RoleID))


insert into [Cts_User_Master]
(um_userId,um_password,um_firstName,um_lastName,um_gender,um_contact,um_emailId,um_isActive,um_emp_cid,um_Salary,um_Designation,um_PerAddress,um_CorAddress,um_created_On,um_created_by,um_IsApprovedOn,um_IsApprovedBy,um_RoleId)
values
('superadmin','123456','Super','Administrator','Male','9848012345','superadmin@gmail.com',1,'CTS11111', 500000, 'CEO','Chennai','Chennai',getdate(),'System',getdate(),'System',1),
('admin','123456','Administrator','Sample','Male','9849012345','admin@gmail.com',1,'CTS22222', 400000, 'Manager','Chennai','Chennai',getdate(),'System',getdate(),'System',2),
('staff','123456','Staff','Sample','Male','9899012345','agent@gmail.com',1,'CTS33333', 300000, 'Employee','Chennai','Chennai',getdate(),'System',getdate(),'System',3),
('user','123456','User','Sample','Male','7899012345','user@gmail.com',1,NULL,NULL, NULL,'Chennai','Chennai',getdate(),'System',getdate(),'System',4)


create table [Cts_Package]
(pk_consignment_id int primary key identity(20000,1), 
pk_Accept_Date date, 
pk_Package_weight float, 
pk_cost float, 
pk_Sender_address varchar(100), 
pk_Receiver_address varchar(100),
pk_package_type varchar(30),
pk_Employee_id varchar(8), 
pk_Customer_id int references [Cts_User_Master](um_id), 
pk_Current_location varchar(100), 
pk_Package_Status varchar(50), 
pk_isActive bit,
)

select * from [Cts_Package]

create table [Cts_BranchMaster]
(
  bm_branchCode int identity primary key,
  bm_branchName varchar(50),
  bm_IsActive bit,
)

alter table [Cts_BranchMaster]
add bm_orders int

insert into Cts_BranchMaster (bm_branchName,bm_IsActive)
values
('Hyderabad',1),('Chennai',1),('Banglore',1)
update Cts_User_Master 
set
um_isActive=null where um_userId='user'


update Cts_BranchMaster
set
bm_branchName='Delhi'
where bm_branchCode = 6