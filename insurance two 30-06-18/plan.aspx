<%@ Page Title="" Language="C#" MasterPageFile="~/frontmainmaster.master" AutoEventWireup="true" CodeFile="plan.aspx.cs" Inherits="plan" %>

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
								<h2 class="page-title">
      Plans of :  <asp:Label ID="lblplans" runat="server" style="text-transform: uppercase;font-size: 45px;
    font-weight: 900;
    letter-spacing: 1.5px;color: #ffffff;
    font-family: Raleway;"></asp:Label></h2>
							</div>
						</div>
						<div class="col-md-12 text-center">
							<div class="breadcrumb-trail breadcrumbs">
								<span class="trail-begin"><a href="default.aspx">Home</a></span>
								<span class="sep">/</span> <span class="trail-end">Life Insurance</span>
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
							<%--<div class="insurance-service-details">
								<!-- Tab panes -->
								<div class="tab-content">
									



									


									
								</div>
							</div> --%>


                            <div class="panel-group faq-group" id="accordion">

							
                          <asp:Repeater ID="RptPlans"  runat="server"><ItemTemplate>   
                          <!--Start Collapse-->
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"> <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#collapse<%#Container.ItemIndex+1 %>"><span class="num"><%#Container.ItemIndex+1 %></span> <%# Eval("plan_name") %></a> </h4>
								</div>
								<div id="collapse<%#Container.ItemIndex+1 %>" class="panel-collapse collapse">  <%--in--%>
									<div class="panel-body"> <%# Eval("plan_detail") %> 

                                        <br /><br />
                                      <asp:Label ID="lblplanname" runat="server" Text='<%# Eval("plan_name") %>' Visible="false"></asp:Label>
                                        <asp:LinkButton ID="LnKBTNDownload" runat="server" OnClick="LnKBTNDownload_Click">Download Plan</asp:LinkButton>

									</div>

                                    



								</div>

                               






							</div>
                        </ItemTemplate></asp:Repeater>

                         <asp:Label ID="lblmessage" runat="server" Font-Bold="true" Font-Size="Larger" style="color:red;" Visible="false"></asp:Label>


							
						</div>



						</div>


                        <div class="col-lg-3 col-md-4 col-sm-6 col-xs-12">
							<div class="insurance-single-item-nav-holder">
								<!-- Nav tabs -->
								<ul class="nav nav-tabs tabs-left"><!-- 'tabs-right' for right tabs -->
									<li class="active"><a href="health-insurance.aspx">Life Insurance <i class="fa fa-angle-right"></i></a></li>
									<li><a href="health-insurance.aspx">Health Insurance <i class="fa fa-angle-right"></i></a></li>
									<li><a href="life-insurance.aspx">General Insurance <i class="fa fa-angle-right"></i></a></li>
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

