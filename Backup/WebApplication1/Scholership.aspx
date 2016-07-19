<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Scholership.aspx.cs" Inherits="WebApplication1.freeSeat" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container bg-2 text-center ">
        <h3>
            Free Technical Education</h3>
    </div>
    <div class="container text-info">
        <p>
            This is an ongoing scheme to promote qualitative education amongst SC/ST/OBC students,
            by providing full financial support for pursuing studies beyond 12th class. In the
            present days of technological development, technical education plays a significant
            role and in the coming years, not only the scope of employment for technical personnel
            will be better but at the same time, it will help the students to become self employed.
            Therefore, emphasis is being laid on promoting technical education amongst the SC/ST/OBC.
            boys and girls also so that they do not lag behind others.</p>
        <div class="text-left text-nowrap">
            <h4>
                Eligibility :-</h4>
        </div>
        A student is allowed to avail the scholarship either under the State Plan Scheme
        or Centrally Sponsored Scholarship Scheme, whichever is beneficial to him/her and
        should inform the awarding authority through the Head of the Institution by mode
        of a declaration”. Technical Institution Approved by AICTE or UGC.
        <div class="text-left">
            <h4>
                Scholarship will be awarded for :-</h4>
        </div>
        Full tuition fee books and stationery per year per student will be awarded The scholarship,
        once awarded, will continue till the completion of the course, subject to the satisfactory
        performance.
    </div>
    <br />
    <div class="container">
        <div class="jumbotron">
            <div class="container-fluid"> <%--/*bg-grey*/--%>
                <h2 class="text-center">
                    Contact</h2>
                <div class="row">
                    <div class="col-sm-5">
                        <p>
                            Contact us and we'll get back to you within 24 hours.</p>
                        <p>
                            <span class="glyphicon glyphicon-phone"></span>+91 XXXXXXXXXX</p>
                        <p>
                            <span class="glyphicon glyphicon-envelope"></span>info@careerexpert.co</p>
                    </div>
                  <form id="formFreeSeat" runat="server">
                    <div class="col-sm-7">
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <asp:TextBox runat="server" CssClass="form-control" id="txtName"  placeholder="Name" type="text" required/>
                                    
                            </div>
                            <div class="col-sm-6 form-group">
                                <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail"  placeholder="Email" type="email" required/>                                    
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                                <asp:TextBox runat="server" CssClass="form-control" id="txtMobNo" name="MobNo" placeholder="Mobile" type="text" MaxLength="10"/>
                                    
                            </div>
                            <div class="col-sm-6 form-group">
                                <asp:TextBox runat="server" CssClass="form-control" id="txtRollNo" name="Roll No" placeholder="Roll No" type="text" required/>
                                    
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-6 form-group">
                              <div class="dropdown">
                                  <asp:DropDownList runat="server" ID="ddlCourse" CssClass="btn btn-primary dropdown-toggle" EnableTheming="true">                            
                              <asp:ListItem Text="Diploma" Value="1"/>
                               <asp:ListItem Text="B.Tech" Value="1"/>
                                <asp:ListItem Text="MBBS" Value="2" />
                                 <asp:ListItem Text="B.Ed" Value="3" />
                                 <asp:ListItem Text="Other" Value="4" />
                             </asp:DropDownList>  
                                </div>
                            </div>
                            <div class="col-sm-6 form-group">
                             <div class="dropdown">
                             <asp:DropDownList runat="server" ID="ddlCity" CssClass="btn btn-primary dropdown-toggle" EnableTheming="true">                            
                              <asp:ListItem Text="City" Value="0"/>
                               <asp:ListItem Text="Kolkata" Value="1"/>
                                <asp:ListItem Text="Patna" Value="2" />
                                 <asp:ListItem Text="Bokaro" Value="3" />
                             </asp:DropDownList>                                                  
                            </div>
                        </div>
                        </div>
                        <div class="row">
                         <div class="col-sm-12">
                        <asp:TextBox runat="server" CssClass="form-control" id="txtAreaMessage" TextMode="multiline" name="comments" placeholder="Message"  Columns="4" Rows="4"></asp:TextBox><br>
                         </div>
                         </div>  
                        <div class="row">
                            <div class="col-sm-12 form-group">
                                <asp:Button class="btn btn-info pull-right"  id="btnSubmit" runat="server" 
                                    Text="Submit" onclick="btnSubmit_Click"></asp:Button>
                                   
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
