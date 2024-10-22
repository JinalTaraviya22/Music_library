using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Music_library
{
    public partial class Artists : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["mail"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
               

        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("Artist_Profile.aspx?Aid=" + id + "");
        }
    }
}