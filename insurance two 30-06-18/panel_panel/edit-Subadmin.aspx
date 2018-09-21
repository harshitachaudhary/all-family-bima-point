<%@ Page Title="" Language="C#" MasterPageFile="~/panel_panel/admin_master.master" AutoEventWireup="true" CodeFile="edit-Subadmin.aspx.cs" Inherits="nyksi_panel_edit_Subadmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script type="text/javascript">
         function isNumberKey(evt) {
             var charCode = (evt.which) ? evt.which : event.keyCode
             if (charCode > 31 && (charCode < 46 || charCode > 57)) {
                 alert("Please Enter Only Numeric Value:");
                 return false;
             }
             return true;
         }
   </script>
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
                     Edit Subadmin
                    <%-- <small>form components and widgets</small>--%>
                  </h3>
                   <ul class="breadcrumb">
                       <li>
                           <a href="Default.aspx"><i class="icon-home"></i></a><span class="divider">&nbsp;</span>
                       </li>
                       <li>
                           <a href="#">Setting</a> <span class="divider">&nbsp;</span>
                       </li>
                       <li><a href="#">Edit Subadmin</a><span class="divider-last">&nbsp;</span></li>
                   </ul>
               </div>
            </div>

    <div class="row-fluid">
               <div class="span12">
                  <div class="widget">
                        <div class="widget-title">
                           <h4><i class="icon-user"></i>Edit Here</h4>             
                        </div>
                        <div class="widget-body">
                             <!--BEGIN ABOUT US-->
                 <form action="#" class="form-horizontal" id="dd" runat="server" autocomplete="off">
                           <div class="about-us">
                               <div class="row-fluid">
                               <div class="span6">


                     

                                       <div class="control-group">
                                       <label class="control-label">UserID
                                       </label>
                                       <div class="controls">
                                       <%--<input type="text" class="span6" style=" width:97%"  id="txtuserid" runat="server"/>--%>
                                       <asp:TextBox ID="txtuserid" runat="server" class="span6" style=" width:97%" AutoPostBack="true" OnTextChanged="txtuserid_TextChanged" ></asp:TextBox>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtuserid" ValidationGroup="tt" ErrorMessage="Fill UserID !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                       </div>
                                       </div>
                                     

                                       <div class="control-group">
                                       <label class="control-label">Password</label>
                                       <div class="controls">
                                       <input type="text" class="span6" style=" width:90%"  id="txtpassword" runat="server" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtpassword" ValidationGroup="tt" ErrorMessage="Fill Password !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                       </div>
                                       </div>



                                       <div class="control-group">
                                       <label class="control-label">Confirm Password</label>
                                       <div class="controls">
                                       <input type="text" class="span6" style=" width:90%"  id="txtconfirmpass" runat="server"/>
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtconfirmpass" ValidationGroup="tt" ErrorMessage="Fill Conferm Password !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                       <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtpassword" ControlToValidate="txtconfirmpass" Text="*" ErrorMessage="Password Mismatch !" ValidationGroup="tt" ForeColor="#cc3300"></asp:CompareValidator>    
                                       </div>
                                       </div>

                                      
                                   
                                       <div class="control-group">
                                       <label class="control-label">Name</label>
                                       <div class="controls">
                                       <input type="text" class="span6" style=" width:97%" id="txtname" runat="server" />
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtname" ValidationGroup="tt" ErrorMessage="Fill  Name !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                       </div>
                                       </div>


                                    <div class="control-group">
                                       <label class="control-label">Father Name</label>
                                       <div class="controls">
                                       <input type="text" class="span6" style=" width:97%" id="txtfathername" runat="server" />
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtfathername" ValidationGroup="tt" ErrorMessage="Fill Father  Name !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                       </div>
                                       </div>


                                       <div class="control-group">
                                       <label class="control-label">Mobile No.</label>
                                       <div class="controls">  
                                       <asp:TextBox ID="TextBox1" runat="server" style=" width:25%" ReadOnly="true" Text="+91" ></asp:TextBox>
                                       <input type="text" class="span6" style=" width:67%" id="txtmobile" runat="server" maxlength="10" onkeypress="return isNumberKey(event)"  />
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtmobile" ValidationGroup="tt" ErrorMessage="Fill Mobile No.!" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                       </div>
                                       </div>

                                       <div class="control-group">
                                       <label class="control-label">Landline</label>
                                       <div class="controls">
                                       <input type="text" class="span6" style=" width:30%" id="txtlandstdcode" onkeypress="return isNumberKey(event)" placeholder="STD Code" runat="server"  maxlength="7"/>
                                       <input type="text" class="span6" style=" width:66%" id="txtlandline" onkeypress="return isNumberKey(event)" placeholder="Landline No" runat="server" maxlength="9"/>
                                       </div>
                                       </div>
                                      

                                       <div class="control-group">
                                       <label class="control-label">Email ID</label>
                                       <div class="controls">
                                       <input type="text" class="span6" style=" width:97%" id="txtemailid" runat="server" />
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtemailid" ValidationGroup="tt" ErrorMessage="Fill Email ID !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                       </div>
                                       </div>
                                   </div>
                                   <div class="span6">
                                    <div class="control-group">
                                       <label class="control-label">Gender</label>
                                       <div class="controls">
                                        <label class="radio">
                                            <input type="radio" name="optionsRadios1" value="option1" checked id="gendermale" runat="server" />
                                            Male
                                        </label>
                                        <label class="radio">
                                            <input type="radio" name="optionsRadios1" value="option2"  id="genderfemale" runat="server" />
                                            Female
                                        </label>
                                       </div>
                                       </div>

                                   
                                       <div class="control-group">
                                       <label class="control-label">Date of Birth</label>
                                       <div class="controls">
                                       <asp:DropDownList ID="ddlday" runat="server" Width="27%"></asp:DropDownList>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" InitialValue="Day" ControlToValidate="ddlday" ValidationGroup="tt" ErrorMessage="Choose Day From Date of Birth !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                           <asp:DropDownList ID="ddlmonth" runat="server" Width="27%"></asp:DropDownList>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" InitialValue="Month" ControlToValidate="ddlmonth" ValidationGroup="tt" ErrorMessage="Choose Month From Date of Birth !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                           <asp:DropDownList ID="ddlyrs" runat="server" Width="27%"></asp:DropDownList>
                                           <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" InitialValue="Year" ControlToValidate="ddlyrs" ValidationGroup="tt" ErrorMessage="Choose Year From Date of Birth !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                       </div>
                                       </div>

                                     

                                      <div class="control-group">
                                       <label class="control-label">Designation</label>
                                       <div class="controls">
                                       <input type="text" class="span6" style=" width:97%" id="txtdesignation" runat="server" />
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="txtdesignation" ValidationGroup="tt" ErrorMessage="Fill Designation !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                       </div>
                                       </div>

                                     


                                       <div class="control-group">
                                       <label class="control-label">Address</label>
                                       <div class="controls">
                                       <input type="text" class="span6" style=" width:97%" id="txtaddress" runat="server" />
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtaddress" ValidationGroup="tt" ErrorMessage="Fill Address !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                       </div>
                                       </div>


                                       <div class="control-group">
                                       <label class="control-label">City</label>
                                       <div class="controls">
                                       <input type="text" class="span6" style=" width:97%" id="txtcity" runat="server" />
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="txtcity" ValidationGroup="tt" ErrorMessage="Fill City !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                       </div>
                                       </div>

                                       <div class="control-group">
                                       <label class="control-label">State</label>
                                       <div class="controls">
                                       <input type="text" class="span6" style=" width:97%" id="txtstate" runat="server" />
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="txtstate" ValidationGroup="tt" ErrorMessage="Fill State !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                       </div>
                                       </div>

                                       <div class="control-group">
                                       <label class="control-label">Country</label>
                                       <div class="controls">
                                       <input type="text" class="span6" style=" width:97%" id="txtcountry" runat="server" />
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtcountry" ValidationGroup="tt" ErrorMessage="Fill Country !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                       </div>
                                       </div>

                                       <div class="control-group">
                                       <label class="control-label">Zip Code</label>
                                       <div class="controls">
                                       <input type="text" class="span6" style=" width:97%" id="txtzipcode" runat="server" />
                                       <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtzipcode" ValidationGroup="tt" ErrorMessage="Fill Zip Code !" Text="*" ForeColor="#cc3300"></asp:RequiredFieldValidator>
                                       </div>
                                       </div>
                                   
                      

                               </div>
                             
                               </div>
                        </div>
                            <!--END ABOUT US-->
                       

                   

  <div class="form-actions clearfix">
                            
       <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-success" OnClick="btnupdate_Click" ValidationGroup="tt" Visible="true"></asp:Button>    
     <asp:ValidationSummary 
            ID="ValidationSummary1" 
            runat="server" 
            HeaderText="Following error occurs....." 
            ShowMessageBox="true"
            DisplayMode="BulletList"
            ShowSummary="false"
            BackColor="Snow"
            Width="450"
            ForeColor="Red"
            Font-Size="X-Large"
            Font-Italic="true" ValidationGroup="tt"
            />
  </div>

                      </div>
                 </form>
                   </div>
               </div>
            </div>
        </div>
</asp:Content>

