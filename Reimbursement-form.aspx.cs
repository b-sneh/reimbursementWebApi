using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Reimbursement
{
    public partial class Reimbursement_form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DD_Monthbind();
            }

            
        }
        private SqlConnection con;
        private SqlCommand com;

        private void connection()
        {
            string constr = ConfigurationManager.ConnectionStrings["getconn"].ToString();
            con = new SqlConnection(constr);


        }
        public void DD_Monthbind()
        {
            DateTimeFormatInfo info = DateTimeFormatInfo.GetInstance(null);
            for (int i = 1; i < 13; i++)
            {
                ddlMonth.Items.Add(new ListItem(info.GetMonthName(i), i.ToString()));

            }
        }

        protected void ddlpurpose_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlpurpose.SelectedIndex == 4)
            {
                txtOther.Visible = true;
            }
            else
            {
                txtOther.Visible = false;
            }
        }

        protected void ddlmode_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlpurpose.SelectedIndex == 5)
            {
                txtOther1.Visible = true;
            }
            else
            {
                txtOther1.Visible = false;
            }
        }
    }
}