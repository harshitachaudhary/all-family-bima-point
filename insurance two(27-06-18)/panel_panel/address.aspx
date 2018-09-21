<%@ Page Title="" Language="C#" MasterPageFile="~/panel_panel/admin_master.master" AutoEventWireup="true" CodeFile="address.aspx.cs" Inherits="nyksi_panel_Upload_Main_Product" %>
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
                   Address:
                    <%-- <small>form components and widgets</small>--%>
                  </h3>
                   <ul class="breadcrumb">
                       <li><a href="Default.aspx"><i class="icon-home"></i></a><span class="divider">&nbsp;</span></li>
                       <li><a href="#">Address</a><span class="divider">&nbsp;</span></li>
                       <li><a href="#"> Address</a><span class="divider-last">&nbsp;</span></li>
                   </ul>
               </div>
            </div>

    <div class="row-fluid">
               <div class="span12">
                  <div class="widget">
                        <div class="widget-title">
                           <h4><i class="icon-user"></i>Update Here</h4>             
                        </div>
                        <div class="widget-body">
                            <!--BEGIN ABOUT US-->
                 <form action="#" class="form-horizontal" id="fhgfh" runat="server">
                     
                           <div class="about-us">
                              
                               
                                      <div class="row-fluid">
                                     <div class="control-group">
                                       <label class="control-label">Mobile No :
                                           <%--<asp:RequiredFieldValidator ID="RequireddFieldValidator5" runat="server" ControlToValidate="Editor1" ValidationGroup="tt" ErrorMessage="Pls. Enter Description. !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>--%>
                                       </label>
                                       <div class="controls">
                                          <%-- <asp:TextBox ID="txtmobileno" runat="server" Width="80%"></asp:TextBox>--%>
                                             <cc1:Editor ID="txtmobileno" runat="server" Height="150px" Width="400px" />
                                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                       </div>
                                       </div>
                                   </div>

                               <div class="row-fluid">
                                     <div class="control-group">
                                       <label class="control-label">Email ID :
                                           <%--<asp:RequiredFieldValidator ID="RequireddFieldValidator5" runat="server" ControlToValidate="Editor1" ValidationGroup="tt" ErrorMessage="Pls. Enter Description. !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>--%>
                                       </label>
                                       <div class="controls">
                                           <%--<asp:TextBox ID="txtemailid" runat="server" Width="80%"></asp:TextBox>--%>
                                            <cc1:Editor ID="txtemailid" runat="server" Height="150px" Width="400px" />
                                       </div>
                                       </div>
                                   </div>

                                  <div class="row-fluid">
                                     <div class="control-group">
                                       <label class="control-label">Address :
                                           <%--<asp:RequiredFieldValidator ID="RequireddFieldValidator5" runat="server" ControlToValidate="Editor1" ValidationGroup="tt" ErrorMessage="Pls. Enter Description. !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>--%>
                                       </label>
                                       <div class="controls">
                                           <%--<asp:TextBox ID="txtaddress" runat="server" Width="80%"></asp:TextBox>--%>
                                            <cc1:Editor ID="txtaddress" runat="server" Height="150px" Width="400px" />
                                       </div>
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

