using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;

namespace Music_library
{
    public class Class1
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;

        public SqlConnection getcon()
        {
            string s = ConfigurationManager.ConnectionStrings["db"].ConnectionString;
            con = new SqlConnection(s);
            con.Open();

            return con;
        }
        public void reg_insert(string email, string nm, string dob, string pwd, string img)
        {
            cmd = new SqlCommand("insert into User_tbl (U_Email,U_Name,U_Dob,U_Password,U_Image) values ('" + email + "','" + nm + "','" + dob + "','" + pwd + "','" + img + "')", con);
            cmd.ExecuteNonQuery();
        }

        public void usr_delete(string mail)
        {
            cmd = new SqlCommand("delete from User_tbl where U_Email='" + mail + "'", con);
            cmd.ExecuteNonQuery();
        }
        public void user_update(string s_mail, string nm, string mail, string dob, string img)
        {
            cmd = new SqlCommand("update User_tbl set U_Name='" + nm + "',U_Email='" + mail + "',U_Dob='" + dob + "',U_Image='" + img + "' where U_Email='" + s_mail + "'", con);
            cmd.ExecuteNonQuery();
        }
        public void user_updatePassword(string s_mail, string pwd)
        {
            cmd = new SqlCommand("update User_tbl set U_Password='" + pwd + "' where U_Email='" + s_mail + "'", con);
            cmd.ExecuteNonQuery();
        }
        public DataSet user_select()
        {
            da = new SqlDataAdapter("select * from User_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public DataSet user_selectMail(string mail)
        {
            da = new SqlDataAdapter("select * from User_tbl where U_Email='" + mail + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public void a_reg_insert(string name, string email, string dob, string pwd, string img, string des)
        {
            cmd = new SqlCommand("insert into Artists_tbl (A_Name,A_Email,A_Dob,A_Password,A_Image,A_description) values ('" + name + "','" + email + "','" + dob + "','" + pwd + "','" + img + "','" + des + "')", con);
            cmd.ExecuteNonQuery();
        }

        public DataSet artist_select()
        {
            da = new SqlDataAdapter("select * from Artists_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public void artist_update(string s_mail, string nm, string mail, string dob, string des, string img)
        {
            cmd = new SqlCommand("update Artists_tbl set A_Name='" + nm + "',A_Email='" + mail + "',A_Dob='" + dob + "',A_description='" + des + "',A_Image='" + img + "' where A_Email='" + s_mail + "'", con);
            cmd.ExecuteNonQuery();
        }

        public void artist_updatePassword(string s_mail, string pwd)
        {
            cmd = new SqlCommand("update Artists_tbl set A_Password='" + pwd + "' where A_Email='" + s_mail + "'", con);
            cmd.ExecuteNonQuery();
        }
        public void artist_delete(int id)
        {
            cmd = new SqlCommand("delete from Artists_tbl where A_Id='" + id + "'", con);
            cmd.ExecuteNonQuery();
        }

        public void album_insert(string nm, string img, string mail)
        {
            cmd = new SqlCommand("insert into Album_tbl (Al_Name,Al_Image,Al_A_Email) values('" + nm + "','" + img + "','" + mail + "')", con);
            cmd.ExecuteNonQuery();
        }
        public void album_delete(int id)
        {
            cmd = new SqlCommand("delete from Album_tbl where Al_Id='" + id + "'", con);
            cmd.ExecuteNonQuery();
        }
        public void album_update(int id, string nm, string img)
        {
            cmd = new SqlCommand("update Album_tbl set Al_Name='" + nm + "',Al_Image='" + img + "' where Al_Id='" + id + "'", con);
            cmd.ExecuteNonQuery();
        }
        public DataSet album_selectId(int id)
        {
            da = new SqlDataAdapter("select * from Album_tbl where Al_Id='" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public DataSet album_select()
        {
            da = new SqlDataAdapter("select * from Album_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet artistProfile_select(int id)
        {
            da = new SqlDataAdapter("select * from Artists_tbl where A_Id='" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public DataSet artist_selectMail(string mail)
        {
            da = new SqlDataAdapter("select * from Artists_tbl where A_Email='" + mail + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public void song_insert(string nm, string audio, string img, int alid, string mail, string genre)
        {
            cmd = new SqlCommand("insert into Songs_tbl (S_Name,S_Audio,S_Image,S_Al_Id,S_A_Email,S_Genre_Id) values('" + nm + "','" + audio + "','" + img + "','" + alid + "','" + mail + "','" + genre + "')", con);
            cmd.ExecuteNonQuery();
        }
        public void song_update(int id, string nm, string audio, string img, string genre)
        {
            cmd = new SqlCommand("update Songs_tbl set S_Name='" + nm + "',S_Audio='" + audio + "',S_Image='" + img + "',S_Genre_Id='" + genre + "' where S_Id='" + id + "' ", con);
            cmd.ExecuteNonQuery();
        }
        public void song_delete(int id)
        {
            cmd = new SqlCommand("Delete from Songs_tbl where S_Id='" + id + "'", con);
            cmd.ExecuteNonQuery();
        }
        public DataSet song_selectId(int id)
        {
            da = new SqlDataAdapter("select * from Songs_tbl where S_Id='" + id + "'", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public DataSet song_select()
        {
            da = new SqlDataAdapter("select * from Songs_tbl", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        public void playlist_create(string email, string nm, string img)
        {
            cmd = new SqlCommand("insert into Playlist_tbl (P_Name,P_User_Email,P_Image) values('" + nm + "','" + email + "','" + img + "')", con);
            cmd.ExecuteNonQuery();
        }
        public void playlist_delete(int id)
        {
            cmd = new SqlCommand("delete from Playlist_tbl where P_Id='" + id + "'", con);
            cmd.ExecuteNonQuery();
        }
        public void playlist_Songsadd(int pid, int sid)
        {
            cmd = new SqlCommand("insert into Playlist_songs_tbl(Playlist_Id,Song_Id) values('" + pid + "','" + sid + "')", con);
            cmd.ExecuteNonQuery();
        }
        public void playlist_Songsdel(int pid, int sid)
        {
            cmd = new SqlCommand("delete from Playlist_Songs_tbl where Playlist_Id='" + pid + "' and Song_Id='" + sid + "'", con);
            cmd.ExecuteNonQuery();
        }

        public void accDeleteRequest(string mail)
        {
            cmd = new SqlCommand("insert into AccDeleterequest_tbl (Ad_U_Email) values('" + mail + "')", con);
            cmd.ExecuteNonQuery();
        }
        public void accDeleteRequestReject(string mail)
        {
            cmd = new SqlCommand("delete from AccDeleteRequest_tbl where Ad_U_Email='" + mail + "'", con);
            cmd.ExecuteNonQuery();
        }

        public DataSet accDeleteRequestSelect()
        {
            da = new SqlDataAdapter("select * from AccDeleteRequest_tbl JOIN User_tbl ON AccDeleteRequest_tbl.Ad_U_Email=User_tbl.U_Email", con);
            ds = new DataSet();
            da.Fill(ds);
            return ds;
        }

        public DataSet SearchUsersAndArtists(string query)
        {
            DataSet ds = new DataSet();
            string sql = @"
            SELECT * FROM User_tbl WHERE U_Name LIKE @query
            UNION
            SELECT * FROM Artists_tbl WHERE A_Name LIKE @query";

            using (SqlDataAdapter da = new SqlDataAdapter(sql, con))
            {
                da.SelectCommand.Parameters.AddWithValue("@query", "%" + query + "%");
                da.Fill(ds);
            }
            return ds;
        }
    }
}