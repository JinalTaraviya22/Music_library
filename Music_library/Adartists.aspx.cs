﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Music_library
{
    public partial class Adartists : System.Web.UI.Page
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
            da = new SqlDataAdapter("SELECT * FROM Artists_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            row = ds.Tables[0].Rows.Count;
            pg = new PagedDataSource
            {
                AllowPaging = true,
                PageSize = 3,
                DataSource = ds.Tables[0].DefaultView
            };
            int currentPageIndex = ViewState["A_Id"] != null ? Convert.ToInt32(ViewState["A_Id"]) : 0;
            if (currentPageIndex < 0) currentPageIndex = 0;
            if (currentPageIndex >= pg.PageCount) currentPageIndex = pg.PageCount - 1;
            pg.CurrentPageIndex = currentPageIndex;
            ViewState["A_Id"] = currentPageIndex;
            artistgrid.DataSource = pg;
            artistgrid.DataBind();
        }
        void fillartistData()
        {
            artistgrid.DataSource = cs.artist_select();
            artistgrid.DataBind();
        }
        protected void artistgrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandArgument == null)
            {
                return;
            }
            int id;
            if (!int.TryParse(e.CommandArgument.ToString(), out id))
            {
                return;
            }
            if (cs == null)
            {
                cs = new Class1();
                cs.getcon(); 
            }
            if (e.CommandName == "cmd_artistdel")
            {
                cs.artist_delete(id);
                fillartistData();
            }
            else if (e.CommandName == "cmd_artistprofile")
            {
                Response.Redirect("Artist_Profile.aspx?Aid=" + id);
            }
        }

        protected void next_Click1(object sender, EventArgs e)
        {
            display();
            pre.Enabled = true;
            int currentPage = Convert.ToInt32(ViewState["A_Id"]);
            currentPage += 1;
            ViewState["A_Id"] = currentPage;
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
            int currentPage = Convert.ToInt32(ViewState["A_Id"]);
            currentPage -= 1;
            ViewState["A_Id"] = currentPage;
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
                da = new SqlDataAdapter("SELECT * FROM Artists_tbl WHERE A_Email LIKE @search OR A_Name LIKE @search OR A_Id LIKE @search OR A_Dob LIKE @search OR A_Password LIKE @search", con);
                da.SelectCommand.Parameters.AddWithValue("@search", "%" + searchQuery + "%");
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM Artists_tbl", con);
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
            if (ViewState["A_Id"] == null)
            {
                ViewState["A_Id"] = 0; // Start with the first page
            }
            pg.CurrentPageIndex = Convert.ToInt32(ViewState["A_Id"]);
            artistgrid.DataSource = pg;
            artistgrid.DataBind();
        }
    }
}