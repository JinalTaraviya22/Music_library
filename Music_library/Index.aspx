<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Music_library.Index" %>
<%@ Register TagPrefix="uc" TagName="currentPlaying" Src="~/currentPlaying.ascx" %>


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

    <!-- Include the currentPlaying user control -->
    <uc:currentPlaying runat="server" ID="currentPlayingControl" />

    <!-- ##### Latest Albums Area Start ##### -->
    <section class="latest-albums-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading style-2">
                        <p>Playlist</p>
                        <h2>Playlists for different occations</h2>
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
                            <p>
                                See what’s new
                            </p>
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
                                            <h6><asp:Label ID="snm" runat="server" Text='<%# Eval("S_Name") %>'></asp:Label></h6>
                                            <p>
                                                <asp:Label ID="anm" runat="server" Text='<%# Eval("A_Name") %>'></asp:Label>
                                            </p>
                                        </div>
                                    </div>
                                    <audio preload="auto" controls>
                                        <source src='<%# Eval("S_Audio") %>'>
                                    </audio>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>

                        <!-- Single Top Item -->
                        <%--<div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="150ms">
                            <div class="first-part d-flex align-items-center">
                                <div class="thumbnail">
                                    <img src="img/bg-img/wt8.jpg" alt="">
                                </div>
                                <div class="content-">
                                    <h6>Power Play</h6>
                                    <p>
                                        In my mind
                                    </p>
                                </div>
                            </div>
                            <audio preload="auto" controls>
                                <source src="audio/dummy-audio.mp3">
                            </audio>
                        </div>--%>

                        <!-- Single Top Item -->
                        <%--<div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="200ms">
                            <div class="first-part d-flex align-items-center">
                                <div class="thumbnail">
                                    <img src="img/bg-img/wt9.jpg" alt="">
                                </div>
                                <div class="content-">
                                    <h6>Cristinne Smith</h6>
                                    <p>
                                        My Music
                                    </p>
                                </div>
                            </div>
                            <audio preload="auto" controls>
                                <source src="audio/dummy-audio.mp3">
                            </audio>
                        </div>--%>

                        <!-- Single Top Item -->
                        <%--<div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="250ms">
                            <div class="first-part d-flex align-items-center">
                                <div class="thumbnail">
                                    <img src="img/bg-img/wt10.jpg" alt="">
                                </div>
                                <div class="content-">
                                    <h6>The Music Band</h6>
                                    <p>
                                        Underground
                                    </p>
                                </div>
                            </div>
                            <audio preload="auto" controls>
                                <source src="audio/dummy-audio.mp3">
                            </audio>
                        </div>--%>

                        <!-- Single Top Item -->
                        <%--<div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="300ms">
                            <div class="first-part d-flex align-items-center">
                                <div class="thumbnail">
                                    <img src="img/bg-img/wt11.jpg" alt="">
                                </div>
                                <div class="content-">
                                    <h6>Creative Lyrics</h6>
                                    <p>
                                        Songs and stuff
                                    </p>
                                </div>
                            </div>
                            <audio preload="auto" controls>
                                <source src="audio/dummy-audio.mp3">
                            </audio>
                        </div>--%>

                        <!-- Single Top Item -->
                        <%--<div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="350ms">
                            <div class="first-part d-flex align-items-center">
                                <div class="thumbnail">
                                    <img src="img/bg-img/wt12.jpg" alt="">
                                </div>
                                <div class="content-">
                                    <h6>The Culture</h6>
                                    <p>
                                        Pop Songs
                                    </p>
                                </div>
                            </div>
                            <audio preload="auto" controls>
                                <source src="audio/dummy-audio.mp3">
                            </audio>
                        </div>--%>
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
                                            <p><asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("A_Id") %>' CommandName="cmd_artistId"><asp:Label ID="Label4" runat="server" Text='<%# Eval("A_Name") %>'></asp:Label></asp:LinkButton>
                                            </p>
                                        </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>

                        <!-- Single Artist -->
                        <%--<div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="150ms">
                            <div class="thumbnail">
                                <img src="img/bg-img/pa2.jpg" alt="">
                            </div>
                            <div class="content-">
                                <p>
                                    William Parker
                                </p>
                            </div>
                        </div>--%>

                        <!-- Single Artist -->
                        <%--<div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="200ms">
                            <div class="thumbnail">
                                <img src="img/bg-img/pa3.jpg" alt="">
                            </div>
                            <div class="content-">
                                <p>
                                    Jessica Walsh
                                </p>
                            </div>
                        </div>--%>

                        <!-- Single Artist -->
                        <%--<div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="250ms">
                            <div class="thumbnail">
                                <img src="img/bg-img/pa4.jpg" alt="">
                            </div>
                            <div class="content-">
                                <p>
                                    Tha Stoves
                                </p>
                            </div>
                        </div>--%>

                        <!-- Single Artist -->
                        <%--<div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="300ms">
                            <div class="thumbnail">
                                <img src="img/bg-img/pa5.jpg" alt="">
                            </div>
                            <div class="content-">
                                <p>
                                    DJ Ajay
                                </p>
                            </div>
                        </div>--%>

                        <!-- Single Artist -->
                        <%-- <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="350ms">
                            <div class="thumbnail">
                                <img src="img/bg-img/pa6.jpg" alt="">
                            </div>
                            <div class="content-">
                                <p>
                                    Radio Vibez
                                </p>
                            </div>
                        </div>--%>

                        <!-- Single Artist -->
                        <%--<div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="400ms">
                            <div class="thumbnail">
                                <img src="img/bg-img/pa7.jpg" alt="">
                            </div>
                            <div class="content-">
                                <p>
                                    Music 4u
                                </p>
                            </div>
                        </div>--%>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Miscellaneous Area End ##### -->
</asp:Content>





