<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="OnlineTest2.aspx.cs" Inherits="WebApplication1.OnlineTest2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container-fluid">

    <div class="well row">
        <h3>
            Customer Data</h3>
        <p>
            <asp:Repeater ID="Repeater1" runat="server">               
                <ItemTemplate>
                  
                        <div class="panel panel-primary">
                            <div class="panel-heading"style="background:#333;border:0px;">
                               
                            <p class="page-header panel-title text-info" ><%# DataBinder.Eval(Container.DataItem, "JobTitle")%>
                               ( <%# DataBinder.Eval(Container.DataItem, "JobExperience")%> Years) 
                               <div class="text-left">( <%# DataBinder.Eval(Container.DataItem, "JobExperience")%>
                                Years)</div></p>                                 
                          </div>                                                                                                                           
                        <div class="panel-body">                           
                                <a class="page-header panel-title">
                                    <%# DataBinder.Eval(Container.DataItem, "JobDesc") %></a>
                          
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </p>
    </div>
</div>
</asp:Content>
