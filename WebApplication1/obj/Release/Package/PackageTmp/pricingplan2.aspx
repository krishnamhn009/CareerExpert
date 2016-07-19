<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pricingplan2.aspx.cs" Inherits="WebApplication1.pricingplan2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>  
        <script type="text/javascript">
           $(document).ready(function () {
               $("#nonseamless").submit();
           });
       </script>
    <title>
    </title>
</head>
<body>
    <form id="nonseamless" method="post" name="redirect" action="https://test.ccavenue.com/transaction/transaction.do?command=initiateTransaction"> 
        <input type="hidden" id="encRequest" name="encRequest" value="<%=strEncRequest%>"/>
        <input type="hidden" name="access_code" id="access_code" value="<%=strAccessCode%>"/>
    </form>
</body>
</html>