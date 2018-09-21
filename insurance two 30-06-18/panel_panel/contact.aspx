<%@ Page Title="" Language="C#" MasterPageFile="~/panel_panel/admin_master.master" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="panel_panel_contact" %>

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
                    Contact Us Query
                    <%-- <small>form components and widgets</small>--%>
                  </h3>
                   <ul class="breadcrumb">
                       <li><a href="Default.aspx"><i class="icon-home"></i></a><span class="divider">&nbsp;</span></li>
                       <li><a href="#">Contact Us Query</a><span class="divider">&nbsp;</span></li>
                       <li><a href="#">Contact Us Query</a><span class="divider-last">&nbsp;</span></li>
                   </ul>
               </div>
            </div>

    <div class="row-fluid">
               <div class="span12">
                  <div class="widget">
                        <div class="widget-title">
                           <h4><i class="icon-user"></i>Detail Here</h4>             
                        </div>
                        <div class="widget-body">
                            <!--BEGIN ABOUT US-->
                 <form action="#" class="form-horizontal" id="fhgfh" runat="server">
                    
                           <div class="about-us">
                              

                                <div class="row-fluid">
                                    <asp:GridView ID="grdcategory" runat="server"  PageIndex="1"  OnRowDataBound="grdcategory_RowDataBound"
             AutoGenerateColumns="false"   Font-Size="Small"
             style="margin-left:0%; text-align:center; width:100%;" 
             DataKeyNames="id"
              EmptyDataText="No Data Found"
             EnablePersistedSelection="false" 
            
               >
     <Columns>
  
         <asp:TemplateField HeaderText="SNo.">
         <ItemTemplate>
               <%# Container.DataItemIndex + 1 %>
         </ItemTemplate>
     </asp:TemplateField>

     <asp:BoundField  DataField="name" HeaderText="Name" />
          <asp:BoundField  DataField="email" HeaderText="Email ID" />
          <asp:BoundField  DataField="phone" HeaderText="Mobile No." />
          
          <asp:BoundField  DataField="comment" HeaderText="Message" />
         <asp:BoundField  DataField="date" HeaderText="Date Of Query" />
        

     <asp:TemplateField ItemStyle-HorizontalAlign="Center">
        <HeaderTemplate>Delete</HeaderTemplate>
        <ItemTemplate>
         <asp:LinkButton ID="lb_Edit" runat="server"  OnClientClick="return confirm('Do you want to Confirm for this action?')" OnClick="lb_Edit_Click">Delete</asp:LinkButton>
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

