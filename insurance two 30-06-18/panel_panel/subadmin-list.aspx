<%@ Page Title="" Language="C#" MasterPageFile="~/panel_panel/admin_master.master" AutoEventWireup="true" CodeFile="subadmin-list.aspx.cs" Inherits="nyksi_panel_subadmin_list" %>

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
                     Subadmin List
                    <%-- <small>form components and widgets</small>--%>
                  </h3>
                   <ul class="breadcrumb">
                       <li>
                           <a href="Default.aspx"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
                       </li>
                       <li>
                           <a href="#">Setting</a> <span class="divider">&nbsp;</span>
                       </li>
                       <li><a href="#">Subadmin List</a><span class="divider-last">&nbsp;</span></li>
                   </ul>
               </div>
            </div>

    <div class="row-fluid">
               <div class="span12">
                  <div class="widget">
                        <div class="widget-title">
                           <h4><i class="icon-user"></i>Report</h4>
                                         
                        </div>
                        <div class="widget-body">
                               <form action="#" class="form-horizontal" id="dd" runat="server">
                            <asp:Label ID="lblresult" runat="server"></asp:Label>
                          <asp:GridView ID="gvDetails" DataKeyNames="userid" runat="server" Width="100%"
AutoGenerateColumns="false" CssClass="Gridview" HeaderStyle-BackColor="#61A6F8"
HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White" EmptyDataText="Data Not Found.."
onrowdeleting="gvDetails_RowDeleting" >
<Columns>

<asp:TemplateField HeaderText="SNo.">
         <ItemTemplate>
               <%# Container.DataItemIndex + 1 %>
         </ItemTemplate>
     </asp:TemplateField>


<asp:TemplateField HeaderText="User ID">
<ItemTemplate>
<asp:Label ID="lblitemUsr" runat="server" Text='<%#Eval("userid") %>'/>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Password">
<ItemTemplate>
<asp:Label ID="lblpassword" runat="server" Text='<%#Eval("password") %>'/>
</ItemTemplate>
</asp:TemplateField>


<asp:TemplateField HeaderText="Name">
<ItemTemplate>
<asp:Label ID="lblDesg" runat="server" Text='<%#Eval("name") %>'/>
</ItemTemplate>
</asp:TemplateField>
    

<asp:TemplateField HeaderText="Father Name">
<ItemTemplate>
<asp:Label ID="lblddDesg" runat="server" Text='<%#Eval("father") %>'/>
</ItemTemplate>
</asp:TemplateField>

<asp:TemplateField HeaderText="Mobile No">
<ItemTemplate>
<asp:Label ID="lblsesddsion" runat="server" Text='<%#Eval("mobile") %>'/>
</ItemTemplate>
</asp:TemplateField>

    <asp:TemplateField HeaderText="Landline No">
<ItemTemplate>
<asp:Label ID="lblsession" runat="server" Text='<%#Eval("landstd") %>'/> - 
    <asp:Label ID="Label1" runat="server" Text='<%#Eval("landlineno") %>'/>
</ItemTemplate>
</asp:TemplateField>


 <asp:TemplateField HeaderText="Email ID">
<ItemTemplate>
<asp:Label ID="lblcollege_name" runat="server" Text='<%#Eval("email") %>'/>
</ItemTemplate>
</asp:TemplateField>


<asp:TemplateField HeaderText="Address">
<ItemTemplate>
<asp:Label ID="lblcollffege_type" runat="server" Text='<%#Eval("address") %>'/>
</ItemTemplate>
</asp:TemplateField>

    <asp:TemplateField HeaderText="Pin Code">
<ItemTemplate>
<asp:Label ID="lblcollege_type" runat="server" Text='<%#Eval("pin") %>'/>
</ItemTemplate>
</asp:TemplateField>


<asp:TemplateField HeaderText="Delete">
<ItemTemplate>
<asp:LinkButton ID="linkbtn" CommandName="Delete" Text="Delete" runat="server" style="color:blue;" ToolTip="Delete" OnClientClick="javascript:return confirm('Are you sure?');">Delete</asp:LinkButton>
</ItemTemplate>
</asp:TemplateField>


    <asp:TemplateField HeaderText="Full">
<ItemTemplate>
<a href="edit-Subadmin.aspx?userd=<%# Eval("userid") %>" target="_blank" style="color:blue;"/>View/Edit</a>
</ItemTemplate>
</asp:TemplateField>


</Columns>
</asp:GridView>
                        </form>
                   </div>
               </div>
            </div>
        </div>
</asp:Content>

