using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;

namespace Music_library
{
    public partial class Index : System.Web.UI.Page
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
            fillalbum();
            fillartist();
            fillsongs();
        }
        void startcon() {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }

        void fillplaylist() {
            da = new SqlDataAdapter("Select * from Playlist_tbl where P_User_Email='admin123@gmail.com'",con);
            ds = new DataSet();
            da.Fill(ds);
            ListView2.DataSource = ds;
            ListView2.DataBind();
        }
        void fillalbum() {
            da = new SqlDataAdapter("Select * from Album_tbl JOIN Artists_tbl ON Album_tbl.Al_A_Email=Artists_tbl.A_Email ORDER BY Album_tbl.Al_Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            ListView1.DataSource = ds;
            ListView1.DataBind();
        }
        void fillartist() {
            da = new SqlDataAdapter("select * from Artists_tbl ORDER BY A_Id Desc",con);
            ds = new DataSet();
            da.Fill(ds);
            ListView3.DataSource = ds;
            ListView3.DataBind();
        }
        void fillsongs() {
            da = new SqlDataAdapter("select S_Name,S_Image,S_Audio,A_Name from Songs_tbl JOIN Artists_tbl ON Songs_tbl.S_A_Email=Artists_tbl.A_Email ORDER BY Songs_tbl.S_Id DESC", con);
            ds = new DataSet();
            da.Fill(ds);
            ListView4.DataSource = ds;
            ListView4.DataBind();
        }
        protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "alid")
            {
                Response.Redirect("Song_List.aspx?Albumid=" + id + "");
            }
        }

        protected void ListView2_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "playid")
            {
                Response.Redirect("Playlist_Songs.aspx?Playid=" + id + "");
            }
        }

        protected void ListView3_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "cmd_artistId")
            {
                Response.Redirect("Artist_Profile.aspx?Aid=" + id + "");
            }
        }
    }
}