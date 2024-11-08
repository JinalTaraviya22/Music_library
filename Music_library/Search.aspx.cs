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
    public partial class Search : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter da;
        SqlCommand cmd;
        SqlDataReader r;
        DataSet ds;
        Class1 cs;
        string mail, s_mail, img;


        public void startcon()
        {
            con = new SqlConnection();
            cs = new Class1();
            con = cs.getcon();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            startcon();
            if (Session["mail"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }
        protected void searchbtn_Click(object sender, EventArgs e)
        {
            string searchTerm = searchtb.Text.Trim();
            if (!string.IsNullOrEmpty(searchTerm))
            {
                // Call the search function
                SearchDatabase(searchTerm);
            }
        }

        private void SearchDatabase(string searchTerm)
        {
            // Query to search in songs, albums, and artists
            string query = @"
            SELECT 'Song' AS Type, S_Id AS Id, S_Name AS Name, S_Image AS Image, S_Audio AS Audio, NULL AS AlbumName, NULL AS ArtistName 
            FROM Songs_tbl 
            WHERE S_Name LIKE @searchTerm

            UNION

            SELECT 'Album' AS Type, Al_Id AS Id, Al_Name AS Name, Al_Image AS Image, NULL AS Audio, Al_Name AS AlbumName, NULL AS ArtistName 
            FROM Album_tbl 
            WHERE Al_Name LIKE @searchTerm

            UNION

            SELECT 'Artist' AS Type, A_Id AS Id, A_Name AS Name, A_Image AS Image, NULL AS Audio, NULL AS AlbumName, A_Name AS ArtistName 
            FROM Artists_tbl 
            WHERE A_Name LIKE @searchTerm";

            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@searchTerm", "%" + searchTerm + "%");

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    // Clear previous results
                    ClearPreviousResults();

                    while (reader.Read())
                    {
                        string type = reader["Type"].ToString();
                        string name = reader["Name"].ToString();
                        string image = reader["Image"] as string; // Assuming this is the image path
                        string audio = reader["Audio"] as string; // Assuming this is the audio path
                        string albumName = reader["AlbumName"] as string;
                        string artistName = reader["ArtistName"] as string;
                        int id = Convert.ToInt32(reader["Id"]);

                        if (type == "Song")
                        {
                            // Display as a single song area
                            DisplaySingleSong(id,name, artistName, image, audio);
                        }
                        else if (type == "Album")
                        {
                            // Display as a single album in album category area
                            DisplaySingleAlbum(id,name, image);
                        }
                        else if (type == "Artist")
                        {
                            // Display as a single album area in buy now area
                            DisplaySingleArtist(id,artistName, image);
                        }
                    }
                }
            }
        }

        private void ClearPreviousResults()
        {
            litSongResults.Text = string.Empty;
            litAlbumResults.Text = string.Empty;
            litBuyNowResults.Text = string.Empty;
        }

        private void DisplaySingleSong(int id, string songName, string artistName, string image, string audio)
        {
            string songHtml = $@"
                <div class='col-12'>
                    <div class='single-song-area mb-30 d-flex flex-wrap align-items-end'>
                        <div class='song-thumbnail'>
                            <img src='{image}' alt='{songName}'>
                        </div>
                        <div class='song-play-area'>
                            <div class='song-name'>
                                <p>{songName}</p>
                            </div>
                            <audio preload='auto' controls>
                                <source src='{audio}'>
                            </audio>
                        </div>
                    </div>
                </div>";

            // Append to the Literal control
            litSongResults.Text += songHtml;
        }
        private void DisplaySingleAlbum(int id,string albumName, string image)
        {
            // Create HTML for a single album
            string albumHtml = $@"
        <div class='col-12 col-sm-4 col-md-3 col-lg-2 single-album-item'>
            <div class='single-album'>
                <img src='{image}' alt=''>
                <div class='album-info'>
                    <a href='Song_List.aspx?Albumid={id}'>
                        <h5>{albumName}</h5>
                    </a>
                    <p>Album Description Here</p>
                </div>
            </div>
        </div>";

            // Append to the Literal control
            litAlbumResults.Text += albumHtml;
        }

        private void DisplaySingleArtist(int id, string artistName, string image)
        {
            // Create HTML for a single artist
            string artistHtml = $@"
        <div class='col-12 col-sm-6 col-md-3'>
            <div class='single-album-area'>
                <div class='album-thumb'>
                    <img src='{image}' alt=''>
                </div>
                <div class='album-info'>
                    <a href='Artist_Profile.aspx?Aid={id}'>
                        <h5>{artistName}</h5>
                    </a>
                    <p>Artist Description Here</p>
                </div>
            </div>
        </div>";

            // Append to the Literal control
            litBuyNowResults.Text += artistHtml;
        }

    }
}
