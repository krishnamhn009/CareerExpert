<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="AdmissionsConsultant.aspx.cs" Inherits="WebApplication1.Admission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <ul class="nav nav-tabs margin-top-70 page-header text-center text-capitalize">
            <li class="active"><a data-toggle="tab" href="#menu0"><i class="fa fa-university fa-2x" style="color: #004466;
                margin-right: .1em;"></i>Find A College</a></li>
            <li><a data-toggle="tab" href="#menu1"><i class="fa fa-bolt fa-2x"
                style="color: #004466; margin-right: .1em;"></i>Admission Counselling </a></li>
            <li><a data-toggle="tab" href="#menu2"><i class="fa fa-balance-scale fa-2x" style="color: #004466;
                margin-right: .1em;"></i>Scholarship for Technical Education</a></li>
            
            <li><a data-toggle="tab" href="#menu3"><i class="fa fa-fort-awesome fa-2x" style="color: #004466;
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
        </div> </div>
    </div>
    <div id="menu0" class="tab-pane fade in active">
        <div class="panel panel-primary">
            <div class="panel-body ">
                <form runat="server">
                <div class="row text-center page-header">
                    <div class="col-md-offset-3 col-sm-offset-2 col-md-2 col-sm-3 form-group">
                        <div class="dropdown">
                            <asp:DropDownList runat="server" ID="ddlCourse" CssClass="btn-lg dropdown-toggle"
                                                EnableTheming="true">                                                
                                            </asp:DropDownList> 
                        </div>
                    </div>
                    <div class="form-group col-md-4 col-sm-4">
                        <div class="dropdown">
                            <asp:DropDownList runat="server" ID="ddlCity" CssClass="btn-lg dropdown-toggle"
                                                EnableTheming="true">                                                
                                            </asp:DropDownList> 
                        </div>
                    </div>
                    <div class="form-group col-md-1">
                        <asp:Button CssClass="btn btn-lg btn-success" ID="btnSearchJob" runat="server" Text="Search" onclick="btnSearchClg_Click"/>
                    </div>
                </div>
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
                </form>
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
    <%-- <div id="menu2" class="tab-pane fade">
        <div>  
                <div class="panel-group" id="accordion">
                    <div class="panel panel-primary">
                        <div class="panel-heading" style="background: #000000;">
                            <h4 class="page-header panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse1" class="text-primary">Engineering
                                    </a>
                            </h4>
                        </div>
                        <div id="collapse1" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <p>
                                    Engineering Course is one of the most sought after courses in the present education
                                    world as Engineers are known for working in almost all corporate sectors.
                                </p>
                                <p>
                                    Engineering course is all about the application of arithmetic and science to solve
                                    problems. It involves taking our scientific understanding of the natural world and
                                    using it to discover, plan, design and build things to solve problems and attain
                                    practical goals. It's one of the most excellent choices for students with science
                                    background, in terms of scope as well as bright career. There are many engineering
                                    entrance exams through which aspirants can pursue BE / B Tech / M.E. / M Tech course
                                    in top engineering colleges.</p>
                                <p>
                                    Many students can't avail this facility due to lack of knowledge.We are here to
                                    help them.Are you one of them??</p>
                                <p>
                                    <h3 class="text-primary">
                                        Top Streams in Engineering</h3>
                                </p>
                                <%--<div class="panel-group" id="acordianBranch">
                                    <h4><a data-toggle="collapse" data-parent="#acordianBranch" href="#collapse01" class="text-primary">
                                        Computer Science Engineering: </a></h4>
                                    <div id="collapse01" class="panel-collapse collapse">
                                       <p> Computer Science Engineering is one of the most popular streams of engineering which
                                        deals with design, execution, and management of information system of both software
                                        & hardware processes. Computer Science Engineering graduates are involved in many
                                        aspects of computing, from the design of personal computers to supercomputers. From
                                        writing software to designing operating systems, Computer Science Engineers have
                                        vast career options.</p>
                                    </div>

                                    <h4><a data-toggle="collapse" data-parent="#acordianBranch" href="#collapse02" class="text-primary">
                                        Electrical Engineering: </a></h4>
                                    <div id="collapse02" class="panel-collapse collapse">
                                        <p>Electrical Engineering (sometimes referred to as electrical and electronics engineering)
                                        is an engineering discipline that deals with the study and/or application of electricity,
                                        electronics and electromagnetism. Electrical Engineering graduates have a wealth
                                        of favorable job opportunities. They can find jobs in engineering consulting firms,
                                        government agencies, may work as manufacturers of electrical, electronic, computer
                                        and office equipment, manufacturers of professional and scientific instruments,
                                        manufacturers of industrial machinery, etc.</p>
                                    </div>
                                     <h4><a data-toggle="collapse" data-parent="#acordianBranch" href="#collapse04" class="text-primary">
                                        Electronics and Communication Engineering:  </a></h4>
                                    <div id="collapse04" class="panel-collapse collapse">
                                    <p>  Electronics and Communication Engineering is a professional engineering discipline
                                        which employs the scientific knowledge of the behavior and effects of electrons
                                        to develop devices, systems, components or equipments that uses electricity as part
                                        of its driving force. Electronics and Communication Engineering graduates may find
                                        career options in designing VLSI chips, analog sensors, mixed signal circuit boards,
                                        improving the functionality and reliability of mobile devices and other electronic
                                        gadgets, etc.</p>
                                    </div>
                                    <h4><a data-toggle="collapse" data-parent="#acordianBranch" href="#collapse05" class="text-primary">
                                        Mechanical Engineering:</a></h4><div id="collapse05" class="panel-collapse collapse">
                                     <p>Mechanical engineering is an engineering discipline that
                                    involves the application of principles of physics for analysis, design, manufacturing,
                                    and maintenance of mechanical systems. Job opportunities for Mechanical Engineering
                                    graduates are available in design, research and development, consulting firms, procurement,
                                    quality assurance and maintenance in manufacturing units, educational institutions,
                                    government agencies, etc.</p></div>
                                    <h4><a data-toggle="collapse" data-parent="#acordianBranch" href="#collapse06" class="text-primary">
                                         Information Technology:</a></h4> <div id="collapse06" class="panel-collapse collapse"><p>Information technology (IT) is
                                    the study, design, development, implementation, support or management of computer-based
                                    information systems, particularly software applications. Information Technology
                                    is a broad field that encompasses many careers options which include computer programming,
                                    technical support, systems analysis, etc.</p></div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel  panel-primary">
                        <div class="panel-heading" style="background: #000000;">
                            <h4 class="page-header panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Career Guidance
                                </a>
                            </h4>
                        </div>
                        <div id="collapse2" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>
                                    We are bringing together dedicated students,professionals with a select group of
                                    career experts. Choosing a right career option is the most vital decision in everyone's
                                    life.We breeds positive thinking, increased confidence, and better results.</p>
                                <p>
                                    <h3>
                                        Still confused about your career????</h3>
                                </p>
                                <p>
                                    <i class="fa fa-check fa-fw" style="color: Green"></i>Don't waste your time,Feel
                                    free to contact us..</p>
                            </div>
                        </div>
                    </div>
                    <div class="panel  panel-primary">
                        <div class="panel-heading" style="background: #000000;">
                            <h4 class="page-header panel-title">
                                <a data-toggle="collapse" data-parent="#accordion" href="#collapse3">Job Assistance
                                </a>
                            </h4>
                        </div>
                        <div id="collapse3" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p>
                                    All Internal job openings under same platform.We refer condidates profiles in top
                                    MNCs and another organization.</p>
                                <p>
                                    <h3>
                                        How it works?</h3>
                                </p>
                                <p>
                                    <i class="fa fa-check fa-fw" style="color: Green"></i>Register with us.</p>
                                <p>
                                    <i class="fa fa-check fa-fw" style="color: Green"></i>we will refer your profile
                                    on behalf of you.
                                </p>
                                <p>
                                    <i class="fa fa-check fa-fw" style="color: Green"></i>profile selected,attend interview
                                    process.
                                </p>
                                <p>
                                    <i class="fa fa-check fa-fw" style="color: Green"></i>Get your dream job!!!
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
     </div>
    </div>
    </div>--%>
    </div>
    <div class="text-center">
        <form id="formSign" method="post" action="register-with-us" novalidate="novalidate">
        <button type="submit" class="btn btn-lg btn-success" name="userType" value="student">
            REGISTER HERE</button>
        to schedule a FREE session with one of our expert admission counselor.
        </form>
    </div>
    </div>
</asp:Content>
