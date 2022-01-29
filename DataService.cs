using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using WebApiExample.Models;

namespace WebApiExample
{
    public class DataService
    {
            
        public static string GetAgentHighestOrderSum(int year)
        {
            using (var context = new TestEntities1())
            {
                var result = context.GetAgentHighestOrderSum(year).ToList();
                if (result.Count() > 0)
                {
                    return result.First().AGENT_CODE;
                }
            }
            return "";
        }

        public static List<AgentWithOrder> GetAgentWithOrder(List<string> agentList, int orderChronologicall)
        {

            List<AgentWithOrder> agentWithOrderList = new List<AgentWithOrder>();
            DataTable table = new DataTable();
            table.Columns.Add("ID", typeof(string));
            foreach (string id in agentList)
            {
                table.Rows.Add(id);
            }

            
            using (var context = new TestEntities1())
            {

                var parameter = new SqlParameter();
                parameter.SqlDbType = SqlDbType.Structured;
                parameter.ParameterName = "@agentList"; //@UserIds is the stored procedure parameter name
                parameter.TypeName = "idList";
                parameter.Value = table;

                var parameter1 = new SqlParameter();
                parameter1.SqlDbType = SqlDbType.Int;
                parameter1.ParameterName = "@OrderChronologicall"; //@UserIds is the stored procedure parameter name
                parameter1.Value = orderChronologicall;

                var parameters = new SqlParameter[2]
                {
                         parameter,parameter1
                };

               agentWithOrderList =  context.Database.SqlQuery<AgentWithOrder>("GetAgentWithOrder @agentList ,@OrderChronologicall", parameters).ToList();
               
            }
            return agentWithOrderList;
        }

        public static List<GetAgentWithOrdersByYearAndCount_Result> GetAgentWithOrdersByYearAndCount(int year, int count)
        {
            List<GetAgentWithOrdersByYearAndCount_Result> list = new List<GetAgentWithOrdersByYearAndCount_Result>();
            using (var context = new TestEntities1())
            {
                list = context.GetAgentWithOrdersByYearAndCount(year, count).ToList();
              
            }
            return list;
        }

    }
}
