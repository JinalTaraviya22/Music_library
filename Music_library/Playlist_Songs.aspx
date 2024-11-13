<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Playlist_Songs.aspx.cs" Inherits="Music_library.Playlist_Songs" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                                                <a class="nav-link" id="tab--1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="true">Add Songs</a>
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
                                                                <label for="exampleInputGenre">Genre</label>
                                                                <asp:DropDownList ID="s_genre" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="C_Name" DataValueField="C_Id"></asp:DropDownList>
                                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Music_Library.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Category_tbl]"></asp:SqlDataSource>
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

        <div class="one-music-songs-area mb-70" style="margin-top: 40px;">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <!-- <div class="section-heading style-2">
                        <p>Popular</p>
                        <h2>Popular releases from Artist</h2>
                    </div> -->
                    </div>
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
                                            <asp:Button ID="dl1b_playlist" CssClass="button-57" runat="server" Text="Add to playlist" />
                                            <%--PopUp Demo--%>
                                            <asp:Panel ID="Panel1" runat="server" BackColor="White" Width="500">
                                                <h1>Playlists</h1>
                                                <asp:DropDownList ID="ddplaylist" CssClass="form-control" runat="server" DataSourceID="PlaylistByUserId" DataTextField="P_Name" DataValueField="P_Id">
                                                    <asp:ListItem>--Select Playlist--</asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:SqlDataSource ID="PlaylistByUserId" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Music_Library.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Playlist_tbl] WHERE ([P_User_Email] = @P_User_Email)">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="P_User_Email" SessionField="mail" Type="String" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                                <br />
                                                <div class="btnbyside">
                                                    <asp:Button ID="btnadd" CommandArgument='<%# Eval("S_Id") %>' CommandName="cmd_songidForplaylist" CssClass="btn oneMusic-btn mt-30" runat="server" Text="Add" />
                                                    <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="btn oneMusic-btn mt-30" />
                                                </div>
                                            </asp:Panel>

                                            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="dl1b_playlist" PopupControlID="Panel1" OkControlID="btncancel"></ajaxToolkit:ModalPopupExtender>
                                            <%--PopUp Demo--%>
                                            <audio preload="auto" style="width: 200px">
                                                <source src="<%# Eval("S_Audio") %>">
                                            </audio>
                                        </div>
                                    </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>

                </div>
            </div>
        </div>
    </section>

    <!-- ##### Song Area End ##### -->

</asp:Content>





