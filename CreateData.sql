

CREATE TABLE  AGENTS 

   (
    AGENT_CODE varchar(6) NOT NULL PRIMARY KEY, 
AGENT_NAME varchar(40), 
WORKING_AREA varchar(35), 
COMMISSION INT, 
PHONE_NO varchar(15), 
COUNTRY varchar(25) 
 );
INSERT INTO AGENTS VALUES ('A005', 'Anderson', 'Brisban', 13, '045-21447739', '');
INSERT INTO AGENTS VALUES ('A001', 'Subbarao', 'Bangalore', 14, '077-12346674', '');
INSERT INTO AGENTS VALUES ('A002', 'Mukesh', 'Mumbai', 11, '029-12358964', '');
INSERT INTO AGENTS VALUES ('A006', 'McDen', 'London', 15, '078-22255588', '');
INSERT INTO AGENTS VALUES ('A004', 'Ivan', 'Torento', 15, '008-22544166', '');
INSERT INTO AGENTS VALUES ('A009', 'Benjamin', 'Hampshair', 11, '008-22536178', '');
INSERT INTO AGENTS VALUES ('A008', 'Alford', 'New York', 12, '044-25874365', '');
INSERT INTO AGENTS VALUES ('A011', 'Ravi Kumar', 'Bangalore', 15, '077-45625874', '');
INSERT INTO AGENTS VALUES ('A012', 'Lucida', 'San Jose', 12, '044-52981425', '');
CREATE TABLE  ORDERS 
   (
    ORD_NUM INT  NOT NULL PRIMARY KEY, 
ORD_AMOUNT FLOAT NOT NULL, 
ADVANCE_AMOUNT FLOAT NOT NULL, 
ORD_DATE DATETIME NOT NULL, 
CUST_CODE VARCHAR(6) NOT NULL, 
AGENT_CODE VARCHAR(6) NOT NULL, 
ORD_DESCRIPTION VARCHAR(60) NOT NULL
   );
INSERT INTO ORDERS VALUES(200116, '600.00', '200.00', '11-18-2021', 'C00010', 'A009', 
'ADR');
INSERT INTO ORDERS VALUES(200113, '4000.00', '600.00', '06-19-2021', 'C00022', 'A002', 
'ADR');
INSERT INTO ORDERS VALUES(200102, '2000.00', '300.00', '05-05-2021', 'C00012', 'A012', 
'ADR');
INSERT INTO ORDERS VALUES(200114, '3500.00', '2000.00', '08-18-2021', 'C00002', 'A008', 
'ADR');
INSERT INTO ORDERS VALUES(200122, '2500.00', '400.00', '09-17-2021', 'C00003', 'A004', 
'ADR');
INSERT INTO ORDERS VALUES(200118, '500.00', '100.00', '09-04-2020', 'C00023', 'A006', 
'ADR');
INSERT INTO ORDERS VALUES(200121, '1500.00', '600.00', '03-19-2021', 'C00008', 'A004', 
'ADR');
INSERT INTO ORDERS VALUES(200130, '2500.00', '400.00', '03-07-2021', 'C00025', 'A011', 
'ADR');
INSERT INTO ORDERS VALUES(200134, '4200.00', '1800.00', '05-19-2020', 'C00004', 'A005', 
'ADR');
INSERT INTO ORDERS VALUES(200108, '4000.00', '600.00', '02-11-2021', 'C00008', 'A004', 
'ADR');
INSERT INTO ORDERS VALUES(200115, '900.00', '700.00', '12-12-2020', 'C00010', 'A009', 
'ADR');
INSERT INTO ORDERS VALUES(200103, '1500.00', '700.00', '11-05-2021', 'C00021', 'A005', 
'ADR');
INSERT INTO ORDERS VALUES(200105, '2500.00', '500.00', '11-08-2020', 'C00025', 'A011', 
'ADR');
INSERT INTO ORDERS VALUES(200101, '3000.00', '1000.00', '07-15-2021', 'C00001', 'A008', 
'ADR');
INSERT INTO ORDERS VALUES(200111, '1000.00', '300.00', '07-10-2021', 'C00020', 'A008', 
'ADR');
INSERT INTO ORDERS VALUES(200104, '1500.00', '500.00', '03-13-2021', 'C00006', 'A004', 
'ADR');
INSERT INTO ORDERS VALUES(200106, '2500.00', '700.00', '02-04-2020', 'C00005', 'A002', 
'ADR');
INSERT INTO ORDERS VALUES(200125, '2000.00', '600.00', '10-10-2020', 'C00018', 'A005', 
'ADR');
INSERT INTO ORDERS VALUES(200117, '800.00', '200.00', '10-11-2021', 'C00014', 'A001', 
'ADR');
INSERT INTO ORDERS VALUES(200123, '500.00', '100.00', '09-12-2021', 'C00022', 'A002', 
'ADR');
INSERT INTO ORDERS VALUES(200120, '500.00', '100.00', '07-06-2020', 'C00009', 'A002', 
'ADR');
INSERT INTO ORDERS VALUES(200002, '1000.00', '400.00', '05-15-2022', 'C00012', 'A012', 
'ADR');
INSERT INTO ORDERS VALUES(200014, '500.00', '100.00', '07-11-2020', 'C00010', 'A009', 
'ADR');
INSERT INTO ORDERS VALUES(200023, '500.00', '100.00', '04-04-2021', 'C00022', 'A002', 
'ADR');
INSERT INTO ORDERS VALUES(200112, '600.00', '200.00', '10-12-2020', 'C00023', 'A006', 
'ADR');
INSERT INTO ORDERS VALUES(201011, '300.00', '200.00', '12-02-2020', 'C00023', 'A006', 
'ADR');
INSERT INTO ORDERS VALUES(201012, '600.00', '200.00', '01-03-2020', 'C00023', 'A004', 
'ADR');
INSERT INTO ORDERS VALUES(201013, '300.00', '200.00', '10-02-2020', 'C00023', 'A004', 
'ADR');
INSERT INTO ORDERS VALUES(210108, '1800.00', '900.00', '12-04-2021', 'C00021', 'A005', 
'ADR');
INSERT INTO ORDERS VALUES(210109, '1800.00', '500.00', '10-04-2021', 'C00021', 'A005', 
'ADR');


/****** Object:  UserDefinedTableType [dbo].[idList]    Script Date: 29/01/2022 22:57:40 ******/
CREATE TYPE [dbo].[idList] AS TABLE(
	[ID] [nvarchar](50) NULL
)
GO



/****** Object:  StoredProcedure [dbo].[GetAgentHighestOrderSum]    Script Date: 29/01/2022 22:57:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAgentHighestOrderSum] 
	@year int
AS
BEGIN

declare @firstDayInquarter datetime = 	(SELECT DATEADD(qq, DATEDIFF(qq, 0, DATEFROMPARTS(@year,01, 01) ), 0));
declare @lastDayInquarter  datetime =   (SELECT DATEADD (dd, -1, DATEADD(qq, DATEDIFF(qq, 0,DATEFROMPARTS(@year,01, 01)) +1, 0)))


Select top 1  AGENT_CODE,ORD_AMOUNT_SUM  From 
(
	Select SUM(ORD_AMOUNT) as ORD_AMOUNT_SUM ,AGENT_CODE
	From ORDERS
	where ORD_DATE between @firstDayInquarter and @lastDayInquarter
	Group by AGENT_CODE
) as t Order by ORD_AMOUNT_SUM desc

END
GO



/****** Object:  StoredProcedure [dbo].[GetAgentWithOrder]    Script Date: 29/01/2022 22:58:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAgentWithOrder]
	(
		  @agentList AS dbo.idList READONLY,
		  @OrderChronologicall int
	)
AS
BEGIN

--drop type idList
--CREATE TYPE idList AS TABLE
--    (
--        ID nvarchar(50)
   
--    )

select AGENT_CODE,AGENT_NAME, PHONE_NO, ORD_NUM, ORD_DATE From 
(
Select ROW_NUMBER() over( partition by ORDERS.AGENT_CODE order by ORD_DATE) as RowNum,ORDERS.AGENT_CODE,AGENT_NAME, PHONE_NO, ORD_NUM, ORD_DATE From  ORDERS
inner join AGENTS on AGENTS.AGENT_CODE = ORDERS.AGENT_CODE
inner join @agentList al on al.ID = ORDERS.AGENT_CODE
) as R where R.RowNum = @OrderChronologicall


END
GO


/****** Object:  StoredProcedure [dbo].[GetAgentWithOrdersByYearAndCount]    Script Date: 29/01/2022 22:58:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAgentWithOrdersByYearAndCount]
	(
		@year int,
		@count int
	)
AS
BEGIN


WITH Order_CTE (OrdersCount,AGENT_CODE)  
AS  
(	
	Select COUNT(*) as OrdersCount ,AGENT_CODE From ORDERS 
	Where DATEPART(yyyy,ORD_DATE) =@year
	Group by AGENT_CODE
	Having COUNT(*) >= @count
)

SELECT AGENTS.AGENT_CODE, AGENT_NAME, PHONE_NO
FROM Order_CTE 
inner join AGENTS on AGENTS.AGENT_CODE = Order_CTE.AGENT_CODE
END
GO



