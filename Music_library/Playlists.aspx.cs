using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Music_library
{
    public partial class Playlists : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection con;
        SqlDataAdapter da;
        DataSet ds;
        Class1 cs;
        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
            if (Session["mail"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            fillplaylist();
        }
        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }
        void fillplaylist()
        {
            da = new SqlDataAdapter("Select * from Playlist_tbl where P_User_Email='admin123@gmail.com'", con);
            ds = new DataSet();
            da.Fill(ds);
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }
        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "playid")
            {
                Response.Redirect("Playlist_Songs.aspx?Playid=" + id + "");
            }
        }
    }
}