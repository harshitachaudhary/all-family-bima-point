<%@ Page Title="" Language="C#" MasterPageFile="~/frontmainmaster.master" AutoEventWireup="true" CodeFile="contact-us.aspx.cs" Inherits="contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <!-- Start Pages Title  -->

		<section id="Page-title" class="Page-title-Style3">
			<div class="color-overlay"></div>
			<div class="container inner-img">
				<div class="row">
					<div class="Page-title">
						<div class="col-md-12 text-center">
							<div class="title-text">
								<h6>ALL FAMILY BIMA POINT</h6>
								<h2 class="page-title">Contact Us</h2>
							</div>
						</div>
						<div class="col-md-12 text-center">
							<div class="breadcrumb-trail breadcrumbs">
								<span class="trail-begin"><a href="default.aspx">Home</a></span>
								<span class="sep">/</span> <span class="trail-end">Contact</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- End Pages Title  -->


		<!-- Start Contact Us -->

		<div id="Contact" class="light-wrapper">
			<div class="container inner">
				<div class="row">
					<div class="col-md-12">
						<!-- Start Map Style1 -->
						<div id="Map-Style" class="light-wrapper">
							
                           <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3507.987191477609!2d77.01050305028768!3d28.44980249899323!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390d182724f0de89%3A0xeea42cc14a4179ac!2sAll+Family+Bima+Points!5e0!3m2!1sen!2sin!4v1528439781924" width="100%" height="350" frameborder="0" style="margin-top:20px; border:5px solid #eae8e3;"  allowfullscreen></iframe>




							

						</div>
						<!-- End Map Style1 -->
					</div>
				</div>
				<div class="divcod70"></div>
				<div class="row">
					<div class="col-md-7">
						<div class="row">
							<div class="Contact-Form">
								<form class="leave-comment contact-form">
									<fieldset>
										<div id="formstatus"></div>
										<div class="Contact-us">
											<div class="form-input col-md-6">
												<input type="text" id="txtname" name="name" placeholder="Your Name" required runat="server"/>
											</div>
											<div class="form-input col-md-6">
												<input type="email" id="txtemail" name="email" placeholder="Email" required runat="server"/>
											</div>
											<div class="form-input col-md-12">
												<input type="text" id="txtsubject" name="subject" placeholder="Phone Number" required runat="server"/>
											</div>
											<div class="form-input col-md-12">
												<textarea class="txt-box textArea" id="txtcomment" name="message" cols="40" rows="7"  placeholder="Message" spellcheck="true" required runat="server"></textarea>
											</div>
											<div class="form-submit col-md-12">

                                                <asp:Button ID="btnsubmit" class="btn btn-large main-bg" runat="server" Text="Submit" Onclick="btnsubmit_Click" />

												<%--<input type="submit" id="submit" class="btn btn-large main-bg" value="Send Message">--%>
											</div>
										</div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-5">
						<div class="Contact-Info">
							<h4>Contact Details</h4>
							
							<div class="Block-Contact col-md-12">
								
								<ul>
									<li>
										<i class="fa fa-phone"></i>
										<span><asp:Label ID="lblphone" runat="server"></asp:Label></span>
									</li>
									<li>
										<i class="fa fa-whatsapp"></i>
										<span>+91 - 9911353954</span>
									</li>
									<li>
										<i class="fa fa-envelope"></i>
										<span><asp:Label ID="lblemail1" runat="server"></asp:Label></span>
									</li>
									<li>
										<i class="fa fa-map-marker"></i>
										<span><asp:Label ID="lbladdress"  runat="server"> </asp:Label></span>
									</li>
								</ul>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- End Contact Us -->

    </div>
</asp:Content>

