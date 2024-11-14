using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace Music_library
{
    public partial class Song_List : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        SqlDataReader read;
        Class1 cs;
        int id, sid;
        string audio, audiofinal, mail, mail2, simg, simgfinal;
        string upsimg, upsaud;

        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
            id = Convert.ToInt32(Request.QueryString["Albumid"]);
            cmd = new SqlCommand("select * from Album_tbl where Al_Id='" + id + "'", con);
            read = cmd.ExecuteReader();
            if (Session["mail"] != null)
            {
                mail = Session["mail"].ToString();
                if (read.HasRows)
                {
                    if (read.Read())
                    {
                        nm.Text = read["Al_Name"].ToString();
                        mail2 = read["Al_A_Email"].ToString();
                        if (mail == mail2 || mail=="admin123@gmail.com")
                        {
                            u_songform.Visible = true;
                            read.Close();
                            fillUpdateData();
                        }
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
            read.Close();
            //if user then show playlist 
        }

        void fillUpdateData()
        {
            ds = cs.album_selectId(id);
            alupdatenm.Text = ds.Tables[0].Rows[0]["Al_Name"].ToString();
            alcover_tb.Value = ds.Tables[0].Rows[0]["Al_Image"].ToString();
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "cmd_songidForplaylist")
            {
                int songid = Convert.ToInt32(e.CommandArgument);
                Panel panel = (Panel)DataList1.Items[0].FindControl("Panel1");
                if (panel != null)
                {
                    DropDownList dropDownList = (DropDownList)panel.FindControl("ddplaylist");
                    if (dropDownList != null)
                    {
                        int playid = Convert.ToInt32(dropDownList.SelectedValue);
                        cs.playlist_Songsadd(playid, songid);
                        Response.Redirect("User_Account.aspx");
                    }
                }
            }
            else if (e.CommandName == "cmd_song_del")
            {
                int songid = Convert.ToInt32(e.CommandArgument);
                cs.song_delete(id);
            }
        }

        protected void del_s_Click(object sender, EventArgs e)
        {
            sid = Convert.ToInt32(dd_del.SelectedValue);
            cs.song_delete(sid);
            Response.Redirect("User_Account.aspx");
        }

        //will fill form based on item selected in drop down
        protected void up_dds_SelectedIndexChanged(object sender, EventArgs e)
        {
            sid = Convert.ToInt32(up_dds.SelectedValue);
            ds = cs.song_selectId(sid);
            up_s_nm.Text = ds.Tables[0].Rows[0]["S_Name"].ToString();
            up_s_genre.Text = ds.Tables[0].Rows[0]["S_Genre"].ToString();
            upsimg = ds.Tables[0].Rows[0]["S_Image"].ToString();
            upsaud = ds.Tables[0].Rows[0]["S_Audio"].ToString();
        }

        protected void up_sbtn_Click(object sender, EventArgs e)
        {
            if (up_s_cover.HasFile)
            {
                simg = "img/song_img/" + up_s_cover.FileName;
                string type = Path.GetExtension(simg);
                string ns = up_s_nm.Text.Replace(" ", "");
                upsimg = "img/album_img/" + ns + type;
                up_s_cover.SaveAs(Server.MapPath(upsimg));

            }
            if (up_s_audio.HasFile)
            {
                audio = "audio/" + up_s_audio.FileName;
                string type = Path.GetExtension(audio);
                string ns = up_s_nm.Text.Replace(" ", "");
                upsaud = "audio/" + ns + type;
                up_s_audio.SaveAs(Server.MapPath(upsaud));
            }
            cs.song_update(sid, up_s_nm.Text, upsaud, upsimg, up_s_genre.Text);
            Response.Redirect("User_Account.aspx");
        }

        protected void alUpdate_btn_Click(object sender, EventArgs e)
        {
            if (alupdatecover.HasFile)
            {
                string fnm = "img/album_img/" + alupdatecover.FileName;
                string type = Path.GetExtension(fnm);
                string ns = alupdatenm.Text + mail.Replace(" ", "");
                string album = "img/album_img/" + ns + type;
                alupdatecover.SaveAs(Server.MapPath(album));

                cs.album_update(id, alupdatenm.Text, album);
                fillUpdateData();
                Response.Redirect("User_Account.aspx");
            }
            else
            {
                cs.album_update(id, alupdatenm.Text, alcover_tb.Value);
                fillUpdateData();
                Response.Redirect("User_Account.aspx");
            }
        }

        void song_cover()
        {
            if (s_cover.HasFile)
            {
                simg = "img/song_img/" + s_cover.FileName;
                string type = Path.GetExtension(simg);
                simgfinal = "img/album_img/" + s_tbnm.Text.Replace(" ", "") + type;
                s_cover.SaveAs(Server.MapPath(simgfinal));
            }
        }

        void song_audio()
        {
            audio = "audio/" + s_audio.FileName;
            string type = Path.GetExtension(audio);
            audiofinal = "audio/" + s_tbnm.Text.Replace(" ", "") + type;
            s_audio.SaveAs(Server.MapPath(audiofinal));
        }
        protected void s_btn_Click(object sender, EventArgs e)
        {
            song_cover();
            song_audio();
            cs.song_insert(s_tbnm.Text, audiofinal, simgfinal, id, mail, s_genre.Text);
            Response.Redirect("User_Account.aspx");
        }

    }
}