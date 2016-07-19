<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Assesment.aspx.cs" Inherits="WebApplication1.Assesment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
/* Black buttons with extra padding and without rounded borders */
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid margin-top-30">
    <div class="well row">
        <div class="col-md-6">
            <div class="panel  panel-default">
                <div class="panel-heading text-center">
                    <h4 class="panel-header ">
                        <strong>Features</strong></h4>
                    <small>The complete package for your exam preparation</small>
                </div>
                <div class="panel-body">  
                <p class="page-header">
                    <i class="fa fa-check-square-o" style="color: Green;">
                    </i>Practice exactly the right questions to improve faster.                   
                </p>   
                    <p class="page-header">
                        <i class="fa fa-check-square-o" style="color: Green;"></i>Sharpen your concepts with
                        over 1.5 Lakh questions with detailed solutions and hints.
                    </p>
                    <p class="page-header">
                        <i class="fa fa-check-square-o" style="color: Green;"></i>Experience real exam like
                        environment and know where you stand at an all India level.
                    </p>
                    <p class="page-header">
                        <i class="fa fa-check-square-o" style="color: Green;"></i>Progress on goals to measure
                        your progress on a chapter.
                    </p>
                </div>
              
            </div>
        </div>

        <div class="col-md-6">
            <div class="panel  panel-primary">
                <div class="panel-heading text-center">
                    <h4 class="panel-header ">
                        <strong>Why Us</strong></h4>
                    <small>Improve your efficiency & Avoid time wasting</small>
                </div>
                <div class="panel-body">
                    <p class="page-header">
                        <i class="fa fa-check-square-o" style="color: Green;"></i>Sharpen your problem solving
                        skills with over 1.5 lakh questions to practice.
                    </p>
                    <p class="page-header">
                        <i class="fa fa-check-square-o" style="color: Green;"></i>tests to help you build
                        the right exam temperament.
                    </p>
                    <p class="page-header">
                        <i class="fa fa-check-square-o" style="color: Green;"></i>Brush up your concepts
                        through concepts sheets and best study materials from across the web.
                    </p>
                    <p class="page-header">
                        <i class="fa fa-check-square-o" style="color: Green;"></i>Get personalised feedback
                        and detailed report to measure your progress.
                    </p>
                </div>
            </div>
        </div>
        <div class="row text-center">
            <button id="btnStartNow" type="submit" class="btn btn-success btn-def " runat="server"
                value="Student">
                Start Now</button>
        </div>
    </div>
      <%--  <div class="page-header text-center">
            <h3>
                Features
            </h3>
            <small>The complete package for your exam preparation</small>
        </div>
        <div class="col-md-6 col-sm-6">  
        <div class="col-md-2 col-sm-6">
            <i class="fa fa-check-square-o" style="color: Green; width: 60px; height: 60px; font-size: 60px;">
            </i>
        </div>    
            <div class="col-md-10 col-sm-6">     
                <h4 class="h4">
               <strong> Practice</strong>
                </h4>
                <p>
                    Practice exactly the right questions to improve faster.
                </p>
            </div>
        </div>
        <div class="col-md-6 col-sm-6">
            <div class="col-md-2 col-sm-6">
                <i class="fa fa-check-square-o" style="color: Green; width: 60px; height: 60px; font-size: 60px;">
                </i>
            </div>
            <div class="col-md-10 col-sm-6">
                <h4 class="h4">
                    <strong>  Goal based learning</strong>
                </h4>
                <p class="ldg-section_para mt-5 mb-5">                 
                    Sharpen your concepts with over 1.5 Lakh questions with detailed solutions and hints.
                </p>
            </div>
            </div>
        <div class="col-md-6">
            <div class="ldg-sectionFeatures_content tab-ta-c tab-ml-0 tab-mt-10">
                <h4 class="h4">
                   Test Series
                </h4>
                <p class="ldg-section_para mt-5 mb-5">
                    Experience real exam like environment and know where you stand at an all India level.
                </p>
            </div>
        </div>
        <div class="col-md-6">
            <div class="ldg-sectionFeatures_content tab-ta-c tab-ml-0 tab-mt-10">
                <h4 class="h4">
                   Performance Reports
                </h4>
                <p class="ldg-section_para mt-5 mb-5">
                    Progress on goals to measure your progress on a chapter.
                </p>
            </div>
        </div>--%>
       
      
    </div>
</asp:Content>
