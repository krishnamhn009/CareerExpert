<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PricingPlan.aspx.cs" Inherits="WebApplication1.PricingPlan" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-alpha1/jquery.min.js"></script>
    <script type="text/javascript">
   // alert("1");
    var url = "https://test.payu.in/_payment";
    var Productinfo = { "paymentParts": [{ "name": "abc", "description": "abcd", "value": "500", "isRequired": "true", 
    "settlementEvent": "EmailConfirmation" },
{ "name": "xyz", "description": "wxyz", "value": "1500", "isRequired": "false", "settlementEvent": "EmailConfirmation"}]};
//,{"paymentIdentifiers": [{"field":"CompletionDate","value":"31/10/2012"},{"field":"TxnId","value":"abced"}]};

jQuery.ajax({
    type: "POST",
    url: url,
    data: JSON.stringify(Productinfo),
    contentType: "application/json; charset=utf-8",
    dataType: "json",
    async: false,
    success: function (msg) {
        var jsonObj = jQuery.parseJSON(msg);
        alert(jsonObj.encPassword);
    },
    failure: function (errorMsg) {

        alert(errorMsg);
    }
});
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="home" class="margin-top-30">
        <div class="home-container text-center">
            <div class="home-title">
                <div class="container">
                    <div class="container text-center">
                        <h2 class="text-center">
                            Your job hunting at <a href="http://www.careerexpert.co" title="www.careerexpert.co">
                               careerexpert.co</a></h2>
                       
                                     <img  src="Image/p6.jpg" alt="img" style="width: 60%; border: 0px;" />
                    </div>
                    <div class="container margin-top-10 text-center">
                        <h2>
                            Let opportunities come to you</h2>
                        <h4>
                            you can see Jobs details and request for referral.We will make path for you to reach
                            Employer. so you'll never miss an opportunity.</h4>
                        <img src="Image/p8.jpg" alt="img" style="width: 60%;"/>
                    </div>
                </div>
            </div>
            </div>
            </section>

            <%--===========FEW OF TOP MNC====================--%>
    <div class="row alert"><marquee>
        <div class="col-sm-3">
            
            <a href="#demo">
                <img src="C_logos/amdocs-logo.jpg" class="img-rounded" alt="Random Name" style="width:80%;height:50%;">
            </a>
        </div>
        <div class="col-sm-3">           
            <a href="#demo2" >
                <img src="C_logos/Cybage.jpg" class="img-rounded" alt="Random Name" style="width: 60%;
                    height: 50%;">
            </a>
        </div>
        <div class="col-sm-3">
            <a href="#demo3">
                <img src="C_logos/cog.png" class="img-rounded" alt="Random Name" style="width: 60%;
                    height: 50%;">
            </a>
        </div>
        <div class="col-sm-3">
            <a href="#demo3">
                <img src="C_logos/ibm.png" class="img-rounded" alt="Random Name" style="width: 60%;
                    height: 50%;">
            </a>
        </div></marquee>
    </div>
            <%--=================================--%>
 

 
</asp:Content>
