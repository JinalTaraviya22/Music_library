using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls; // Add this line

namespace Music_library
{
    public partial class currentPlaying : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataBind(); // Ensure data binding is called
            }

            // Update the display based on the current song
            if (IsSongPlaying())
            {
                lblCurrentSong.Text = GetCurrentSong();
                audioSource.Attributes["src"] = GetCurrentSongAudio();
            }
            else
            {
                this.Visible = false; // Hide if no song is playing
            }
        }

        public bool IsSongPlaying()
        {
            return Session["CurrentSong"] != null;
        }

        public string GetCurrentSong()
        {
            return Session["CurrentSong"] != null ? Session["CurrentSong"].ToString() : "No song is currently playing.";
        }

        public string GetCurrentSongAudio()
        {
            return Session["CurrentSongAudio"] != null ? Session["CurrentSongAudio"].ToString() : string.Empty;
        }
    }
}