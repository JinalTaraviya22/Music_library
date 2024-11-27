<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Adartists.aspx.cs" Inherits="Music_library.Adartists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <style>
        .center-buttons {
            text-align: center;
            margin-top: 10px;
        }

        .sidebar {
            background-color: #f8f9fa; /* Light gray background */
            padding: 15px;
            border-radius: 5px;
        }

        .nav.flex-column .nav-link {
            text-align: left;
            width: 100%;
        }

        .main-content {
            background-color: #ffffff; /* White background for the main content */
            padding: 20px;
            border-radius: 5px;
        }


        .small-search {
            display: inline-block; /* Keeps the input inline */
            width: 200px; /* Set a smaller width */
            height: 30px; /* Adjust the height */
            font-size: 14px; /* Adjust font size */
            padding: 5px; /* Add inner spacing */
            border: 1px solid #ccc; /* Add a border */
            border-radius: 4px; /* Optional: Rounded corners */
            box-sizing: border-box; /* Ensures padding doesn't affect width */
        }

        }
    </style>
    <section class="breadcumb-area bg-img bg-overlay mb-50" style="background-image: url(img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>Artists Info</h2>
        </div>
    </section>
    <br />

    <section class="miscellaneous-area">
        <div class="container">
            <div class="row">
                <!-- Sidebar Section -->
                <div class="col-md-3">
                    <div class="sidebar">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a href="AdUsers.aspx" class="btn btn-dark nav-link mb-2">User</a>
                            </li>
                            <li class="nav-item">
                                <a href="Adartists.aspx" class="btn btn-dark nav-link mb-2">Artists</a>
                            </li>
                            <li class="nav-item">
                                <a href="Adalbums.aspx" class="btn btn-dark nav-link mb-2">Albums</a>
                            </li>
                            <li class="nav-item">
                                <a href="Adsongs.aspx" class="btn btn-dark nav-link">Songs</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- Main Content Section-->
                <div class="col-md-9">
                    <div class="main-content">
                        <%-- search area --%>
                        <div class="search-bar text-center mb-50">
                            <asp:TextBox ID="search_txt" placeholder="Search Here..." runat="server" class="form-control d-inline-block w-50"></asp:TextBox>
                            <asp:Button ID="Button1" runat="server" Text="Search" CssClass="btn btn-dark" OnClick="search_Click" EnableViewState="True" Font-Bold="True" Font-Size="10" ForeColor="White" />
                        </div>
                        <%-- search area --%>
                        <asp:GridView ID="artistgrid" runat="server" AutoGenerateColumns="False" OnRowCommand="artistgrid_RowCommand" CssClass="centered-grid" Width="100%">
                            <Columns>
                                <asp:TemplateField HeaderText="Id" HeaderStyle-Width="50" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="center-item" ItemStyle-Height="20">
                                    <ItemTemplate>
                                        <asp:Label ID="Label18" runat="server" Text='<%# Eval("A_Id") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Name" HeaderStyle-Width="100" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="center-item" ItemStyle-Height="50">
                                    <ItemTemplate>
                                        <asp:Label ID="Label19" runat="server" Text='<%# Eval("A_Name") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Email" HeaderStyle-Width="200" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="center-item" ItemStyle-Height="50">
                                    <ItemTemplate>
                                        <asp:Label ID="Label20" runat="server" Text='<%# Eval("A_Email") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Date of Birth" HeaderStyle-Width="100" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="center-item" ItemStyle-Height="50">
                                    <ItemTemplate>
                                        <asp:Label ID="Label21" runat="server" Text='<%# Eval("A_Dob") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Password" HeaderStyle-Width="100" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="center-item" ItemStyle-Height="50">
                                    <ItemTemplate>
                                        <asp:Label ID="Label22" runat="server" Text='<%# Eval("A_Password") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Image" HeaderStyle-HorizontalAlign="Center" ItemStyle-Height="50" ItemStyle-CssClass="center-item" ItemStyle-Width="100">
                                    <ItemTemplate>
                                        <asp:Image ID="Image4" runat="server" ImageAlign="AbsMiddle" ImageUrl='<%# Eval("A_Image") %>' />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Profile" HeaderStyle-Width="200" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="center-item" ItemStyle-Height="50">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="artistprofile" runat="server" CommandArgument='<%# Eval("A_Id") %>' CommandName="cmd_artistprofile">See Profile</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Delete" HeaderStyle-Width="100" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="center-item" ItemStyle-Height="50">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="artistdelete" runat="server" CommandArgument='<%# Eval("A_Id") %>' CommandName="cmd_artistdel">
                                            <asp:Image ID="Image2" runat="server" ImageUrl="~/img/core-img/del.png" />
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <br>
                        <div class="center-buttons">
                            <asp:Button ID="pre" runat="server" Text="Pre" OnClick="pre_Click1" CssClass="btn btn-dark" />
                            &nbsp;&nbsp;
                            <asp:Button ID="next" runat="server" Text="Next" OnClick="next_Click1" CssClass="btn btn-dark" />
                        </div>

                        <!-- grid view end -->
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

