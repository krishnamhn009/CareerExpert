<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PostJob.aspx.cs" Inherits="WebApplication1.PostJob" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container margin-top-50">
        <div class="row">

    <form id="loginForm" runat="server">
         <div class="col-md-4 col-md-offset-2">
              <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header mod-header">                   
                    <h4 class="modal-title text-center">
                        Post a Job</h4>
                </div>
                <div class="modal-body">                      
                    <div class="form-group">
                        <label>Job Title/Suitable for Role *</label>
                            <input class="form-control" id="txtJobTitle" placeholder="Job Title" type="text" runat="server" required
                                 />     
                            <asp:RegularExpressionValidator ID="regName" runat="server" ControlToValidate="txtJobTitle"
                                            ValidationExpression="^[a-zA-Z'.\s]{1,30}" Text="Enter a valid job title" ForeColor="Red"/>                   
                                        
                    </div>
                     <div class="form-group ">
                        <label>Company Name *</label>
                        <input class="form-control" id="txtCompany" placeholder="Company" required
                                runat="server" />
                    </div>
                    <div class="form-group ">
                        <label>Location *</label>                                                      
                                <asp:TextBox ID="txtJobLoc" CssClass="form-control dropdown"  AutoCompleteType="BusinessCity" runat="server" AutoPostBack="true"></asp:TextBox>
                                <asp:AutoCompleteExtender ServiceMethod="GetLocation" MinimumPrefixLength="1"  
                               CompletionInterval="100" EnableCaching="true" CompletionSetCount="1" TargetControlID="txtJobLoc"  
                               ID="AutoCompleteExtender1" runat="server" FirstRowSelected="false">  
                                  </asp:AutoCompleteExtender> 
                            <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
                        </div>
                                     
                    <div class="form-group ">
                        <label>Key Skills *</label>
                            <input class="form-control" id="txtKeySkills" placeholder="eg.. java,php,.net..etc"  required
                                runat="server" />
                       
                    </div>
                   
                    <div class="form-group ">
                        <label>Experience *</label>
                        <div class="dropdown">
                                <asp:DropDownList runat="server" ID="ddlStartExp" CssClass="btn btn-lg btn-info-outline dropdown-toggle"
                                    EnableTheming="true" TabIndex="1">
                                    <asp:ListItem Text="Entry" Value="0"/>
                                    <asp:ListItem Text="1" Value="1" />
                                    <asp:ListItem Text="2" Value="2" />        
                                    <asp:ListItem Text="3" Value="3" />
                                    <asp:ListItem Text="4" Value="4" />
                                    <asp:ListItem Text="5" Value="5" />
                                    <asp:ListItem Text="6" Value="6" />
                                    <asp:ListItem Text="7" Value="7" />
                                    <asp:ListItem Text="8" Value="8" />                                    
                                    <asp:ListItem Text="9" Value="9" />
                                    <asp:ListItem Text="10+" Value="10" />
                                </asp:DropDownList>  to                       
                                <asp:DropDownList runat="server" ID="ddlEndExp" CssClass="btn btn-lg btn-info-outline dropdown-toggle"
                                    EnableTheming="true" TabIndex="2">                                   
                                    <asp:ListItem Text="1" Value="0" />
                                    <asp:ListItem Text="2" Value="1" />        
                                    <asp:ListItem Text="3" Value="2" />
                                    <asp:ListItem Text="4" Value="3" />
                                    <asp:ListItem Text="5" Value="4" />
                                    <asp:ListItem Text="6" Value="5" />
                                    <asp:ListItem Text="7" Value="6" />
                                    <asp:ListItem Text="8" Value="7" />                                    
                                    <asp:ListItem Text="9" Value="8" />
                                    <asp:ListItem Text="10" Value="9" />
                                    <asp:ListItem Text="11+" Value="10" />
                                </asp:DropDownList>
                         </div>
                       
                            <input class="form-control" id="txtJobExp" placeholder="Job Experience "  required
                                runat="server" />
                    </div>
                    <div class="form-group ">
                        <label>CTC(in Rs Lacs p.a.) *</label>                       
                            <input class="form-control" id="txtSalary" placeholder="Salry "  required
                                runat="server" />    
                        <div class="dropdown">
                                <asp:DropDownList runat="server" ID="ddlStartCtc" CssClass="btn btn-lg btn-info-outline dropdown-toggle"
                                    EnableTheming="true" TabIndex="1">
                                    
                                    <asp:ListItem Text="1" Value="1" />
                                    <asp:ListItem Text="2" Value="2" />        
                                    <asp:ListItem Text="3" Value="3" />
                                    <asp:ListItem Text="4" Value="4" />
                                    <asp:ListItem Text="5" Value="5" />
                                    <asp:ListItem Text="6" Value="6" />
                                    <asp:ListItem Text="7" Value="7" />
                                    <asp:ListItem Text="8" Value="8" />                                    
                                    <asp:ListItem Text="9" Value="9" />
                                    <asp:ListItem Text="10" Value="10" />
                                    <asp:ListItem Text="11" Value="11" />
                                    <asp:ListItem Text="12" Value="12" />                                    
                                    <asp:ListItem Text="13" Value="13" />
                                    <asp:ListItem Text="14" Value="14" />
                                    <asp:ListItem Text="15" Value="15" />
                                    <asp:ListItem Text="16" Value="16" />
                                    <asp:ListItem Text="17" Value="17" />                                    
                                    <asp:ListItem Text="18" Value="18" />
                                    <asp:ListItem Text="19" Value="19" />
                                </asp:DropDownList>  to                       
                                <asp:DropDownList runat="server" ID="ddlEndCtc" CssClass="btn btn-lg btn-info-outline dropdown-toggle"
                                    EnableTheming="true" TabIndex="2">                                   
                                    <asp:ListItem Text="1" Value="0" />
                                    <asp:ListItem Text="2" Value="1" />        
                                    <asp:ListItem Text="3" Value="2" />
                                    <asp:ListItem Text="4" Value="3" />
                                    <asp:ListItem Text="5" Value="4" />
                                    <asp:ListItem Text="6" Value="5" />
                                    <asp:ListItem Text="7" Value="6" />
                                    <asp:ListItem Text="8" Value="7" />                                    
                                    <asp:ListItem Text="9" Value="8" />
                                    <asp:ListItem Text="10" Value="9" />
                                   <asp:ListItem Text="11" Value="11" />
                                    <asp:ListItem Text="12" Value="12" />                                    
                                    <asp:ListItem Text="13" Value="13" />
                                    <asp:ListItem Text="14" Value="14" />
                                    <asp:ListItem Text="15" Value="15" />
                                    <asp:ListItem Text="16" Value="16" />
                                    <asp:ListItem Text="17" Value="17" />                                    
                                    <asp:ListItem Text="18" Value="18" />
                                    <asp:ListItem Text="19" Value="19" />
                                    <asp:ListItem Text="20+" Value="20" />
                                </asp:DropDownList>
                         </div>                   
                    </div>
                    <div class="form-group ">
                        <label>Job Description *</label>
                        <div class="input-group">
                            <span class="input-group-addon btn-bitbucket"><i class="fa  fa-tasks"></i></span>
                            <input class="form-control" id="txtJobDesc" placeholder="Job Description"  required
                                runat="server" />
                        </div>
                    </div>                    
                </div> 
            
                <div class="modal-footer">
                    <a href="#" data-dismiss="modal" class="btn btn-danger">Close</a>                   
                    <asp:Button ID="btnJobPost" CssClass="btn btn-lg btn-danger-outline" OnClick="btnJobPost_Click" runat="server" Text="Submit" />
                </div>
             </div>
                  </div>
             </div>
                </form> 
            </div>
        </div>
</asp:Content>
