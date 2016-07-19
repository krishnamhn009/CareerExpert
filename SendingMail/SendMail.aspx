<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendMail.aspx.cs" Inherits="SendingMail.SendMail" %>
 <form id="SendMailT" runat="server">
   <asp:Panel ID="Panel1" runat="server" DefaultButton="btnSubmit">
    <p>
        Please Fill the Following to Send Mail.</p>
    <p>
        Your name:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="*"
            ControlToValidate="YourName" ValidationGroup="save" /><br />
        <asp:TextBox ID="YourName" runat="server" Width="250px" /><br />
        Your email address:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*"
            ControlToValidate="YourEmail" ValidationGroup="save" /><br />
        <asp:TextBox ID="YourEmail" runat="server" Width="250px" />
        <asp:RegularExpressionValidator runat="server" ID="RegularExpressionValidator23"
            SetFocusOnError="true" Text="Example: username@gmail.com" ControlToValidate="YourEmail"
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"
            ValidationGroup="save" /><br />
        Subject:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*"
            ControlToValidate="YourSubject" ValidationGroup="save" /><br />
        <asp:TextBox ID="YourSubject" runat="server" Width="400px" /><br />
        Your Question:
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*"
            ControlToValidate="Comments" ValidationGroup="save" /><br />
        <asp:TextBox ID="Comments" runat="server" TextMode="MultiLine" Rows="10" Width="400px" />
    </p>
    <p>
        <asp:Button ID="btnSubmit" runat="server" Text="Send" OnClick="Button1_Click" ValidationGroup="save" />
    </p>
</asp:Panel>
<p>
    <asp:Label ID="lblMsgSend" runat="server" Visible="false" />
</p>
    
</form>