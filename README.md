# WebApiExample

to check to WebAPI  works properly  



1. clone the project to local computer  
2. execute the CreateData.sql to create the tables and SP
3. change the connetion string on web.Config
4. run swagger ui https://localhost:44323/swagger/ui/index


first method  
GetAgentHighestOrderSum   year=2020  
  
second method  
GetAgentWithOrder  
agentList=A004,A002  
orderChronologicall=2  

third method   
GetAgentWithOrdersByYearAndCount  
year=2020  
count=2  

