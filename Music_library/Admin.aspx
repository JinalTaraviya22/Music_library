<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Music_library.Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        #demo {
            width: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- ##### Breadcumb Area Start ##### -->
    <div class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb2.jpg);">
        <div class="bradcumbContent">
            <p>
                <asp:Label ID="u_nm" runat="server" Text=""></asp:Label>
            </p>
            <h2>Admin</h2>
        </div>
    </div>
    <!-- ##### Breadcumb Area End ##### -->

    <section class="miscellaneous-area section-padding-100-0">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="oneMusic-tabs-content">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link" id="tab--1" data-toggle="tab" href="#tab1" role="tab" aria-controls="tab1" aria-selected="false">Users</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="tab--2" data-toggle="tab" href="#tab2" role="tab" aria-controls="tab2" aria-selected="false">Artists</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="tab--3" data-toggle="tab" href="#tab3" role="tab" aria-controls="tab3" aria-selected="false">Albums</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="tab--4" data-toggle="tab" href="#tab4" role="tab" aria-controls="tab4" aria-selected="false">Delete Account Requests</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-12">
                    <div class="tab-content mb-100" id="myTabContent">
                        <div class="tab-pane fade" id="tab1" role="tabpanel" aria-labelledby="tab--1">
                            <div class="oneMusic-tab-content">
                                <!-- Tab Text -->
                                <div class="oneMusic-tab-text">
                                    <p>
                                        <center>
                                            <asp:GridView ID="usrgrid" runat="server" AutoGenerateColumns="False" OnRowCommand="usrgrid_RowCommand" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Id" HeaderStyle-Width="50" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="20">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("U_Id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Image" HeaderStyle-Width="100" HeaderStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                        <ItemTemplate>
                                                            <asp:Image ID="Image1" runat="server" ImageAlign="AbsMiddle" ImageUrl='<%# Eval("U_Image") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Email" HeaderStyle-Width="200" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("U_Email") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Name" HeaderStyle-Width="100" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("U_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Date of Birth" HeaderStyle-Width="100" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("U_Dob") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Password" HeaderStyle-Width="100" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("U_Password") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Delete" HeaderStyle-Width="100" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("U_Id") %>' CommandName="cmd_usrdel">
                                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/img/core-img/del.png" />
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </center>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tab2" role="tabpanel" aria-labelledby="tab--2">
                            <div class="oneMusic-tab-content">
                                <!-- Tab Text -->
                                <div class="oneMusic-tab-text">
                                    <p>
                                        <center>
                                            <asp:GridView ID="artistgrid" runat="server" AutoGenerateColumns="False" OnRowCommand="artistgrid_RowCommand" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Id" HeaderStyle-Width="50" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="20">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label18" runat="server" Text='<%# Eval("A_Id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Name" HeaderStyle-Width="100" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label19" runat="server" Text='<%# Eval("A_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Email" HeaderStyle-Width="200" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label20" runat="server" Text='<%# Eval("A_Email") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Date of Birth" HeaderStyle-Width="100" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label21" runat="server" Text='<%# Eval("A_Dob") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Password" HeaderStyle-Width="100" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label22" runat="server" Text='<%# Eval("A_Password") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Image" ItemStyle-Height="50" ItemStyle-Width="100">
                                                        <ItemTemplate>
                                                            <asp:Image ID="Image4" runat="server" ImageAlign="AbsMiddle" ImageUrl='<%# Eval("A_Image") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Description" HeaderStyle-Width="200" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label23" runat="server" Text='<%# Eval("A_description") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Profile" HeaderStyle-Width="200" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="artistprofile" runat="server" CommandArgument='<%# Eval("A_Id") %>' CommandName="cmd_artistprofile">See Profile</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Delete" HeaderStyle-Width="100" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="artistdelete" runat="server" CommandArgument='<%# Eval("A_Id") %>' CommandName="cmd_artistdel">
                                                                <asp:Image ID="Image2" runat="server" ImageUrl="~/img/core-img/del.png" />
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </center>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="tab3" role="tabpanel" aria-labelledby="tab--3">
                            <div class="oneMusic-tab-content">
                                <!-- Tab Text -->
                                <div class="oneMusic-tab-text">
                                    <p style="text-align: center">
                                        <center>
                                            <asp:GridView ID="albumgrid" runat="server" AutoGenerateColumns="False" OnRowCommand="albumgrid_RowCommand" Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Id" HeaderStyle-Width="50" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="20">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label24" runat="server" Text='<%# Eval("Al_Id") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Artist_Email" HeaderStyle-Width="200" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label25" runat="server" Text='<%# Eval("Al_A_Email") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Name" HeaderStyle-Width="100" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label26" runat="server" Text='<%# Eval("Al_Name") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Image" ItemStyle-Height="50" ItemStyle-Width="100">
                                                        <ItemTemplate>
                                                            <asp:Image ID="Image5" runat="server" ImageUrl='<%# Eval("Al_Image") %>' />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="View" HeaderStyle-Width="100" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("Al_Id") %>' CommandName="cmd_album">View</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Delete" HeaderStyle-Width="100" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# Eval("Al_Id") %>' CommandName="cmd_delalbum">Delete</asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </center>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade show active" id="tab4" role="tabpanel" aria-labelledby="tab--4">
                            <div class="oneMusic-tab-content">
                                <!-- Tab Text -->
                                <div class="oneMusic-tab-text">
                                    <p><center>
                                        <asp:GridView ID="dellaccgrid" runat="server" AutoGenerateColumns="False" OnRowCommand="dellaccgrid_RowCommand" Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Id" HeaderStyle-Width="50" HeaderStyle-HorizontalAlign="center" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="20">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label27" runat="server" Text='<%# Eval("Ad_Id") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Email" HeaderStyle-Width="200" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label28" runat="server" Text='<%# Eval("Ad_U_Email") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name" HeaderStyle-Width="100" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label29" runat="server" Text='<%# Eval("U_Name") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Approve" HeaderStyle-Width="100" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton5" runat="server" CommandArgument='<%# Eval("Ad_U_Email") %>' CommandName="cmd_accDelMail" ForeColor="#99CC00">Approve</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Decline" HeaderStyle-Width="100" ItemStyle-HorizontalAlign="Center" ItemStyle-Height="50">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# Eval("Ad_U_Email") %>' CommandName="cmd_accMail" ForeColor="Red">Decline</asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        </center>
                                    </p>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
        <!-- ##### Newsletter & Testimonials Area End ##### -->
    </section>
</asp:Content>

