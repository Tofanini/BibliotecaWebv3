<%@ Page Title="Reserva de LIvros" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReservaLivro.aspx.cs" Inherits="BibliotecaWeb.ReservaLivro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <h2><%:Page.Title %></h2>


    <div>

        <asp:Label ID="idLivro" runat="server" Text="ID_Livro"></asp:Label>
        <div>

            <asp:TextBox ID="idLivroTextBox" runat="server"></asp:TextBox>

        </div>
         

    </div><br /><br />

        <div>

        <asp:Label ID="idLocatario" runat="server" Text="ID_Locatário"></asp:Label>
        <div>

            <asp:TextBox ID="idLocatarioTextBox" runat="server"></asp:TextBox>

        </div><br /><br />
    </div>
        <div>

        <asp:Label ID="DataReserva" runat="server" Text="Data da Reserva" ></asp:Label>
        <div>

            <asp:TextBox ID="datareservaTextBox" runat="server" TextMode="Date"></asp:TextBox>

        </div>


    </div><br /><br />



    

</asp:Content>
