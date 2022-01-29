using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApiExample.Models
{
    public class AgentWithOrder
    {

        public string AGENT_CODE     { get; set; }
        public string AGENT_NAME { get; set; }
        public string PHONE_NO { get; set; }
        public int ORD_NUM { get; set; }
        public DateTime ORD_DATE { get; set; }


    }
}