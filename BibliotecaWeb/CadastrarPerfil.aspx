<%@ Page Title="Cadastro de Perfil" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadastrarPerfil.aspx.cs" Inherits="BibliotecaWeb.CadastrarPerfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:Page.Title %></h2>



    <div>
        <asp:Label ID="nomeLabel" runat="server" Text="Nome:"></asp:Label>


        <div>
            <asp:TextBox ID="nomeTextBox" runat="server"></asp:TextBox>

        </div>

    </div><br />

    <div>
        <asp:Label ID="descricaoLabel" runat="server" Text="Descrição:"></asp:Label>


        <div>
            <asp:TextBox ID="descricaoTextBox" runat="server"></asp:TextBox>

        </div>

    </div><br />

    <div>


        <asp:Button ID="cadastrarButton" runat="server" Text="Cadastrar" OnClick="cadastrarButton_Click" />
    </div><br />

    <div>
        <asp:Label ID="mensagemLabel" runat="server" Text=""></asp:Label>

    </div>


</asp:Content>
