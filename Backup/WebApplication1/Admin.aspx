<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="WebApplication1.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server">
<div class="container">
<div class="row text-center">
 <h2><small>Users </small>
 </h2>
    <div class="col-md-3">
     <div class="panel panel-primary">
      <div class="panel-head page-header">
        <h2>Operation:</h2>
          <asp:DropDownList runat="server" CssClass=" btn-sm btn-lg" ID="ddlAdd" AutoPostBack="true"
              OnSelectedIndexChanged="itemSelected" EnableTheming="true">
              <asp:ListItem Text="Select Operation" Value="0" Selected="True"/>
              <asp:ListItem Text="Add User" Value="1" />
              <asp:ListItem Text="Add Job" Value="2" />              
          </asp:DropDownList>
      </div>
      <div id="AddJob" class="panel-body" runat="server" visible="false">
          
          <asp:TextBox runat="server" CssClass="form-group form-control " ID="txtNewJobId" placeholder="Job Id"
             type="text" required />
          <asp:TextBox runat="server" CssClass="form-group form-control" ID="txtNewJobTitle"
              placeholder="Job Title" type="text" required />
          <asp:TextBox runat="server" CssClass="form-group form-control " ID="txtNewJobLoc"
              placeholder="Job Location"  type="text" required />
          <asp:TextBox runat="server" CssClass="form-group form-control " ID="txtNewJobCompany"
              placeholder="Company" type="text" required />
          <asp:TextBox runat="server" CssClass="form-group form-control " ID="txtNewJobDesc"
              placeholder="Job Description" type="text" required Columns="4" Rows="4" TextMode="MultiLine" />
          <asp:TextBox runat="server" CssClass="form-control" ID="txtNewJobExp"
              placeholder="Job Experience Required" type="text" required />
          <div class="panel-footer">
              <button type="reset" runat="server" class="btn btn-sm btn-primary" id="btnClear">
                  Clear</button>
              <asp:Button runat="server" CssClass="btn btn-sm  btn-success" Text="Add" ID="btnAddJob"
                  OnClick="btnAddJob_AddingJob" />
          </div>
          </div>
     
      
             <div id="AddUser" class="panel-body" runat="server" visible="false">
                 <asp:TextBox runat="server" CssClass="form-group form-control " ID="txtUserName" placeholder="Name"
                     type="text" required />
                 <asp:TextBox runat="server" CssClass="form-group form-control" ID="txtEmail" placeholder="Email"
                     type="text" required />
                 <asp:TextBox runat="server" CssClass="form-group form-control " ID="txtPhone" placeholder="Phone"
                     type="text" required />
              
                 <div class="dropdown">
                     <asp:DropDownList runat="server" ID="ddlUserType" CssClass=" btn-sm btn-lg dropdown-toggle "
                         EnableTheming="true">
                         <asp:ListItem Text="Select User Type" Value="0" />
                         <asp:ListItem Text="Student" Value="1" />
                         <asp:ListItem Text="Admin" Value="2" />
                         <asp:ListItem Text="Job Seeker" Value="3" />
                         <asp:ListItem Text="Employer" Value="4" />
                     </asp:DropDownList>
                 </div>
                 <div class="panel-footer">
                     <button type="reset" runat="server" class="btn btn-sm btn-primary" id="btnReset">
                         Clear</button>
                     <asp:Button runat="server" CssClass="btn btn-sm  btn-success" Text="Add" ID="btnAddUser"
                         OnClick="btnAddUser_AddingUser" />
                 </div>
             </div>
     </div> 
         </div>
     </div>
    </div>

     <div class="container">
    <h3>Pending Job Details:</h3>
   <div class="col-lg-12"> 
   <asp:GridView ID="gvPendingJobs" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="panel"
       ForeColor="#333333" GridLines="None" OnRowDeleting="gvPendingJobs_RowDeleting" OnRowEditing="gvPendingJobs_RowEditing"
       OnRowUpdating="gvPendingJobs_RowUpdating" OnRowCancelingEdit="gvPendingJobs_RowCancelingEdit">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Job Id" SortExpression="JobId">                           
                <ItemTemplate>
                    <asp:Label ID="lblJobId" runat="server" Text='<%# Bind("JobId") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Posted Email" SortExpression="JobId"> 
               <ItemTemplate>
                    <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Posted Date" SortExpression="PostedDate">   
                <ItemTemplate>
                    <asp:Label ID="lblPostedDate" runat="server" Text='<%# Bind("PostedDate") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="Job Title" SortExpression="JobTitle">
                <EditItemTemplate>
                    <asp:TextBox ID="txtJobTitle" runat="server" Text='<%# Bind("JobTitle") %>'></asp:TextBox>
                </EditItemTemplate>               
                <ItemTemplate>
                    <asp:Label ID="lblJobTitle" runat="server" Text='<%# Bind("JobTitle") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Company" SortExpression="Company">
                <EditItemTemplate>
                    <asp:TextBox ID="txtCompany" runat="server" Text='<%# Bind("Company") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblCompany" runat="server" Text='<%# Bind("Company") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Job Description" SortExpression="JobDesc">
                <EditItemTemplate>
                    <asp:TextBox ID="txtJobDesc" runat="server" Text='<%# Bind("JobDesc") %>'></asp:TextBox>
                </EditItemTemplate>
              
                <ItemTemplate>
                    <asp:Label ID="lblJobDesc" runat="server" Text='<%# Bind("JobDesc") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Experience" SortExpression="JobExperience">
                <EditItemTemplate>
                    <asp:TextBox ID="txtJobExp" runat="server" Text='<%# Bind("JobExperience") %>'></asp:TextBox>
                </EditItemTemplate>                
                <ItemTemplate>
                    <asp:Label ID="lblJobExp" runat="server" Text='<%# Bind("JobExperience") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Location" SortExpression="Location">
                <EditItemTemplate>
                    <asp:TextBox ID="txtJobLoc" runat="server" Text='<%# Bind("Location") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblJobLoc" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>           
            <asp:TemplateField HeaderText="Active" SortExpression="ActiveJobs">
                <EditItemTemplate>
                    <asp:TextBox ID="txtJobActive" runat="server" Text='<%# Bind("ActiveJobs") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblJobActive" runat="server" Text='<%# Bind("ActiveJobs") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="true" />
            <asp:CommandField ShowDeleteButton="true" />
           
        </Columns>
        
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
        
     </asp:GridView>
    </div>
    </div>
   
    <div class="container">
    <h3>Applied Job Details:</h3>
   <div class="col-lg-12"> 
   <asp:GridView ID="gvAppliedJobs" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="panel"
       ForeColor="#333333" GridLines="None" >
        <AlternatingRowStyle BackColor="White" />
       <Columns>
            <asp:TemplateField HeaderText="Job Id" SortExpression="JobId">                           
                <ItemTemplate>
                    <asp:Label ID="lblJobId" runat="server" Text='<%# Bind("JobId") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Posted User" SortExpression="PostedEmail">   
               <ItemTemplate>
                    <asp:Label ID="lblPostedEmail" runat="server" Text='<%# Bind("PostedEmail") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>   
                <asp:TemplateField HeaderText="Posted Date" SortExpression="PostedDate">   
                <ItemTemplate>
                    <asp:Label ID="lblPostedDate" runat="server" Text='<%# Bind("PostedDate") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>   
                <asp:TemplateField HeaderText="User Applied" SortExpression="AppliedEmail">   
                <ItemTemplate>
                    <asp:Label ID="lblAppliedEmail" runat="server" Text='<%# Bind("AppliedEmail") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>   
                <asp:TemplateField HeaderText="Applied Date" SortExpression="AppliedDate">   
                <ItemTemplate>
                    <asp:Label ID="lblAppliedDate" runat="server" Text='<%# Bind("AppliedDate") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>   
                <asp:TemplateField HeaderText="Job Title" SortExpression="JobTitle">   
                <ItemTemplate>
                    <asp:Label ID="lblJobTitle" runat="server" Text='<%# Bind("JobTitle") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>   
                <asp:TemplateField HeaderText="Job Desc" SortExpression="JobDesc">   
                <ItemTemplate>
                    <asp:Label ID="lblJobDesc" runat="server" Text='<%# Bind("JobDesc") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>   
                <asp:TemplateField HeaderText="Experience" SortExpression="JobExperience">   
                <ItemTemplate>
                    <asp:Label ID="lblJobExp" runat="server" Text='<%# Bind("JobExperience") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>   
                <asp:TemplateField HeaderText="Location" SortExpression="Location">   
                <ItemTemplate>
                    <asp:Label ID="lblLocation" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>   
                <asp:TemplateField HeaderText="Company" SortExpression="Company">   
                <ItemTemplate>
                    <asp:Label ID="lblCompany" runat="server" Text='<%# Bind("Company") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>   
                <asp:TemplateField HeaderText="Active" SortExpression="ActiveJobs">   
                <ItemTemplate>
                    <asp:Label ID="lblActive" runat="server" Text='<%# Bind("ActiveJobs") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>                                   
        </Columns>
        
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
        
     </asp:GridView>
    </div>
    </div>

    <div class="container">
    <h3>Posted Job Details:</h3>
   <div class="col-lg-12"> 
   <asp:GridView ID="gvJobs" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="panel"
       ForeColor="#333333" GridLines="None" OnRowDeleting="gvJobs_RowDeleting" OnRowEditing="gvJobs_RowEditing"
       OnRowUpdating="gvJobs_RowUpdating" OnRowCancelingEdit="gvJobs_RowCancelingEdit">
        <AlternatingRowStyle BackColor="White" />
       <Columns>
            <asp:TemplateField HeaderText="Job Id" SortExpression="JobId">                           
                <ItemTemplate>
                    <asp:Label ID="lblJobId" runat="server" Text='<%# Bind("JobId") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Posted Email" SortExpression="JobId">   
               <ItemTemplate>
                    <asp:Label ID="lblUserEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Posted Date" SortExpression="PostedDate">   
                <ItemTemplate>
                    <asp:Label ID="lblPostedDate" runat="server" Text='<%# Bind("PostedDate") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
            <asp:TemplateField HeaderText="Job Title" SortExpression="JobTitle">
                <EditItemTemplate>
                    <asp:TextBox ID="txtJobTitle" runat="server" Text='<%# Bind("JobTitle") %>'></asp:TextBox>
                </EditItemTemplate>               
                <ItemTemplate>
                    <asp:Label ID="lblJobTitle" runat="server" Text='<%# Bind("JobTitle") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Company" SortExpression="Company">
                <EditItemTemplate>
                    <asp:TextBox ID="txtCompany" runat="server" Text='<%# Bind("Company") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblCompany" runat="server" Text='<%# Bind("Company") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Job Description" SortExpression="JobDesc">
                <EditItemTemplate>
                    <asp:TextBox ID="txtJobDesc" runat="server" Text='<%# Bind("JobDesc") %>'></asp:TextBox>
                </EditItemTemplate>
              
                <ItemTemplate>
                    <asp:Label ID="lblJobDesc" runat="server" Text='<%# Bind("JobDesc") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Experience" SortExpression="JobExperience">
                <EditItemTemplate>
                    <asp:TextBox ID="txtJobExp" runat="server" Text='<%# Bind("JobExperience") %>'></asp:TextBox>
                </EditItemTemplate>                
                <ItemTemplate>
                    <asp:Label ID="lblJobExp" runat="server" Text='<%# Bind("JobExperience") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Location" SortExpression="Location">
                <EditItemTemplate>
                    <asp:TextBox ID="txtJobLoc" runat="server" Text='<%# Bind("Location") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblJobLoc" runat="server" Text='<%# Bind("Location") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>            
            <asp:TemplateField HeaderText="Active" SortExpression="ActiveJobs">
                <EditItemTemplate>
                    <asp:TextBox ID="txtJobActive" runat="server" Text='<%# Bind("ActiveJobs") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblJobActive" runat="server" Text='<%# Bind("ActiveJobs") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>            
            <asp:CommandField ShowEditButton="true" />
            <asp:CommandField ShowDeleteButton="true" />
           
        </Columns>
        
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
        
     </asp:GridView>
    </div>
    </div>
   
<div class="container">
 <h3>User Details:</h3>
    <div class="row text-center">
        <asp:GridView ID="gvUser" runat="server" AutoGenerateColumns="False" CellPadding="4"
            CssClass="panel" ForeColor="#333333" GridLines="None" OnRowDeleting="gvUser_RowDeleting"
            OnRowEditing="gvUser_RowEditing" OnRowUpdating="gvUser_RowUpdating" OnRowCancelingEdit="gvUser_RowCancelingEdit">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text='<%# Bind("Name") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email" SortExpression="UserType">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGvEmail" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblEmail" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User Type" SortExpression="UserType">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGvUserType" runat="server" Text='<%# Bind("UserType") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGvUserType" runat="server" Text='<%# Bind("UserType") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
               <asp:TemplateField HeaderText="Mobile No" SortExpression="Mobile no">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGvMobile" runat="server" Text='<%# Bind("Mobile") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGvMobile" runat="server" Text='<%# Bind("Mobile") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Job Description" SortExpression="Qualification">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGvQualification" runat="server" Text='<%# Bind("Qualification") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGvQualification" runat="server" Text='<%# Bind("Qualification") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Institute" SortExpression="Institute">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGvInstitute" runat="server" Text='<%# Bind("Institute") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGvInstitute" runat="server" Text='<%# Bind("Institute") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Company" SortExpression="Company">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGvCompany" runat="server" Text='<%# Bind("Company") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGvCompany" runat="server" Text='<%# Bind("Company") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Experience" SortExpression="Experience">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGvExperience" runat="server" Text='<%# Bind("Experience") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGvExperience" runat="server" Text='<%# Bind("Experience") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="City" SortExpression="City">
                    <EditItemTemplate>
                        <asp:TextBox ID="txtGvCity" runat="server" Text='<%# Bind("Add.City") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="lblGvCity" runat="server" Text='<%# Bind("Add.City") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Update Date" SortExpression="RegisterDate">
                    <ItemTemplate>
                        <asp:Label ID="lblGvRegisterDate" runat="server" Text='<%# Bind("RegisterDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ShowEditButton="true" />
                <asp:CommandField ShowDeleteButton="true" />
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>
    </div>
    </div>
    </form>
</asp:Content>
