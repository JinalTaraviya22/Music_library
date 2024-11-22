<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Playlist_Songs.aspx.cs" Inherits="Music_library.Playlist_Songs" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        audio {
            background: none !important;
            border: none !important;
            padding: 0 !important;
            margin: 0 !important;
            width: auto !important;
            height: auto !important;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- ##### Breadcumb Area Start #####Playlist Image -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>
                <asp:Label ID="plnm" runat="server" Text="Label"></asp:Label></h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <section class="album-catagory section-padding-100-0">
        <!-- ##### Admin Song add Area Start ##### -->
        <asp:UpdatePanel ID="admin" runat="server" Visible="false">
            <ContentTemplate>
                <section class="newsletter-testimonials-area">
                    <div class="container">
                        <div class="row">

                            <!-- Song form Area -->
                            <div class="col-12">
                                <div class="newsletter-area mb-100">
                                    <div class="section-heading text-left mb-50">
                                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                                            <li class="nav-item show active">
                                                <a class="nav-link" id="tab--1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="false">Artist</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="tab--2" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false">Genre</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="newsletter-form">
                                        <div class="tab-content mb-100" id="myTabContent2">
                                            <div class="tab-pane fade show active" id="tab1" role="tabpanel" aria-labelledby="tab--1">
                                                <div class="oneMusic-tab-content">
                                                    <!-- Tab Text -->
                                                    <div class="oneMusic-tab-text">
                                                        <div action="#">
                                                            <div class="form-group">
                                                                <label for="exampleInputGenre">Artist</label>
                                                                <asp:DropDownList ID="a_name" OnSelectedIndexChanged="a_name_SelectedIndexChanged" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="A_Name" DataValueField="A_Email" AutoPostBack="True">
                                                                    <asp:ListItem Text="Select Artist" Value="" />
                                                                </asp:DropDownList>
                                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [A_Name], [A_Email] FROM [Artists_tbl]"></asp:SqlDataSource>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="exampleInputGenre">Albums</label>
                                                                <asp:DropDownList ID="DropDownList2" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" CssClass="form-control" runat="server" DataTextField="Al_Name" DataValueField="Al_Id" AutoPostBack="true">
                                                                    <asp:ListItem Text="Select Album" Value="" />
                                                                </asp:DropDownList>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="exampleInputGenre">Songs</label>
                                                                <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server" DataTextField="S_Name" DataValueField="S_Id" AutoPostBack="True">
                                                                    <asp:ListItem Text="Select Songs" Value="" />
                                                                </asp:DropDownList>
                                                            </div>
                                                            <asp:Button ID="s_btn_album" CssClass="btn oneMusic-btn mt-30" runat="server" Text="Add" OnClick="s_btn_album_Click" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab--2">
                                                <div class="oneMusic-tab-content">
                                                    <!-- Tab Text -->
                                                    <div class="oneMusic-tab-text">
                                                        <div action="#">
                                                            <div class="form-group">
                                                                <label for="exampleInputGenre">Genre</label>
                                                                <asp:DropDownList ID="s_genre" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="S_Genre" DataValueField="S_Genre"></asp:DropDownList>
                                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [S_Genre] FROM [Songs_tbl]"></asp:SqlDataSource>
                                                            </div>
                                                            <asp:Button ID="s_btn" CssClass="btn oneMusic-btn mt-30" OnClick="s_btn_Click" runat="server" Text="Add" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                </section>
            </ContentTemplate>
        </asp:UpdatePanel>

        <!-- ##### Admin Song add Area Start ##### -->


        <!-- ##### Song Area Start ##### -->

        <div class="one-music-songs-area" style="margin-top: 10px;">
            <div class="container">
                <div class="row">
                    <%--<div class="col-12">
                        <div class="section-heading style-2">
                            <p>Popular</p>
                            <h2>Popular releases from Artist</h2>
                        </div>
                    </div>--%>
                    <!-- Single Song Area -->
                    <%--<div class="col-12">
                        <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                            <div class="song-thumbnail">
                                <img src="img/bg-img/s4.jpg" alt="">
                            </div>
                            <div class="song-play-area">
                                <div class="song-name">
                                    <p>01. Main Hit Song</p>
                                </div>
                                <audio preload="auto" controls>
                                    <source src="audio/dummy-audio.mp3">
                                </audio>
                            </div>
                        </div>
                    </div>--%>

                    <%-- song play area with db variables --%>
                    <%--<div class="col-12">
                        <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                            <div class="song-thumbnail">
                                <img src='<%# Eval("S_Image") %>' alt="">
                            </div>
                            <div class="song-play-area">
                                <div class="song-name">
                                    <p style="display: inline;">
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("S_Name") %>'></asp:Label>
                                    </p>
                                    <asp:LinkButton ID="songremove" runat="server" Visible="false" CommandArgument='<%# Eval("S_Id") %>' CommandName="cmd_songRemovePlaylist">
                                        <asp:Image ID="Image2" runat="server" ImageAlign="Right" Height="20px" Width="20px" ImageUrl="~/img/core-img/delw.png" />
                                    </asp:LinkButton>
                                    <asp:HiddenField ID="hidsid" Value='<%# Eval("S_Id") %>' runat="server" />
                                    <audio preload="auto" style="width: 200px">
                                        <source src="<%# Eval("S_Audio") %>">
                                    </audio>
                                </div>
                            </div>
                        </div>
                    </div>--%>

                    <asp:DataList ID="songByPlaylist" runat="server" OnItemCommand="songByPlaylist_ItemCommand">
                        <ItemTemplate>
                            <div class="col-12">

                                <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                                    <div class="song-thumbnail">
                                        <img src='<%# Eval("S_Image") %>' alt="">
                                    </div>
                                    <div class="song-play-area">
                                        <div class="song-name">
                                            <p style="display: inline;">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("S_Name") %>'></asp:Label>
                                            </p>
                                            <asp:LinkButton ID="songremove" runat="server" Visible="false" CommandArgument='<%# Eval("S_Id") %>' CommandName="cmd_songRemovePlaylist">
                                                <asp:Image ID="Image2" runat="server" ImageAlign="Right" Height="20px" Width="20px" ImageUrl="~/img/core-img/delw.png" />
                                            </asp:LinkButton>
                                            <asp:HiddenField ID="hidsid" Value='<%# Eval("S_Id") %>' runat="server" />
                                            <audio preload="auto" controls style="width: 200px"
                                                data-song-title="<%# Eval("S_Name") %>"
                                                data-song-image="<%# Eval("S_Image") %>"
                                                data-song-audio="<%# Eval("S_Audio") %>">
                                                <source src="<%# Eval("S_Audio") %>">
                                            </audio>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
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
            </div>
        </div>
    </section>

    <!-- ##### Song Area End ##### -->

</asp:Content>





