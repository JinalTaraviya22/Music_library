<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User_Account.aspx.cs" Inherits="Music_library.User_Account" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            left: 0px;
            top: 0px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb2.jpg);">
        <div class="bradcumbContent">
            <p>
                <asp:Label ID="u_nm" runat="server" Text=""></asp:Label>
            </p>
            <h2>Your Library</h2>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <section class="miscellaneous-area section-padding-100-0">

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div class="container mb-30" id="adminPages" runat="server" visible="false">
            <div class="row">
                <div class="col-12">
                    <div class="oneMusic-tabs-content">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a href="AdUsers.aspx" class="btn btn-dark nav-link" role="tab" aria-controls="tab1" aria-selected="false">User</a>
                            </li>
                            <li class="nav-item">
                                <a href="Adartists.aspx" class="btn btn-dark nav-link" role="tab" aria-controls="tab1" aria-selected="false">Artists</a>

                            </li>
                            <li class="nav-item">
                                <a href="Adalbums.aspx" class="btn btn-dark nav-link" role="tab" aria-controls="tab1" aria-selected="false">Albums</a>
                            </li>
                            <li class="nav-item">
                                <a href="Adsongs.aspx" class="btn btn-dark nav-link" role="tab" aria-controls="tab1" aria-selected="false">Songs</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <!-- ***** weeks top ***** -->

                <div class="col-12 col-lg-6">
                    <div class="weeks-top-area mb-100">

                        <!-- ##### User playlist area start##### -->
                        <asp:UpdatePanel ID="u_playlist" runat="server" Visible="False">
                            <ContentTemplate>
                                <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
                                    <p>See what’s new</p>
                                    <h2>Playlists</h2>
                                </div>

                                <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="DataList2_ItemCommand" OnItemDataBound="DataList2_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="single-top-item d-flex wow fadeInUp" data-wow-delay="100ms">
                                            <div class="thumbnail">
                                                <asp:Image ID="alimg" ImageUrl='<%# Eval("P_Image") %>' runat="server" />
                                            </div>
                                            <div class="content-">
                                                <h6>
                                                    <asp:Label ID="p_nm" runat="server" Text='<%# Eval("P_Name") %>'></asp:Label></h6>
                                                <p>
                                                    <asp:LinkButton ID="p_link" runat="server" CommandArgument='<%# Eval("P_Id") %>' CommandName="cmd_playlistId">See Playlist</asp:LinkButton>&nbsp;&nbsp;|&nbsp;&nbsp;
                                                    <asp:LinkButton ID="aldel" runat="server" CommandArgument='<%# Eval("P_Id") %>' CommandName="cmd_playlistDel" ForeColor="Red" PostBackUrl="#">Delete</asp:LinkButton>
                                                </p>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Music_Library.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Playlist_tbl] WHERE ([P_User_Email] = @P_User_Email)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="P_User_Email" SessionField="mail" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <!-- ##### User playlist area end##### -->

                        <!-- ##### Artist album area start##### -->
                        <asp:UpdatePanel ID="u_albumlist" runat="server" Visible="False">
                            <ContentTemplate>
                                <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
                                    <p>Your</p>
                                    <h2>Albums</h2>
                                </div>

                                <!-- Single Top Item -->
                                <%--<div class="single-top-item d-flex wow fadeInUp" data-wow-delay="100ms">
                                    <div class="thumbnail">
                                        <img src="img/bg-img/wt1.jpg" alt="">
                                    </div>
                                    <div class="content-">
                                        <h6>Sam Smith</h6>
                                        <p>Underground</p>
                                    </div>
                                </div>--%>

                                <asp:DataList ID="DataList1" runat="server" DataKeyField="Al_Id" OnItemCommand="DataList1_ItemCommand" DataSourceID="SqlDataSource1">
                                    <ItemTemplate>
                                        <div class="single-top-item d-flex wow fadeInUp" data-wow-delay="100ms">
                                            <div class="thumbnail">
                                                <asp:Image ID="alimg" ImageUrl='<%# Eval("Al_Image") %>' runat="server" />
                                            </div>
                                            <div class="content-">
                                                <h6>
                                                    <asp:Label ID="alnm" runat="server" Text='<%# Eval("Al_Name") %>'></asp:Label></h6>
                                                <p>
                                                    <asp:LinkButton ID="alid" runat="server" CommandArgument='<%# Eval("Al_Id") %>' CommandName="cmd_alShow">See Album</asp:LinkButton>&nbsp;&nbsp;|&nbsp;&nbsp;
                                                    <asp:LinkButton ID="aldel" runat="server" CommandArgument='<%# Eval("Al_Id") %>' CommandName="cmd_alDel" ForeColor="Red" PostBackUrl="#">Delete</asp:LinkButton>
                                                </p>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Music_Library.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [Album_tbl] WHERE ([Al_A_Email] = @Al_A_Email)">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="Al_A_Email" SessionField="mail" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <!-- ##### Artist album area end##### -->

                    </div>
                </div>

                <!-- ***** Popular Artists ***** -->
                <div class="col-12 col-lg-6">
                    <div class="popular-artists-area mb-100">
                        <div class="section-heading text-left mb-50 wow fadeInUp" data-wow-delay="50ms">
                            <p>See what’s new</p>
                            <h2>Artist you follow</h2>
                        </div>

                        <!-- Single Artist -->
                        <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="100ms">
                            <div class="thumbnail">
                                <img src="img/bg-img/pa1.jpg" alt="">
                            </div>
                            <div class="content-">
                                <p>Sam Smith</p>
                            </div>
                        </div>

                        <!-- Single Artist -->
                        <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="150ms">
                            <div class="thumbnail">
                                <img src="img/bg-img/pa2.jpg" alt="">
                            </div>
                            <div class="content-">
                                <p>William Parker</p>
                            </div>
                        </div>

                        <!-- Single Artist -->
                        <div class="single-artists d-flex align-items-center wow fadeInUp" data-wow-delay="200ms">
                            <div class="thumbnail">
                                <img src="img/bg-img/pa3.jpg" alt="">
                            </div>
                            <div class="content-">
                                <p>Jessica Walsh</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <section class="newsletter-testimonials-area">
            <div class="container">
                <div class="row">
                    <div class="col-12 col-lg-6">
                        <div class="newsletter-area mb-100">
                            <!-- ##### artist form start##### -->
                            <asp:UpdatePanel ID="u_artist" runat="server" Visible="False">
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="al_btn" />
                                </Triggers>
                                <ContentTemplate>
                                    <div class="section-heading text-left mb-50">
                                        <p>See what’s new</p>
                                        <h2>Add new Album</h2>
                                    </div>
                                    <div class="newsletter-form">
                                        <form action="#">
                                            <div class="form-group">
                                                <label for="exampleinputeTailB">Album Name</label>
                                                <asp:TextBox ID="al_tbnm" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label fof="eUampleinputpassword1">Album Cover</label>
                                                <asp:FileUpload ID="alcoverupload" CssClass="form-control" runat="server" />
                                                <asp:Label ID="alcover_error" runat="server" Text="Upload file with dimentions of 300*300"></asp:Label>
                                            </div>
                                            <asp:Button ID="al_btn" CssClass="btn oneMusic-btn m-2" runat="server" OnClick="al_btn_Click" Text="Add Album" />
                                        </form>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <!-- ##### artist form end##### -->

                            <!-- ##### user playlist form start##### -->
                            <asp:UpdatePanel ID="u_user" runat="server" Visible="False">
                                <Triggers>
                                    <asp:PostBackTrigger ControlID="p_btn" />
                                </Triggers>
                                <ContentTemplate>
                                    <div class="section-heading text-left mb-50">
                                        <p>See what’s new</p>
                                        <h2>Create New Playlist</h2>
                                    </div>
                                    <div class="newsletter-form">
                                        <form action="#">
                                            <div class="form-group">
                                                <label for="exampleinputeTailB">Playlist Name</label>
                                                <asp:TextBox ID="p_nm" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label fof="eUampleinputpassword1">Playlist Cover</label>
                                                <asp:FileUpload ID="p_cover" CssClass="form-control" runat="server" />
                                                <asp:Label ID="Label1" runat="server" Text="Upload file with dimentions of 300*300"></asp:Label>
                                            </div>
                                            <asp:Button ID="p_btn" CssClass="btn oneMusic-btn m-2" OnClick="p_btn_Click" runat="server" Text="Create" />
                                        </form>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <!-- ##### user playlist form end##### -->

                        </div>
                    </div>

                    <!-- Personal Info form-->
                    <div class="col-12 col-lg-6">
                        <div class="newsletter-area mb-100 oneMusic-tabs-content">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link" id="tab--1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="false">Update Account Info</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="tab--2" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false">Password/Delete Account</a>
                                </li>
                            </ul>
                            <div class="tab-content mb-100" id="myTabContent">
                                <div class="tab-pane fade" id="tab1" role="tabpanel" aria-labelledby="tab--1">
                                    <div class="oneMusic-tab-content">
                                        <!-- Tab Text -->
                                        <div class="oneMusic-tab-text">
                                            <div class="login-form">
                                                <div action="#" method="post">
                                                    <div class="form-group">
                                                        <label for="exampleinputemail1">Name</label>
                                                        <asp:TextBox ID="tbnm" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleinputemail1">Email</label>
                                                        <asp:TextBox ID="tbmail" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleinputemail1">Date of Birth</label>
                                                        <asp:TextBox ID="tbdob" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <!--if artist then show description-->
                                                    <asp:UpdatePanel ID="a_des" runat="server" Visible="false">
                                                        <ContentTemplate>
                                                            <div class="form-group">
                                                                <label for="exampleinputemail1">Description</label>
                                                                <asp:TextBox ID="tbdes" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </ContentTemplate>
                                                    </asp:UpdatePanel>

                                                    <div class="form-group">
                                                        <label for="exampleinputpassword1">Profile</label>
                                                        <asp:HiddenField ID="tbimg_db" runat="server" />
                                                        <asp:FileUpload ID="tbimg" CssClass="form-control" runat="server" />
                                                    </div>
                                                    <asp:Button ID="a_btn" CssClass="btn oneMusic-btn m-2" OnClick="a_btn_Click" runat="server" Text="Update" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab--2">
                                    <div class="oneMusic-tab-content">
                                        <!-- Tab Text -->
                                        <div class="oneMusic-tab-text">
                                            <div class="login-form">
                                                <div action="#" method="post">
                                                    <div class="form-group">
                                                        <label for="exampleinputemail1">Enter Old Password</label>
                                                        <asp:HiddenField ID="tboldpwd_db" runat="server" />
                                                        <asp:TextBox ID="tboldpwd" CssClass="form-control" runat="server"></asp:TextBox>
                                                        <asp:Label ID="pwdError" runat="server" Visible="false" ForeColor="Red" Text="Password Incorrect."></asp:Label>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleinputemail1">New Password</label>
                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ForeColor="Red" ErrorMessage=" Passwords do not match." ControlToCompare="tbcpwd" ControlToValidate="tbnewpwd"></asp:CompareValidator>
                                                        <asp:TextBox ID="tbnewpwd" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="exampleinputemail1">Confirm Password</label>
                                                        <asp:TextBox ID="tbcpwd" CssClass="form-control" runat="server"></asp:TextBox>
                                                    </div>
                                                    <center>
                                                        <asp:Button ID="pwd_btn" CssClass="btn oneMusic-btn m-2" OnClick="pwd_btn_Click" runat="server" Text="Update" />
                                                        <br />
                                                        Click here to delete yout account.
                                                        <asp:Button ID="del_acc" CssClass="btn oneMusic-btn m-2" OnClick="del_acc_Click" runat="server" Text="Delete" /></center>
                                                </div>
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
        <!-- ##### Newsletter & Testimonials Area End ##### -->
    </section>
</asp:Content>



