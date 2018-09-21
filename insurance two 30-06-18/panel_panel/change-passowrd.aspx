<%@ Page Title="" Language="C#" MasterPageFile="~/panel_panel/admin_master.master" AutoEventWireup="true" CodeFile="change-passowrd.aspx.cs" Inherits="nyksi_panel_change_passowrd" %>

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
                     Change Password
                    <%-- <small>form components and widgets</small>--%>
                  </h3>
                   <ul class="breadcrumb">
                       <li><a href="Default.aspx"><i class="icon-home"></i></a><span class="divider">&nbsp;</span></li>
                       <li><a href="#">Setting</a><span class="divider">&nbsp;</span></li>
                       <li><a href="#">Change Password</a><span class="divider-last">&nbsp;</span></li>
                   </ul>
               </div>
            </div>

    <div class="row-fluid">
               <div class="span12">
                  <div class="widget">
                        <div class="widget-title">
                           <h4><i class="icon-user"></i>Change Here</h4>             
                        </div>
                        <div class="widget-body">
                            <!--BEGIN ABOUT US-->
                 <form action="#" class="form-horizontal" id="dd" runat="server">

                           <div class="about-us">
                              
                               <div class="row-fluid">
                               <div class="span6">
                                       <div class="control-group">
                                       <asp:Label ID="lbl_msg" runat="server" Font-Size="X-Large"></asp:Label>
                                       </div>
                                       <div class="control-group">
                                       <label class="control-label">Old Password</label>
                                       <div class="controls">
                                        <asp:TextBox ID="txt_cpassword" runat="server" TextMode="Password" Width="100%"></asp:TextBox>
                                       </div>
                                       </div>
                                 
                                       <div class="control-group">
                                       <label class="control-label">New Password</label>
                                       <div class="controls">
                                       <asp:TextBox ID="txt_npassword" runat="server" TextMode="Password" Width="100%"></asp:TextBox>
                                       </div>
                                       </div>

                                       <div class="control-group">
                                       <label class="control-label">Confirm Password</label>
                                       <div class="controls">
                                       <asp:TextBox ID="txt_ccpassword" runat="server" TextMode="Password" Width="100%"></asp:TextBox>    
                                       </div>
                                       </div>

                                      
                                       
                                       </div>


                                      <div class="span6">

                                      <div class="control-group"> &nbsp; </div>
                                      <div class="control-group">   
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_cpassword" ValidationGroup="tt" ErrorMessage="Please enter Current password" ForeColor="#cc3300"></asp:RequiredFieldValidator>            
                                      </div>
                                    
                                      <div class="control-group">
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_npassword" ValidationGroup="tt" ErrorMessage="Please enter New password" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                      </div>

                                      <div class="control-group">
                                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_ccpassword" ErrorMessage="Please enter Confirm  password" ValidationGroup="tt" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                      <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_npassword" ControlToValidate="txt_ccpassword" ErrorMessage="Password Mismatch" ValidationGroup="tt" ForeColor="#cc3300"></asp:CompareValidator>    
                                      </div>


                                       </div>

                               </div>
                               
                               </div>
                               
                             
                           </div>
                            <!--END ABOUT US-->
                      

                       <div class="form-actions clearfix">
                           <asp:Button ID="bTnStudentRegist" runat="server" Text="Submit" CssClass="btn btn-success" ValidationGroup="tt" OnClick="bTnStudentRegist_Click"></asp:Button>      
                          </div>
                        
                      </form>
                   </div>
               </div>
            </div>
        </div>
</asp:Content>

