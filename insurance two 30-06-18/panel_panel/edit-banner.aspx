<%@ Page Title="" Language="C#" MasterPageFile="~/panel_panel/admin_master.master" AutoEventWireup="true" CodeFile="edit-banner.aspx.cs" Inherits="nyksi_panel_banner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row-fluid">
               <div class="span12">
                   <!-- BEGIN THEME CUSTOMIZER-->
                   <div id="theme-change" class="hidden-phone">
                       <i class="icon-cogs"></i>
                        <span class="settings">
                            <span class="text">Theme:</span>
                            <span class="colors">
                                <span class="color-default" data-style="default"></span>
                                <span class="color-gray" data-style="gray"></span>
                                <span class="color-purple" data-style="purple"></span>
                                <span class="color-navy-blue" data-style="navy-blue"></span>
                            </span>
                        </span>
                   </div>
                   <!-- END THEME CUSTOMIZER-->
                  <h3 class="page-title">
                     Edit Banner
                    <%-- <small>form components and widgets</small>--%>
                  </h3>
                   <ul class="breadcrumb">
                       <li><a href="Default.aspx"><i class="icon-home"></i></a><span class="divider">&nbsp;</span></li>
                       <li><a href="#">Home Page</a><span class="divider">&nbsp;</span></li>
                       <li><a href="#">Edit  Banner</a><span class="divider-last">&nbsp;</span></li>
                   </ul>
               </div>
            </div>

    <div class="row-fluid">
               <div class="span12">
                  <div class="widget">
                        <div class="widget-title">
                           <h4><i class="icon-user"></i>Edit Here <span style="color:red">(Image Size:- Width:1920px & Height:742px)</span></h4>
                           <span style="float:right;"><a href="banner.aspx">Go to Banner List</a></span> 
                                      
                        </div>
                        <div class="widget-body">
                            <!--BEGIN ABOUT US-->
                 <form action="#" class="form-horizontal" id="fhgfh" runat="server">
                    
                           <div class="about-us">
                              
                              <div class="row-fluid" id="dd" runat="server" visible="true">
                               <div class="span12">
                                       
                                   

                                    <div class="control-group">
                                       <label class="control-label">Heading1</label>
                                       <div class="controls">
                                           <asp:TextBox ID="txtheading1" runat="server" Width="100%"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtheading1" ValidationGroup="tt" ErrorMessage="*" ForeColor="#cc3300"></asp:RequiredFieldValidator> 
                                       </div>
                                       </div>


                                    <div class="control-group">
                                       <label class="control-label">Heading2</label>
                                       <div class="controls">
                                           <asp:TextBox ID="txtheading2" runat="server" Width="100%"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtheading2" ValidationGroup="tt" ErrorMessage="*" ForeColor="#cc3300"></asp:RequiredFieldValidator> 
                                       </div>
                                       </div>


                                   <div class="control-group">
                                       <label class="control-label">Heading3</label>
                                       <div class="controls">
                                           <asp:TextBox ID="txtheading3" runat="server" Width="100%"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtheading3" ValidationGroup="tt" ErrorMessage="*" ForeColor="#cc3300"></asp:RequiredFieldValidator> 
                                       </div>
                                       </div>
                                   




                                      <div class="control-group">
                                       <label class="control-label">Choose Banner</label>
                                       <div class="controls">
                                           <asp:FileUpload ID="FileUpload1" runat="server" />


                                           <asp:Image ID="Image1" runat="server" />

                                            
                                       </div>
                                       </div>








                                </div>


                            

                  </div>

                                 <div class="form-actions clearfix">
                                 <asp:Button ID="ntnAddCategory" runat="server" Text="Update" CssClass="btn btn-success" ValidationGroup="tt" OnClick="ntnAddCategory_Click"></asp:Button> 
                                           <asp:Label ID="lblcatcode" runat="server" Visible="false"></asp:Label> 
                                </div>

                                 
                            
                               </div>
                               
                               
                            <!--END ABOUT US-->
                     

                      </form>
                   </div>
               </div>
            </div>
        </div>
</asp:Content>

