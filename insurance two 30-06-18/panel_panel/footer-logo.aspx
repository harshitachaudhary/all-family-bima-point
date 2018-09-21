<%@ Page Title="" Language="C#" MasterPageFile="~/panel_panel/admin_master.master" AutoEventWireup="true" CodeFile="footer-logo.aspx.cs" Inherits="nyksi_panel_Upload_Main_Product" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor" TagPrefix="cc1" %>
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
                    Footer logo
                    <%-- <small>form components and widgets</small>--%>
                  </h3>
                   <ul class="breadcrumb">
                       <li><a href="Default.aspx"><i class="icon-home"></i></a><span class="divider">&nbsp;</span></li>
                       <li><a href="#">Home</a><span class="divider">&nbsp;</span></li>
                       <li><a href="#">Footer  Logo</a><span class="divider-last">&nbsp;</span></li>
                   </ul>
               </div>
            </div>

    <div class="row-fluid">
               <div class="span12">
                  <div class="widget">
                        <div class="widget-title">
                           <h4><i class="icon-user"></i>Update Here <span style="color:red">(Image Size:- Width:175px & Height:60px)</span></h4>             
                        </div>
                        <div class="widget-body">
                            <!--BEGIN ABOUT US-->
                 <form action="#" class="form-horizontal" id="fhgfh" runat="server">
                     
                           <div class="about-us">
                              
                                         

                                   <div class="control-group">
                                       <label class="control-label">Image 1</label>
                                       <div class="controls">
                                           <asp:FileUpload ID="FileUpload1" runat="server" Style="width:55%"/>
                                           <asp:Image ID="Image1" runat="server" Width="200px" Height="200px" />
                                         
                                       </div>
                                       </div>


                                <div class="form-actions clearfix">

                                 <div class="control-group">
                                       <label class="control-label"></label>
                                       <div class="controls">
                                       <asp:Button ID="Button1" runat="server" Text="Update" CssClass="btn btn-success" ValidationGroup="tt" OnClick="Button1x_Click"></asp:Button> 
                                       </div>
                                       </div>
                                </div>

                              

                                

                              
                               </div>
                               
                             
                          
                            <!--END ABOUT US-->

                      </form>
                   </div>
               </div>
            </div>
        </div>
   
</asp:Content>

