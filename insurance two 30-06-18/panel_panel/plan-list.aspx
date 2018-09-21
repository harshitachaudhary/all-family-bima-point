<%@ Page Title="" Language="C#" MasterPageFile="~/panel_panel/admin_master.master" AutoEventWireup="true" CodeFile="plan-list.aspx.cs" ValidateRequest="False" Inherits="nyksi_panel_banner" %>

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
            <h3 class="page-title">Plan List
                    <%-- <small>form components and widgets</small>--%>
            </h3>
            <ul class="breadcrumb">
                <li><a href="Default.aspx"><i class="icon-home"></i></a><span class="divider">&nbsp;</span></li>
                <li><a href="#">Services</a><span class="divider">&nbsp;</span></li>
                <li><a href="#">Plan List</a><span class="divider-last">&nbsp;</span></li>
            </ul>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">
            <div class="widget">
                <div class="widget-title">
                    <h4><i class="icon-user"></i>List Here </h4>
                </div>
                <div class="widget-body">
                    <!--BEGIN ABOUT US-->
                    <form action="#" class="form-horizontal" id="fhgfh" runat="server">

                        <div class="about-us">





                            <div class="row-fluid">
                                <asp:GridView ID="grdcategory" runat="server" PageIndex="1"
                                    AutoGenerateColumns="false" Font-Size="Small"
                                    Style="margin-left: 0%; text-align: center; width: 100%;"
                                    DataKeyNames="id"
                                    EmptyDataText="No Data Found"
                                    EnablePersistedSelection="false">
                                    <Columns>
                                        <asp:TemplateField>
                                            <HeaderTemplate>S.No.</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblSRNO" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>Service Name</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblheading1" runat="server" Text='<%#Eval("service_heading") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>



                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>Plan Name</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblheading2" runat="server" Text='<%#Eval("plan_name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>



                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>Download Plan File</HeaderTemplate>
                                            <ItemTemplate>
                                                <%--<asp:Label ID="lblheading3" runat="server" Text='<%#Eval("download_plan") %>'></asp:Label>--%>

                                                <asp:LinkButton ID="lnkDownload" runat="server" Text="Download" OnClick="lnkDownload_Click"></asp:LinkButton>


                                            </ItemTemplate>
                                        </asp:TemplateField>




                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>Edit/View</HeaderTemplate>
                                            <ItemTemplate>
                                                <a href="edit-service-plan.aspx?id_x=<%#Eval("id") %>">Edit/View</a>
                                            </ItemTemplate>
                                        </asp:TemplateField>



                                        <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                                            <HeaderTemplate>Delete</HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lb_Edit" runat="server" OnClientClick="return confirm('Do you want to Confirm for this action?')" OnClick="lb_Edit_Click">Delete</asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>

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

