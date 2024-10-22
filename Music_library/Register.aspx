<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Music_library.Register1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
                       <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>Register</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Login Area Start ##### -->
    <section class="login-area section-padding-100">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="login-content">
                        <h3>Welcome</h3>
                        <!-- Login Form -->
                        <div class="login-form">
                            <div method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <asp:TextBox ID="r_tbmail" CssClass="form-control" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter valid email" ControlToValidate="r_tbmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    <%--<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter E-mail">--%>
                                    <small id="emailHelp" class="form-text text-muted"><i class="fa fa-lock mr-2"></i>We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="wxmapleInputName">Name</label>
                                    <asp:TextBox ID="r_tbnm" CssClass="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter username" ControlToValidate="r_tbnm"></asp:RequiredFieldValidator>
                                    <%--<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">--%>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputDob">Birth Date</label>
                                    <asp:TextBox ID="r_tbdob" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please choose Birth date" ControlToValidate="r_tbdob"></asp:RequiredFieldValidator>
                                    <%--<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">--%>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword">Password</label>
                                    <asp:TextBox ID="r_tbpwd" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords does not match" ControlToCompare="r_tbcpwd" ControlToValidate="r_tbpwd"></asp:CompareValidator>
                                    <%--<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">--%>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputConfirmPassword">Confirm Password</label>
                                    <asp:TextBox ID="r_tbcpwd" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                    <%--<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">--%>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputProfile">Profle Image:</label>
                                    <asp:FileUpload ID="r_imgUpload" CssClass="form-control" runat="server" /><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please enter profile image" ControlToValidate="r_imgUpload"></asp:RequiredFieldValidator>
                                    <%--<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">--%>
                                </div>
                                <asp:Button ID="r_btnregister" CssClass="btn oneMusic-btn mt-30" runat="server" Text="Register" OnClick="r_btnregister_Click" />
                                <%--<button type="submit" class="btn oneMusic-btn mt-30">Register</button>--%>
                                <br/><br/><br/>   
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Login Area End ##### -->

            </asp:Content>





