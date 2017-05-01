<%@ Page Title="Detalhes Editora" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalhesEditora.aspx.cs" Inherits="BibliotecaWeb.DetalhesEditora" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <h2 class="h2"><%:Page.Title %></h2>


    <div>

        <asp:DetailsView ID="EditoraDetailsView" Font-Size="X-Large" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="nomeEditora" ForeColor="Black" GridLines="None" DataSourceID="SqlDataSource">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <EditRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <Fields>
                <asp:BoundField DataField="idEditora" HeaderText="ID_Editora" InsertVisible="False" ReadOnly="True" SortExpression="idEditora" />
                <asp:BoundField DataField="nomeEditora" HeaderText="Editora" ReadOnly="True" SortExpression="nomeEditora" />
                <asp:BoundField DataField="Endereco" HeaderText="Endereço" SortExpression="Endereco" />
                <asp:BoundField DataField="Bairro" HeaderText="Bairro" SortExpression="Bairro" />
                <asp:BoundField DataField="Cidade" HeaderText="Cidade" SortExpression="Cidade" />
                <asp:BoundField DataField="UF" HeaderText="UF" SortExpression="UF" />
                <asp:BoundField DataField="Telefone" HeaderText="Telefone" SortExpression="Telefone" />
                <asp:BoundField DataField="CEP" HeaderText="CEP" SortExpression="CEP" />
                <asp:BoundField DataField="CNPJ" HeaderText="CNPJ" SortExpression="CNPJ" />
            </Fields>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        </asp:DetailsView>
        <asp:SqlDataSource ID="SqlDataSource" runat="server" ConnectionString="Data Source=TOFANINI;Initial Catalog=Biblioteca;Integrated Security=True" SelectCommand="SELECT DISTINCT * FROM [Editora] WHERE ([nomeEditora] = @nomeEditora)">
            <SelectParameters>
                <asp:QueryStringParameter Name="nomeEditora" QueryStringField="nomeEditora" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>


</asp:Content>
