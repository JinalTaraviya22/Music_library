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
    public partial class User_Account : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        SqlDataReader read;
        Class1 cs;
        int i;
        string album, fnm, mail, usr_type;

        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
            if (Session["mail"] != null)
            {
                mail = Session["mail"].ToString();
                u_nm.Text = mail;

                String adminMail = ConfigurationManager.AppSettings["Email"];

                if (mail.Equals(adminMail, StringComparison.OrdinalIgnoreCase))
                {
                    // User is admin
                    adminPages.Visible = true; // Show admin tabs
                }
                cmd = new SqlCommand("select * from Artists_tbl where A_Email='" + mail + "'", con);
                read = cmd.ExecuteReader();
                if (read.HasRows)
                {
                    usr_type = "artist";
                    u_artist.Visible = true;
                    u_albumlist.Visible = true;
                    a_des.Visible = true;
                    if (read.Read())
                    {
                        fillUpdateDataartist();
                    }
                    read.Close();
                }
                else
                {
                    usr_type = "user";
                    u_playlist.Visible = true;
                    u_user.Visible = true;
                    read.Close();
                    cmd = new SqlCommand("select * from User_tbl where U_Email='" + mail + "'", con);
                    read = cmd.ExecuteReader();
                    if (read.HasRows)
                    {
                        if (read.Read())
                        {
                            fillUploadDatauser();
                        }
                        read.Close();
                    }
                }
            }
            else Response.Redirect("Login.aspx");
        }

        void fillUpdateDataartist()
        {
            tbnm.Text = read["A_Name"].ToString();
            tbmail.Text = read["A_Email"].ToString();
            tbdob.Text = read["A_Dob"].ToString();
            tbdes.Text = read["A_description"].ToString();
            tbimg_db.Value = read["A_Image"].ToString();
            tboldpwd_db.Value = read["A_Password"].ToString();
        }
        void fillUploadDatauser()
        {
            tbnm.Text = read["U_Name"].ToString();
            tbmail.Text = read["U_Email"].ToString();
            tbdob.Text = read["U_Dob"].ToString();
            tbimg_db.Value = read["U_Image"].ToString();
            tboldpwd_db.Value = read["U_Password"].ToString();
        }

        void fillgrid()
        {
            //GridView1.DataSource = cs.user_select();
            //GridView1.DataBind();
        }

        protected void a_btn_Click(object sender, EventArgs e)
        {
            if (usr_type == "artist")
            {
                string newnm = tbimg_db.Value;
                if (tbimg.HasFile)
                {
                    if (File.Exists(tbmail.Text))//image name from folder:email+extention
                    {
                        File.Delete(tbmail.Text);
                    }
                    fnm = "img/user_img/" + tbimg.FileName;
                    string type = Path.GetExtension(fnm);
                    newnm = "img/user_img/" + tbmail.Text.Trim() + type;
                    tbimg.SaveAs(Server.MapPath(newnm));
                }
                cs.artist_update(mail, tbnm.Text, tbmail.Text, tbdob.Text, tbdes.Text, newnm);
                Response.Redirect("Index.aspx");
            }
            else if (usr_type == "user")
            {
                string newnm = tbimg_db.Value; ;
                if (tbimg.HasFile)
                {
                    if (File.Exists(tbmail.Text))//image name from folder:email+extention
                    {
                        File.Delete(tbmail.Text);
                    }
                    fnm = "img/user_img/" + tbimg.FileName;
                    string type = Path.GetExtension(fnm);
                    newnm = "img/user_img/" + tbmail.Text.Trim() + type;
                    tbimg.SaveAs(Server.MapPath(newnm));
                }
                cs.user_update(mail, tbnm.Text, tbmail.Text, tbdob.Text, newnm);
                Response.Redirect("Index.aspx");
            }
        }

        protected void pwd_btn_Click(object sender, EventArgs e)
        {
            if (tboldpwd_db.Value == tboldpwd.Text)
            {
                if (usr_type == "artist")
                {
                    cs.artist_updatePassword(mail, tbnewpwd.Text);
                }
                else if (usr_type == "user")
                {
                    cs.user_updatePassword(mail, tbnewpwd.Text);
                }
                Response.Redirect("Index.aspx");
            }
            else
            {
                pwdError.Visible = true;
            }
        }

        void al_imgup()
        {
            if (alcoverupload.HasFile)
            {
                fnm = "img/album_img/" + alcoverupload.FileName;
                string type = Path.GetExtension(fnm);
                string ns = al_tbnm.Text + mail.Replace(" ", "");
                album = "img/album_img/" + ns + type;
                alcoverupload.SaveAs(Server.MapPath(album));
            }
        }

        protected void al_btn_Click(object sender, EventArgs e)
        {
            al_imgup();
            cs.album_insert(al_tbnm.Text, album, mail);
            Response.Redirect("User_Account.aspx");
        }

        protected void del_acc_Click(object sender, EventArgs e)
        {
            cs.accDeleteRequest(mail);
        }

        protected void DataList2_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            // Check if the item is not a header or footer
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Find the controls
                Label p_nm = (Label)e.Item.FindControl("p_nm");
                LinkButton aldel = (LinkButton)e.Item.FindControl("aldel");

                // Check if the playlist name is "Liked Playlist"
                if (p_nm != null && aldel != null && p_nm.Text == "Liked Songs")
                {
                    // Hide the delete button
                    aldel.Visible = false;
                }
            }
        }

        protected void p_btn_Click(object sender, EventArgs e)
        {
            fnm = "img/playlist_img/" + p_cover.FileName;
            string type = Path.GetExtension(fnm);
            string plimg = "img/playlist_img/" + p_nm.Text.Replace(" ", "") + tbmail.Text.Replace(".", "") + type;
            p_cover.SaveAs(Server.MapPath(plimg));
            cs.playlist_create(mail, p_nm.Text, plimg);
            Response.Redirect("User_Account.aspx");
        }
        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "cmd_alShow")
            {
                Response.Redirect("Song_List.aspx?Albumid=" + id + "");
            }
            else if (e.CommandName == "cmd_alDel")
            {
                cs.album_delete(id);
                Response.Redirect("Index.aspx");
            }
        }
        protected void DataList2_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            if (e.CommandName == "cmd_playlistId")
            {
                Response.Redirect("Playlist_Songs.aspx?Playid=" + id + "");
            }
            else if (e.CommandName == "cmd_playlistDel")
            {
                cs.playlist_delete(id);
                Response.Redirect("Index.aspx");
            }
        }
    }
}