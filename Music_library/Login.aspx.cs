using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;

namespace Music_library
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        Class1 cs;
        int i,j;

        void startcon() {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
        }

        protected void l_btn_Click(object sender, EventArgs e)
        {
            cmd = new SqlCommand("select count(*) from User_tbl where U_Email='" + l_tbmail.Text + "' and U_Password='" + l_tbpwd.Text + "'", con);
            i = Convert.ToInt32(cmd.ExecuteScalar());
            if (i > 0)
            {
                String adminMail = ConfigurationManager.AppSettings["Email"];
                String adminpwd = ConfigurationManager.AppSettings["Password"];
                if (l_tbmail.Text == adminMail && l_tbpwd.Text==adminpwd)
                {
                    Session["mail"] = l_tbmail.Text;
                    Response.Redirect("User_Account.aspx");
                }
                else
                {
                    Session["mail"] = l_tbmail.Text;
                    Response.Redirect("Index.aspx");
                }
            }
            else {
                cmd = new SqlCommand("select count(*) from Artists_tbl where A_Email='" + l_tbmail.Text+"' and A_Password='"+l_tbpwd.Text+"'",con);
                i = Convert.ToInt32(cmd.ExecuteScalar());
                if (i > 0)
                {
                    Session["mail"] = l_tbmail.Text;
                    Response.Redirect("Index.aspx");
                }
                else {
                    l_error.Text = "Enter valid Email and password.";
                }
            }
        }
    }
}