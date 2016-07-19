<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="OnlineResult.aspx.cs" Inherits="WebApplication1.OnlineResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div style="margin-left:10px;margin-top:10px">
        <asp:GridView CssClass="gv" ShowFooter="true" OnRowDataBound="GridView1_RowDataBound" AutoGenerateColumns="false" ID="GridView1" runat="server" Height="255px" 
        style="color: #000000" Width="513px">
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                      
                        <asp:Label ID="Label5" runat="server" Text="Question"></asp:Label></th>
                        <th>
                            <asp:Label ID="Label6" runat="server" Text="Answer"></asp:Label></th><th>
                        <asp:Label ID="Label7" runat="server" Text="Your Progress"></asp:Label>  
                    </HeaderTemplate>
                   
                    <AlternatingItemTemplate>
                        <tr class="ggv" >
                            <td class="ques" align="left" >
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("question_desc") %>'></asp:Label></td>
                            <td class="correct" width="35%" align="right">
                                <asp:Label ID="Label2" runat="server" Text='<%#CAns(Container.DataItem) %>'></asp:Label></td>
                            <td width="35%" class="userans" align="right">
                                <asp:Label ID="Label3" runat="server" Text='<%#ans(Container.DataItem) %>'></asp:Label></td>
                        </tr>
                    </AlternatingItemTemplate>
                 
                    <ItemTemplate>
                        <tr class="ggval" >
                            <td class="ques" width="50%" align="left" >
                                <asp:Label ID="Label1" runat="server" Text='<%#Eval("question_desc") %>'></asp:Label></td>
                            <td class="correct" width="35%" align="right">
                                <asp:Label ID="Label2" runat="server" Text='<%#CAns(Container.DataItem) %>'></asp:Label></td>
                            <td width="35%" class="userans" align="right">
                                <asp:Label ID="Label3" runat="server" Text='<%#ans(Container.DataItem) %>'></asp:Label></td>
                        </tr>


                    </ItemTemplate>
                    <FooterTemplate>
                 <tr><td colspan="3">
                        <strong id="span1">Correct Answers:<%# marks.ToString() %></strong></td></tr>
                    </FooterTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
            <br />
    

 </div>
</asp:Content>
