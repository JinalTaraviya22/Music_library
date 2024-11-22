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
    public partial class Register1 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        Class1 cs;
        string fnm,newnm;

        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
        }

        void startcon() {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }

        protected void r_btnregister_Click(object sender, EventArgs e)
        {
            img_upload();
            cs.reg_insert(r_tbmail.Text,r_tbnm.Text,r_tbdob.Text,r_tbpwd.Text,newnm);
            Session["mail"] = r_tbmail.Text;

            cs.playlist_create(r_tbmail.Text,"Liked Songs","img/playlist_img/Liked_Playlist.png");
            Response.Redirect("Index.aspx");
        }

        void img_upload()
        {
            fnm ="img/user_img/"+ r_imgUpload.FileName;
            string type = Path.GetExtension(fnm);
            newnm = "img/user_img/"+ r_tbmail.Text.Trim() + type;
            r_imgUpload.SaveAs(Server.MapPath(newnm));
        }
    }
}