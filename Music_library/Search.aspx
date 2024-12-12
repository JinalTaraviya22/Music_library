<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Music_library.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<%--<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
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

    <section class="album-catagory section-padding-100-0">
        <div class="container">
            <!-- ##### Album Category Area Start ##### -->
            <div class="row oneMusic-albums" id="albumResults">
                <asp:DataList ID="dlAlbumResults" runat="server" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item">
                            <div class="single-album">
                                <img src='<%# Eval("Image") %>' alt="" />
                                <div class="album-info">
                                    <h5><%# Eval("Name") %></h5>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <!-- ##### Album Category Area End ##### -->

            <!-- ##### Artist Area Start ##### -->
            <div class="row oneMusic-buy-now-area mb-100 p-3" id="buyNowResults">
               <asp:DataList ID="dlBuyNowResults" runat="server" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="col-12 col-sm-6 col-md-3">
                            <div class="single-event-area mb-30">
                                <div class="event-thumbnail">
                                    <img src='<%# Eval("Image") %>' alt="" />
                                </div>
                                <div class="album-info">
                                    <a href='<%# "Artist_Profile.aspx?Aid=" + Eval("Id") %>'>
                                        <h5><%# Eval("Name") %></h5>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <!-- ##### Artist Area End ##### -->

            <!-- ##### Song Area Start ##### -->
            <div class="one-music-songs-area mb-70" id="songResults">
                <asp:Literal ID="litSongResults" runat="server"></asp:Literal>
            </div>
            <!-- ##### Song Area End ##### -->
        </div>
    </section>
</asp:Content>--%>

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

    <section class="album-catagory section-padding-100-0">
        <div class="container">
            <!-- ##### Album Category Area Start ##### -->
            <div class="row oneMusic-albums" id="albumResults">
                <asp:DataList ID="dlAlbumResults" runat="server" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item">
                            <div class="single-album">
                                <img src='<%# Eval("Image") %>' alt="" />
                                <div class="album-info">
                                    <h5><%# Eval("Name") %></h5>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <!-- ##### Album Category Area End ##### -->

            <!-- ##### Artist Area Start ##### -->
           <div class="row oneMusic-albums" id="buyNowResults">
                <asp:DataList ID="dlBuyNowResults" runat="server" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item">
                            <div class="single-album">
                                <img src='<%# Eval("Image") %>' alt="" />
                                <div class='album-info'>
                                    <a href='<%# "Artist_Profile.aspx?Aid=" + Eval("Id") %>'>
                                        <h5><%# Eval("Name") %></h5>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <!-- ##### Artist Area End ##### -->

            <!-- ##### Song Area Start ##### -->
            <div class="new-hits-area mb-100" id="songResults">
                <asp:DataList ID="dlSongResults" runat="server" RepeatDirection="Vertical">
                    <ItemTemplate>
                        <div class="single-new-item d-flex align-items-center justify-content-between wow fadeInUp" data-wow-delay="150ms">
                            <div class="first-part d-flex align-items-center">
                                <div class="thumbnail">
                                    <img src='<%# Eval("Image") %>' alt='<%# Eval("Name") %>' />
                                </div>
                                <div class="content-" style="margin-right: 200px;">
                                    <h6><%# Eval("Name") %></h6>
                                    <%--k<p><%# Eval("Album") %></p>--%>
                                </div>
                            </div>
                            <audio preload="auto" controls>
                                <source src='<%# Eval("Audio") %>' />
                            </audio>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <!-- ##### Song Area End ##### -->
        </div>
    </section>
</asp:Content>


