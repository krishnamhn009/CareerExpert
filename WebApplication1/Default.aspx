<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="WebApplication1.WebForm1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">       
    <script type="text/javascript">
       
        function checkBlank() {

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
            var city = document.getElementById("ContentPlaceHolder1_ddlCity");
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
<%--===================================================--%>
  <section id="home" class=" hero banner margin-top-30" runat="server" visible="false"> 
        <div class="home-container text-center">            
            <div class="home-title">
                <div class="row ">                                      
                    <div class="col-md-12">        
							<h2> We are growing consulting firm </h2>
							<div class="industry-list row margin-top-20">
								<div class="col-xs-12 col-sm-4 list-industry-item ">
									<a href="#" class="industry-link  education theme-yellow-bg"><i class="icon-education"></i>Education</a>
								</div>
								<div class="col-xs-12 col-sm-4 list-industry-item">
									<a href="#" class="industry-link bussiness theme-yellow-bg"><i class="icon-bussiness"></i>Business</a>
								</div>
								<div class="col-xs-12 col-sm-4 list-industry-item">
									<a href="#"><i class="icon-technology"></i>Technology</a>
								</div>							
								</div>
							</div>

                    <div class="panel panel-transparent">
                            <div class="panel-body">
                                	
                                <form id="myform" runat="server" visible="false">                            
                                <div class="row text-center">
                                 <h3 class="text-center">
                                    <strong><label runat="server" id="formHead">Send Your Query</label></strong></h3>
                                </div>
                                <div class="row margin-top-10">
                                    <div class="col-sm-6 form-group">
                                    <asp:TextBox runat="server" CssClass="form-control placeholder" ID="txtName" placeholder="Name"
                                            BackColor="Transparent" type="text" required/>
                                        <asp:RegularExpressionValidator ID="regName" runat="server" ControlToValidate="txtName"
                                            ValidationExpression="^[a-zA-Z'.\s]{1,30}" Text="Enter a valid name" ForeColor="Red"/>
                                    </div>
                                    <div class="col-sm-6 form-group">                                        
                                            <asp:TextBox runat="server" CssClass="form-control placeholder " ID="txtEmail" placeholder="Email"
                                            BackColor="Transparent" type="email" required />
                                              <asp:RegularExpressionValidator ID="rfvEmail2"
                                              runat="server" ErrorMessage="Please Enter Valid Email ID"
                                                  ValidationGroup="vgSubmit" ControlToValidate="txtEmail"
                                                  CssClass="requiredFieldValidateStyle"
                                                  ForeColor="Red"
                                                  ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                                  </asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 form-group">
                                        <asp:TextBox runat="server" CssClass="form-control placeholder" ID="txtMobNo" placeholder="Mobile"
                                            BackColor="Transparent" type="text" MaxLength="10" required />
                                            <asp:RegularExpressionValidator ID="rfvPhoneNo"
                                              runat="server" ErrorMessage="Please Enter Valid Phone No"
                                                  ControlToValidate="txtMobNo"
                                                  CssClass="requiredFieldValidateStyle"
                                                  ForeColor="Red"
                                                  ValidationExpression="\+?\d[\d -]{8,12}\d">
                                                  </asp:RegularExpressionValidator>
                                    </div>
                                    <div class="col-sm-6 col-xs-6 form-group ">
                                        <div class="dropdown">
                                            <asp:DropDownList runat="server" ID="ddlCity" CssClass="btn  btn-sm  btn-lg dropdown-toggle placeholder dropdown-tranparent"
                                                EnableTheming="true">
                                            </asp:DropDownList>
                                           
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 col-xs-6 form-group">
                                        <div class="dropdown">
                                            <asp:DropDownList runat="server" ID="ddlQual" CssClass="btn btn-sm btn-lg dropdown-toggle dropdown-tranparent placeholder"
                                                EnableTheming="true">                                                
                                            </asp:DropDownList>
                                         
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6 form-group">
                                        <div class="dropdown">
                                            <asp:DropDownList runat="server" ID="ddlCareerField" CssClass="btn btn-sm btn-lg dropdown-toggle dropdown-tranparent placeholder"
                                                EnableTheming="true">                                                
                                            </asp:DropDownList>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="well col-sm-12  form-group" style="background: transparent; border: 0px;">
                                        <asp:TextBox runat="server" CssClass="form-control placeholder" TextMode="MultiLine"
                                            ID="txtQuery" BackColor="Transparent" Style="resize: none;" name="comments" placeholder="your query"
                                            Rows="4" cols="4" maxlength="500" required /><br />
                                        <asp:RegularExpressionValidator ID="reqQuery" runat="server" ControlToValidate="txtQuery"
                                            ForeColor="Red" ValidationExpression="^[a-zA-Z0-9.,\s]{1,500}" Text="Enter a valid Query" />
                                    </div>
                                </div>   
                                 <div class="row text-center">
                                    <label class="placeholder" id="submitInfo" runat="server" visible="false" />
                                </div> 
                                <div class="row">
                                    <div class="col-md-6 col-sm-6 col-xs-6 text-center">
                                        <button id="btnReset" type="reset" class="btn btn-danger" value="Reset" runat="server">
                                            Reset</button>
                                   </div>
                                    <div class="col-md-6 col-sm-6 col-xs-6 text-center">
                                        <asp:Button CssClass="btn btn-success" ID="btnSubmit" runat="server" Text="Submit"
                                            OnClick="btnSubmit_Click" OnClientClick="checkBlank()" />
                                    </div>
                                </div>
                                                            
                                </form>
                            </div>
                        </div>                    
                </div>
            </div>
            </div>
            
 </section>

  
<div id="myCarousel" class="carousel slide margin-top-30" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <div class="mbr-section mbr-section-hero carousel-item dark center mbr-section-full active" data-bg-video-slide="false" style="background-image: url(Image/coworkers.jpg);">
                         <div class="mbr-table-cell">  
                              <div class="mbr-overlay" style="opacity: 0.3;"></div>                          
                            <div class="container-slide container">                        
                                <div class="row">
                                    <h2 class="mbr-section-title display-1">Earn Job Referrals From Company Insiders And Get Hired</h2>
                                        <p class="mbr-section-lead">Increase Chances of Getting Hired by 20x Times....</p>
                                        <div class="mbr-section-btn"> <a class="btn btn-lg btn-white btn-white-outline" href="get-jobs">LATEST JOBS</a></div>                                   
                                </div>
                         </div>
                        </div>
            </div>
      </div>
      <div class="item">
          <div class="mbr-section mbr-section-hero carousel-item dark center mbr-section-full active" data-bg-video-slide="false" style="background-image: url(Image/banner-img-2000x853-50.jpg);">
                    <div class="mbr-table-cell">
                       
                            <div class="container-slide container">                                
                                    <div class="col-md-10 col-md-offset-2 text-xs-center">
                                        <h2 class="mbr-section-title display-1"><span style="line-height: 1.1;">Hiring? Your next hire is here</span><br></h2>
                                       <p class="mbr-section-lead lead">Post your job + requirements. Get screened candidates immediately and hire today.</p>

                                        <div class="mbr-section-btn"> <a class="btn btn-lg btn-white btn-white-outline" href="https://mobirise.com">POST YOUR JOB</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
           </div>
      <div class="item">
          <div class="mbr-section mbr-section-hero carousel-item dark center mbr-section-full active" data-bg-video-slide="false" style="background-image: url(Image/post_job.jpg);">
        <div class="mbr-table-cell">
                            <div class="mbr-overlay" style="opacity: 0.5;"></div>
                            <div class="container-slide container">
                                
                                <div class="row">
                                        <h2 class="mbr-section-title display-1"><span style="line-height: 1.1;">Get Accepted to Your Top Choice College!</span><br></h2>
                                        <p class="mbr-section-lead lead">We've guided thousands of applicants &nbsp;to acceptances at 450+ top programs since 2009.</p>

                                        <div class="mbr-section-btn"> <a class="btn btn-lg btn-white btn-white-outline" href="find-colleges">FIND YOUR COLLEGE</a></div>
                                </div>
                            </div>
                        </div>
       </div>
     </div>
    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
    </div>
<%--===================================================--%>
    <div class="container-fluid">  
    <div class="row" >
    <div class="col-lg-12 text-center" style="visibility:visible;">
      <h2><small>Who <strong>We Are</strong></small></h2>
         <h3 class="bg-lead">
              It's our mission to connect people and provide them complete career
             guidance to achieve their life goals.</h3>
     </div>
    </div>
    <div class ="row margin-top-05 ">
    <div class="col-md-12 text-center">
   <%-- <p class="marquee anchor">scholership program for SC/ST students of BIHAR,Jharkhand and ODISHA  <a href="Scholership.aspx"> click here</a> for detalis</p>--%>
    </div>
    </div>   
        </div>
    <div class="container-fluid">  
        <div class="container">
    <div class="row margin-top-10">
          <div class="col-md-6 text-justify">
          <p>
            We offer guidelines and instructions to the aspirants for career growth with accurate,
              unbiased,comprehensive,objective and timely information on Educational Institutions,
              Careers Guidance,Referral Interview Information and how to access those opportunities and after all.             
         <%--</p>   
          <p> --%>     
              Our extensive team members engages aspirants in the most effective
              way, from live conversation to navigate the increasingly complex array
              of options towards career growth.
          </p>
          </div>
          <div class="col-md-6 text-justify">
              <p>
                  Our processes are designed to help individuals understand how a variety of personal
                  attributes—their interests values, preferences, motivations, aptitudes, and skills,
                  can impact their potential with personal and professional success and satisfaction.                 
             <%-- </p>
              <p>--%>
               Each individual's path is different. We have designed our multifaceted approach
                  to accommodate the full spectrum of opportunities.
              </p>

              <%--<div data-sdid="1033502174" data-identifier="SnapdealAffiliateAds" data-height="250" data-width="300"></div>
              <script async id="snap_zxcvbnhg" src="https://affiliate-ads.snapdeal.com/affiliate/js/snapdealAffiliate.js"></script>--%>
          </div>
          </div>
            </div>               
     </div>
    <div class="container-fluid" style="background: rgb(255, 250, 243);"> 
    <div id="services" class="container-fluid text-center margin-top-20" >
        <h2>
           <small>Services</small></h2>
       <h3>total career solutions</h3>
       <p></p>
        <div class="row">
            <div class="col-sm-4">
                <a type="button" class="btn-lg" href="/our-experts"><span class="glyphicon glyphicon-road logo-small colortheme">
                </span></a>
                <h4>
                    Career Guidance</h4>
                <p>
                    Experienced Career Experts</p>
            </div>
            <div class="col-sm-4">
                <a type="button" class="btn-lg" href="/admisssion-counselling"><span class="glyphicon glyphicon-education logo-small colortheme">
                </span></a>
                <h4>
                    Admission Counseling</h4>
                <p>
                    Accurate Guidelines and Instructions</p>
            </div>
            <div class="col-sm-4">
                <a type="button" class="btn-lg " href="/referral-jobs"><span class="glyphicon glyphicon-briefcase logo-small colortheme">
                </span></a>
                <h4>
                   Jobs</h4>
                <p>
                   Referral  Jobs</p>
            </div>
        </div>
    </div>
   </div>

      



</asp:Content>
