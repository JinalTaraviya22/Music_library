﻿using System;
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
    public partial class Playlist_Songs : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        SqlDataReader read;
        Class1 cs;
        string mail=null;
        int play_id;

        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
            play_id = Convert.ToInt32(Request.QueryString["Playid"]);
            if (Session["mail"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                mail = Session["mail"].ToString();
                if (mail == "admin123@gmail.com")
                {
                    admin.Visible = true;
                }
                cmd = new SqlCommand("select * from Playlist_tbl where P_Id='" + play_id + "'", con);
                read = cmd.ExecuteReader();
                if (read.HasRows)
                {
                    if (read.Read())
                    {
                        plnm.Text = read["P_Name"].ToString();
                        read.Close();
                    }
                }
                fillSongsByPlaylist();
            }           
        }

        void fillSongsByPlaylist() {
            da = new SqlDataAdapter("select * from Playlist_tbl JOIN Playlist_songs_tbl ON  Playlist_tbl.P_Id=Playlist_songs_tbl.Playlist_Id JOIN Songs_tbl ON Songs_tbl.S_Id=Playlist_Songs_tbl.Song_id where Playlist_tbl.P_Id='"+play_id+"'",con);
            ds = new DataSet();
            da.Fill(ds);
            songByPlaylist.DataSource = ds;
            songByPlaylist.DataBind();
        }

        protected void songByPlaylist_ItemCommand(object source, DataListCommandEventArgs e)
        {
            int song_id = Convert.ToInt32(e.CommandArgument);
            if(e.CommandName== "cmd_songRemovePlaylist")
            {
                cs.playlist_Songsdel(play_id,song_id);
                fillSongsByPlaylist();
            }
        }

        protected void s_btn_Click(object sender, EventArgs e)
        {
            string gen = s_genre.SelectedValue;
            cmd = new SqlCommand("insert into Playlist_songs_tbl(Playlist_Id,Song_Id) select '"+play_id+"', S_Id from Songs_tbl where S_Genre_Id='"+gen+"'",con);
            cmd.ExecuteNonQuery();
            Response.Redirect("User_Account.aspx");
        }
    }
}