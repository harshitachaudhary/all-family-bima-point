<%@ Page Title="" Language="C#" MasterPageFile="~/frontmainmaster.master" AutoEventWireup="true" CodeFile="about-us.aspx.cs" Inherits="aboutus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div>
        
		<!-- Start Pages Title  -->

		<section id="Page-title" class="Page-title-Style1">
			<div class="color-overlay"></div>
			<div class="container inner-img">
				<div class="row">
					<div class="Page-title">
						<div class="col-md-12 text-center">
							<div class="title-text">
								<h6>ALL FAMILY BIMA POINT</h6>
								<h2 class="page-title">About Us</h2>
							</div>
						</div>
						<div class="col-md-12 text-center">
							<div class="breadcrumb-trail breadcrumbs">
								<span class="trail-begin"><a href="default.aspx">Home</a></span>
								<span class="sep">/</span> <span class="trail-end">About Us</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- End Pages Title  -->

		<!-- Start Our Why Us -->

		<section id="Why_Us" class="light-wrapper about-page">
			<div class="container inner">
				<div class="row">
					<div class="col-md-6">
						<div class="title-section text-left">
							<p>History</p>
							<h3>The Company</h3>
						</div>
						<div class="divcod40"></div>
						<div class="accordions">
							<div class="tap-inner">
                                <asp:Repeater ID="RptImage" runat="server"><ItemTemplate>

								<img src="<%# ResolveUrl(Eval("content").ToString()) %>" alt="portfolio" width="250" height="182">
                                      </ItemTemplate>
                                </asp:Repeater>
								<div class="text-accordions">
                                    <p style="text-align:justify"><asp:Label ID="lblhd1" runat="server"></asp:Label>  </p><br />
                                    <p style="text-align:justify"> <asp:Label ID="lblhd2" runat="server"></asp:Label></p><br />
                                    <p style="text-align:justify"> <asp:Label ID="lblhd3" runat="server"></asp:Label></p>

								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="title-section text-left">
							<p>We Are Good</p>
							<h3>Our Features</h3>
						</div>
						<div class="divcod40"></div>
						<div class="features-box">
							<div class="row">
								<div class="col-xs-12 col-md-12">


                                    <asp:Repeater ID="rptfeatures" runat="server"><ItemTemplate>

									<div class="feature ">
										<i class="<%# Eval("icon") %>"></i>
										<h3><%# Eval("heading") %></h3>
										<p><%# Eval("content") %></p>
									</div>

                                    </ItemTemplate></asp:Repeater>





									
								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- End Our Why Us -->

		<!-- Start Our Services -->

		<section id="Services" class="whitesmoke-wrapper">
			<div class="container inner">
				<div class="row">
					<div class="col-md-12">
						<div class="title-section text-left">
							<p>THE BEST</p>
							<h3>OUR SERVICES</h3>
						</div>
						<div class="description-welcome text-left">
							<p>To be a leader and role model in a broad based and integrated Insurance services with 100% customer satisfaction..</p>

						</div>
					</div>
				</div>
				<div class="divcod55"></div>
				<div class="row">



                    <asp:Repeater ID="Rptabotsrvc" runat="server">
                                            <ItemTemplate>
					<div class="col-xs-12 col-sm-6 col-lg-3 col-md-3 none-padding">
						<div class="services-block-img text-center">
							<img src="<%# ResolveUrl(Eval("img").ToString()) %>" alt="">
							<div class="block-services">
								<i class="<%# Eval("icon") %>"></i>
								<h4><a href="#"><%# Eval("name") %></a></h4>
								<p><%# Eval("desc_") %></p>
							</div>
						</div>
					</div>

                      </ItemTemplate>
                                        </asp:Repeater>



					
					
					
				</div>
				
			</div>
		</section>

		<!-- End Our Services -->

		<!-- Start Our Team -->

		<section id="Team" class="light-wrapper">
			<div class="container inner">
				<div class="row">
					<div class="col-md-12">
						<div class="title-section text-left">
							<p>Creatives</p>
							<h3>Our Agent</h3>
						</div>
						<div class="description-welcome text-left">
							<p>Our core values describe the attitude and behavior, we believe in delivering best services to our clients forever.</p>

						</div>
					</div>
				</div>
				<div class="divcod55"></div>
				<div class="row">

                    <asp:Repeater ID="rptrteam" runat="server"><ItemTemplate>

					<div class="team-item col-xs-12 col-sm-6 col-md-3">
						<div class="team-item-block">
							<div class="team-thumb">
								<img src="<%# ResolveUrl(Eval("img").ToString()) %>" alt="Mahmoud ADel Baghagho" class="img-rounded" style=" border-radius: 50%!important;">
								
							</div>
							<div class="info-team">
								<h5><%# Eval("name") %></h5>
								<p class="team-company"><%# Eval("designation") %></p>
							</div>
						</div>
					</div>

                        </ItemTemplate></asp:Repeater>



					
				</div>
			</div>
		</section>

		<!-- End Our Team -->




		<!-- Start Our Testimonials -->

		<section id="Testimonials" class="whitesmoke-wrapper">
			<div class="container inner">
				<div class="row">
					<div class="col-md-12">
						<div class="title-section text-left">
							<p>People Say</p>
							<h3>Testimonials</h3>
						</div>
						<div class="description-welcome text-left">
                                     <p>BIMA POINT THANKS TO ALL CUSTOMER TO SUPORT AND TRUST . BIMA POINT COMMITED TO

                                         PROVIDE BEST SERVICES FOREVER TO CUSTOMER SATISFACTION</p>
						</div>
					</div>
				</div>
				<div class="divcod55"></div>
				<div class="row">
					<div id="Testimonials-3col" class="owl-carousel owl-theme">

                        <asp:Repeater ID="Rpttesti" runat="server">
                                            <ItemTemplate>

						<div class="item-testimonial">
							<div class="quote-client">
								<p><%# Eval("desc_") %></p>
							</div>
							<!-- End quote-client -->
							<div class="info-client">
								<div class="avata"><img src="<%# ResolveUrl(Eval("img").ToString()) %>" alt=""></div>
								<span class="client-name"><%# Eval("name") %></span>
								<span class="client-position"><%# Eval("degisnation") %></span>
							</div>
							<!-- End info-client -->
						</div>

                       </ItemTemplate>
                                        </asp:Repeater>







						
					</div>
				</div>
			</div>
		</section>

		<!-- End Our Testimonials -->

		<!-- Start Our Clients -->

		<section id="Clients" class="light-wrapper">
			<div class="container inner">
				<div class="row">
					<div class="col-md-12">
						<div class="title-section text-left">
							<p>They Trust Us</p>
							<h3>WE ARE ASSOCIATED WITH INDIA’S LEADING INSURANCE COMPANY</h3>
						</div>
						
					</div>
				</div>
				<div class="divcod55"></div>
				<div class="row">
					<div class="col-md-12">
						<div id="Our-clients" class="owl-carousel owl-theme">


                            <asp:Repeater ID="rptrprtnt" runat="server"><ItemTemplate>
							<a href="#" class="item-client"><img src="<%# ResolveUrl(Eval("img").ToString()) %>" alt="customer" width="170" height="68"></a>
                                  </ItemTemplate></asp:Repeater>


							
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- End Our Clients  -->



    </div>

</asp:Content>

