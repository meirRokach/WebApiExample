using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.ServiceModel.Channels;
using System.Web;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;

namespace WebApiExample
{

    public class ApiAuthorize : ActionFilterAttribute
    {
        public override void OnActionExecuting(HttpActionContext actionContext)
        {

            string ip = GetClientIp(actionContext.Request);
            string value = System.Configuration.ConfigurationManager.AppSettings["AllowIpList"];
            if (!value.Split(',').Contains(ip))
            {
                var response = actionContext.Request.CreateErrorResponse(HttpStatusCode.Forbidden, "Ip not Allow");
                actionContext.Response = response;
                return;
            }


            if (!actionContext.Request.Headers.Contains("ApiKey"))
            {
                var response = actionContext.Request.CreateErrorResponse(HttpStatusCode.BadRequest, "ApiKey missing");
                actionContext.Response = response;
                return;
                // validate the supplied API key
                // Validate it
                //  var headerKey = Request.Headers.GetValues("ApiKey").First();
            }


            var headerKey = actionContext.Request.Headers.GetValues("ApiKey").First();
            string apiKey = System.Configuration.ConfigurationManager.AppSettings["ApiKey"];
            if (apiKey != headerKey)
            {
                var response = actionContext.Request.CreateErrorResponse(HttpStatusCode.Forbidden, "Forbidden");
                actionContext.Response = response;
            }

        }


        private string GetClientIp(HttpRequestMessage request = null)
        {
           

            if (request.Properties.ContainsKey("MS_HttpContext"))
            {
                return ((HttpContextWrapper)request.Properties["MS_HttpContext"]).Request.UserHostAddress;
            }
            else if (request.Properties.ContainsKey(RemoteEndpointMessageProperty.Name))
            {
                RemoteEndpointMessageProperty prop = (RemoteEndpointMessageProperty)request.Properties[RemoteEndpointMessageProperty.Name];
                return prop.Address;
            }
            else if (HttpContext.Current != null)
            {
                return HttpContext.Current.Request.UserHostAddress;
            }
            else
            {
                return null;
            }
        }


    }
}