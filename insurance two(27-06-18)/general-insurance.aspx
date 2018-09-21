<%@ Page Title="" Language="C#" MasterPageFile="~/frontmainmaster.master" AutoEventWireup="true" CodeFile="general-insurance.aspx.cs" Inherits="generalinsurance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    



		<!-- Start Pages Title  -->

		<section id="Page-title" class="Page-title-Style2">
			<div class="color-overlay"></div>
			<div class="container inner-img">
				<div class="row">
					<div class="Page-title">
						<div class="col-md-12 text-center">
							<div class="title-text">
								<h6>All Family Bima Point</h6>
								<h2 class="page-title">General Insurance</h2>
							</div>
						</div>
						<div class="col-md-12 text-center">
							<div class="breadcrumb-trail breadcrumbs">
								<span class="trail-begin"><a href="default.aspx">Home</a></span>
								<span class="sep">/</span> <span class="trail-end">General Insurance</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- End Pages Title  -->

		

    <section id="Projects" class="light-wrapper">
			<!-- =================== services single content ================== -->
			<section class="insurance-single-item-content">
				<div class="container inner">
					<div class="row">
						
						<div class="col-lg-9 col-md-8 col-sm-6 col-xs-12">
							<div class="insurance-service-details">
								<!-- Tab panes -->
								<div class="tab-content">
									



									<div class="tab-pane active row" id="insurance">
										<%--<img class="img-responsive col-lg-8 col-md-7 col-sm-12 col-xs-12" src="images/services/3.jpg" alt="image">--%>


                                  <asp:Image ID="Image1" class="img-responsive col-lg-8 col-md-7 col-sm-12 col-xs-12" runat="server" />

										<div class="slider_container col-lg-4 col-md-5 col-sm-12 col-xs-12">
											<div id="services-single-slider4" class="carousel slide" data-ride="carousel">
												<!-- Indicators -->
												<ol class="carousel-indicators">
													<li data-target="#services-single-slider4" data-slide-to="0" class="active"></li>
													<li data-target="#services-single-slider4" data-slide-to="1"></li>
													<li data-target="#services-single-slider4" data-slide-to="2"></li>
                                                    <li data-target="#services-single-slider4" data-slide-to="3"></li>
												</ol>
												<!-- Wrapper for slides -->
												<div class="carousel-inner inner_slider_container" role="listbox">
													


                                                   <asp:Repeater ID="Rpt1Insu" runat="server">
                                                       <ItemTemplate>
                                                    <div class="item active">
														
														<a href="mutual-funds.aspx"><%# Eval("heading") %></a>
														<p style="text-align:justify;padding-right: 20px;"><%# Eval("contentA") %>... <a href="mutual-funds.aspx">read more</a></p>
													</div>
                                                    </ItemTemplate>
                                                   </asp:Repeater>



                                                      <asp:Repeater ID="Rpt2Insu" runat="server">
                                                       <ItemTemplate>
													<div class="item">
														
															<a href="general-insurance.aspx"><%# Eval("heading") %></a>
														<p style="text-align:justify;padding-right: 20px;"><%# Eval("contentA") %>... <a href="general-insurance.aspx">read more</a></p>
													</div>
													 </ItemTemplate>
                                                   </asp:Repeater>



                                                    <asp:Repeater ID="Rpt3Insu" runat="server">
                                                       <ItemTemplate>
													<div class="item">
														
															<a href="health-insurance.aspx"><%# Eval("heading") %></a>
														<p style="text-align:justify;padding-right: 20px;"><%# Eval("contentA") %>... <a href="health-insurance.aspx">read more</a></p>
													</div>
													 </ItemTemplate>
                                                   </asp:Repeater>



                                                    <asp:Repeater ID="Rpt4Insu" runat="server">
                                                       <ItemTemplate>
													<div class="item">
														
															<a href="life-insurance.aspx"><%# Eval("heading") %></a>
														<p style="text-align:justify;padding-right: 20px;"><%# Eval("contentA") %>... <a href="life-insurance.aspx">read more</a></p>
													</div>
													 </ItemTemplate>
                                                   </asp:Repeater>





												</div> <!-- end inner_slider_container -->
											</div> <!-- end #services-single-slider -->
										</div> <!-- end slider_container -->
										<div class="insurance-service-title clear_fix col-lg-12 col-md-12 col-sm-12 col-xs-12">
											<h1><asp:Label ID="lblheading" runat="server" Font-Size="25px" Font-Bold="true"></asp:Label></h1>
											<span class="decor_default"></span>
										</div>
										<div class="text col-lg-12 col-md-12 col-sm-12 col-xs-12">
											
                                            <p style="text-align:justify;">
                                                <asp:Label ID="lblcontent" runat="server"></asp:Label></p>
                                            
                                              <p style="text-align:center;">
                                                <%--<a href="#"  class="btn btn-large main-bg">View Plan</a>--%>
                                                <asp:Button id="BtnViewPlan" runat="server" Text="View Plan" class="btn btn-large main-bg" OnClick="BtnViewPlan_Click"></asp:Button>
                                            </p>
										</div>
										<div class="clearfix"></div>
										<!-- start single insurance short info -->
										
										<!-- end single insurance short info -->
									</div>


									
								</div>
							</div> <!-- End insurance-service-details -->
						</div>


                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
							<div class="insurance-single-item-nav-holder">
								<!-- Nav tabs -->
								<ul class="nav nav-tabs tabs-left"><!-- 'tabs-right' for right tabs -->
									<li ><a href="health-insurance.aspx">Life Insurance <i class="fa fa-angle-right"></i></a></li>
									<li><a href="health-insurance.aspx">Health Insurance <i class="fa fa-angle-right"></i></a></li>
									<li class="active"><a href="life-insurance.aspx">General Insurance <i class="fa fa-angle-right"></i></a></li>
									<li ><a href="mutual-funds.aspx">Mutual Fund <i class="fa fa-angle-right"></i></a></li>
									
								</ul>
							</div>
							<div class="Categories-Blog widget" style="margin-top:50px;">
								<div class="Top-Title-SideBar">
									<h3>Quick Links</h3>
								</div>
								<div class="Categories-Block">
									<ul>
										<li><a href="about-us.aspx"><i class="fa fa-angle-double-right"></i><p>About Us</p></a></li>
										<li><a href="testimonials.aspx"><i class="fa fa-angle-double-right"></i><p>Testimonial</p></a></li>
										<li><a href="documents.aspx"><i class="fa fa-angle-double-right"></i><p>Documants</p></a></li>
										<li><a href="query.aspx"><i class="fa fa-angle-double-right"></i><p>Query Form</p></a></li>
										<li><a href="gallery.aspx"><i class="fa fa-angle-double-right"></i><p>Gallery</p></a></li>
										<li><a href="contact-us.aspx"><i class="fa fa-angle-double-right"></i><p>Contact Us</p></a></li>
									</ul>
								</div>
							</div>
						</div>


					</div> <!-- End row -->

				</div> <!-- End container -->
			</section> <!-- /insurance-single-item-content -->


			<!-- =================== /services single content ================== -->
		</section>








</asp:Content>

