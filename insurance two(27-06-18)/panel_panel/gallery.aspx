<%@ Page Title="" Language="C#" MasterPageFile="~/panel_panel/admin_master.master" AutoEventWireup="true" CodeFile="gallery.aspx.cs" Inherits="nyksi_panel_Upload_Main_Product" %>
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
                     Awards & Achievements
                    <%-- <small>form components and widgets</small>--%>
                  </h3>
                   <ul class="breadcrumb">
                       <li><a href="Default.aspx"><i class="icon-home"></i></a><span class="divider">&nbsp;</span></li>
                       <li><a href="#">Awards</a><span class="divider">&nbsp;</span></li>
                       <li><a href="#">Awards</a><span class="divider-last">&nbsp;</span></li>
                   </ul>
               </div>
            </div>

    <div class="row-fluid">
               <div class="span12">
                  <div class="widget">
                        <div class="widget-title">
                           <h4><i class="icon-user"></i>Manage Here <span style="color:red;">Note :- Image Width:350px & Height:250px </span></h4>             
                        </div>
                        <div class="widget-body">
                            <!--BEGIN ABOUT US-->
                 <form action="#" class="form-horizontal" id="fhgfh" runat="server">
                     
                           <div class="about-us">
                              
                               
                                  <div class="row-fluid">
                                     <div class="control-group">
                                       <label class="control-label">Heading :
                                           <%--<asp:RequiredFieldValidator ID="RequireddFieldValidator5" runat="server" ControlToValidate="Editor1" ValidationGroup="tt" ErrorMessage="Pls. Enter Description. !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>--%>
                                       </label>
                                       <div class="controls">
                                           <asp:TextBox ID="txtheading" runat="server" Width="80%"></asp:TextBox>
                                            <asp:Button ID="Button1" runat="server" Text="Update" CssClass="btn btn-success" ValidationGroup="tt" OnClick="Button1x_Click"></asp:Button> 
                                       </div>
                                       </div>
                                   </div>



                                <div class="row-fluid">
                                    <asp:Label ID="lblresult" runat="server"></asp:Label>
                                    <asp:GridView ID="gvDetails" DataKeyNames="id" runat="server" Width="100%"
AutoGenerateColumns="false" CssClass="Gridview" HeaderStyle-BackColor="#61A6F8"
ShowFooter="true" HeaderStyle-Font-Bold="true" HeaderStyle-ForeColor="White"
onrowcancelingedit="gvDetails_RowCancelingEdit"
onrowdeleting="gvDetails_RowDeleting" onrowediting="gvDetails_RowEditing"
onrowupdating="gvDetails_RowUpdating"
onrowcommand="gvDetails_RowCommand">
<Columns>

     <asp:TemplateField >
<HeaderTemplate>S.No.</HeaderTemplate>
<ItemTemplate>
<asp:Label ID="lblSRNO" runat="server" Text='<%#Container.DataItemIndex+1 %>'></asp:Label>
</ItemTemplate>
</asp:TemplateField>


<asp:TemplateField HeaderText="Name">
<EditItemTemplate>
    <asp:TextBox ID="txteditheading" runat="server" Text='<%#Eval("name") %>'></asp:TextBox>

</EditItemTemplate>
<ItemTemplate>
<asp:Label ID="lblitemUsr" runat="server" Text='<%#Eval("name") %>'/>
</ItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtftrusrname" runat="server"/>
<asp:RequiredFieldValidator ID="rfvusername" runat="server" ControlToValidate="txtftrusrname" Text="*" ValidationGroup="validaiton"/>
</FooterTemplate>
</asp:TemplateField>


<%--<asp:TemplateField HeaderText="Year">
<EditItemTemplate>
    <asp:TextBox ID="txteditdegisnation" runat="server" Text='<%#Eval("year") %>'></asp:TextBox>

</EditItemTemplate>
<ItemTemplate>
<asp:Label ID="lblitesmUsr" runat="server" Text='<%#Eval("year") %>'/>
</ItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtftdegisnation" runat="server"/>
<asp:RequiredFieldValidator ID="rfvuserename" runat="server" ControlToValidate="txtftdegisnation" Text="*" ValidationGroup="validaiton"/>
</FooterTemplate>
</asp:TemplateField>--%>





<%--<asp:TemplateField HeaderText="Description">
<EditItemTemplate>
<asp:TextBox ID="txtcity" runat="server" Text='<%#Eval("desc_") %>'/>
</EditItemTemplate>
<ItemTemplate>
<asp:Label ID="lblcity" runat="server" Text='<%#Eval("desc_") %>'/>
</ItemTemplate>
<FooterTemplate>
<asp:TextBox ID="txtftrcity" runat="server" Width="95%"/>
<asp:RequiredFieldValidator ID="rfvcity" runat="server" ControlToValidate="txtftrcity" Text="*" ValidationGroup="validaiton"/>
</FooterTemplate>
</asp:TemplateField>--%>


<asp:TemplateField HeaderText="Choose Image">
<EditItemTemplate>
    <asp:FileUpload ID="fileuploadedit" runat="server" />
    <asp:Label ID="lblimg" runat="server" Text='<%#Eval("img") %>' Visible="false"></asp:Label>
     <asp:Image ID="d" runat="server" ImageUrl='<%#Eval("img") %>' />
</EditItemTemplate>
<ItemTemplate>
<asp:Label ID="lblDesg" runat="server" Text='<%#Eval("img") %>' Visible="false"/>
    <asp:Image ID="Image1" runat="server" ImageUrl='<%#Eval("img") %>' />
</ItemTemplate>
<FooterTemplate>
    <asp:FileUpload ID="fileuploadfooter" runat="server" />

<asp:RequiredFieldValidator ID="rfvdesignation" runat="server" ControlToValidate="fileuploadfooter" Text="*" ValidationGroup="validaiton"/>
</FooterTemplate>
</asp:TemplateField>
    <asp:TemplateField>
<EditItemTemplate>
<asp:ImageButton ID="imgbtnUpdate" CommandName="Update" runat="server" ImageUrl="~/Images/update.jpg" ToolTip="Update" Height="20px" Width="20px" />
<asp:ImageButton ID="imgbtnCancel" runat="server" CommandName="Cancel" ImageUrl="~/Images/Cancel.jpg" ToolTip="Cancel" Height="20px" Width="20px" />
</EditItemTemplate>
<ItemTemplate>
<asp:ImageButton ID="imgbtnEdit" CommandName="Edit" runat="server" ImageUrl="~/Images/Edit.jpg" ToolTip="Edit" Height="20px" Width="20px" />
<asp:ImageButton ID="imgbtnDelete" CommandName="Delete" Text="Edit" runat="server" ImageUrl="~/Images/delete.jpg" ToolTip="Delete" Height="20px" Width="20px" />
</ItemTemplate>
<FooterTemplate>
<asp:ImageButton ID="imgbtnAdd" runat="server" ImageUrl="~/Images/AddNewitem.jpg" CommandName="AddNew" Width="30px" Height="30px" ToolTip="Add new User" ValidationGroup="validaiton" />
</FooterTemplate>
</asp:TemplateField>
</Columns>
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

