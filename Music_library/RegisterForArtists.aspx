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
                                <asp:Button ID="a_submit" CssClass="btn oneMusic-btn mt-30" runat="server" Text="Submit" OnClick="a_submit_Click" />
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
    <form id="payment_form" method="post" runat="server" style="display: none;">
        <asp:HiddenField ID="razorpay_payment_id" runat="server" />
    </form>
    <!-- ##### Login Area End ##### -->
    <script type="text/javascript">
        function openRazorpay() {
            var options = {
                "key": "YOUR_RAZORPAY_KEY_ID", // Replace with your Razorpay Key ID
                "amount": "10000", // Amount in paise (10000 paise = 100 INR)
                "currency": "INR",
                "name": "Your Site Name",
                "description": "Registration Fee",
                "image": "https://example.com/your_logo.jpg", // Replace with your logo URL
                "handler": function (response) {
                    // Send the payment details to your server
                    document.getElementById('razorpay_payment_id').value = response.razorpay_payment_id;
                    document.getElementById('payment_form').submit();
                },
                "theme": {
                    "color": "#F37254"
                }
            };
            var rzp1 = new Razorpay(options);
            rzp1.open();
            return false; // Prevent form submission
        }
    </script>
</asp:Content>


