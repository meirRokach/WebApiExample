# WebApiExample

to check to WebAPI  works properly  

1 .clone the project to local computer  
2. execute the CreateData sql script to create the data  
3. configurate the connection string on the web.config  
4. Run the project  

first method  
fetch('https://localhost:44323/Api/Home/GetAgentHighestOrderSum?year=2020', {  
    headers: {  
    'ApiKey': '22222222'  
  }  
}).then(res => res.json())  

second method  
fetch('https://localhost:44323/Api/Home/GetAgentWithOrder?agentList=A004,A002&orderChronologicall=2', {  
    headers: {  
    'ApiKey': '222222'  
  }  
}).then(res => res.json())  
  
third method   
  
fetch('https://localhost:44323/Api/Home/GetAgentWithOrdersByYearAndCount?year=2020&count=2', {  
    headers: {  
    'ApiKey': '22222222'  
  }  
}).then(res => res.json())  
  
