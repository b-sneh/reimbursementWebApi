using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Reimbursement
{
    public class webApiConfig : ApiController
    {
        
        public static void Register(HttpConfiguration config)
        {


            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

        }

        public static void Register1(HttpConfiguration config)

        {
            config.Routes.MapHttpRoute(

            name: "DefaultApi",

            routeTemplate: "api/{controller}/{action}/{id}",

            defaults: new { id = RouteParameter.Optional }

        );
            var appXmlType = config.Formatters.XmlFormatter.SupportedMediaTypes.FirstOrDefault(t => t.MediaType == "application/xml");

            config.Formatters.XmlFormatter.SupportedMediaTypes.Remove(appXmlType);

        }
    }
}