<%@ Page Title="" Language="C#" MasterPageFile="~/frontmainmaster.master" AutoEventWireup="true" CodeFile="apply-online.aspx.cs" Inherits="documents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div>
        <!-- Start Pages Title  -->

		<section id="Page-title" class="Page-title-Style2">
			<div class="color-overlay"></div>
			<div class="container inner-img">
				<div class="row">
					<div class="Page-title">
						<div class="col-md-12 text-center">
							<div class="title-text">
								<h6>ALL FAMILY BIMA POINT</h6>
								<h2 class="page-title">APPLY ONLINE</h2>
							</div>
						</div>
						<div class="col-md-12 text-center">
							<div class="breadcrumb-trail breadcrumbs">
								<span class="trail-begin"><a href="default.aspx">Home</a></span>
								<span class="sep">/</span> <span class="trail-end">Apply Online</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- End Pages Title  -->

		<!-- Start Projects -->

		<section id="portfolio-post" class="light-wrapper">
			<div class="container inner">

				<div class="row">
					<div class="col-md-12">
						<div class="Top-Title-Page">
							<h3>fill this form to upload documents :</h3>
						</div>
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
												<input type="email" id="txtemail" name="email" placeholder="Email" required="required" runat="server"/>
											</div>
                                            <div class="form-input col-md-6">
												<input type="text" id="txtaddress" name="email" placeholder="Address" required="required" runat="server"/>
											</div>
                                            <div class="form-input col-md-6">
												<input type="text" id="txtphone" name="email" placeholder="Contact Number" required="required" runat="server"/>
											</div>


                                            <div class="form-input col-md-6">
												<%--<input type="email" id="email" name="email" placeholder="Documents For" required="required"/>--%>

                                        <asp:DropDownList ID="ddldocumentfrom" runat="server" CssClass="form-input col-md-12" style="height: 42px;">
                                                        <asp:ListItem Value="0">Insurance Type</asp:ListItem>
                                                        <asp:ListItem Value="1">Life Insurance</asp:ListItem>
                                                        <asp:ListItem Value="2">Health Insurance</asp:ListItem>
                                                        <asp:ListItem Value="3">General Insurance</asp:ListItem>
                                                        <asp:ListItem Value="4">Mutual Funds</asp:ListItem>
                                                        



                                                    </asp:DropDownList>

											</div>
                                           
                                            <div class="form-input col-md-6">
												

                                                  <asp:FileUpload ID="idprof" runat="server" title="ID Proof" />

											</div>
                                            <div class="form-input col-md-6">
												
                                                <asp:FileUpload ID="addrsproof" runat="server" title="Address Proof" />
											</div>
                                            <div class="form-input col-md-6">
												
                                                <asp:FileUpload ID="dobproof" runat="server" title="Date of Birth Proof" />
											</div>
                                            <div class="form-input col-md-6">
												
                                                <asp:FileUpload ID="photu" runat="server" title="Photu" />
											</div>
                                            <div class="form-input col-md-6">
												
                                                <asp:FileUpload ID="otherdoc" runat="server" title="Other Documents" />
											</div>







											
											<div class="form-input col-md-12">
												<textarea class="txt-box textArea" id="txtcomment" name="message" cols="40" rows="7"  placeholder="Message" spellcheck="true" required runat="server"></textarea>
											</div>
											<div class="form-submit col-md-12">

                                                    <asp:Button ID="btnsubmit" class="btn btn-large main-bg" runat="server" Text="submit" OnClick="btnsubmit_Click" />

												<%--<input type="submit" id="submit" class="btn btn-large main-bg" value="Send Message">--%>
											</div>
										</div>
									</fieldset>
								</form>
							</div>
						</div>
					</div>
					
				</div>
				
			</div>
		</section>

		<!-- End Projects -->

		<!-- Start Call To Action -->

		<div id="call_to_action" class="color-wrapper parallax">
			<div class="container inner-parallax">
				<div class="row">
					<div class="col-md-12">
						<div class="parallax-call-to-action color-call">
							<a class="btn btn-grey" href="contact-us.aspx" title="Get A Quote">Contact Us</a>
							<p>To be a leader and role model in a broad based and integrated Insurance services with 100%
                         customer satisfaction.</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- End Call To Action -->


    </div>
</asp:Content>

