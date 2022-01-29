using Swashbuckle.Swagger;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Description;

namespace WebApiExample.App_Start
{
  public class AddRequiredHeaderParameter : Swashbuckle.Swagger.IOperationFilter
    {
    public void Apply(Operation operation, SchemaRegistry schemaRegistry, ApiDescription apiDescription)
    {
        if (operation.parameters == null)
            operation.parameters = new List<Parameter>();

        operation.parameters.Add(new Parameter
        {
            name = "ApiKey",
            @in = "header",
            type = "string",
            description = "Api Key",
            required = true
        });
    }
}
}