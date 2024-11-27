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
    public partial class AdUsers : System.Web.UI.Page
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
            da = new SqlDataAdapter("SELECT * FROM User_tbl", con);
            ds = new DataSet();
            da.Fill(ds);

            row = ds.Tables[0].Rows.Count;
            pg = new PagedDataSource
            {
                AllowPaging = true,
                PageSize = 2,
                DataSource = ds.Tables[0].DefaultView
            };
            int currentPageIndex = ViewState["U_Id"] != null ? Convert.ToInt32(ViewState["U_Id"]) : 0;
            if (currentPageIndex < 0) currentPageIndex = 0;
            if (currentPageIndex >= pg.PageCount) currentPageIndex = pg.PageCount - 1;
            pg.CurrentPageIndex = currentPageIndex;
            ViewState["U_Id"] = currentPageIndex;
            usrgrid.DataSource = pg;
            usrgrid.DataBind();
        }
        void filluserData()
        {
            usrgrid.DataSource = cs.user_select();
            usrgrid.DataBind();
        }

        protected void usrgrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
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
            if (e.CommandArgument == null)
            {
                return;
            }
            string mail = e.CommandArgument.ToString();
            if (cs == null)
            {
                cs = new Class1();
                cs.getcon();
            }
            if (e.CommandName == "cmd_usrdel")
            {
                cs.user_delete(id); 
                filluserData();
            }
        }
        protected void next_Click1(object sender, EventArgs e)
        {
            display();
            pre.Enabled = true;
            int currentPage = Convert.ToInt32(ViewState["U_Id"]);
            currentPage += 1;
            ViewState["U_Id"] = currentPage;
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
            int currentPage = Convert.ToInt32(ViewState["U_Id"]);
            currentPage -= 1;
            ViewState["U_Id"] = currentPage;
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
                da = new SqlDataAdapter("SELECT * FROM User_tbl WHERE U_Email LIKE @search OR U_Name LIKE @search OR U_Id LIKE @search OR U_Dob LIKE @search OR U_Password LIKE @search ", con);
                da.SelectCommand.Parameters.AddWithValue("@search", "%" + searchQuery + "%");
            }
            else
            {
                da = new SqlDataAdapter("SELECT * FROM User_tbl", con);
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
            if (ViewState["U_Id"] == null)
            {
                ViewState["U_Id"] = 0; // Start with the first page
            }
            pg.CurrentPageIndex = Convert.ToInt32(ViewState["U_Id"]);
            usrgrid.DataSource = pg;
            usrgrid.DataBind();
        }

    }
}