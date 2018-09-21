<%@ Page Title="" Language="C#" MasterPageFile="~/panel_panel/admin_master.master" AutoEventWireup="true" CodeFile="plan-lists.aspx.cs" Inherits="nyksi_panel_product_list" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
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
            <h3 class="page-title">Portfolio List
                    <%-- <small>form components and widgets</small>--%>
            </h3>
            <ul class="breadcrumb">
                <li><a href="Default.aspx"><i class="icon-home"></i></a><span class="divider">&nbsp;</span></li>
                <li><a href="#">Portfolio</a><span class="divider">&nbsp;</span></li>
                <li><a href="#">Portfolio List</a><span class="divider-last">&nbsp;</span></li>
            </ul>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-user"></i>Plan List</h4>
                </div>
                <div class="widget-body">
                    <!--BEGIN ABOUT US-->
                    <form action="#" class="form-horizontal" id="fhgfh" runat="server">

                        <div class="about-us">



                            <div class="row-fluid">


                                <div class="control-group">
                                    <label class="control-label">Search by Category</label>
                                    <div class="controls">
                                        <asp:TextBox ID="txtsearch" runat="server" Width="70%"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtsearch" ValidationGroup="ttp" ErrorMessage="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                        <asp:Button ID="BtnSearch" runat="server" Text="Search" CssClass="btn btn-success" ValidationGroup="ttp" OnClick="BtnSearch_Click"></asp:Button>
                                    </div>
                                </div>





                                <asp:GridView ID="grdsubcategory" runat="server" OnRowDataBound="grdsubcategory_RowDataBound"
                                    AutoGenerateColumns="false" Font-Size="Small"
                                    Style="margin-left: 0%; text-align: center; width: 100%;"
                                    DataKeyNames="id"
                                    OnRowDeleting="grdcategory_RowDeleting"
                                    EmptyDataText="No Data Found"
                                    EnablePersistedSelection="false"
                                    AllowPaging="true" PageSize="100"
                                    OnPageIndexChanging="grdsubcategory_PageIndexChanging">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>S.No.</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblSRNO" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField DataField="catname" HeaderText=" Plan category Name" ReadOnly="True" />


                                           <asp:BoundField DataField="plan_name" HeaderText="Plan Name" />
                                         <asp:BoundField DataField="Heading" HeaderText="Plan Heading" />


                                        <asp:TemplateField HeaderText="Image">

                                            <ItemTemplate>

                                                <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("image") %>' Width="200px" />
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Edit/View">
                                            <ItemTemplate>
                                                <a href="edit-upload-portfolio.aspx?id_x=<%#Eval("id") %>" target="_blank">View/Edit</a>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>Delete</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lb_Edit" runat="server" OnClientClick="return confirm('Do you want to Confirm for this action?')" OnClick="lb_Edit_Click">Delete</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <%-- <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />--%>
                                    </Columns>
                                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                                </asp:GridView>



                            </div>


                        </div>



                        <!--END ABOUT US-->

                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

