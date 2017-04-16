﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="OnlineJobs.aspx.cs" Inherits="WebApplication1.OnlineJobs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">  

  <div class="container links-container fixed-parent">
      <nav id="sub-links" class="clearfix fixed">
<div class="inner">
<ul class="clearfix">
<li class="home"><a href="get-jobs" class="external"><i class="fa  fa-2x fa-home"></i></a></li>
<li><a href="https://www.techgig.com/jobs/Walkin" class="external">Latest Walkins</a></li>
<li><a href="https://www.techgig.com/jobs/Fresher" class="external">Fresher Jobs</a></li>
<li><a href="https://www.techgig.com/jobs/top-company-jobs" class="external">Top Company Jobs</a></li>
<li class="post-job"><a href="post-job" class="external">Hiring? Post a Job</a></li>
<!-- <li><a href="#recommendations">Recommendations</a></li> -->
</ul>
</div>
<%--<a href="javasript:void(0);" class="btn button2 more-menu-btn" id="more-sub-links" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-bars"></i>More</a>
<ul aria-labelledby="more-sub-links" class="dropdown-menu"></ul>--%>
</nav>

  </div>
     <form id="SerchJob" runat="server">
        <section id="home">
                   
            <div class="home-container text-center" style="position:static;">
                <div class="home-title">
                    <%--<form id="SerchJob" runat="server">--%>
                   <%-- <div class="row text-center">
                    <h1>
                       <strong> Earn Job referrals from Company Insiders and Get Hired</strong></h1>
                        Increase Chances of Getting Hired by 20x Times....
                       </div>--%>
               <%--     <div class="row text-center margin-top-30">
                        <div class="col-md-offset-3 col-sm-offset-2 col-md-2 col-sm-3 form-group">
                            <div class="dropdown">
                                <asp:DropDownList runat="server" ID="ddlLocation" CssClass="btn btn-sm dropdown-toggle placeholder dropdown-tranparent"
                                    EnableTheming="true">
                                    <asp:ListItem Text="Select City" Value="0"/>
                                    <asp:ListItem Text="Bangalore" Value="1" />
                                    <asp:ListItem Text="Mumbai" Value="2" />        
                                    <asp:ListItem Text="Pune" Value="3" />
                                    <asp:ListItem Text="Delhi" Value="4" />
                                    <asp:ListItem Text="Kolkata" Value="5" />
                                    <asp:ListItem Text="Chennai" Value="6" />
                                    <asp:ListItem Text="Gurgaon" Value="7" />
                                    <asp:ListItem Text="Ahmedabad" Value="8" />                                    
                                    <asp:ListItem Text="Coimbatore" Value="9" />
                                    <asp:ListItem Text="Kochi" Value="10" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="form-group col-md-4 col-sm-4">
                            <asp:TextBox runat="server" CssClass="form-control placeholder" ID="txtJobKeyword" placeholder="Job title ,keyword or company name.."
                                BackColor="Transparent" type="text" />
                        </div>
                        <div class="form-group col-md-1">
                            <asp:Button CssClass="btn btn-success" ID="btnSearchJob" runat="server" 
                                Text="Search" onclick="btnSearchJob_Click" />
                        </div>
                    </div>   --%>

                       <div class="row margin-top-15">          
            <div class="col-sm-3">
                <a type="button" class="btn-lg"><i class="fa fa-user-plus fa-4x colortheme"></i></a>
                <h4>
                    Be A Member</h4>
            </div>       
            <div class="col-sm-3">
                <a type="button" class="btn-lg" ><i class="fa fa-clipboard fa-4x colortheme">
                    
                </i></a>
                <h4>
                    Fill Your Profile</h4>
            </div>
            <div class="col-sm-3">
                <a type="button" class="btn-lg"><i class="fa fa-list-ul fa-4x colortheme"></i></a>
                <h4>
                    Select A Job and Request Referral</h4>                
            </div>
            <div class="col-sm-3">
                <i class="fa fa-signal fa-4x colortheme"></i>
                <h4 class="navbar-text">
                  Increase Chances of Getting Hired by 20x Times!!!</h4>               
            </div>
        </div>


                    <%--</form>--%>
                </div>                 
                </div>             
        </section> 
        
          <%--========================================================--%>
<%--<div id="HowItWorks" class="container-fluid text-center" >
        <h2>
            <small>How It Works</small></h2>
        <p>
        </p>
     <%--   <div class="row margin-top-15">          
            <div class="col-sm-3">
                <a type="button" class="btn-lg"><i class="fa fa-user-plus fa-3x colortheme"></i></a>
                <h4>
                    Be A Member</h4>
            </div>       
            <div class="col-sm-3">
                <a type="button" class="btn-lg" ><i class="fa fa-clipboard fa-3x colortheme">
                    
                </i></a>
                <h4>
                    Fill Your Profile</h4>
            </div>
            <div class="col-sm-3">
                <a type="button" class="btn-lg"><i class="fa fa-list-ul fa-3x colortheme"></i></a>
                <h4>
                    Select A Job and Request Referral</h4>                
            </div>
            <div class="col-sm-3">
                <i class="fa fa-signal fa-3x colortheme"></i>
                <h4 class="navbar-text">
                  Increase Chances of Getting Hired by 20x Times!!!</h4>               
            </div>
        </div>
    </div>--%>

            <%--============================================================--%> 
         <div class="container margin-top-15">
          <div id="search-College">  
              <div class="search-form">
              <div class="row">  
                 <div class=" col-sm-3 col-xs-12">
                   <div class="form-group">
                        <label>Skills & Title </label>
                            <asp:TextBox runat="server" CssClass="form-control col-md-3 col-sm-3" ID="txtJobKeyword" placeholder="Job title ,keyword or company name.."
                                 type="text" />
                        </div> 
                     </div> 
                  <div class="col-sm-2  col-xs-6">  
                   <div class="form-group">
                            <label>Location </label>
                            <div class="dropdown">
                                <asp:DropDownList runat="server" ID="ddlLocation" CssClass="btn btn-lg btn-info-outline dropdown-toggle"
                                    EnableTheming="true" TabIndex="1">
                                    <asp:ListItem Text="Select City" Value="0"/>
                                    <asp:ListItem Text="Bangalore" Value="1" />
                                    <asp:ListItem Text="Mumbai" Value="2" />        
                                    <asp:ListItem Text="Pune" Value="3" />
                                    <asp:ListItem Text="Delhi" Value="4" />
                                    <asp:ListItem Text="Kolkata" Value="5" />
                                    <asp:ListItem Text="Chennai" Value="6" />
                                    <asp:ListItem Text="Gurgaon" Value="7" />
                                    <asp:ListItem Text="Ahmedabad" Value="8" />                                    
                                    <asp:ListItem Text="Coimbatore" Value="9" />
                                    <asp:ListItem Text="Kochi" Value="10" />
                                </asp:DropDownList>
                            </div>
                                                    
                        </div>
                      </div>
                  <div class="col-sm-1  margin-top-20 col-xs-6">  
                   <div class="form-group"> 
                     <asp:Button CssClass="btn btn-lg btn-danger-outline" ID="btnSearchJob" runat="server" 
                                Text="Search" onclick="btnSearchJob_Click" /> 
                       </div>
                      </div>                     
                   <div class="col-sm-4 col-sm-offset-2 col-xs-12">
                        <div class="hire">
                        <h6>Are you Hiring?</h6>
                        <a href="get-jobs" class="btn btn-lg btn-warning-outline ">Post a Job</a>
                        </div>
                        <a href="https://www.techgig.com/upload_resume.php" class="btn btn-default btn-lg upload-resume margin-top-30"><i class="fa fa-upload"></i> Upload Resume</a>
                        </div>
                    </div>   
                  </div>
                 </div>
              </div> 

<div class="container-fluid">
    <div class="row text-center">
    
    <div id="jobStatus" class="alert alert-success" runat="server" visible="false">
        <button type="button" class="close" data-dismiss="alert">
            ×</button>
        <strong>Job Applied Successfully!! Prepare for Interview...</strong>
    </div>
    <div id="userPlanStatus" class="alert alert-warning" runat="server" visible="false">
        <button type="button" class="close" data-dismiss="alert">
            ×</button>
        <strong><asp:Label ID="lblUserPlan" runat="server"></asp:Label></strong>
    </div>
    </div>  
    <!--test-->
    <asp:ScriptManager ID="MainScriptManager" runat="server" />
        <asp:UpdatePanel ID="pnlHelloWorld" runat="server">
            <ContentTemplate>
    <div class="container" >
         <div class="row" style="background:#f4f4f4;">
           <h3>Latest Jobs</h3>
             </div>
        <div class="row">                      
                    <div class="col-md-8 col-md-offset-2">  
                <asp:Repeater ID="rptResult" runat="server">                    
                    <ItemTemplate>
                       
                        <div class="panel  panel-default">
                            <div class="panel-body panel-heading-career">
                                <p class="panel-title">
                                    <a class="text-white" data-toggle="collapse" data-parent="#accordion" href="#<%# DataBinder.Eval(Container.DataItem, "JobId")%>">
                                     
                                        <%# DataBinder.Eval(Container.DataItem, "JobTitle")%></a>
                                    <div class="text-left"> 
                                  <i class="fa fa-user-secret" aria-hidden="true"></i> <%# DataBinder.Eval(Container.DataItem, "JobExperience")%>
                                    yrs.
                                     | <i class="fa fa-calendar" aria-hidden="true"></i> <%# DataBinder.Eval(Container.DataItem, "PostedDate","{0:d/MMM/yyyy}")%>
                                        </div>
                                    <div class="text-left">                                        
                                        <i class="fa fa-building-o" aria-hidden="true"></i> <%# DataBinder.Eval(Container.DataItem, "Company")%> |
                                      <i class="fa fa-map-marker" aria-hidden="true"></i> <%# DataBinder.Eval(Container.DataItem, "Location")%>
                                        </div>
                                </p>
                            </div>
                            <div id="<%# DataBinder.Eval(Container.DataItem, "JobId")%>" class="panel-collapse collapse in">
                            <div class="panel-body">
                                <p class="text-black">
                                    <%# DataBinder.Eval(Container.DataItem, "JobDesc") %>                                  
                                    </p>
                                 <hr/>                               
                                <h4 class="text-right"><a class="btn btn-lg btn-danger-outline" href="get-jobs?job=<%# DataBinder.Eval(Container.DataItem, "JobId")%>"
                                    id="btnApply" type="submit"
                                    >Request Refer</a></h4>
                            </div>
                            </div>
                           
                        </div> 
                            
                    </ItemTemplate>              
                </asp:Repeater>  
                      
                <nav>
                 <ul class="pager">
                     <li class="page-item">
                         <asp:LinkButton ID="lbFirst" runat="server" CssClass="page-link" aria-label="First"
                             OnClick="lbFirst_Click">First</asp:LinkButton></li>
                     <li class="page-item">
                         <asp:LinkButton ID="lbPrevious" runat="server" CssClass="page-link" aria-label="Previous"
                             OnClick="lbPrevious_Click"><span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></asp:LinkButton>

                     </li>
                       <li class="page-item">
                         <asp:LinkButton ID="lbNext" runat="server" CssClass="page-link" aria-label="Next"
                             OnClick="lbNext_Click"><span aria-hidden="true">&raquo;</span> <span class="sr-only">Next</span></asp:LinkButton>
                       </li>
                      <li class="page-item">
                         <asp:LinkButton ID="lbLast" runat="server" CssClass="page-link" aria-label="Last"
                             OnClick="lbLast_Click">Last</asp:LinkButton>
                     </li>
                      <li class="page-item">
                         <asp:Label ID="lblpage" runat="server" CssClass="page-link" Text=""></asp:Label>
                     </li>
                      <li class="page-item">
                     <asp:DataList ID="rptPaging" runat="server"
                         OnItemCommand="rptPaging_ItemCommand"
                         OnItemDataBound="rptPaging_ItemDataBound"
                         RepeatDirection="Horizontal" Visible="false">
                          
                         <ItemTemplate>                           
                                 <asp:LinkButton ID="lbPaging" runat="server" BackColor="White" CssClass="page-link"
                                     CommandArgument='<%# Eval("PageIndex") %>'
                                     CommandName="newPage"
                                     Text='<%# Eval("PageText") %> '>
                                 </asp:LinkButton>
                             
                         </ItemTemplate>
                            
                     </asp:DataList>
                        </li>
                   

                    
                    
                 </ul>
             </nav>          
                 </div>   
            </div>
        
         <asp:Repeater ID="Repeater2" runat="server" Visible="false">                    
                    <ItemTemplate>
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <p class="page-header panel-title">
                                    <a class="text-info" title="Click to see details" data-toggle="collapse" data-parent="#accordion" href="#<%# DataBinder.Eval(Container.DataItem, "JobId")%>">
                                     
                                        <%# DataBinder.Eval(Container.DataItem, "JobTitle")%></a>
                                    (
                                    <%# DataBinder.Eval(Container.DataItem, "JobExperience")%>
                                    Years)
                                    <div class="text-left">
                                        
                                        <%# DataBinder.Eval(Container.DataItem, "Company")%> |
                                        <%# DataBinder.Eval(Container.DataItem, "Location")%>
                                        </div>
                                </p>
                            </div>
                            <div id="<%# DataBinder.Eval(Container.DataItem, "JobId")%>" class="panel-collapse collapse">
                            <div class="panel-body">
                                <p class="page-header panel-title">
                                    <%# DataBinder.Eval(Container.DataItem, "JobDesc") %>                                  
                                    </p>
                            </div>
                            </div>
                        </div>
                    </ItemTemplate>              
                </asp:Repeater>
<%--=======================advertise service start===========--%>
           <%-- <SCRIPT charset="utf-8" type="text/javascript" src="http://ws-in.amazon-adsystem.com/widgets/q?rt=ss_mfw&ServiceVersion=20070822&MarketPlace=IN&ID=V20070822%2FIN%2Fcareerexpert-21%2F8001%2F4aa9d1ae-fb6b-41c0-9dee-f7c0505c3ff7"> </SCRIPT> <NOSCRIPT><A rel="nofollow" HREF="http://ws-in.amazon-adsystem.com/widgets/q?rt=ss_mfw&ServiceVersion=20070822&MarketPlace=IN&ID=V20070822%2FIN%2Fcareerexpert-21%2F8001%2F4aa9d1ae-fb6b-41c0-9dee-f7c0505c3ff7&Operation=NoScript">Amazon.in Widgets</A></NOSCRIPT>

             <SCRIPT charset="utf-8" type="text/javascript" src="http://ws-in.amazon-adsystem.com/widgets/q?rt=qf_sp_asin_mfw&ServiceVersion=20070822&MarketPlace=IN&ID=V20070822%2FIN%2Fcareerexpert-21%2F8001%2F8aac5530-d0e3-46a3-b422-3d55489d861b"> </SCRIPT> <NOSCRIPT><A rel="nofollow" HREF="http://ws-in.amazon-adsystem.com/widgets/q?rt=qf_sp_asin_mfw&ServiceVersion=20070822&MarketPlace=IN&ID=V20070822%2FIN%2Fcareerexpert-21%2F8001%2F8aac5530-d0e3-46a3-b422-3d55489d861b&Operation=NoScript">Amazon.in Widgets</A></NOSCRIPT>

               <div data-sdid="1033502174" data-identifier="SnapdealAffiliateAds" data-height="250" data-width="300"></div>
              <script async id="snap_zxcvbnhg" src="https://affiliate-ads.snapdeal.com/affiliate/js/snapdealAffiliate.js"></script>--%>



<%--=======================end=========================--%>

         </div>
    
            </ContentTemplate>
        </asp:UpdatePanel>

</div>
</form>
    
    
        
   <%------Princing Start-----%>
    <div class="container-fluid margin-top-20" id="Pricing" runat="server" style="background-color:#f2f2f2;">
        <div class="text-center">
            <h2>
                <small>Pricing</small></h2>
            <h3>
                Choose a payment plan that works for you</h3>
        </div>
        <div class="row text-center margin-top-20">             
        <asp:DataList ID="dlData" runat="server" CssClass="row text-center " RepeatDirection="Horizontal" RepeatLayout="Flow">
            <ItemTemplate>
            <div class="col-sm-4">
                <div class="panel panel-career panel-default text-center">
                    <div class="panel-heading ">
                        <h2 class="panel-title">
                            <%--<a href="#<%# DataBinder.Eval(Container.DataItem, "PlanId")%>">
                                <%# DataBinder.Eval(Container.DataItem, "PlanName")%></a>--%>
                            
                            <h2> <%# DataBinder.Eval(Container.DataItem, "PlanName")%> </h2>   
                         </h2>
                    </div>
                    <div class="panel-body" style="background-color: #323A45;color:#eee;font-size:20px;">

                    <h3>
                            <i class="fa fa-inr"></i>
                            <%# DataBinder.Eval(Container.DataItem, "PlanPrice")%></h3>
                        <h3>
                            
                                <%# DataBinder.Eval(Container.DataItem, "PlanDesc")%>
                            
                        </h3>
                      
                          <h3>  
                                <%# DataBinder.Eval(Container.DataItem, "PlanDuration")%></h3>
                    </div>
                    <div class="panel-footer panel-footer-career ">  <%--panel-footer-career--%>                                                                        
                        <a class="btn btn-lg" id="buyNow"
                            href="pricing-plan2?plan=<%# DataBinder.Eval(Container.DataItem, "PlanId")%>">
                            Buy Now</a>
                    </div>
                </div> 
                </div>
            </ItemTemplate>
          
         </asp:DataList>
         
      
        </div>
    </div>

     <%------------Pricing End--------%>
</asp:Content>
