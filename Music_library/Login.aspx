<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Music_library.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>Login</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->
    <!-- ##### Login Area Start ##### -->
    <section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="login-content">
                        <h3>Welcome Back</h3>
                        <!-- Login Form -->
                        <div class="login-form">
                            <div action="#" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <asp:TextBox ID="l_tbmail" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                                    <%--<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter E-mail">--%>
                                    <small id="emailHelp" class="form-text text-muted"><i class="fa fa-lock mr-2"></i>We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <asp:TextBox ID="l_tbpwd" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                    <%--<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">--%>
                                </div>
                                <asp:Label ID="l_error" ForeColor="Red" runat="server" Text=""></asp:Label><br />
                                <asp:Button ID="l_btn" CssClass="btn oneMusic-btn mt-30" runat="server" Text="Login" OnClick="l_btn_Click" />
                                <%--<button type="submit" class="btn oneMusic-btn mt-30">Login</button>--%>
                                <br />
                                <br />
                                <br />
                                <div>Don't have an account?<a href="register.aspx"> Sign Up</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Login Area End ##### -->

</asp:Content>



