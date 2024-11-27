﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace Music_library
{
    public partial class Adsongs : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        DataSet ds;
        Class1 cs;
        PagedDataSource pg;
        int p;
        int row;
        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                startcon();
                display();
            }
        }
        void display()
        {
            startcon();
            da = new SqlDataAdapter("SELECT * FROM Songs_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            row = ds.Tables[0].Rows.Count;
            pg = new PagedDataSource
            {
                AllowPaging = true,
                PageSize = 3,
                DataSource = ds.Tables[0].DefaultView
            };
            int currentPageIndex = ViewState["S_Id"] != null ? Convert.ToInt32(ViewState["S_Id"]) : 0;
            if (currentPageIndex < 0) currentPageIndex = 0;
            if (currentPageIndex >= pg.PageCount) currentPageIndex = pg.PageCount - 1;
            pg.CurrentPageIndex = currentPageIndex;
            ViewState["S_Id"] = currentPageIndex;
            songsgrid.DataSource = pg;
            songsgrid.DataBind();
        }

        //void fillsongsdata()
        //{
        //    songsgrid.DataSource = cs.songs_select();
        //    songsgrid.DataBind();

        //    row = ds.Tables[0].Rows.Count;
        //    pg = new PagedDataSource();

        //    pg.AllowPaging = true;
        //    pg.PageSize = 2;

        //    pg.CurrentPageIndex = Convert.ToInt32(ViewState["P_Id"]);
        //    pg.DataSource = ds.Tables[0].DefaultView;

        //    songsgrid.DataSource = pg;
        //    songsgrid.DataBind();
        //}   

        protected void songsgrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandArgument == null || !int.TryParse(e.CommandArgument.ToString(), out int id))
            {
                return;
            }
           if (e.CommandName == "cmd_album")
            {
                Response.Redirect("Song_List.aspx?Albumid=" + id);
            }
            else if (e.CommandName == "cmd_delSongs")
            {
                if (cs == null)
                {
                    cs = new Class1();
                    cs.getcon(); 
                }
                cs.song_delete(id);
                display();
            }
        }


        protected void next_Click1(object sender, EventArgs e)
        {
            display();
            pre.Enabled = true;
            int currentPage = Convert.ToInt32(ViewState["S_Id"]);
            currentPage += 1;
            ViewState["S_Id"] = currentPage;
            int totalPages = (int)Math.Ceiling((double)row / pg.PageSize);
            if (currentPage >= totalPages - 1)
            {
                next.Enabled = false;
            }
            display();
        }

        protected void pre_Click1(object sender, EventArgs e)
        {
            display();
            next.Enabled = true;
            int currentPage = Convert.ToInt32(ViewState["S_Id"]);
            currentPage -= 1;
            ViewState["S_Id"] = currentPage;
            if (currentPage <= 0)
            {
                pre.Enabled = false;
                display();
            }
        }
        protected void search_Click(object sender, EventArgs e)
        {
            startcon();
            string searchQuery = search_txt.Text.Trim();
            if (!string.IsNullOrEmpty(searchQuery))
            {
                da = new SqlDataAdapter("SELECT * FROM Songs_tbl WHERE S_ID LIKE @search OR S_Name LIKE @search OR S_Audio LIKE @search OR S_Image LIKE @search  OR S_Genre LIKE @search", con);
                da.SelectCommand.Parameters.AddWithValue("@search", "%" + searchQuery + "%");
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM Songs_tbl", con);
            }
            ds = new DataSet();
            da.Fill(ds);

            row = ds.Tables[0].Rows.Count;
            pg = new PagedDataSource
            {
                AllowPaging = true,
                PageSize = 2,
                DataSource = ds.Tables[0].DefaultView
            };
            if (ViewState["S_Id"] == null)
            {
                ViewState["S_Id"] = 0; // Start with the first page
            }
            pg.CurrentPageIndex = Convert.ToInt32(ViewState["U_Id"]);
            songsgrid.DataSource = pg;
            songsgrid.DataBind();
        }

    }
}