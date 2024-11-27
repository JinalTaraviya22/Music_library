<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Artist_Profile.aspx.cs" Inherits="Music_library.Artist_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay"
        style="background-image: url(img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>
                <asp:Label ID="artist_nm" runat="server" Text=""></asp:Label></h2>
            <asp:HiddenField ID="artist_mail" runat="server" />
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->


    <!-- ##### Add Area Start ##### -->
    <section class="album-catagory section-padding-100-0">
        <div class="container">
            <div class="add-area mb-80">
                <div class="container">
                    <div class="row">
                        <div class="col-12">
                            <table style="padding:10px">
                                <tr><td style="height:300px;width:300px;" >
                                    <asp:Image ID="Image1" runat="server"/></td>
                                    <td style="padding:20px;">
                                        <asp:Label ID="Label2" runat="server" Text=""></asp:Label></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Add Area End ##### -->

    <!-- ##### Buy Now Area Start ##### -->
    <section class="latest-albums-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading style-2">
                        <p>Albums</p>
                        <h2>Artist's Albums</h2>
                    </div>
                </div>
                <!-- latest playlist by-->
                <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand" DataKeyField="Al_Id" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div class="col-12 col-sm-6 col-md-3">
                            <div class="single-album-area">
                                <div class="album-thumb">
                                    <img src='<%# Eval("Al_Image") %>' height='300' width='300'>
                                </div>
                                <div class="album-info">
                                    <h5>
                                        <asp:LinkButton ID="LinkButton1" CommandName="alid" CommandArgument='<%# Eval("Al_Id") %>' runat="server">
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Al_Name") %>' />
                                        </asp:LinkButton></h5>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Music_Library.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Album_tbl] WHERE ([Al_A_Email] = @Al_A_Email)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="artist_mail" Name="Al_A_Email" PropertyName="Value" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </section>
    <!-- ##### Buy Now Area End ##### -->

    <!-- ##### play list Area Start ##### -->
    <%--<section class="latest-albums-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading style-2">
                        <p>Playlist</p>
                        <h2>Featuring Artist</h2>
                    </div>
                </div>
            </div>
            <!-- latest playlist by-->
            <div class="row">
                <div class="col-12">
                    <div class="albums-slideshow owl-carousel">
                        <!-- Single Album -->
                        <div class="single-album">
                            <img src="img/bg-img/a1.jpg" alt="">
                            <div class="album-info">
                                <a href="Playlist_Songs.aspx">
                                    <h5>The Cure</h5>
                                </a>
                                <p>Second Song</p>
                            </div>
                        </div>
                        <!-- Single Album -->
                        <div class="single-album">
                            <img src="img/bg-img/a2.jpg" alt="">
                            <div class="album-info">
                                <a href="Playlist_Songs.aspx">
                                    <h5>Sam Smith</h5>
                                </a>
                                <p>Underground</p>
                            </div>
                        </div>
                        <!-- Single Album -->
                        <div class="single-album">
                            <img src="img/bg-img/a3.jpg" alt="">
                            <div class="album-info">
                                <a href="Playlist_Songs.aspx">
                                    <h5>Will I am</h5>
                                </a>
                                <p>First</p>
                            </div>
                        </div>
                        <!-- Single Album -->
                        <div class="single-album">
                            <img src="img/bg-img/a4.jpg" alt="">
                            <div class="album-info">
                                <a href="Playlist_Songs.aspx">
                                    <h5>The Cure</h5>
                                </a>
                                <p>Second Song</p>
                            </div>
                        </div>
                        <!-- Single Album -->
                        <div class="single-album">
                            <img src="img/bg-img/a5.jpg" alt="">
                            <div class="album-info">
                                <a href="Playlist_Songs.aspx">
                                    <h5>DJ SMITH</h5>
                                </a>
                                <p>The Album</p>
                            </div>
                        </div>
                        <!-- Single Album -->
                        <div class="single-album">
                            <img src="img/bg-img/a6.jpg" alt="">
                            <div class="album-info">
                                <a href="Playlist_Songs.aspx">
                                    <h5>The Ustopable</h5>
                                </a>
                                <p>Unplugged</p>
                            </div>
                        </div>
                        <!-- Single Album -->
                        <div class="single-album">
                            <img src="img/bg-img/a7.jpg" alt="">
                            <div class="album-info">
                                <a href="Playlist_Songs.aspx">
                                    <h5>Beyonce</h5>
                                </a>
                                <p>Songs</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>--%>
    <!-- ##### play list Area End ##### -->
</asp:Content>
