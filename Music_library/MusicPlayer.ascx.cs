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
    public partial class MusicPlayer : System.Web.UI.UserControl
    {
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter da;
        DataSet ds;
        SqlDataReader read;

        void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }

        public string AudioSource { get; set; }
        public string Title { get; set; }
        public string Artist { get; set; }

        Class1 cs = new Class1();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if the hidden field has a valid numeric value
            int songId = 0;
            if (!string.IsNullOrEmpty(hfCurrentSongId.Value) && int.TryParse(hfCurrentSongId.Value, out songId))
            {
                if (songId != 0)
                {
                    // Fetch the song details using the song ID
                    DataSet songDetailsDataSet = cs.song_selectId(songId);

                    if (songDetailsDataSet != null && songDetailsDataSet.Tables[0].Rows.Count > 0)
                    {
                        // Extract data from the first row in the DataSet
                        DataRow songRow = songDetailsDataSet.Tables[0].Rows[0];

                        // Set the song details to controls
                        songName.Text = songRow["S_Name"].ToString();  // Assuming "S_Name" is the column name for the song title
                        songAudio.Text = $"<audio id='audio-song' src='{songRow["S_Audio"]}'></audio>";  // Assuming "S_Audio" is the column name for the audio file path
                    }
                }
            }
            else
            {
                // Handle the case when songId is invalid (either empty or non-numeric)
                // You can log the error or show a default message
                songName.Text = "Song not found";
            }
        }
    }
}