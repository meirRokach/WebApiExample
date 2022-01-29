using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.ServiceModel.Channels;
using System.Web;
using System.Web.Http;
using WebApiExample.Models;

namespace WebApiExample.Controllers
{
    public class HomeController : ApiController
    {
        [Route("GetAgentWithOrdersByYearAndCount")]
        [HttpGet]
        [ApiAuthorize]
        public HttpResponseMessage GetAgentWithOrdersByYearAndCount(int year, int count)
        {

            List<GetAgentWithOrdersByYearAndCount_Result> list = DataService.GetAgentWithOrdersByYearAndCount(year, count);

            return this.Request.CreateResponse(
                  HttpStatusCode.OK,
                 list);
        }

        [Route("GetAgentHighestOrderSum")]
        [HttpGet]
        [ApiAuthorize]
        public HttpResponseMessage GetAgentHighestOrderSum(int year)
        {

            string AgentCode = DataService.GetAgentHighestOrderSum(year);

            return this.Request.CreateResponse(
                  HttpStatusCode.OK,
                  new { Agent = AgentCode });

        }

        [Route("GetAgentWithOrder")]
        [HttpGet]
        [ApiAuthorize]
        public HttpResponseMessage GetAgentWithOrder(string agentList, int orderChronologicall)
        {

            List<AgentWithOrder> result = DataService.GetAgentWithOrder(agentList.Split(',').ToList(), orderChronologicall);

            return this.Request.CreateResponse(
                  HttpStatusCode.OK,
                  result);
        }
    }
}
