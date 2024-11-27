<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="RegisterForArtists.aspx.cs" Inherits="Music_library.RegisterForArtists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>

</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
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
                                    <asp:TextBox ID="a_tbmail" CssClass="form-control" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Please Enter valid email" ControlToValidate="a_tbmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    <%--<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter E-mail">--%>
                                    <small id="emailHelp" class="form-text text-muted"><i class="fa fa-lock mr-2"></i>We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="wxmapleInputName">Name</label>
                                    <asp:TextBox ID="a_tbnm" CssClass="form-control" runat="server"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please enter username" ControlToValidate="a_tbnm"></asp:RequiredFieldValidator>
                                    <%--<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">--%>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputDob">Birth Date</label>
                                    <asp:TextBox ID="a_tbdob" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please choose Birth date" ControlToValidate="a_tbdob"></asp:RequiredFieldValidator>
                                    <%--<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">--%>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword">Password</label>
                                    <asp:TextBox ID="a_tbpwd" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords does not match" ControlToCompare="a_tbcpwd" ControlToValidate="a_tbpwd"></asp:CompareValidator>
                                    <%--<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">--%>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputConfirmPassword">Confirm Password</label>
                                    <asp:TextBox ID="a_tbcpwd" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                    <%--<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">--%>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputDescription">Description</label>
                                    <asp:TextBox ID="a_tbdes" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <%--<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">--%>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputProfile">Profle Image:</label>
                                    <asp:FileUpload ID="a_imgUpload" CssClass="form-control" runat="server" />
                                    <asp:Label ID="Label1" runat="server" Text="Upload Image with dimentions of 225*225"></asp:Label>
                                    <%--<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">--%>
                                </div>
                                <asp:HiddenField ID="hfPaymentId" runat="server" />
                                <asp:Button ID="a_submit" CssClass="btn oneMusic-btn mt-30" runat="server" Text="Submit" OnClick="a_submit_Click" OnClientClick="triggerRazorpay(); return false;" />
                                <%--<asp:Button ID="Button1" CssClass="btn oneMusic-btn mt-30" runat="server" Text="Submit" OnClick="a_submit_Click"/>--%>
                                <%--<button type="submit" class="btn oneMusic-btn mt-30">Register</button>--%>
                                <br />
                                <br />
                                <br />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <script>
        function triggerRazorpay() {
            var options = {
                "key": "rzp_test_yCgrsfXSuM7SxL", // Replace with your Razorpay Key ID
                "amount": "100", // Amount in paisa (e.g., 50000 = 500 INR)
                "currency": "INR",
                "name": "Music Library",
                "description": "Registration Fee",
                "handler": function (response) {
                    // On successful payment
                    document.getElementById('<%= hfPaymentId.ClientID %>').value = response.razorpay_payment_id;
                    // Trigger the postback after successful payment
                    __doPostBack('<%= a_submit.UniqueID %>', '');  // Postback to server-side handler
                },
                "prefill": {
                    "email": document.getElementById('<%= a_tbmail.ClientID %>').value,
            "name": document.getElementById('<%= a_tbnm.ClientID %>').value
                },
                "theme": {
                    "color": "#000000"
                }
            };
            var rzp = new Razorpay(options);
            rzp.open();
        }
    </script>

    <!-- ##### Login Area End ##### -->
</asp:Content>


