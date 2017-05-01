<%@ Page Title="Cadastro de Usuário" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadastroUsuario.aspx.cs" Inherits="BibliotecaWeb.CadastroUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


<h2><%:Page.Title%></h2>


<div>

    <asp:Label ID="nomeLabel" runat="server" Text="Nome:"></asp:Label>
    <div>

        <asp:TextBox ID="nomeTextBox" runat="server"></asp:TextBox>
    </div>

</div><br />
    <div>

    <asp:Label ID="datanascLabel" runat="server" Text="Data de Nascimento:"></asp:Label>
    <div>

        <asp:TextBox ID="datanascTextBox" runat="server"></asp:TextBox>
    </div>

</div><br />
    <div>

    <asp:Label ID="rgLabel" runat="server" Text="RG:"></asp:Label>
    <div>

        <asp:TextBox ID="rgTextBox" runat="server"></asp:TextBox>
    </div>

</div><br />


    <div>

    <asp:Label ID="cpfLabel" runat="server" Text="CPF:"></asp:Label>
    <div>

        <asp:TextBox ID="cpfTextBox" runat="server"></asp:TextBox>
    </div>

</div><br />


    <div>
        <asp:Button ID="cadastrarButton" runat="server" Text="Cadastrar" />



    </div><br />

    <asp:Label ID="mensagemLabel" runat="server" Text=""></asp:Label>

</asp:Content>
