using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Music_library
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        string mail;

        protected void Page_Load(object sender, EventArgs e)
        {
            String adminMail = ConfigurationManager.AppSettings["Email"];
            if (Session["mail"] != null)
            {
                mail = Session["mail"].ToString();
                //admin_btn.Visible = (mail == adminMail);
                login_btn.Text = "Account";
                logout_btn.Visible = true;
                ImageButton2.Visible = true;
            }
            else
            {
                login_btn.Text = "Login/Register";
            }

        }

        protected void login_Click(object sender, EventArgs e)
        {
            if (login_btn.Text == "Account")
            {
                Response.Redirect("User_Account.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void logout_btn_Click(object sender, ImageClickEventArgs e)
        {
            // Session destroy and redirect to index page
            Session.Abandon();
            Response.Redirect("Index.aspx");
        }

        //protected void admin_btn_Click(object sender, EventArgs e)
        //{
        //    Response.Redirect("Admin.aspx");
        //}
        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Search.aspx");
        }
    }
}