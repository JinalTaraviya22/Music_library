<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Adalbums.aspx.cs" Inherits="Music_library.Adalbums" %>

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
            <h2>Albumes Info</h2>
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
                        <asp:GridView ID="albumgrid" runat="server" AutoGenerateColumns="False" ItemStyle-HorizontalAlign="Center" OnRowCommand="albumgrid_RowCommand" CssClass="centered-grid" Width="100%">
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
