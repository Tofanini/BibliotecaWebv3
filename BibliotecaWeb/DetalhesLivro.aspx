<%@ Page Title="Detalhes do Livro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalhesLivro.aspx.cs" Inherits="BibliotecaWeb.EditarLivro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:Page.Title %></h2>

    <div>

        <asp:DetailsView ID="LivroDetailsView" runat="server" Font-Size="X-Large" AutoGenerateRows="False" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="idLivro" GridLines="Horizontal" Height="50px" Width="125px" DataSourceID="SqlDataSource">
            <AlternatingRowStyle BackColor="#F7F7F7" />
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            <Fields>
                <asp:BoundField DataField="idLivro" HeaderText="ID_Livro" InsertVisible="False" ReadOnly="True" SortExpression="idLivro" />
                <asp:HyperLinkField DataNavigateUrlFormatString="DetalhesEditora?nomeEditora={0}" DataTextField="nomeEditora" HeaderText="Editora" DataNavigateUrlFields="nomeEditora" />
                <asp:BoundField DataField="Titulo" HeaderText="Título" SortExpression="Titulo" />
                <asp:BoundField DataField="Edicao" HeaderText="Edição" SortExpression="Edicao" />
                <asp:BoundField DataField="Ano" HeaderText="Lançamento" SortExpression="Ano" />
                <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" />
                <asp:BoundField DataField="Localizacao" HeaderText="Localização" SortExpression="Localizacao" />
                <asp:BoundField DataField="Assunto" HeaderText="Assunto" SortExpression="Assunto" />
                <asp:BoundField DataField="Autor" HeaderText="Autor" SortExpression="Autor" />
            </Fields>
            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
            <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="Data Source=TOFANINI;Initial Catalog=Biblioteca;Integrated Security=True" SelectCommand="SELECT DISTINCT * FROM [Livro] WHERE ([idLivro] = @idLivro)">
            <SelectParameters>
                <asp:QueryStringParameter Name="idLivro" QueryStringField="idLivro" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>
