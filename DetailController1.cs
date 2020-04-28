using System;
using System.Collections.Generic;
using System.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using static Reimbursement.Reimbursement_form;
using System.Data;

namespace Reimbursement
{
    public class DetailController1 : ApiController
    {
        //creating the object of EmpRepository class  
        static detailrepository repository = new detailrepository();


        public string Adddetails(details Emp)
        {
            //calling EmpRepository Class Method and storing Repsonse   
            var response = repository.AddDetails(Emp);
            return response;

        }
        public DataSet Getrecord(string date)

        {
            DataSet ds = repository.GetRecordbydate(date);

            return ds;
        }

    }
}