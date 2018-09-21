<%@ Page Title="" Language="C#" MasterPageFile="~/panel_panel/admin_master.master" AutoEventWireup="true" CodeFile="create-plan-category.aspx.cs" Inherits="nyksi_panel_add_category" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <style type="text/css">
        .modalBackground {
            background-color: Gray;
            filter: alpha(opacity=80);
            opacity: 0.8;
            z-index: 10000;
        }
    </style>


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
            <h3 class="page-title">Add Category
                    <%-- <small>form components and widgets</small>--%>
            </h3>
            <ul class="breadcrumb">
                <li><a href="Default.aspx"><i class="icon-home"></i></a><span class="divider">&nbsp;</span></li>
                <li><a href="#">Course</a><span class="divider">&nbsp;</span></li>
                <li><a href="#">Add Category</a><span class="divider-last">&nbsp;</span></li>
            </ul>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-user"></i>Add Here</h4>
                </div>
                <div class="widget-body">
                    <!--BEGIN ABOUT US-->
                    <form action="#" class="form-horizontal" id="fhgfh" runat="server">

                        <div class="about-us">

                            <div class="row-fluid">
                                <div class="span6">

                                    <div class="control-group">
                                        <label class="control-label">Category</label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtCategory" runat="server" Width="100%"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCategory" ValidationGroup="tt" ErrorMessage="Pls. Enter Course Name" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>

                                    <div class="control-group">
                                        <label class="control-label"></label>
                                        <div class="controls">
                                            <asp:Button ID="ntnAddCategory" runat="server" Text="Submit" CssClass="btn btn-success" ValidationGroup="tt" OnClick="ntnAddCategory_Click"></asp:Button>
                                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-success" ValidationGroup="ttpdd" OnClick="btnUpdate_Click" Visible="false"></asp:Button>
                                            <asp:Label ID="lblcatcode" runat="server" Visible="false"></asp:Label>
                                        </div>
                                    </div>

                                </div>


                                <div class="span6">


                                    <div class="control-group">
                                        <label class="control-label">Search Category</label>
                                        <div class="controls">
                                            <asp:TextBox ID="txtsearch" runat="server" Width="70%"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtsearch" ValidationGroup="ttp" ErrorMessage="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                            <asp:Button ID="BtnSearch" runat="server" Text="Search" CssClass="btn btn-success" ValidationGroup="ttp" OnClick="BtnSearch_Click"></asp:Button>

                                        </div>
                                    </div>


                                    <asp:GridView ID="grdcategory" runat="server" AllowPaging="true" PageIndex="1"
                                        AutoGenerateColumns="false" PageSize="50" Font-Size="Small"
                                        Style="margin-left: 0%; text-align: center; width: 100%;"
                                        OnRowCancelingEdit="grdcategory_RowCancelingEdit" DataKeyNames="code"
                                        OnRowDeleting="grdcategory_RowDeleting" OnRowEditing="grdcategory_RowEditing"
                                        OnRowUpdating="grdcategory_RowUpdating" EmptyDataText="No Data Found"
                                        OnRowCreated="grdcategory_RowCreated" EnablePersistedSelection="false"
                                        OnRowUpdated="grdcategory_RowUpdated"
                                        OnPageIndexChanging="grdcategory_PageIndexChanging">
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>S.No.</HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSRNO" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <%--<asp:BoundField DataField="code" HeaderText="Category ID" ReadOnly="True" />--%>

                                            <asp:BoundField DataField="cat" HeaderText="Category Name" />



                                            <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                                <HeaderTemplate>Edit</HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lb_Edit" runat="server" OnClientClick="return confirm('Do you want to Confirm for this action?')" OnClick="lb_Edit_Click">Edit</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lbtnDel" runat="server" OnClientClick="return confirm('Do you want to Confirm delete Category?')" OnClick="lbtnDel_Click">Delete</asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                    </asp:GridView>



                                </div>

                            </div>
                        </div>



                        <!--END ABOUT US-->


                        <div class="form-actions clearfix">
                        </div>

                        <!-------------------------------------Modal PopUp Start---------------------------------->
                        <%--<asp:Button ID="btnShowPopup" runat="server" style="display:none" />
<asp:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="btnShowPopup" PopupControlID="pnlpopup"
CancelControlID="btnCancel" BackgroundCssClass="modalBackground">
</asp:ModalPopupExtender>
<asp:Panel ID="pnlpopup" runat="server" BackColor="White" Height="200px" Width="400px" style=" display:none;">
<table width="100%" style="border:Solid 3px #D55500; width:100%; height:100%" cellpadding="0" cellspacing="0">
<tr style="background-color:#D55500">
<td colspan="2" style=" height:10%; color:White; font-weight:bold; font-size:larger" align="center">Update Category</td>
</tr>
<tr>
<td align="right" style=" width:33%">
Category Code :&nbsp;
</td>
<td>
<asp:Label ID="lblcatcode" runat="server"></asp:Label>
</td>
</tr>
<tr>
<td align="right">
Category Name :&nbsp;
</td>
<td>
<asp:TextBox ID="txtcategoryUpdate" runat="server" Width="250px"/>
</td>
</tr>

<tr>
<td>
</td>
<td>
<asp:Button ID="btnUpdate" CommandName="Update" runat="server" Text="Update" class="submit2" onclick="btnUpdate_Click"/>
<asp:Button ID="btnCancel" runat="server" Text="Cancel" class="submit2" />
</td>
</tr>
</table>
</asp:Panel>--%>
                        <!-------------------------------------Modal PopUp End---------------------------------->


                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

