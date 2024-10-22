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
    public partial class RegisterForArtists : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        Class1 cs;
        string fnm, newnm;

        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
        }

        void img_upload()
        {
            fnm = "img/user_img/" + a_imgUpload.FileName;
            string type = Path.GetExtension(fnm);
            newnm = "img/user_img/" + a_tbmail.Text.Replace(".","") + type;
            a_imgUpload.SaveAs(Server.MapPath(newnm));
        }

        protected void a_submit_Click(object sender, EventArgs e)
        {
            img_upload();
            cs.a_reg_insert(a_tbnm.Text, a_tbmail.Text, a_tbdob.Text, a_tbpwd.Text, newnm,a_tbdes.Text);
            Session["mail"] = a_tbmail.Text;
            Response.Redirect("Index.aspx");
        }
    }
}