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
        </div>
    </section>
    <!-- ##### Album Category Area End ##### -->

    <!-- ##### Buy Now Area Start ##### -->
    <div class="row oneMusic-buy-now-area mb-100" id="buyNowResults">
        <asp:Literal ID="litBuyNowResults" runat="server"></asp:Literal>
    </div>
    <!-- ##### Buy Now Area End ##### -->

    <!-- ##### Song Area Start ##### -->
    <div class="one-music-songs-area mb-70" id="songResults">
        <asp:Literal ID="litSongResults" runat="server"></asp:Literal>
    </div>
    <!-- ##### Song Area End ##### -->

    <!-- ##### Contact Area Start ##### -->
    <%--<section class="contact-area section-padding-100 bg-img bg-overlay bg-fixed has-bg-img" style="background-image: url(img/bg-img/bg-2.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading white">
                        <p>See what’s new</p>
                        <h2>Get In Touch</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <!-- Contact Form Area -->
                    <div class="contact-form-area">
                        <form action="Contact.aspx" method="post">
                            <!-- Form fields and submit button -->
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>--%>
    <!-- ##### Contact Area End ##### -->
</asp:Content>

