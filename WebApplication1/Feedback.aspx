<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="WebApplication1.Feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container margin-top-50">
                <div class="page-header">
                    <h3>Have a complaint or feedback regarding your experience on Career Expert? </h3>
                </div>
               <p> Please let us know using the form below, so we can fix it.  We're trying to make sure Career Expert is the most effective job portal around, and we need your feedback to improve:</p>
                </br>
                <div id="FeedbackStatus" class="alert alert-success" runat="server" visible="false">
               <button type="button" class="close" data-dismiss="alert">
                   ×</button>
               <strong>Thank You for your valuable feedback.</strong>
           </div>
                       <form id="complaintform" runat="server">
                       
                       
                       
                       <div class="row">
                    
                    
	                        <div class="col-md-6 col-sm-10 form-group">
	                            <label for="email">
	                                Email:
	                            </label>
	                            <asp:textbox type="email" runat="server"  class="form-control" name="email" id="txtFeedEmail" value=""  placeholder="Enter Email" maxlength="99" required/>
	                                                       
	                        </div>
	                    </div>
                        <div class="row">
	                        <div class="col-md-6 col-sm-10 form-group pull-left">
	                            <label for="complaintto">
	                                Who should this complaint to be raised to?
	                            </label>
	                            <div>
	                                <select name="complaintto" id="complaintto" runat="server"  class="form-control">	                                    
	                                    <option value="Technology"> Technology </option>
	                                    <option value="Customer Support"> Customer Support </option>
	                                    <option value="Management"> Management </option>
	                                    
	                                </select>
	                            </div>
	                        </div>
                         </div>
                        <div class="row">
	                        <div class="col-md-6 col-sm-10 form-group pull-left">
	                            <label for="complaint">
	                                Complaint or Suggestion:
	                            </label>
	                            <textarea class="form-control" runat="server"  rows="5" name="complaint" id="complaint" maxlength="2000" required></textarea>
	                        </div>
                        </div>
                        <div class="row">
	                        <div class="col-md-6 col-sm-10 pull-left">
	                            <asp:button type="submit" runat="server" class="btn btn-primary" name="submit_complaint" id="submit_complaint" OnClick="Submit_Complaint" text="Submit Complaint"></asp:button>
	                        </div>
                       </div>
                    </form>
               
            </div>
      
</asp:Content>
