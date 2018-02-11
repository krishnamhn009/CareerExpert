<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Login1.aspx.cs" Inherits="WebApplication1.Login1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
  <style>.abc {
	position: fixed;
	
	vertical-align:middle;
	width: 100%;
	height: 100%;
	z-index: 9999;
	
}</style>
    <%---------------linkedin login--------------------------%>
    <%--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>--%>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.2/modernizr.js"></script>
    <script type="text/javascript" src="http://platform.linkedin.com/in.js">
api_key:XXXXXXXXXXXX 
authorize: false
onLoad: onLinkedInLoad
scope:  r_emailaddress 
    </script>
    <script type="text/javascript">
        function onLinkedInLoad() {

            IN.Event.on(IN, "auth", onLinkedInAuth);
           
        }
        function onLinkedInAuth() {
            IN.API.Profile("me")
.fields("firstName", "lastName", "industry", "location:(name)", "picture-url", "headline", "summary", "num-connections", "public-profile-url", "distance", "positions", "email-address", "educations", "date-of-birth")
.result(displayProfiles)
.error(displayProfilesErrors);
        }

        function displayProfiles(profiles) {
            $(".abc").fadeIn();
            member = profiles.values[0];
            // alert(JSON.stringify(member));
          //  debugger;
          //  alert(JSON.stringify(member));
            var email = member.emailAddress;
          var name = member.firstName + " " + member.lastName; // + "<br/> Location is " + member.location.name;
          var location = member.location.name;          
           var company = member.positions.values[0].company.name;
           var joinDate = member.positions.values[0].startDate.year;
            validateSocial(email, name, location, company,joinDate);

        }
//   ==========   linked in callback start ===========
        function lnkTest() {       
            IN.User.authorize(function () {
                callback();
            });
        }

        //   ==========   linked in callback end ===========
        function displayProfilesErrors(error) {
            profilesDiv = document.getElementById("profiles");
            profilesDiv.innerHTML = error.message;
            console.log(error);
        }

        function validateSocial(email, name, location, company, joinDate) {
            PageMethods.RegisterUser(email, name,location,company,joinDate, OnSuccess);
        }
        function OnSuccess(response, userContext, methodName) {
            //window.location.href = "MyAccount.aspx";
            window.location.href = "my-dashboard";
         }
         
         $(window).load(function () {
             // Animate loader off screen
             $(".abc").fadeOut("slow");           
         });

    </script>
    <%-----------------------------------------------------%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="abc text-center" style="width: 100%; height: 100%; background: white;">
        <i class="fa fa-spinner fa-spin fa-2x"></i>
    </div>
    <div class="well container-fluid margin-top-30">
          
       
    <div class="row text-center" >
       <div class="col-md-6 col-md-offset-3 col-sm-6 col-sm-offset-3 col-xs-12">
           <div id="loginStatus" class="alert alert-danger" runat="server">
               <button type="button" class="close" data-dismiss="alert">
                   ×</button>
               <strong>Sorry!! Please Enter Valid Email Id and Password.</strong>
           </div>
           <div id="ResetStatus" class="alert alert-danger" runat="server" visible="false">
               <button type="button" class="close" data-dismiss="alert">
                   ×</button>
               <strong>Sorry!! Please Enter Valid Email Id.</strong>
           </div>
           <div id="ResetSuccess" class="alert alert-success" runat="server">
               <button type="button" class="close" data-dismiss="alert">
                   ×</button>
               <strong>Password has been sent to your Email.</strong>
           </div>
         <div id="RegisterSuccess" class="alert alert-success" runat="server">
               <button type="button" class="close" data-dismiss="alert">
                   ×</button>
               <strong>Registration Successful. Please LogIn Now.</strong>
           </div>
           <div id="ChangePwdSuccess" class="alert alert-success" runat="server">
               <button type="button" class="close" data-dismiss="alert">
                   ×</button>
               <strong>Password Changed Successfully.</strong>
           </div>

            <div class="margin-margin-top-70"">
                <form id="loginForm" runat="server">
                <asp:ScriptManager runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
              
                <div class="text-center"><label  runat="server" class="h3" id="lblLogin">Login</label></div>
                <div class="text-center"><label runat="server" class="h3" id="lblReset">Reset Password</label></div>
                <div class="text-center"><label runat="server" class="h3" id="lblChange">Change Password</label></div>
                <%--<div class="text-center"><label runat="server" class="h3" id="lblRegister">Registration Successful. Please LogIn Now.</label></div>--%>
                <%--=================================--%>
               <%-- <div class="form-group text-center" id="socialLogin">
                    <script type="in/Login"></script>
                
                </div>--%>

               <div class="text-center">                     
                           <a class="btn btn-lg btn-social btn-linkedin text-center" onclick="lnkTest();return false;" href="#" >
                       <span class="fa fa-linkedin fa-3x"></span>Sign in with LinkedIn</a> 
                                                                                                                                             
                </div>
               
                
                <%--====================================--%>
                <div class="form-group margin-top-15">
                    <div id="idEmail" runat="server" class="input-group">
                        <span class="input-group-addon"><i class="fa fa-envelope-o"></i></span>
                        
                        <asp:TextBox class="form-control" id="txtEmail"  placeholder="Enter Email"
                            type="email" runat="server"  required/>                         
                    </div>
                    <asp:RegularExpressionValidator ID="rfvEmail2" runat="server" ErrorMessage="Please Enter Valid Email ID"
                        ValidationGroup="vgSubmit" ControlToValidate="txtEmail" CssClass="requiredFieldValidateStyle"
                        ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                    </asp:RegularExpressionValidator>
                </div>
                <div id="idPass" class="form-group" runat="server" >
                    <div class="input-group">
                        <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
                        <input class="form-control" id="txtUserPaswd" placeholder="Password" type="password"
                            runat="server" required/>
                    </div>
                </div>
                <p id="lblForgetPass" class="text-right" runat="server">
                    <a href="/login?ResetPassword=Y" class="text-danger" runat="server">Forgot password?</a></p>             
                <asp:Button type="submit" CssClass="btn btn-success" ID="resetPass" value="ResetPass"
                    runat="server" OnClick="Reset_Click" Text="Reset Password" />
                    <asp:Button type="submit" CssClass="btn btn-success" ID="changePass" value="ChangePass"
                    runat="server" OnClick="ChangePwd_Click" Text="Change Password" />
                <asp:Button type="submit" CssClass="btn btn-success" ID="btnLogin" value="Login"
                    runat="server" Text="Login" OnClick="login_Click" />
                </form>
            </div>
        </div>
        </div>
        
</div>
</asp:Content>
