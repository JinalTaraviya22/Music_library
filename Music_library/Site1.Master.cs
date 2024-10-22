using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
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
                if (mail == adminMail)
                {
                    admin_btn.Visible = true;
                }
                else
                {
                    admin_btn.Visible = false;
                }
                login_btn.Text = "Account";
                logout_btn.Visible = true;
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
                Response.Redirect("Login.aspx");
        }

        protected void logout_btn_Click(object sender, ImageClickEventArgs e)
        {
            //session destroy and redirect to index page
            Session.Abandon();
            Response.Redirect("Index.aspx");
        }

        protected void admin_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin.aspx");
        }
    }
}