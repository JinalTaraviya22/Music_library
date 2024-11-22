<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Playlists.aspx.cs" Inherits="Music_library.Playlists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>Playlists By Our Editors</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Album Catagory Area Start ##### -->
    <section class="album-catagory section-padding-100-0">
        <div class="container">
            <div class="row oneMusic-albums">

                <!-- Single Album -->
                <%--<div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item t c p">
                    <div class="single-album">
                        <img src="img/bg-img/a1.jpg" alt="">
                        <div class="album-info">
                            <a href="#">
                                <h5>The Cure</h5>
                            </a>
                            <p>Second Song</p>
                        </div>
                    </div>
                </div>--%>

                <asp:ListView ID="ListView1" runat="server" OnItemCommand="ListView1_ItemCommand">
                    <ItemTemplate>
                        <asp:LinkButton ID="playid" runat="server" CommandName="playid" CommandArgument='<%# Eval("P_Id") %>'>
                            <div class="col-12 col-sm-4 col-md-3 col-lg-2 single-album-item">
                                <div class="single-album">
                                    <img src="<%# Eval("P_Image") %>" alt="">
                                    <div class="album-info">
                                        <h5>
                                            <asp:Label ID="playlistName" runat="server" Text='<%#Eval("P_Name") %>'></asp:Label></h5>
                                    </div>
                                </div>
                            </div>
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:ListView>

            </div>
        </div>
    </section>
    <!-- ##### Album Catagory Area End ##### -->
</asp:Content>

