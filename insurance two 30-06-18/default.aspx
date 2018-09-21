<%@ Page Title="" Language="C#" MasterPageFile="~/frontmainmaster.master" AutoEventWireup="true" CodeFile="default.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div>
        <!-- slider -->
        <div id="slider">
            <!-- revolution slider begin -->
            <div class="fullwidthbanner-container">
                <div id="revolution-slider">
                    <ul>
                        <asp:Repeater ID="RptBanner" runat="server">
                            <ItemTemplate>


                                <li data-transition="fade" data-slotamount="7" data-masterspeed="2500" data-delay="5000">
                                    <!--  BACKGROUND IMAGE -->
                                    <img src="<%# ResolveUrl(Eval("image").ToString()) %>" alt="">

                                    <div class="tp-caption lft custom-font-2" data-x="center" data-y="184" data-speed="800" data-start="800" data-easing="easeInOutCubic">
                                        <%# Eval("heading1") %>
                                    </div>

                                    <div class="tp-caption sfb custom-font-1" data-x="center" data-y="250" data-speed="800" data-start="1400" data-easing="easeInOutCubic">
                                        <%# Eval("heading2") %> <span><%# Eval("heading3") %> </span>
                                    </div>


                                </li>

                            </ItemTemplate>
                        </asp:Repeater>





                    </ul>
                </div>
            </div>
            <!-- revolution slider close -->
        </div>
        <!-- slider close -->

        <main>
			<!-- Start Our Services -->

		<section id="Services" class="light-wrapper">
			<div class="container inner">
				<div class="row">
					<div class="col-md-12">
						<div class="title-section text-left">
							<p>THE BEST</p>
							<h3>OUR SERVICES</h3>
						</div>
						<div class="description-welcome text-left">
                            <p>To be a leader and role model in a broad based and integrated Insurance services with 100%
                                 Customer Satisfaction.</p>
						</div>
					</div>
				</div>
				<div class="divcod55"></div>
				<div class="row">
					
					

                     <asp:Repeater ID="Repeatsrvc" runat="server">
                                    <ItemTemplate>

					<div class="col-xs-12 col-sm-6 col-lg-3 col-md-3">
						<div class="welcome-Block text-center">
							<div class="Top-welcome">
								<i class="icon <%# Eval("icon") %>"></i>
								<h4><%# Eval("servicename") %></h4>
							</div>
							<div class="hover-welcome">
								<p><%# Eval("desc_") %>  </p>
                               
								
							</div>
						</div>
					</div>
                            </ItemTemplate>
                                </asp:Repeater>





                    
					
				</div>
				
			</div>
		</section>

		<!-- End Our Services -->
			<!-- ======= /Welcome section ======= -->

			<!-- End Our Services -->

			<!-- Start Our Projects -->



			<!-- End Our Projects -->

			<!-- Start Our Why Us -->

			<section id="Why_Us" class="light-wrapper" style="margin-top:-128px;">
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
						<div class="col-md-6 get-quote-section">
							<div class="title-section text-left">
								<p>IN THE NEWS</p>
								<h3>GET A QUOTE</h3>
							</div>
							<div class="divcod40"></div>



							<div class="get-quote-form">

								
									<!-- Name -->
									<div class="form-input">
										<input id="txtname" type="text" class="form-control" placeholder="Your Name"  runat="server"/>
									</div>
									<!-- Email -->
									<div class="form-group form-input">
										<input id="txtemail" type="email" class="form-control" placeholder="Your Email Address"  runat="server"/>
									</div>
									<div class="form-input">
										<input id="txtsubject" type="text" class="form-control" placeholder="Phone Number"  runat="server"/>
									</div>
									<!-- Matter -->
									<div class="form-input">
										<textarea id="txtcomment" class="form-control" rows="5" placeholder="Your Message"  runat="server"></textarea>
									</div>
									<!-- Button -->


                                <asp:Button ID="btnsubmit" class="btn" runat="server" Text="submit" OnClick="btnsubmit_Click"  />

								<%--	<button type="submit" class="btn">Submit</button> &nbsp;


									<button type="reset" class="btn">Reset</button>--%>
								
							</div>






						</div>
					</div>
				</div>
			</section>

			<!-- End Our Why Us -->

			<!-- Start Our Testimonials -->

			<section id="Testimonials" class="whitesmoke-wrapper">
				<div class="container inner">
					<div class="row">
						<div class="col-md-12">
							<div class="title-section text-left">
								<p>About us</p>
								<h3>Meet our insurance Agents</h3>
							</div>
							<div class="description-welcome text-left">
								<p>Our core values describe the attitude and behavior, we believe in delivering best services to our
                           clients forever.</p>

							</div>
						</div>
					</div>
					<div class="divcod55"></div>
					<!-- Start Out Team Area V-3 -->
					<div class="row">


                        <asp:Repeater ID="rptrteam" runat="server"><ItemTemplate>
						<div class="team-item col-xs-12 col-sm-6 col-md-3">
							<div class="team-item-block">
								<div class="team-thumb">
									<img src="<%# ResolveUrl(Eval("img").ToString()) %>" alt="Mahmoud ADel Baghagho" class="img-rounded" style=" border-radius: 50%!important;"  >
									
								</div>
								<div class="info-team">
									<h5><%# Eval("name") %></h5>
									<p class="team-company"><%# Eval("designation") %></p>
								</div>
							</div>
						</div>
                         </ItemTemplate></asp:Repeater>


						
					</div>
					<!-- End Out Team Area V-3 -->

				</div>
			</section>

			<!-- End Our Testimonials -->

			<!-- Start Our Vision -->

			<section id="happy-customers" class="light-wrapper">
				<div class="container inner">
					<div class="row">
						<div class="col-md-12">
							<div class="title-section text-left">
								<p>OUR VISION</p>
								<h3>Best insurances for everyone</h3>
							</div>
							<div class="description-welcome text-left">
								<p>To be a leader and role model in a broad based and integrated Insurance services with 100%
                           customer satisfaction.</p>

							</div>
						</div>
					</div>
					<div class="divcod55"></div>




					<div class="row">

						<div class="col-md-3 col-sm-6 col-xs-12 text-center">
							<span class="icon-mobile el-icon3x"></span>
							<div class="fact">
								<div class="fact-number timer" data-perc="987">
									<span class="factor color-primary"></span>
								</div>
								<span class="fact-title">Satisfied Customers</span>
							</div>
						</div>

						<div class="col-md-3 col-sm-6 col-xs-12 text-center">
							<span class="icon-desktop el-icon3x"></span>
							<div class="fact">
								<div class="fact-number timer" data-perc="5">
									<span class="factor color-success"></span>
								</div>
								<span class="fact-title">professional agents</span>
							</div>
						</div>

						<div class="col-md-3 col-sm-6 col-xs-12 text-center">
							<span class="icon-wallet el-icon3x"></span>
							<div class="fact">
								<div class="fact-number timer" data-perc="10">
									<span class="factor color-warning"></span>
								</div>
								<span class="fact-title">insurances in our offer</span>
							</div>
						</div>

						<div class="col-md-3 col-sm-6 col-xs-12 text-center">
							<span class="icon-briefcase el-icon3x"></span>
							<div class="fact">
								<div class="fact-number timer" data-perc="15">
									<span class="factor color-danger"></span>
								</div>
								<span class="fact-title">years of experience</span>
							</div>
						</div>

					</div>


				</div>
			</section>

			<!-- End Our Vision  -->

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


                            <p>Bima point thanks to all customer to support and trust. Bima Point Commited to provide best services forever to customer satisfaction.</p>

                                   
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
								<p><%# Eval("desc_") %> </p>
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
							<h3>We are associated with India’s leading insurance company</h3>
						</div>
						
					</div>
				</div>
				<div class="divcod55"></div>
				<div class="row">
					<div class="col-md-12">

                         
						<div id="Our-clients" class="owl-carousel owl-theme">
							<asp:Repeater ID="rptrprtnt" runat="server"><ItemTemplate>
                                <a href="#" class="item-client">
                                
                                <img src="<%# ResolveUrl(Eval("img").ToString()) %>" alt="customer" width="170" height="68"></a>

							                                            </ItemTemplate></asp:Repeater>

                                   

						</div>

                     
					</div>
				</div>
			</div>
		</section>

		<!-- End Our Clients  -->





		</main>



    </div>


</asp:Content>

