<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Song_List.aspx.cs" Inherits="Music_library.Song_List" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .btnbyside {
            display: flex;
        }

        #popup-window {
            position: fixed;
            width: 300px;
            height: 200px;
            background: white;
            border: 1px solid black;
            padding: 10px;
            margin: auto;
            top: 0;
            right: 0;
            bottom: 0;
            left: 0;
            z-index: 10;
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- ##### Breadcumb Area Start #####Playlist Image -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>
                <asp:Label ID="nm" runat="server" Text=""></asp:Label></h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->


    <section class="album-catagory section-padding-100-0">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <!-- ##### Artist's song upload form start ##### -->
        <asp:UpdatePanel ID="u_songform" runat="server" Visible="False">
            <Triggers>
                <asp:PostBackTrigger ControlID="s_btn" />
                <asp:PostBackTrigger ControlID="alUpdate_btn" />
                <asp:PostBackTrigger ControlID="up_sbtn" />
                <asp:PostBackTrigger ControlID="del_s" />
            </Triggers>
            <ContentTemplate>
                <section class="newsletter-testimonials-area">
                    <div class="container">
                        <div class="row">

                            <!-- Song form Area -->
                            <div class="col-12">
                                <div class="newsletter-area mb-100">
                                    <div class="section-heading text-left mb-50">
                                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                                            <li class="nav-item">
                                                <a class="nav-link" id="tab--1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="true">Add Songs</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="tab--2" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false">Update Songs</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="tab--3" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false">Delete Songs</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link" id="tab--4" data-toggle="tab" href="#tab4" role="tab" aria-controls="tab4" aria-selected="false">Update Album Information</a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="newsletter-form">
                                        <div class="tab-content mb-100" id="myTabContent2">
                                            <div class="tab-pane fade" id="tab1" role="tabpanel" aria-labelledby="tab--1">
                                                <div class="oneMusic-tab-content">
                                                    <!-- Tab Text -->
                                                    <div class="oneMusic-tab-text">
                                                        <div action="#">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Name</label>
                                                                <asp:TextBox ID="s_tbnm" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="exampleInputGenre">Genre</label>
                                                                <asp:DropDownList ID="s_genre" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="C_Name" DataValueField="C_Id"></asp:DropDownList>
                                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Music_Library.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Category_tbl]"></asp:SqlDataSource>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="exampleInputPassword1">Audio</label>
                                                                <asp:FileUpload ID="s_audio" CssClass="form-control" runat="server" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="exampleInputPassword1">Song Cover</label>
                                                                <asp:FileUpload ID="s_cover" CssClass="form-control" runat="server" />
                                                            </div>
                                                            <asp:Button ID="s_btn" CssClass="btn oneMusic-btn mt-30" OnClick="s_btn_Click" runat="server" Text="Upload" />
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
                                                                <label for="exampleInputEmail1">Choose Song:</label>
                                                                <asp:DropDownList ID="up_dds" AutoPostBack="true" OnSelectedIndexChanged="up_dds_SelectedIndexChanged" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="S_Name" DataValueField="S_Id"></asp:DropDownList>
                                                                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Music_Library.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Songs_tbl] WHERE ([S_Al_Id] = @S_Al_Id)">
                                                                    <SelectParameters>
                                                                        <asp:QueryStringParameter Name="S_Al_Id" QueryStringField="Albumid" Type="String" />
                                                                    </SelectParameters>
                                                                </asp:SqlDataSource>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Name</label>
                                                                <asp:TextBox ID="up_s_nm" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="exampleInputGenre">Genre</label>
                                                                <asp:DropDownList ID="up_s_genre" CssClass="form-control" runat="server" DataSourceID="SqlDataSource1" DataTextField="C_Name" DataValueField="C_Id"></asp:DropDownList>
                                                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Music_Library.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Category_tbl]"></asp:SqlDataSource>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="exampleInputPassword1">Cover</label>
                                                                <asp:HiddenField ID="up_s_cover_db" runat="server" />
                                                                <asp:FileUpload ID="up_s_cover" CssClass="form-control" runat="server" />
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="exampleInputPassword1">Audio</label>
                                                                <asp:HiddenField ID="up_s_audio_db" runat="server" />
                                                                <asp:FileUpload ID="up_s_audio" CssClass="form-control" runat="server" />
                                                            </div>
                                                            <asp:Button ID="up_sbtn" OnClick="up_sbtn_Click" CssClass="btn oneMusic-btn mt-30" runat="server" Text="Update" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="tab3" role="tabpanel" aria-labelledby="tab--3">
                                                <div class="oneMusic-tab-content">
                                                    <!-- Tab Text -->
                                                    <div class="oneMusic-tab-text">
                                                        <div action="#">
                                                            <div class="form-group">
                                                                <label for="exampleInputEmail1">Choose Song to Delete</label>
                                                                <asp:DropDownList ID="dd_del" AutoPostBack="true" CssClass="form-control" runat="server" DataSourceID="SqlDataSource3" DataTextField="S_Name" DataValueField="S_Id">
                                                                    <asp:ListItem>--Select Song--</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                            <asp:Button ID="del_s" CssClass="btn oneMusic-btn mt-30" OnClick="del_s_Click" runat="server" Text="Delete" />
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="tab-pane fade" id="tab4" role="tabpanel" aria-labelledby="tab--4">
                                                <div class="oneMusic-tab-content">
                                                    <!-- Tab Text -->
                                                    <div class="oneMusic-tab-text">
                                                        <asp:Panel ID="adminArtist" runat="server">
                                                            <div action="#">
                                                                <div class="form-group">
                                                                    <label for="exampleInputEmail1">Name</label>
                                                                    <asp:TextBox ID="alupdatenm" CssClass="form-control" runat="server"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="exampleInputPassword1">Album Cover</label>
                                                                    <asp:HiddenField ID="alcover_tb" runat="server" />
                                                                    <asp:FileUpload ID="alupdatecover" CssClass="form-control" runat="server" />
                                                                </div>
                                                                <asp:Button ID="alUpdate_btn" CssClass="btn oneMusic-btn mt-30" OnClick="alUpdate_btn_Click" runat="server" Text="Update" />
                                                            </div>
                                                        </asp:Panel>
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
        <!-- ##### Artist's song upload form end ##### -->

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

                    <asp:DataList ID="DataList1" runat="server" DataSourceID="songs_showByAlbum" RepeatDirection="Vertical" OnItemCommand="DataList1_ItemCommand">
                        <ItemTemplate>
                            <div class="col-12">
                                <div class="single-song-area mb-30 d-flex flex-wrap align-items-end">
                                    <div class="song-thumbnail">
                                        <img src="<%# Eval("S_Image") %>" alt="">
                                    </div>
                                    <div class="song-play-area">
                                        <div class="song-name">
                                            <p style="display: inline;">
                                                <asp:Label ID="dl1s_nm" runat="server" Text='<%# Eval("S_Name") %>'></asp:Label>
                                            </p>
                                            <t />
                                            <t />
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
                                        </div>
                                        <audio preload="auto" controls style="width: 200px">
                                            <source src="<%# Eval("S_Audio") %>">
                                        </audio>
                                    </div>
                                </div>
                            </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>

                    <asp:SqlDataSource ID="songs_showByAlbum" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Music_Library.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Songs_tbl] WHERE ([S_Al_Id] = @S_Al_Id)">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="S_Al_Id" QueryStringField="Albumid" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Song Area End ##### -->
</asp:Content>

