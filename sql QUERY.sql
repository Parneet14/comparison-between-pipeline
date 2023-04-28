                                                        /****** OILPIPELINE ******/
/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Date]
      ,[Month]
      ,[Year]
      ,[Company]
      ,[Pipeline]
      ,[Key Point]
      ,[Latitude]
      ,[Longitude]
      ,[Direction Of Flow]
      ,[Trade Type]
      ,[Product]
      ,[Throughput (1000 m3 d)]
      ,[Nameplate Capacity (1000 m3 d)]
      ,[Available Capacity (1000 m3 d)]
      ,[Reason For Variance]
  FROM [AdventureWorks2019].[dbo].[Pcochin-throughput-and-capacity]

  /* delete rows and columns not required*/
  delete from [dbo].[Pcochin-throughput-and-capacity] where Year<2019
  alter table [dbo].[Pcochin-throughput-and-capacity] drop column [Nameplate Capacity (1000 m3 d)], [Reason for Variance]
  select* from [dbo].[Pcochin-throughput-and-capacity]

  delete from [dbo].[Penbridge-line9-throughput-and-capacity] where Year<2019
  alter table   [dbo].[Penbridge-line9-throughput-and-capacity] drop column [Nameplate Capacity (1000 m3 d)], [Reason for Variance]
  select* from [dbo].[Penbridge-line9-throughput-and-capacity]

  delete from [dbo].[Pkeystone-throughput-and-capacity] where Year<2019
  alter table [dbo].[Pkeystone-throughput-and-capacity] drop column [Nameplate Capacity (1000 m3 d)], [Reason for Variance]
  select* from [dbo].[Pkeystone-throughput-and-capacity]
  
  delete from[dbo].[Pmontreal-throughput-and-capacityP]  where Year<2019
  alter table [dbo].[Pmontreal-throughput-and-capacityP] drop column [Nameplate Capacity (1000 m3 d)], [Reason for Variance]
  select* from [dbo].[Pmontreal-throughput-and-capacityP]

  delete from  [dbo].[Pnorman-wells-throughput-and-capacity]where Year<2019
  alter table [dbo].[Pnorman-wells-throughput-and-capacity] drop column [Nameplate Capacity (1000 m3 d)], [Reason for Variance]
  select* from [dbo].[Pnorman-wells-throughput-and-capacity]

  delete from[dbo].[Psouthern-lights-throughput-and-capacity] where Year<2019
  alter table [dbo].[Psouthern-lights-throughput-and-capacity] drop column [Nameplate Capacity (1000 m3 d)], [Reason for Variance]
  select* from [dbo].[Psouthern-lights-throughput-and-capacity]

  delete from [dbo].[Pwestspur-throughput-and-capacity]where Year<2019
  alter table [dbo].[Pwestspur-throughput-and-capacity] drop column [Nameplate Capacity (1000 m3 d)], [Reason for Variance]
  select* from [dbo].[Pwestspur-throughput-and-capacity]

   delete from [dbo].[Ptrans-northern-throughput-and-capacity] where Year<2019
  alter table [dbo].[Ptrans-northern-throughput-and-capacity] drop column [Nameplate Capacity (1000 m3 d)], [Reason for Variance]
  select* from [dbo].[Ptrans-northern-throughput-and-capacity]

  delete from [dbo].[Ptrans-mountain-throughput-and-capacity]where Year<2019
  alter table  [dbo].[Ptrans-mountain-throughput-and-capacity]drop column [Nameplate Capacity (1000 m3 d)], [Reason for Variance]
  select* from [dbo].[Ptrans-mountain-throughput-and-capacity]
  ./* Handling Blank Values*/
  update [dbo].[Pwestspur-throughput-and-capacity] set Latitude='N/A' ,Longitude ='N/A' where  [Key Point] ='system'
   update [dbo].[Ptrans-northern-throughput-and-capacity] set Latitude='N/A' ,Longitude ='N/A' where  [Key Point] ='system'
    update [dbo].[Ptrans-northern-throughput-and-capacity] set [Direction Of Flow]='N/A Bidirectional' where  [Direction Of Flow] ='not available'
	 update  [dbo].[Ptrans-mountain-throughput-and-capacity] set Latitude='N/A' ,Longitude ='N/A' where  [Key Point] ='system'
   update [dbo].[Ptrans-mountain-throughput-and-capacity] set[Available Capacity (1000 m3 d)]='28' where [Key Point]='Burnaby'
    update [dbo].[Ptrans-mountain-throughput-and-capacity] set[Available Capacity (1000 m3 d)]='28' where [Key Point]='Burnaby'
	 update [dbo].[Ptrans-mountain-throughput-and-capacity] set[Available Capacity (1000 m3 d)]='47' where [Key Point]='westridge'

 /* Joining all oil Pipelines*/

 select* into OilPipeline from  [dbo].[Pcochin-throughput-and-capacity]
Union all
select*from [dbo].[Penbridge-line9-throughput-and-capacity]
Union all
select*from [dbo].[Pkeystone-throughput-and-capacity]
Union all
select*from [dbo].[Pmontreal-throughput-and-capacityP]
Union all
select*from [dbo].[Pnorman-wells-throughput-and-capacity]
Union all
select*from [dbo].[Psouthern-lights-throughput-and-capacity]
Union all
select*from [dbo].[Ptrans-mountain-throughput-and-capacity]
Union all
select*from [dbo].[Ptrans-northern-throughput-and-capacity]
Union all
select*from [dbo].[Pwestspur-throughput-and-capacity]

 /*Standardize date format*/
select Date ,convert(Date,Date) from [dbo].[OilPipeline]
Alter table[dbo].[Oilpipeline]
add Dateconverted Date
select* from OilPipeline
update  OilPipeline set Dateconverted=convert(Date,Date)
select *from OilPipeline
alter table OilPipeline drop column [Date]

                                                        /* GASPIPELINE*/
/*Read Data*/
SELECT TOP (1000) [Date]
      ,[Day]
      ,[Month]
      ,[Year]
      ,[Company]
      ,[Pipeline]
      ,[Key Point]
      ,[Latitude]
      ,[Longitude]
      ,[Direction Of Flow]
      ,[Trade Type]
      ,[Capacity (1000 m3 d)]
      ,[Throughput (1000 m3 d)]
      ,[Throughput (GJ d)]
  FROM [master].[dbo].[Gbrunswick-throughput-and-capacity]
  /* deleted Unwanted rows*/
  delete from [master].[dbo].[Gbrunswick-throughput-and-capacity] where Year<2019
  /* delete unrequired Column*/
  alter table [Gbrunswick-throughput-and-capacity] drop column [Throughput (GJ d)]
  /*Change Datatype*/
  alter table  [master].[dbo].[Gbrunswick-throughput-and-capacity] alter column [Capacity (1000 m3 d)] decimal
  alter table  [master].[dbo].[Gbrunswick-throughput-and-capacity] alter column [Throughput (1000 m3 d)] decimal
/*delete unwanted rows and columns*/
  delete from  [master].[dbo].[Gfoothills-throughput-and-capacity] where Year<2019
  alter table  [master].[dbo].[Gfoothills-throughput-and-capacity] drop column [Throughput (GJ d)]

  delete from  [master].[dbo].[Gngtl-throughput-and-capacity] where Year<2019
  alter table [master].[dbo]. [Gngtl-throughput-and-capacity]  drop column [Throughput (GJ d)]

delete from  [master].[dbo]. [Gtcpl-mainline-throughput-and-capacity] where Year<2019
  alter table  [master].[dbo].[Gtcpl-mainline-throughput-and-capacity] drop column [Throughput (GJ d)]

delete from  [master].[dbo].[Gtqm-throughput-and-capacity] where Year<2019
  alter table  [master].[dbo]. [Gtqm-throughput-and-capacity] drop column [Throughput (GJ d)]


delete from  [master].[dbo].[Gwestcoast-throughput-and-capacity] where Year<2019
  alter table [master].[dbo]. [Gwestcoast-throughput-and-capacity] drop column [Throughput (GJ d)]

   /*Combining all data to one table*/
 select* into GasPipeline3 from  [master].[dbo].[Galliance-throughput-and-capacity]


  Union all
  SELECT [Date]
      ,[Day]
      ,[Month]
      ,[Year]
      ,[Company]
      ,[Pipeline]
      ,[Key Point]
      ,[Latitude]
      ,[Longitude]
      ,[Direction Of Flow]
      ,[Trade Type]
      ,[Capacity (1000 m3 d)]
      ,[Throughput (1000 m3 d)]
      
  FROM [master].[dbo].[Gbrunswick-throughput-and-capacity]
  Union all
  SELECT  [Date]
      ,[Day]
      ,[Month]
      ,[Year]
      ,[Company]
      ,[Pipeline]
      ,[Key Point]
      ,[Latitude]
      ,[Longitude]
      ,[Direction Of Flow]
      ,[Trade Type]
      ,[Capacity (1000 m3 d)]
      ,[Throughput (1000 m3 d)]
     
  FROM [master].[dbo].[Gfoothills-throughput-and-capacity]
  union all
  SELECT [Date]
      ,[Day]
      ,[Month]
      ,[Year]
      ,[Company]
      ,[Pipeline]
      ,[Key Point]
      ,[Latitude]
      ,[Longitude]
      ,[Direction Of Flow]
      ,[Trade Type]
      ,[Capacity (1000 m3 d)]
      ,[Throughput (1000 m3 d)]
     
  FROM [master].[dbo].[Gngtl-throughput-and-capacity]
  union all
  SELECT [Date]
      ,[Day]
      ,[Month]
      ,[Year]
      ,[Company]
      ,[Pipeline]
      ,[Key Point]
      ,[Latitude]
      ,[Longitude]
      ,[Direction Of Flow]
      ,[Trade Type]
      ,[Capacity (1000 m3 d)]
      ,[Throughput (1000 m3 d)]
     
  FROM [master].[dbo].[Gtcpl-mainline-throughput-and-capacity]

  union all
  SELECT [Date]
      ,[Day]
      ,[Month]
      ,[Year]
      ,[Company]
      ,[Pipeline]
      ,[Key Point]
      ,[Latitude]
      ,[Longitude]
      ,[Direction Of Flow]
      ,[Trade Type]
      ,[Capacity (1000 m3 d)]
      ,[Throughput (1000 m3 d)]
     
  FROM [master].[dbo].[Gtqm-throughput-and-capacity]
  union all
  SELECT [Date]
      ,[Day]
      ,[Month]
      ,[Year]
      ,[Company]
      ,[Pipeline]
      ,[Key Point]
      ,[Latitude]
      ,[Longitude]
      ,[Direction Of Flow]
      ,[Trade Type]
      ,[Capacity (1000 m3 d)]
      ,[Throughput (1000 m3 d)]
     
  FROM [master].[dbo].[Gwestcoast-throughput-and-capacity]



select distinct Company from GasPipeline3
update GasPipeline3 set Company=' Trans Québec and Maritimes Pipeline Inc.'where Company='Trans QuÃ©bec and Maritimes Pipeline Inc.'

/*replace null values with not applicable for Brunwick pipeline as measurement done throughout the pipe*/
update GasPipeline3 set Latitude='N/A' ,Longitude ='N/A' where Company ='Emera Brunswick Pipeline Company Ltd.'
drop table  [master].[dbo].dimCompany

/*Creation of dimnsion tables*/
Create Table [AdventureWorks2019].[dbo].[dimCompany](Companyid varchar(100) Primary Key, Company varchar(100),Pipeline varchar(100))

/*insertion of data in dimension Table manually*/
insert into [AdventureWorks2019].[dbo].[dimCompany] values ('Alliance01', 'Alliance Pipeline Ltd.','Alliance Pipeline')

insert into  [AdventureWorks2019].[dbo].[dimCompany] values ('Brunwick01', 'Emera Brunswick Pipeline Company Ltd.','Brunswick Pipeline'),
('Foothill01', 'Foothills Pipe Lines Ltd.','Foothills System'),
('Nova01', 'NOVA Gas Transmission Ltd.','Ngtl System'),
('Transcan01', 'TransCanada PipeLines Limited','TC Canadian Mainline'),
('TransQuebec01', 'Trans Québec and Maritimes Pipeline Inc.','TQM Pipeline'),
('Westcoast01', 'Westcoast Energy Inc.','Enbridge BC Pipeline')
Select *from dimCompany

Create table [AdventureWorks2019].[dbo].[ dimkeypoint](keypointid varchar(100)primary key,keypoint varchar(100),Latitude varchar(100),Longitude varchar(100),Direction varchar(100),Trade Varchar(100))

Insert into [AdventureWorks2019].[dbo].[ dimkeypoint] values('BorderAll01','Border', '49',	'-101.588','southeast','export'),
('ZoneAll02','Zone 2','	55.8558',	'-119.591','southeast','intracanada'),
('Kingsgatehills01','Kingsgate',	'49.0015','-116.187',	'south'	,'export'),
('Monchyhill02','Monchy',	'49.0004',	'-107.544',	'southeast',	'export'),
('sustemwick01','system','N/A','N/A','west',	'export'),
('Calgaryngtl01','Calgary',	'51.22022',	'-114.4925',	'west & south','intracanada'),
('EastGatengtl02','East Gate',	'50.6608','-110.028',	'east & southeast',	'intracanada'),
('Edmonton03','Edmonton',	'51.80478',	'-113.59329','east & north','	intracanada'),
('Northngtl04','North and East'	,'53.6374',	'-112.018','	east & north',	'intracanada'),
('osdakirbyngtl05','OSDA Kirby','	53.31907',	'-111.35386',	'east & north',	'intracanada'),
('osdaliegangtl06','OSDA Liege',	'56.9473','	-111.80979',	'east & north','intracanada'),
('Saturnngtl07','Saturn',	'55.99558',	'-121.1104','southeast',	'intracanada'),
('upstramngtl08','Upstream of James River','51.9475','-114.74','	southeast & east','	intracanada'),
('West ngtl08','West Gate','	49.6348',	'-114.588','	west','intracanada'),
('Easttqm01','East Hereford	','45.033',	'-71.5',	'south','	export'),
('Sainttqm02','Saint Lazare','5.3713','-74.1249','	east','intracanada'),
('SAinttqm03','Saint Lazare + Sabrevois',	'45.3713','	-74.1249',	'east','	intracanada'),
('fortiswest01','FortisBC Lower Mainland',	'49.0034',	'-122.22','	west',	'intracanada'),
('hungtingdonwest02','Huntingdon Export',	'49.0034',	'-122.22',	'south','export'),
('kingsvalewest03','Kingsvale','	49.9583','	-120.916',	'east',	'intracanada'),
('novawest04','NOVA/Gordondale','	55.8643',	'-119.568','	east',	'intracanada'),
('Sunsetest05','Sunset Creek',	'55.8136',	'-120.867','	east',	'intracanada'),
('Chippawatcpl01','Chippawa',	'43.0046',	'-79.0546',	'east',	'export'),
('EasternPRtcpl02','Eastern Triangle - Parkway Receipts',	'43.5699',	'-79.7858','north','	intracanada'),
('EmersonItcpl03','Emerson I',	'49.0018',	'-97.0571','south',	'export'),
('Iroquoistcpl04','Iroquois',	'44.8556',	'-75.2667',	'west',	'import'),
('Nigaratcpl05','Niagara',	'43.1922',	'-79.0693',	'east',	'export'),
('Northerntcpl06','Northern Ontario Line',	'49.718',	'-96.9859','east',	'intracanada'),
('othertcpl07','Other US Northeast',	'45.0236',	'-73.0546',	'south',	'export'),
('Prairiestcpl08','Prairies',	'50.6836',	'-110.087','east',	'intracanada'),
('EmersonIItcpl09','Emerson II',	'49.0012',	'-97.0561','north',	'import'),
('EasternNOLtcpl10','Eastern Triangle - NOL Receipts','46.379','-79.4704','east','intracanada'),
('EasternPdtcpl11','Eastern Triangle - Parkway Deliveries','43.5699','-79.7858','south','intracanada')


drop table dimdate

create table [AdventureWorks2019].[dbo].[dimdate]([Date] date Primary Key,month varchar(500),year varchar(100))


/*insertion of data in dimensional table with the help of command*/
insert into [AdventureWorks2019].[dbo].[dimdate](date,month,year)
select distinct [date] as date,month as Month,year as Year
from  [dbo].[GasPipeline]


select * from dimdate
/*Standardize date format*/
select Date ,convert(Date,Date) from[dbo].[GasPipeline3]
Alter table [dbo].[GasPipeline3]
add Dateconverted Date
update  [dbo].[GasPipeline3] set Dateconverted=convert(Date,Date)

select distinct company from  [dbo].[GasPipeline3]
update [dbo].[GasPipeline3] set Company= LTRIM(Company)where Company=' Trans Québec and Maritimes Pipeline Inc.'
select distinct company from  [dbo].[dimCompany]
	
alter table  [dbo].[GasPipeline3] drop column [Date]

/*creation and insertion of data in Fact table*/
Create table [AdventureWorks2019].[dbo].[FactGaspipeline] (Companyid varchar(100),keypointid varchar(100),Date date,[Capacity(1000 m3 d)] decimal,[Throughput (1000 m3 d)] decimal)
insert into [AdventureWorks2019].[dbo].[FactGaspipeline]
select c.Companyid as [Companyid],
k.keypointid  as[Keypointid],
d.Date as [Date] ,
G.[Capacity (1000 m3 d)] as[Capacity (1000 m3 d)],
G.[Throughput (1000 m3 d)] as[Throughput (1000 m3 d)]
from [dbo].[Gaspipeline3] G,[AdventureWorks2019].dbo.[ dimkeypoint] k,[AdventureWorks2019].[dbo].[dimCompany] c,[AdventureWorks2019].[dbo].[dimdate] d
where G.[Company]=c.Company and
G.[Key Point]= k.keypoint and
G.[Date]=d.Date


                                                   /*INCIDENT TABLE*/


/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Incident Number]
      ,[Incident Types]
      ,[Reported Date]
      ,[Nearest Populated Centre]
      ,[Province]
      ,[Company]
      ,[Status]
      ,[Latitude]
      ,[Longitude]
      ,[Approximate Volume Released (m3)]
      ,[Substance]
      ,[Release Type]
      ,[Significant]
      ,[Year]
      ,[What Happened]
      ,[Why It Happened]
  FROM [AdventureWorks2019].[dbo].[pipeline-incident]

  /*delete unwanted Rows */
  delete from  [dbo].[pipeline-incident]where Year<2019
  alter table [dbo].[pipeline-incident] drop column [Nearest Populated Centre]
  delete from [dbo].[pipeline-incident] where Year='2023'

 /* to separate Province Column*/
  select substring([Nearest Populated Centre],1,charindex(',',[Nearest Populated Centre]))as centre ,
 substring([Nearest Populated Centre],charindex(',',[Nearest Populated Centre]),len([Nearest Populated Centre]))as centre from[dbo].[pipeline-incident]
  Alter table[dbo].[pipeline-incident]  add centre varchar(100)
  update [dbo].[pipeline-incident] set  centre=
    CASE 
        WHEN CHARINDEX(',', [Nearest Populated Centre], 0) = 0
            THEN [Nearest Populated Centre]
        ELSE LEFT([Nearest Populated Centre], CHARINDEX(',', [Nearest Populated Centre], 0)-1)
        END 
   /* changes to Names*/
		select distinct centre from[dbo].[pipeline-incident] where centre like'Z%'
		update [dbo].[pipeline-incident] set  centre='Burnaby' where centre=' City of Burnaby '
			update [dbo].[pipeline-incident] set  centre='Chilliwack' where centre='Chiliwack'
			update [dbo].[pipeline-incident] set  centre='City of Kamloops' where centre='Kamloops BC'
			update [dbo].[pipeline-incident] set  centre='Unknown' where centre like'6%%'
		select distinct [Year]from[dbo].[pipeline-incident]
		
		update [dbo].[pipeline-incident] set [Company] ='Foothills Pipe Lines Ltd.' where [Company]='Foothills Pipe Lines (South B.C.) Ltd.'

