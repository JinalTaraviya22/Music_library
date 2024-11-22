<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Artists.aspx.cs" Inherits="Music_library.Artists" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <!-- ##### Breadcumb Area Start ##### -->
    <section class="breadcumb-area bg-img bg-overlay" style="background-image: url(img/bg-img/breadcumb3.jpg);">
        <div class="bradcumbContent">
            <p>See what’s new</p>
            <h2>Artists</h2>
        </div>
    </section>
    <!-- ##### Breadcumb Area End ##### -->

    <!-- ##### Events Area Start ##### -->
    <section class="events-area section-padding-100">
        <div class="container">
            <div class="row">

                <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="ListView1_ItemCommand">
                    <ItemTemplate>
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="single-event-area mb-30">
                                <div class="event-thumbnail">
                                    <img src="<%# Eval("A_Image") %>">
                                </div>
                                <div class="event-text">
                                    <h4><%# Eval("A_Name") %></h4>
                                    <asp:LinkButton ID="kbSeeProf" CssClass="btn see-more-btn" runat="server" CommandArgument='<%# Eval("A_Id") %>' CommandName="artist_red">See Profile</asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Music_Library.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [A_Id], [A_Name], [A_Image] FROM [Artists_tbl]"></asp:SqlDataSource>

                <!-- Single Event Area -->
                <!-- <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-event-area mb-30">
                        <div class="event-thumbnail">
                            <img src="img/bg-img/e2.jpg" alt="">
                        </div>
                        <div class="event-text">
                            <h4>The Mission</h4>
                            <div class="event-meta-data">
                                <a href="#" class="event-place">Gold Arena</a>
                                <a href="#" class="event-date">June 15, 2018</a>
                            </div>
                            <a href="Songs-list.html" class="btn see-more-btn">See Event</a>
                        </div>
                    </div>
                </div> -->

                <!-- Single Event Area -->
                <!-- <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-event-area mb-30">
                        <div class="event-thumbnail">
                            <img src="img/bg-img/e3.jpg" alt="">
                        </div>
                        <div class="event-text">
                            <h4>Planet ibiza</h4>
                            <div class="event-meta-data">
                                <a href="#" class="event-place">Space Ibiza</a>
                                <a href="#" class="event-date">June 15, 2018</a>
                            </div>
                            <a href="Songs-list.html" class="btn see-more-btn">See Event</a>
                        </div>
                    </div>
                </div> -->

                <!-- Single Event Area -->
                <!-- <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-event-area mb-30">
                        <div class="event-thumbnail">
                            <img src="img/bg-img/e4.jpg" alt="">
                        </div>
                        <div class="event-text">
                            <h4>Dj Night Party</h4>
                            <div class="event-meta-data">
                                <a href="#" class="event-place">VIP Sala</a>
                                <a href="#" class="event-date">June 15, 2018</a>
                            </div>
                            <a href="#" class="btn see-more-btn">See Event</a>
                        </div>
                    </div>
                </div> -->

                <!-- Single Event Area -->
                <!-- <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-event-area mb-30">
                        <div class="event-thumbnail">
                            <img src="img/bg-img/e5.jpg" alt="">
                        </div>
                        <div class="event-text">
                            <h4>The Mission</h4>
                            <div class="event-meta-data">
                                <a href="#" class="event-place">Gold Arena</a>
                                <a href="#" class="event-date">June 15, 2018</a>
                            </div>
                            <a href="Songs-list.html" class="btn see-more-btn">See Event</a>
                        </div>
                    </div>
                </div> -->

                <!-- Single Event Area -->
                <!-- <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-event-area mb-30">
                        <div class="event-thumbnail">
                            <img src="img/bg-img/e6.jpg" alt="">
                        </div>
                        <div class="event-text">
                            <h4>Planet ibiza</h4>
                            <div class="event-meta-data">
                                <a href="#" class="event-place">Space Ibiza</a>
                                <a href="#" class="event-date">June 15, 2018</a>
                            </div>
                            <a href="Songs-list.html" class="btn see-more-btn">See Event</a>
                        </div>
                    </div>
                </div> -->

                <!-- Single Event Area -->
                <!-- <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-event-area mb-30">
                        <div class="event-thumbnail">
                            <img src="img/bg-img/e7.jpg" alt="">
                        </div>
                        <div class="event-text">
                            <h4>Dj Night Party</h4>
                            <div class="event-meta-data">
                                <a href="#" class="event-place">VIP Sala</a>
                                <a href="#" class="event-date">June 15, 2018</a>
                            </div>
                            <a href="Songs-list.html" class="btn see-more-btn">See Event</a>
                        </div>
                    </div>
                </div> -->

                <!-- Single Event Area -->
                <!-- <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-event-area mb-30">
                        <div class="event-thumbnail">
                            <img src="img/bg-img/e8.jpg" alt="">
                        </div>
                        <div class="event-text">
                            <h4>The Mission</h4>
                            <div class="event-meta-data">
                                <a href="#" class="event-place">Gold Arena</a>
                                <a href="#" class="event-date">June 15, 2018</a>
                            </div>
                            <a href="Songs-list.html" class="btn see-more-btn">See Event</a>
                        </div>
                    </div>
                </div> -->

                <!-- Single Event Area -->
                <!-- <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-event-area mb-30">
                        <div class="event-thumbnail">
                            <img src="img/bg-img/e9.jpg" alt="">
                        </div>
                        <div class="event-text">
                            <h4>Planet ibiza</h4>
                            <div class="event-meta-data">
                                <a href="#" class="event-place">Space Ibiza</a>
                                <a href="#" class="event-date">June 15, 2018</a>
                            </div>
                            <a href="Songs-list.html" class="btn see-more-btn">See Event</a>
                        </div>
                    </div>
                </div> -->

            </div>

            <!-- <div class="row">
                <div class="col-12">
                    <div class="load-more-btn text-center mt-70">
                        <a href="#" class="btn oneMusic-btn">Load More <i class="fa fa-angle-double-right"></i></a>
                    </div>
                </div>
            </div> -->
        </div>
    </section>
    <!-- ##### Events Area End ##### -->

    <!-- ##### Newsletter & Testimonials Area Start ##### -->
    <section class="newsletter-testimonials-area">
        <div class="container">
            <div class="row">

                <!-- Newsletter Area -->
                <div class="col-12 col-lg-6">
                    <div class="newsletter-area mb-100">
                        <div class="section-heading text-left mb-50">
                            <p>See what’s new</p>
                            <h2>Subscribe to newsletter</h2>
                        </div>
                        <div class="newsletter-form">
                            <form action="#">
                                <input type="search" name="search" id="newsletterSearch" placeholder="E-mail">
                                <button type="submit" class="btn oneMusic-btn">Subscribe <i class="fa fa-angle-double-right"></i></button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Testimonials Area -->
                <div class="col-12 col-lg-6">
                    <div class="testimonials-area mb-100 bg-img bg-overlay" style="background-image: url(img/bg-img/bg-3.jpg);">
                        <div class="section-heading white text-left mb-50">
                            <p>See what’s new</p>
                            <h2>Testimonial</h2>
                        </div>
                        <!-- Testimonial Slide -->
                        <div class="testimonials-slide owl-carousel">
                            <!-- Single Slide -->
                            <div class="single-slide">
                                <p>Nam tristique ex vel magna tincidunt, ut porta nisl finibus. Vivamus eu dolor eu quam varius rutrum. Fusce nec justo id sem aliquam fringilla nec non lacus. Suspendisse eget lobortis nisi, ac cursus odio. Vivamus nibh velit, rutrum.</p>
                                <div class="testimonial-info d-flex align-items-center">
                                    <div class="testimonial-thumb">
                                        <img src="img/bg-img/t1.jpg" alt="">
                                    </div>
                                    <p>William Smith, Customer</p>
                                </div>
                            </div>
                            <!-- Single Slide -->
                            <div class="single-slide">
                                <p>Nam tristique ex vel magna tincidunt, ut porta nisl finibus. Vivamus eu dolor eu quam varius rutrum. Fusce nec justo id sem aliquam fringilla nec non lacus. Suspendisse eget lobortis nisi, ac cursus odio. Vivamus nibh velit, rutrum.</p>
                                <div class="testimonial-info d-flex align-items-center">
                                    <div class="testimonial-thumb">
                                        <img src="img/bg-img/t1.jpg" alt="">
                                    </div>
                                    <p>Nazrul Islam, Developer</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- ##### Newsletter & Testimonials Area End ##### -->

    <!-- ##### Contact Area Start ##### -->
    <section class="contact-area section-padding-100 bg-img bg-overlay bg-fixed has-bg-img" style="background-image: url(img/bg-img/bg-2.jpg);">
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
                        <form action="#" method="post">
                            <div class="row">
                                <div class="col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="name" placeholder="Name">
                                    </div>
                                </div>
                                <div class="col-md-6 col-lg-4">
                                    <div class="form-group">
                                        <input type="email" class="form-control" id="email" placeholder="E-mail">
                                    </div>
                                </div>
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <input type="text" class="form-control" id="subject" placeholder="Subject">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <textarea name="message" class="form-control" id="message" cols="30" rows="10" placeholder="Message"></textarea>
                                    </div>
                                </div>
                                <div class="col-12 text-center">
                                    <button class="btn oneMusic-btn mt-30" type="submit">Send <i class="fa fa-angle-double-right"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ##### Contact Area End ##### -->
    <div id="current-song" style="position: fixed; bottom: 0; left: 0; right: 0; background: rgba(0, 0, 0, 0.8); color: white; padding: 10px; display: none; z-index: 1;">
        <div class="row" style="margin-left: 5px;">
            <img id="current-song-image" src="" alt="Current Song Image" style="height: 50px; margin-right: 10px;" />
            <h5 style="text-size-adjust: auto; color: white;" id="current-song-title" class="song-name"></h5>
            <%--<span id="current-song-audio"></span>--%>
            <button class="common_player-play-btn" id="play-pause-btn" style="margin-left: auto; margin-right: 30px;">
                <i class="fa fa-play"></i>
            </button>
        </div>
    </div>
</asp:Content>





