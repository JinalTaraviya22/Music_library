using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

namespace Music_library
{
    public partial class Artist_Profile : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        SqlDataReader r;
        DataSet ds;
        Class1 cs;
        string mail, s_mail,img;

        public void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
            int id = Convert.ToInt32(Request.QueryString["Aid"]);
            if (Session["mail"] != null)
            {
                s_mail = Session["mail"].ToString();
                cmd = new SqlCommand("select * from Artists_tbl where A_Id=" + id + "", con);
                r = cmd.ExecuteReader();
                if (r.Read())
                {
                    artist_nm.Text = r["A_Name"].ToString();
                    Image1.Attributes["src"] = r["A_Image"].ToString();
                    Label2.Text = r["A_description"].ToString();
                    //a_bg_img.Text = r["A_Image"].ToString();
                    mail = r["A_Email"].ToString();
                    artist_mail.Value = mail;
                    r.Close();
                }
            }
            else Response.Redirect("Login.aspx");
        }
        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "alid")
            {
                Response.Redirect("Song_List.aspx?Albumid=" + id + "");
            }
            else if (e.CommandName == "cmd_albumdel")
            {
                cs.album_delete(id);
                Response.Redirect("Admin.aspx");
            }
        }

    }
}