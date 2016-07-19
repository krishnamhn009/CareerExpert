<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="ExpertCouncelling1.aspx.cs" Inherits="WebApplication1.ExpertCouncelling" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Content/custome.css" rel="stylesheet" type="text/css" />
   <%-- <link href="../Content/bootstrap.css" rel="stylesheet" type="text/css" />--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid">

    <div class="jumbotron row ">
<div class="col-md-12 text-center">
 <h3><strong>Uniting Experts on the same Platform </strong></h3>
 <p>
  Career Expert is a Platform, bringing together dedicated
     students,professionals with a select group of  career coaches. Choosing a right career option is the most
     vital decision in everyone's life.We breeds positive thinking, increased confidence,
     and better results.
 </p>
</div>
 
</div>
<div class ="row margin-top-10">

 <div class="col-md-4 text-center">
 
       <img src="../Image/expert_01.jpg" class="img-circle" alt="Expert" width="200" height="200"/>
        <p class="margin-top-10"><strong>Dinesh Anantwar</strong></p><br>
  </div>
  <div class="col-md-8 text-justify">
      <p class="margin-top-50">
          Dinesh Anantwar has 21+ years of global experience (USA, UK, Germany, Malaysia and
          India) at Senior positions in IT Industry in Software Development and Training with
          companies like Infosys, iGate Patni and CDAC. He was Head Education and Research
          at Infosys-Pune and Global Head for Training and Certifications at iGATE Patni.
          He was Member of Board of Studies at Symbiosis International University from 2004
          till 2012. He is double post-graduate from premier institutes i.e. M.S.(Software
          Systems) from BITS-Pilani and Post graduation in Management from IIM-Kozikode
          <a  data-toggle="collapse" data-target="#more">know more</a>
          <p id="more" class="collapse">
          He is Certified Project Management Professional (PMP) from PMI-USA, Certified SCRUM
          Master and Certified on Rational Unified Process by IBM. He has led and managed
          Software Development Projects in USA, Europe, South-East Asia and India. Conducted
          Trainings in USA, UK and India. Conducted trainings for TCS, Infosys, iGATE, Patni
          ,CDAC, Amdocs, Fund-Tech, Evalueserve, FIS Global, Tata Power, Credit Suisse, Vodaphone
          etc. He is passionate trainer and specializes in teaching trainers to teach effectively.
          He teaches various Technical, Project Management and Soft skill courses. He has
          trained thousands of professionals including Senior management, Team leaders, Designers,
          Programmers. Dinesh is Career Mentor for whole of Amdocs India (8000+ employees)
          and has Mentored 500+ employees including Directors and Managers with intensive
          one to one meetings.
       </p>          
      </p>
  </div>
  
</div>
    <div class=" row">
<div class="col-md-12">
    <h4 class="text-center">
        Are you a person who has been successful in business and life and would like to
        give back to help others to be successful? Have you been down a similar road, looking
        for work or a new career, and would like to share your journey and success by helping
        someone who has walked in similar shoes?</h4>
        <h3 class="text-center"> Become a Expert that assist our participants to
        achieve their goals.. </h3><h3 class="text-center"><a class="btn btn-success"  data-toggle="collapse" data-target="#joinExpert">join us</a></h3>
       
       <h4 id="joinExpert" class="collapse text-info text-center"> mail us your profile at <a href="mailto:query@careerexpert.co" style="color:Green;text-decoration:none;transition: color .5s;">query@careerexpert.co</a></h4>

     
      
</div>
</div>

</div>
</asp:Content>
