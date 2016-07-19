<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Tution.aspx.cs" Inherits="WebApplication1.Tution" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
.logo {
    font-size: 200px;
    color: #2980B9;
}
 .logo-tution
    {
        font-size: 150px;
     }
@media screen and (max-width: 768px) {
    .col-sm-4 {
        text-align: center;
        margin: 25px 0;
    }
    
   
}
</style>
 <script src="../Scripts/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="../Scripts/bootstrap.js" type="text/javascript"></script>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<br/><br/><br/><br/><br/><br/>
<div class="jumbotron">
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-8">
      <h2>We help you obtain Better Grades</h2>
        <p>
            We believe that private tutoring is the most powerful way to unlock “I get it” moments—when
            eyes light up, possibilities unfold, and confidence is born.</p>
        <p>
            We offer personalized, 1-on-1 instruction that helps students 
            gain confidence, improve grades, and learn new skills.</p>
      <button class="btn btn-info btn-lg">Get in Touch</button>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-signal logo"></span>
    </div>
  </div>
</div>
</div>
<div id="services" class="container-fluid text-center">
        <h2>
            How It Works</h2>
        <div class="row">
            <div class="col-sm-4">
                <a type="button" class="btn btn-lg" href="#"><span class="glyphicon glyphicon-comment logo-tution">
                </span></a>
                <h4>
                    Enquire About Tutor</h4>
            </div>
            <div class="col-sm-4">
                <a type="button" class="btn btn-lg" href="#"><span class="glyphicon glyphicon-blackboard logo-tution">
                </span></a>
                <h4>
                    Schedule a Demo Class</h4>
            </div>
            <div class="col-sm-4">
                <a type="button" class="btn btn-lg" href="#"><span class="glyphicon glyphicon-home logo-tution">
                </span></a>
                <h4>
                   Classes begin at home</h4>
                
            </div>
        </div>
    </div>
<div class="jumbotron">
<div class="container">
  <div class="text-capitalize text-center">
 
 <h2> Enroll For a Great Part-Time Tutoring Job </h2>
  </div>
    <p>
        We understand your passion to teach and learn, tutoring with flipClass is a great
        way to earn extra money. College students, teachers, senior citizens and professionals,
        all love this part-time tutoring job. Learn more about how you can help students
        and keep their skills sharp. There are current positions available in physics, maths,
        indian & foreign languages, accountancy, geography and many more subjects.</p>
     <button id="btnTutorRegistration"  class="btn btn-info btn-lg"  data-toggle="modal" data-target="#myModal">Free Tutor Registration</button>
</div>

    <div id="myModal" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="modal-header text-center text-info">
                        <button type="button" class="close" data-dismiss="modal">
                            &times;</button>
                        <h4 class="modal-title">
                            Be A Tutor</h4>
                    </div>
                    <div class="container" id="TutorFormContainer">
                        <div class="row well">
                            <div class="col-sm-12">
                                <div class="row">
                                    <h4 class="text-center text-info">
                                        Be a Tutor</h4>
                                </div>
                                <form id="TutorFrom" runat="server">
                                <div class="row">
                                    <div class="col-sm-6 form-group">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtName" placeholder="Name"
                                            type="text" required />
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtEmail" placeholder="Email"
                                            type="email" required />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 form-group">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtMobNo" placeholder="Mobile"
                                            type="text" MaxLength="10" required />
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtSubjects" placeholder="Primary subjects"
                                            type="text" required />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 form-group">
                                        <div class="dropdown">
                                            <asp:DropDownList runat="server" ID="DropDownList1" CssClass="btn btn-primary dropdown-toggle"
                                                EnableTheming="true">
                                                <asp:ListItem Text="Qualification" Value="0" />
                                                <asp:ListItem Text="High School" Value="1" />
                                                <asp:ListItem Text="Graduate" Value="2" />
                                                <asp:ListItem Text="Master" Value="3" />
                                                <asp:ListItem Text="Other" Value="4" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <div class="dropdown">
                                            <asp:DropDownList runat="server" ID="ddlExperience" CssClass="btn btn-primary dropdown-toggle"
                                                EnableTheming="true">
                                                <asp:ListItem Text="Experience" Value="0" />
                                                <asp:ListItem Text="Fresher" Value="1" />
                                                <asp:ListItem Text="2" Value="2" />
                                                <asp:ListItem Text="3" Value="3" />
                                                <asp:ListItem Text="4" Value="4" />
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                <div class="row-well">
                                    <div class="col-sm-12 form-group">
                                        <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" ID="txtAbout"
                                            name="comments" placeholder="Describe yourself" Rows="4" cols="4" /><br />
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 form-group">
                                        <asp:Button CssClass="btn btn-danger" ID="btnCloseModel" runat="server" data-dismiss="modal"
                                            Text="Cancel" />
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <asp:Button CssClass="btn btn-info" ID="btnSubmit" runat="server" Text="Submit" />
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
