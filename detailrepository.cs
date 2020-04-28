using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Reimbursement
{
    public class detailrepository
    {
        private SqlConnection con;
        private SqlCommand com;

        private void connection()
        {
            string constr = ConfigurationManager.ConnectionStrings["getconn"].ToString();
            con = new SqlConnection(constr);


        }

        public string AddDetails(details Emp)
        {
            connection();
            com = new SqlCommand("InsertData", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@monnth", Emp.month);
            com.Parameters.AddWithValue("@reim", Emp.radio);
            com.Parameters.AddWithValue("@frm", Emp.txtfrm);
            com.Parameters.AddWithValue("@to", Emp.txtto);
            com.Parameters.AddWithValue("@purpose", Emp.ddlpurpose);
            com.Parameters.AddWithValue("@mode", Emp.ddlmode);
            com.Parameters.AddWithValue("@km", Emp.txtkm);
            com.Parameters.AddWithValue("@Invno", Emp.txtInvno);
            com.Parameters.AddWithValue("@amt", Emp.txtamt);
            com.Parameters.AddWithValue("@file", Emp.FileUpload1);
            con.Open();
            int i = com.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
            {
                return "New details Added Successfully";

            }
            else
            {
                return "details Not Added";

            }
        }

        public DataSet GetRecordbydate(string date)

        {

            SqlCommand com = new SqlCommand("GetDataByDate", con);

            com.CommandType = CommandType.StoredProcedure;

            com.Parameters.AddWithValue("@date", date);

            SqlDataAdapter da = new SqlDataAdapter(com);

            DataSet ds = new DataSet();

            da.Fill(ds);

            return ds;

        }
    }
}