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
    public partial class Admin : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        Class1 cs;
        void startcon() {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
            filluserData();
            fillartistData();
            fillalbumdata();
            filldelaccData();
        }

        void filluserData() {
            usrgrid.DataSource = cs.user_select();
            usrgrid.DataBind();
        }
        void fillartistData()
        {
            artistgrid.DataSource = cs.artist_select();
            artistgrid.DataBind();
        }

        void fillalbumdata()
        {
            albumgrid.DataSource = cs.album_select();
            albumgrid.DataBind();
        }

        void filldelaccData() {
            dellaccgrid.DataSource = cs.accDeleteRequestSelect();
            dellaccgrid.DataBind();
        }

        protected void artistgrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if(e.CommandName== "cmd_artistdel")
            {
                cs.artist_delete(id);
                fillartistData();
            }
            else if (e.CommandName == "cmd_artistprofile")
            {
                Response.Redirect("Artist_Profile.aspx?Aid=" + id + "");
            }
        }

        protected void usrgrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "cmd_usrdel")
            {
                string umail = Convert.ToString(e.CommandArgument);
                cs.usr_delete(umail);
                filluserData();
            }
        }

        protected void albumgrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "cmd_album")
            {
                Response.Redirect("Song_List.aspx?Albumid=" + id+"");
            }
            else if(e.CommandName== "cmd_delalbum")
            {
                cs.album_delete(id);
                fillalbumdata();
            }
        }

        protected void dellaccgrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string umail = Convert.ToString(e.CommandArgument);
            if (e.CommandName== "cmd_accDelMail")
            {
                cs.usr_delete(umail);
                cs.accDeleteRequestReject(umail);
                filluserData();
                filldelaccData();
            }else if(e.CommandName== "cmd_accMail")
            {
                cs.accDeleteRequestReject(umail);
                filldelaccData();
            }
        }
    }
}