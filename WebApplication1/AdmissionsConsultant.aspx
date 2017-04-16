<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="AdmissionsConsultant.aspx.cs" Inherits="WebApplication1.Admission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
       
        function checkBlank() {
            debugger;
            var name = document.getElementById("ContentPlaceHolder1_txtName").value;
            var mail = document.getElementById("ContentPlaceHolder1_txtEmail").value;
            var mob = document.getElementById("ContentPlaceHolder1_txtMobNo").value;
            var txtQuery = document.getElementById("ContentPlaceHolder1_txtQuery").value;
            if (name == "" || mail == "" || mob == "" || txtQuery=="")
                return false;
            else
                return ValidateUser();

        }
        function ValidateUser() {
            var city = document.getElementById("ContentPlaceHolder1_ddlCity1");
            var qual = document.getElementById("ContentPlaceHolder1_ddlQual");
            var careerFld = document.getElementById("ContentPlaceHolder1_ddlCareerField");
            var cityValue = city.options[city.selectedIndex].value;
            var qualValue = qual.options[qual.selectedIndex].value;
            var careerValue = careerFld.options[careerFld.selectedIndex].value;

            if (cityValue == 1)
            {
                alert("Please Select City");
                return false;
            }
            


            if (qualValue == 1) {
                alert("Please Select Qualification");
                return false;
            }
           


            if (careerValue == 1) {
                alert("Please Select Career");
                return false;
            }
            return true;
            
        }
         </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <form runat="server">
    <div class="container">
            <ul class="nav nav-tabs margin-top-70 page-header text-center text-capitalize">
            <li class="active"><a data-toggle="tab" href="#menu0"><i class="fa fa-university fa-2x colortheme" style="
                margin-right: .1em;"></i>Find A College</a></li>
            <li><a data-toggle="tab" href="#menuQuery"><i class="fa fa-bell-o fa-2x colortheme" style="
                margin-right: .1em;"></i>Your Query</a></li>
            <li><a data-toggle="tab" href="#menu1"><i class="fa fa-bolt fa-2x colortheme"
                style=" margin-right: .1em;"></i>Admission Counselling </a></li>
            <li><a data-toggle="tab" href="#menu2"><i class="fa fa-balance-scale fa-2x colortheme" style="
                margin-right: .1em;"></i>Scholarship for Technical Education</a></li>
            
            <li><a data-toggle="tab" href="#menu3"><i class="fa fa-fort-awesome fa-2x colortheme" style="
                margin-right: .1em;"></i>College Admissions </a></li>            
        </ul>
            <div class="tab-content">
             
            <%--===============================================--%>
                      <div id="menu1" class="tab-pane fade "> 
          <div class="panel panel-primary">
                <div class="panel-body">
                    <p>
                        In today’s hyper-competitive admissions landscape, standing out from the crowd is
                        more important and more difficult than ever. At selective and highly selective universities,
                        high grades and standardized test scores are the norm. We offer exceptional college
                        consulting services tailored to help you meet your goal.</p>
                    <p>
                        We are team of Experts not Agent.We have been advising college and graduate school
                        applicants since 2010.Our Team of Experts can assist you, like they have helped
                        thousands of others, no matter where you are or where you want to go.</p>
                    <p>
                        When you choose us, you will be assigned your own expert dedicated to helping you,
                        as well as the support of a team made up of uncommonly talented professionals.
                    </p>
                    <h3>
                        Quick Facts about Admission Counseling Services</h3>
                    <p>
                        <i class="fa fa-check fa-fw" style="color: Green"></i>Over 2000 applicants subscribe
                        to our Premium Admissions Counseling Service every year</p>
                    <p>
                        <i class="fa fa-check fa-fw" style="color: Green"></i>Applicants are serviced by
                        experts who are highly experienced professionals</p>
                    <p>
                        <i class="fa fa-check fa-fw" style="color: Green"></i>service One-on-one and customized
                        service provided for both Counseling and Editing of applications</p>
                    <p>
                        <i class="fa fa-check fa-fw" style="color: Green"></i>Applicants serviced through
                        us have received admission offers from highly reputed universities</p>
                    <p>
                        <i class="fa fa-check fa-fw" style="color: Green"></i>We have tie up with various
                        college as well as Institutes.</p>
                    <h3>
                        Deliverables</h3>
                    <p>
                        <i class="fa fa-check fa-fw" style="color: Green"></i>Profiling & University/College
                        Selection</p>
                    <p>
                        <i class="fa fa-check fa-fw" style="color: Green"></i>Application Assistance & Counseling</p>
                </div>
         </div>
    </div>
                      <div id="menuQuery" class="tab-pane fade">
                           <div class="panel panel-primary">
                             <div class="panel-body ">
                                        
                                <div class="row text-center">
                                 <h3 class="text-center">
                                    <strong><label runat="server" id="formHead">Send Your Query</label></strong></h3>
                                </div>
                                <div class="row margin-top-10">
                                    <div class=" form-group">
                                       <label class="control-label col-sm-1" for="txtName" runat="server">
                                        Name:</label> 
                                    <div class="col-sm-6 form-group">
                                    <asp:TextBox runat="server" CssClass="form-control " ID="txtName" placeholder="Name"
                                            type="text"/>  
                                     </div>                                     
                                    </div>
                                </div>
                                <div class="row">
                                 <div class="form-group">
                                       <label class="control-label  col-sm-1 " for="txtEmail" runat="server">
                                        Email:</label>
                                     <div class="col-sm-6 form-group">
                                         <asp:TextBox runat="server" CssClass="form-control  " ID="txtEmail" placeholder="Email"
                                             type="email" />
                                     </div>
                                </div>
                                 </div>
                                <div class="row">
                                     <div class="form-group">
                                    <label class="control-label col-sm-1" for="txtMobNo" runat="server">
                                        Mobile:</label>
                                    <div class="col-sm-6 form-group">
                                        <asp:TextBox runat="server" CssClass="form-control " ID="txtMobNo" placeholder="Mobile"
                                             type="text" MaxLength="10" />                                            
                                    </div>
                                    </div>
                               </div>
                                <div class="row">
                                <div class="form-group">
                                    <label class="control-label col-sm-1" for="ddlCity1" runat="server">
                                        City:</label>
                                    <div class="col-sm-6 form-group">
                                        <div class="dropdown">
                                            <asp:DropDownList runat="server" ID="ddlCity1" CssClass="btn-sm  btn-lg dropdown-toggle"
                                                EnableTheming="true">
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>
                                    </div>
                                <div class="row">
                                     <div class="form-group">
                                    <label class="control-label col-sm-1" for="ddlQual" runat="server">
                                        Qualification:</label>
                                    <div class=" col-sm-6 form-group">
                                        <div class="dropdown">
                                            <asp:DropDownList runat="server" ID="ddlQual" CssClass="btn-sm btn-lg dropdown-toggle  "
                                                EnableTheming="true">                                                
                                            </asp:DropDownList>
                                         
                                        </div>
                                    </div>
                                    </div> 
                                    </div>                                   
                                <div class="row">
                                       <div class="form-group">
                                    <label class="control-label col-sm-1" for="ddlCareerField" runat="server">
                                        Career:</label>
                                    <div class="col-sm-6 form-group">
                                        <div class="dropdown">
                                            <asp:DropDownList runat="server" ID="ddlCareerField" CssClass="btn-sm btn-lg dropdown-toggle  "
                                                EnableTheming="true">                                                
                                            </asp:DropDownList>                                            
                                        </div>
                                    </div>
                                </div>
                                     </div>
                                 <div class="row">
                                     <div class="form-group">
                                         <label class="control-label col-sm-1" for="ddlCareerField" runat="server">
                                             Comments:</label>
                                         <div class="col-sm-6  form-group">
                                             <asp:TextBox runat="server" CssClass="form-control " TextMode="MultiLine"
                                                 ID="txtQuery" Style="resize: none;" name="comments" placeholder="your comments..."
                                                 Rows="4" cols="4" MaxLength="500" /><br />

                                         </div>
                                     </div>
                                     <div class="row text-center">
                                         <label class="placeholder" id="submitInfo" runat="server" visible="false" />
                                     </div>
                                 </div>
                                 <div class="row">
                                    <div class="col-md-6 col-sm-6 col-xs-6 text-center">
                                        <button id="btnReset" type="reset" class="btn btn-danger" value="Reset" runat="server">
                                            Reset</button>
                                   </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6 text-center">
                                        <asp:Button CssClass="btn btn-success" ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click1" OnClientClick="checkBlank()" />
                                    </div>
                                </div>
                                                            
                               
                           </div>
                           </div>
                           </div>  
                      <div id="menu2" class="tab-pane fade">
        <div class="panel panel-primary">
            <div class="panel-body">
            <p>
                This is an ongoing scheme to promote qualitative education amongst SC/ST/OBC students,
                by providing full financial support for pursuing studies beyond 12th class.</p>
            <p>
                In the present days of technological development, technical education plays a significant
                role and in the coming years, not only the scope of employment for technical personnel
                will be better but at the same time.<%--</p><p> --%>It will help the students to
                become self employed. Therefore, emphasis is being laid on promoting technical education.
            </p>
            <p>
                Many students can't avail this facility due to lack of knowledge.We are here to
                help them.Are you one of them??</p>
            <h3>
                Eligibility:</h3>
            <p>
                <i class="fa fa-check fa-fw" style="color: Green"></i>Students must have more than
                50% in PCM.
            </p>
            <p>
                <i class="fa fa-check fa-fw" style="color: Green"></i>Student have to take admission
                thorugh us to avail this facility.</p>
            <p>
                <i class="fa fa-check fa-fw" style="color: Green"></i>Not any charge from the students
                ie Everything is Absolutely free!!</p>
            <p>
                <i class="fa fa-check fa-fw" style="color: Green"></i>Student have to provide Income
                certificate along with Caste Certificate during admission or after.</p>
            <p>
                <i class="fa fa-check fa-fw" style="color: Green"></i>Scholarship either under the
                State Plan Scheme or Centrally Sponsored Scholarship Scheme</p>
            <h3>
                Scholarship will be awarded for :-</h3>
            <p>
                <i class="fa fa-check fa-fw" style="color: Green"></i>Full tuition fee per year
                will be awarded</p>
            <p>
                <i class="fa fa-check fa-fw" style="color: Green"></i>Scholarship Amount will be
                awarded to student in their own account.</p>
            <p>
                <i class="fa fa-check fa-fw" style="color: Green"></i>It will continue till the
                completion of the course, subject to the satisfactory performance.
            </p>
        </div> 
        </div>
    </div>
                      <div id="menu0" class="tab-pane fade in active">
        <div class="panel panel-primary">
            <div class="panel-body ">
           
                <div id="search-College">                   
                    <div class="row">
                            <div class="form-group col-md-4 col-sm-4">
                         <label>Courses </label>
                                <div class="dropdown">
                            <asp:DropDownList runat="server" ID="ddlCourse" CssClass="btn btn-lg btn-info-outline dropdown-toggle"
                                                EnableTheming="true" TabIndex="1">                                                
                            </asp:DropDownList> 
                        </div>
                        </div>
                            <div class="form-group col-md-4 col-sm-4">
                         <label>Location </label>
                                <div class="dropdown">
                            <asp:DropDownList runat="server" ID="ddlCity" CssClass="btn btn-lg btn-info-outline dropdown-toggle"
                                                EnableTheming="true" TabIndex="2">                                                
                            </asp:DropDownList> 
                        </div>
                        </div>
                  
                    <div class="form-group col-md-1">
                        <br/>
                        <asp:Button CssClass="btn btn-lg btn-danger-outline" ID="btnSearchJob" runat="server" Text="Search" onclick="btnSearchClg_Click"/>
                    </div>
                           <%-- </div>--%>
                        </div>
                </div>
                <hr />
                <div class="container">
    <h3>List Of Colleges:</h3>
   <div class="col-md-10"> 
   <asp:GridView ID="gvListClg" runat="server" AutoGenerateColumns="False" CellPadding="4" CellSpacing="4" 
       ForeColor="#333333" GridLines="None" AllowPaging="true" Width="100%" OnPageIndexChanging="OnPaging" PageSize="10" CssClass="table table-striped table-bordered table-hover" EmptyDataText="There are no data records to display." >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Colleges" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="Colleges">                           
                <ItemTemplate>
                    <asp:Label ID="lblClg" runat="server" Text='<%# Bind("ClgName") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="State" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="State"  > 
               <ItemTemplate>
                    <asp:Label ID="lblState" runat="server"  Text='<%# Bind("State") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Course Name" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Center" SortExpression="CourseName"  >   
                <ItemTemplate>
                    <asp:Label ID="lblCourseName" runat="server" Text='<%# Bind("CourseName") %>'></asp:Label>
                </ItemTemplate>
                </asp:TemplateField>                                                                 
        </Columns>                
        <FooterStyle BackColor="#ffffff" Font-Bold="True" ForeColor="White" />
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
   </div>
 </div>
    </div>
                      <div id="menu3" class="tab-pane fade ">
                      <div class="panel panel-primary">
            <div class="panel-body">
                <h3 class="text-capitalize text-primary text-left">
                    College Admission</h3>
               
                    <p>
                        The transition from PUC / 12th Std. to college is filled with challenge, opportunity
                        and decisions. Every year, thousands of students apply for admission to colleges/universities.
                        Admission mechanisms vary from College to College, and there are government bodies
                        or independent associations that offer standardized entrance exams to aid the college
                        admission process.
                    </p>
                    <p>
                        The college admission process varies from one college to the other. Most of the
                        colleges use pre-qualifying test scores to determine what course/college you are
                        interested in while some colleges conduct their own admission tests or participate
                        in one or the other centralized college admission process. National and State Level
                        Tests, and Interviews are organized by statutory bodies composed of participating
                        colleges to determine the merit of all applicants. Applicants are ranked based on
                        the pre-qualifying marks/scores in the entrance exams/academic years by the governing
                        bodies. After learning their ranks, candidates can then apply to a number of colleges
                        directly or participate in the centralized selection process conducted by the respective
                        examination authorities.
                    </p>
                    <p>
                        Of the total seats reserved for college admissions, 75-80% seats are reserved for
                        merit students, 5-10% seats are reserved for management quota and 15% seats are
                        reserved for NRI / Foreign students. The college admission process is different
                        for students seeking admission through merit and for students seeking direct admission
                        under management/NRI quota.</p>
               
                <h3 class="text-capitalize text-primary text-left">
                    College Admission through Merit</h3>
                <p>
                    The College Admission through Merit shall be based on the rank/score/marks obtained
                    by the eligible candidate in the previous academic years/pre-qualifying entrance
                    exam. The admission at a particular college shall be carried out through a selection
                    procedure organized by the college for respective course, in which the candidate
                    has to be physically present/attend the counselling process online, as required,
                    on the scheduled date along with necessary documents.</p>
                <p>
                    Candidates seeking college admission through merit should ensure that they fulfill
                    all the eligibility criteria required to attend the admission process. On the basis
                    of their performance in previous academic years, pre-qualifying entrance exam and
                    the seat availability, candidates shall be allotted a confirmed seat at their preferred
                    college for respective course.
                </p>
                <p>
                    Candidates seeking college admission through merit should satisfy the following
                    eligibility criteria for admission: Should have completed a minimum of 15-16 years
                    of education in India. Should have obtained required score/percentage in previous
                    academic year/pre-qualifying entrance exam.</p>
                <h3 class="text-capitalize text-primary text-left">
                    College Admission under Management Quota</h3>
                <p>
                    Candidates who have scored low in any of the pre-qualifying entrance exams/previous
                    academic years can get college admission under management quota, which may cost
                    higher in tuition fee than the admission through merit. The colleges have separate
                    reservation for direct admission of candidates under management quota. The admission
                    of such candidates is based on satisfying certain terms and conditions of pre-qualifying
                    exams applicable to that particular college. The management has the power to select
                    students of their own choice, for direct admission under management quota, from
                    out of those who are qualified in the exam conducted by a particular mechanism.</p>
                <p>
                    Candidates seeking direct admission to college under management quota should satisfy
                    the following eligibility criteria for admission:</p>
                <p>
                    Should have completed a minimum 16 years of education in India.</p>
                <p>
                    Should have obtained required score/percentage in previous academic year/pre-qualifying
                    entrance exam.
                </p>
                <p>
                    Should be financially sound to pay the capitation fee.</p>
                <h3 class="text-capitalize text-primary text-left">
                    College Admission under NRI Quota</h3>
                <p>
                    The college admission under NRI quota shall be based on the marks secured in the
                    pre-qualifying exam. Foreign nationals are also considered for admission under NRI
                    quota. Candidates should submit a separate application at the desired college for
                    NRI admission in the prescribed format.
                </p>
                <p>
                    Candidates seeking college admission through NRI quota should satisfy the following
                    eligibility criteria admission:</p>
                <p>
                    Candidate who has completed his/her 16 years of education abroad and obtained requisite
                    marks.</p>
                <p>
                    Candidate whose parents, either father or mother is an NRI.</p>
                <p>
                    Candidate whose guardian/sponsor is an NRI. Should be financially strong to pay
                    the capitation fee.</p>
                <p>
                    It's not mandatory for a candidate to be an NRI to get admission under NRI Quota.
                    Any Indian candidate can get admission under NRI quota, which may cost higher in
                    tuition fee than the admission through merit/management quota. As per the directive
                    of the Honorable Supreme Court of India, the seat availability for candidates seeking
                    admission under NRI quota should not exceed more than 15% of total seats.</p>                
            </div>
        </div>
                      </div>
                
            </div>
   </div>
          </form>          
</asp:Content>
