<%@ Page Title="" Language="C#" MasterPageFile="~/frontmainmaster.master" AutoEventWireup="true" CodeFile="query.aspx.cs" Inherits="query" %>

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
								<h2 class="page-title"></h2>
							</div>
						</div>
						<div class="col-md-12 text-center">
							<div class="breadcrumb-trail breadcrumbs">
								<span class="trail-begin"><a href="default.aspx">Home</a></span>
								<span class="sep">/</span> <span class="trail-end">Query From</span>
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
					
				</div>
				<div class="divcod70"></div>
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<div class="Contact-Form">
								<form class="leave-comment contact-form" autocomplete="on" id="contact-form"  name="contact-form" method="post" action="http://iglyphic.com/themes/html/html_safest/php/send.php">
									<fieldset>
										<div id="formstatus"></div>
										<div class="Contact-us">
											<div class="form-input col-md-6">
												<input type="text" id="txtname" name="name" placeholder="Your Name" required runat="server"/>
											</div>
											<div class="form-input col-md-6">
												<input type="email" id="txtemail" name="email" placeholder="Email" required runat="server"/>
											</div>
											<div class="form-input col-md-6">
												<input type="text" id="txtphone" name="subject" placeholder="Phone Nmber" runat="server"/>
											</div>
                                            <div class="form-input col-md-6">
												<%--<input type="text" id="insurance" name="subject" placeholder="Insurance Type">--%>
                                                    <asp:DropDownList ID="ddlqueryfrom" runat="server" CssClass="form-input col-md-12" style="height: 42px;">
                                                        <asp:ListItem Value="0">Insurance Type</asp:ListItem>
                                                        <asp:ListItem Value="1">Life Insurance</asp:ListItem>
                                                        <asp:ListItem Value="2">Health Insurance</asp:ListItem>
                                                        <asp:ListItem Value="3">General Insurance</asp:ListItem>
                                                        <asp:ListItem Value="4">Mutual Funds</asp:ListItem>
                                                        



                                                    </asp:DropDownList>




											</div>
											<div class="form-input col-md-12">
												<textarea class="txt-box textArea" id="txtcomment" name="message" cols="40" rows="7"  placeholder="Message" spellcheck="true" required runat="server"></textarea>
											</div>
											<div class="form-submit col-md-12 " style="text-align:center;">

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
		</div>

		<!-- End Contact Us -->


    </div>
</asp:Content>

