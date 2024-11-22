<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Music_library.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- ##### Breadcrumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>Search here</p>
            <asp:TextBox ID="searchtb" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            <asp:Button ID="searchbtn" CssClass="btn oneMusic-btn" runat="server" Text="Search" OnClick="searchbtn_Click" />

        </div>
    </section>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Album Category Area Start ##### -->
    <section class="album-catagory section-padding-100-0">
        <div class="container">
            <div class="row oneMusic-albums" id="albumResults">
                <asp:Literal ID="litAlbumResults" runat="server"></asp:Literal>
            </div>
            <div class="row oneMusic-buy-now-area mb-100 p-3" id="buyNowResults">
                <asp:Literal ID="litBuyNowResults" runat="server"></asp:Literal>
            </div>
            <div class="one-music-songs-area mb-70" id="songResults">
                <asp:Literal ID="litSongResults" runat="server"></asp:Literal>
            </div>
        </div>
    </section>
    <div class="container-fluid" id="current-song" style="position: fixed; bottom: 0; left: 0; right: 0; background: rgba(0, 0, 0, 0.8); color: white; padding: 10px; display: none; z-index: 1;">
        <div class="row" style="margin-left: 5px;">
            <img id="current-song-image" src="" alt="Current Song Image" style="height: 50px; margin-right: 10px;" />
            <h5 style="text-size-adjust: auto; color: white;" id="current-song-title" class="song-name"></h5>
            <%--<span id="current-song-audio"></span>--%>
            <button class="common_player-play-btn" id="play-pause-btn" style="margin-left: auto; margin-right: 30px;">
                <i class="fa fa-play"></i>
            </button>
        </div>
    </div>
    <!-- ##### Album Category Area End ##### -->

    <!-- ##### Artist Area Start ##### -->

    <!-- ##### Artist Area End ##### -->

    <!-- ##### Song Area Start ##### -->

    <!-- ##### Song Area End ##### -->

</asp:Content>

