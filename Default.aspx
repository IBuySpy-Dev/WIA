<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WIA._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h2>Hello <asp:LoginName ID="LoginName1" runat="server" />
        </h2>
        <p>You authenticated using: <asp:Label ID="loginMethod" runat="server"></asp:Label>
        </p>
    </div>
    <div class="row">
        <div class="col-md-12">
            <p>
                <asp:DataGrid ID="claims" AutoGenerateColumns="true" runat="server"></asp:DataGrid>
            </p>
        </div>
    </div>

</asp:Content>
