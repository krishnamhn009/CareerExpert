<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="OnlineTest.aspx.cs"  Inherits="WebApplication1.OnlineTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container">
<br />
	<asp:MultiView ID="MultiView1" runat="server">
               
                <asp:View ID="View1" runat="server">
                   
                    <div style="height: 237px; width: 925px">
             <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
       <ContentTemplate>
           <asp:Timer ID="Timer1" OnTick="Timer1_Tick" Interval="1000" runat="server"></asp:Timer>
            <asp:Label ID="Label3" runat="server" ></asp:Label>
           
       </ContentTemplate>
    </asp:UpdatePanel>
                    <hr />
    <asp:GridView PageSize="1" AllowPaging="True" BorderColor="#999999" Width="100%" ID="GridView1" runat="server" AutoGenerateColumns="False" 
         ShowHeader="False" BackColor="#CCCCCC" BorderWidth="3px" CellPadding="4" ForeColor="Black" BorderStyle="Solid" CellSpacing="2" 
         OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCreated="GridView1_RowCreated" OnRowDataBound="GridView1_RowDataBound">
        <Columns>
            <asp:TemplateField HeaderStyle-BorderWidth="0" ControlStyle-BorderWidth="0"><HeaderTemplate></HeaderTemplate>
            <ItemTemplate>
            <table style="width: 80%" align="center" border="0"><tr><td valign="top">
            <asp:Label ID="Label1" runat="server" Text='<%#GetID(Container.DataItem)%>'></asp:Label>
            <asp:Label ID="Label2" runat="server" Text='<%#Eval("question_desc") %>' /></td></tr>
            <tr><td>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server"></asp:RadioButtonList></td></tr>
            </table>
            </ItemTemplate>
            <ControlStyle BorderWidth="0px" /><HeaderStyle BorderWidth="0px" />
            </asp:TemplateField>
        </Columns>
        <PagerStyle ForeColor="Black" BackColor="#CCCCCC" HorizontalAlign="Left" />
        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerSettings PageButtonCount="3" Position="Bottom" />
        <PagerTemplate>
            <asp:Button ID="Button1" Width="60px" Height="40px" CssClass="Buttonclass" OnClick="Button1_Click" PostBackUrl="OnlineTest.aspx" runat="server" Text="Next" 
            CommandName="Page" CommandArgument="Next" />
        <hr />
        </PagerTemplate>
        <RowStyle BackColor="White" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />
    </asp:GridView>
            
                         </div>
               </asp:View>
            </asp:MultiView>
           

</div>
</asp:Content>