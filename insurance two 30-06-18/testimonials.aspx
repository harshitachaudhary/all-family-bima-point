<%@ Page Title="" Language="C#" MasterPageFile="~/frontmainmaster.master" AutoEventWireup="true" CodeFile="testimonials.aspx.cs" Inherits="Testimonials" %>

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
								<h2 class="page-title">TESTIMONIALS</h2>
							</div>
						</div>
						<div class="col-md-12 text-center">
							<div class="breadcrumb-trail breadcrumbs">
								<span class="trail-begin"><a href="default.aspx">Home</a></span>
								<span class="sep">/</span> <span class="trail-end">Testimonials</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- End Pages Title  -->





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
    </div>
</asp:Content>

