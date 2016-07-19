<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication1.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript" src="http://platform.linkedin.com/in.js">
api_key: 75kkh3dvgqo4yq
authorize: true
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
            member = profiles.values[0];
            // alert(JSON.stringify(member));
            debugger;
            alert(member);
          var mail=member.emailAddress;
        var name = member.firstName + " " + member.lastName; // + "<br/> Location is " + member.location.name;
        var location = member.location.name;
        var joinDate = member.positions.values[0].startDate.year;
            var company = member.positions.values[0].company.name;
           // Test();
            //document.getElementById("lblProfile").innerHTML = member.publicProfileUrl + " " + member.headline + " " + member.industry + " " + member.positions.values[0].company.name;
            //window.location("MyAccount.aspx");
         // window.location("Login1.aspx?login=Social");
            ShowCurrentTime(mail)
        }
        function displayProfilesErrors(error) {
            profilesDiv = document.getElementById("profiles");
            profilesDiv.innerHTML = error.message;
            console.log(error);
        }
    </script>
    <script type="text/javascript">
        function ShowCurrentTime(mail) {

            PageMethods.RegisterUser(mail, OnSuccess);
           

        }
        function OnSuccess(response, userContext, methodName) {
            alert(response);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form id="form1" runat="server" class="margin-top-70">
  <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
    </asp:ScriptManager>
    <div>
        Your Name :
        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
        <input id="btnGetTime" type="button" value="Show Current Time" onclick="ShowCurrentTime()" />
        <div class="form-group text-center" id="socialLogin">
            <script type="in/Login"></script>
        </div>
    </div>
    </form>
</asp:Content>
