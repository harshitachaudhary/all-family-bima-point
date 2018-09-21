<%@ Page Title="" Language="C#" MasterPageFile="~/panel_panel/admin_master.master" AutoEventWireup="true" CodeFile="aboutfeatures.aspx.cs" Inherits="panel_panel_aboutfeatures" %>
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
            <h3 class="page-title">Features
                    <%-- <small>form components and widgets</small>--%>
            </h3>
            <ul class="breadcrumb">
                <li><a href="Default.aspx"><i class="icon-home"></i></a><span class="divider">&nbsp;</span></li>
                <li><a href="#">Home</a><span class="divider">&nbsp;</span></li>
                <li><a href="#">Features</a><span class="divider-last">&nbsp;</span></li>
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
                                    <label class="control-label">
                                        Choose Topic First :
                                          
                                    </label>
                                    <div class="controls">
                                        <asp:DropDownList ID="ddltopic" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddltopic_SelectedIndexChanged"></asp:DropDownList>

                                    </div>
                                </div>
                            </div>

                            <div class="control-group">
                                <label class="control-label">
                                    Icon Code :
                                           <%--<asp:RequiredFieldValidator ID="RequireddFieldValidator5" runat="server" ControlToValidate="Editor1" ValidationGroup="tt" ErrorMessage="Pls. Enter Description. !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>--%>
                                </label>
                                <div class="controls">
                                    <asp:TextBox ID="Txticon" runat="server" Width="50%"></asp:TextBox>

                                </div>

                                <br />
                                <div class="row-fluid">
                                    <div class="control-group">
                                        <label class="control-label">
                                            Heading :
                                           <%--<asp:RequiredFieldValidator ID="RequireddFieldValidator5" runat="server" ControlToValidate="Editor1" ValidationGroup="tt" ErrorMessage="Pls. Enter Description. !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>--%>
                                        </label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtheading" runat="server" Width="50%"></asp:TextBox>

                                        </div>
                                    </div>
                                </div>

                                <div class="row-fluid">
                                    <div class="control-group">
                                        <label class="control-label">
                                            Content :
                                           <%--<asp:RequiredFieldValidator ID="RequireddFieldValidator5" runat="server" ControlToValidate="Editor1" ValidationGroup="tt" ErrorMessage="Pls. Enter Description. !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>--%>
                                        </label>
                                        <div class="controls">
                                            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                            <cc1:Editor ID="Editor1" runat="server" Height="350px" Width="350px" />
                                             
                                           
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
                        </div>


                        <!--END ABOUT US-->

                    </form>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

