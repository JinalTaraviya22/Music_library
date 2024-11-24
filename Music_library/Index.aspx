<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Music_library.Index" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- ##### Hero Area Start ##### -->
    <section class="hero-area">
        <div class="hero-slides owl-carousel">
            <!-- Single Hero Slide -->
            <div class="single-hero-slide d-flex align-items-center justify-content-center">
                <!-- Slide Img -->
                <div class="slide-img bg-img" style="background-image: url(img/bg-img/bg-1.jpg);">
                </div>
                <!-- Slide Content -->
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="hero-slides-content text-center">
                                <h6 data-animation="fadeInUp" data-delay="100ms">Music Space</h6>
                                <h2 data-animation="fadeInUp" data-delay="300ms">Last Frequency<span>Last Frequency</span></h2>
                                <a data-animation="fadeInUp" data-delay="500ms" href="#" class="btn oneMusic-btn mt-50">Discover <i class="fa fa-angle-double-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Hero Slide -->
            <div class="single-hero-slide d-flex align-items-center justify-content-center">
                <!-- Slide Img -->
                <div class="slide-img bg-img" style="background-image: url(img/bg-img/bg-2.jpg);">
                </div>
                <!-- Slide Content -->
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <div class="hero-slides-content text-center">
                                <h6 data-animation="fadeInUp" data-delay="100ms">Music Space</h6>
                                <h2 data-animation="fadeInUp" data-delay="300ms">Last Frequency<span>Last Frequency</span></h2>
                                <a data-animation="fadeInUp" data-delay="500ms" href="#" class="btn oneMusic-btn mt-50">Discover <i class="fa fa-angle-double-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Hero Area End ##### -->

    <!-- ##### Latest Albums Area Start ##### -->
    <section class="latest-albums-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading style-2">
                        <p>Playlist</p>
                        <h2>Playlists for different occations</h2>
                    </div>
                    <div class="mb-4" style="display: flex; justify-content: flex-end">
                        <asp:LinkButton ID="Playlist_SeeAll" CssClass="btn" runat="server" OnClick="Playlist_SeeAll_Click">See All</asp:LinkButton>
                        <%--<button class="btn" style="align-content: end">See All</button>--%>
                    </div>
                </div>
            </div>

            <!-- latest playlist by-->
            <div class="row">
                <div class="col-12">
                    <div class="albums-slideshow owl-carousel">


                        <asp:ListView ID="ListView2" runat="server" OnItemCommand="ListView2_ItemCommand">
                            <ItemTemplate>
                                <div class="single-album">
                                    <div class="album-thumb">
                                        <img src='<%# Eval("P_Image") %>'>
                                    </div>
                                    <div class="album-info">
                                        <asp:LinkButton ID="playid" runat="server" CommandName="playid" CommandArgument='<%# Eval("P_Id") %>'>
                                            <h5>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("P_Name") %>'></asp:Label></h5>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>

                        <!-- Single Album -->
                        <%--<div class="single-album">
                            <img src="img/bg-img/a1.jpg" alt="">
                            <div class="album-info">
                                <a href="#">
                                    <h5>The Cure</h5>
                                </a>
                                <p>
                                    Second Song
                                </p>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Latest Albums Area End ##### -->

    <!-- ##### Latest Songs Area Start ##### -->
    <section class="latest-albums-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading style-2">
                        <p>Albums</p>
                        <h2>Latest albums by our top artists</h2>
                    </div>
                </div>
            </div>
            <!-- latest playlist by-->
            <div class="row">
                <div class="col-12">
                    <div class="albums-slideshow owl-carousel">
                        <!-- Single Album -->
                        <%--<div class="single-album">
                            <img src="img/bg-img/a1.jpg" alt="">
                            <div class="album-info">
                                <a href="#">
                                    <h5>The Cure</h5>
                                </a>
                                <p>
                                    Second Song
                                </p>
                            </div>
                        </div>--%>

                        <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand">
                            <ItemTemplate>
                                <div class="single-album">
                                    <div class="album-thumb">
                                        <img src='<%# Eval("Al_Image") %>'>
                                    </div>
                                    <div class="album-info">
                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("Al_Id") %>' CommandName="alid">
                                            <h5>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Al_Name") %>'></asp:Label></h5>
                                        </asp:LinkButton>
                                        <p>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("A_Name") %>'></asp:Label>
                                        </p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>

                        <!-- Single Album -->
                        <%--<div class="single-album">
                            <img src="img/bg-img/a2.jpg" alt="">
                            <div class="album-info">
                                <a href="#">
                                    <h5>Sam Smith</h5>
                                </a>
                                <p>
                                    Underground
                                </p>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Latest Songs Area End ##### -->

    <!-- ##### Miscellaneous Area Start ##### -->
    <section class="miscellaneous-area section-padding-100-0">
        <div class="container">
            <div class="row">

                <!-- ***** New Hits Songs ***** -->
                <div class="col-12 col-lg-6">
                    <div class="new-hits-area mb-100">
                        <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
                            <p>See what’s new</p>
                            <h2>New Hits</h2>
                        </div>

                        <!-- Single Top Item -->
                        <%--<div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="100ms">
                            <div class="first-part d-flex align-items-center">
                                <div class="thumbnail">
                                    <img src="img/bg-img/wt7.jpg" alt="">
                                </div>
                                <div class="content-">
                                    <h6>Sam Smith</h6>
                                    <p>
                                        Underground
                                    </p>
                                </div>
                            </div>
                            <audio preload="auto" controls>
                                <source src="audio/dummy-audio.mp3">
                            </audio>
                        </div>--%>

                        <asp:ListView ID="ListView4" runat="server">
                            <ItemTemplate>
                                <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="150ms">
                                    <div class="first-part d-flex align-items-center">
                                        <div class="thumbnail">
                                            <img src='<%# Eval("S_Image") %>' alt="">
                                        </div>
                                        <div class="content-">
                                            <h6>
                                                <asp:Label ID="snm" runat="server" Text='<%# Eval("S_Name") %>'></asp:Label></h6>
                                            <p>
                                                <asp:Label ID="anm" runat="server" Text='<%# Eval("A_Name") %>'></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                    <audio preload="auto" controls >
                                        <source src="<%# Eval("S_Audio") %>">
                                    </audio>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>

                    </div>
                </div>

                <!-- ***** Popular Artists ***** -->
                <div class="col-12 col-lg-6">
                    <div class="popular-artists-area mb-100">
                        <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
                            <p>
                                See what’s new
                            </p>
                            <h2>Popular Artist</h2>
                        </div>


                        <!-- Single Artist -->
                        <%--<div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="100ms">
                            <div class="thumbnail">
                                <img src="img/bg-img/pa1.jpg" alt="">
                            </div>
                            <div class="content-">
                                <p>
                                    Sam Smith
                                </p>
                            </div>
                        </div>--%>

                        <asp:ListView ID="ListView3" runat="server" OnItemCommand="ListView3_ItemCommand">
                            <ItemTemplate>
                                <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="100ms">
                                    <div class="thumbnail">
                                        <img src='<%# Eval("A_Image") %>'>
                                    </div>
                                    <div class="content-">
                                        <p>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("A_Id") %>' CommandName="cmd_artistId">
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("A_Name") %>'></asp:Label>
                                            </asp:LinkButton>
                                        </p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>

                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- current playing song area start -->
   <%-- <div id="now-playing" class="now-playing">
        <div class="container d-flex align-items-center">
            <div class="song-info">
                <h5 id="song-title" style="color:white">No song playing</h5>
                <p id="song-artist">---</p>
            </div>
            <div class="player-controls">
                <button id="play-pause-btn" class="btn btn-primary">
                    <i id="play-pause-icon" class="fa fa-play"></i>
                </button>
                <input type="range" id="progress-bar" value="0" class="progress-bar" />
            </div>
        </div>
    </div>--%>
    <!--current playing song area ends  -->

    <!-- ##### Miscellaneous Area End ##### -->
</asp:Content>





