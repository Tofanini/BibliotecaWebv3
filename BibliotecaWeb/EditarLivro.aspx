<%@ Page Title="Alterar Registro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarLivro.aspx.cs" Inherits="BibliotecaWeb.EditarLivro1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%:Page.Title %></h2>


    <div class="form-horizontal">
        <h4>Detalhes do Livro</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />


		<div class="form-group">
            <asp:Label runat="server"  Font-Bold="true" CssClass="col-md-2 control-label">ID_Livro</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="idLivroTextBox" AutoPostBack="true" Enabled="false" TextMode="SingleLine" CssClass="form-control" />
                
            
            </div>
        </div>

		<div class="form-group">
            <asp:Label runat="server"  Font-Bold="true" CssClass="col-md-2 control-label">Editora</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="nomeEditoraTextBox" TextMode="SingleLine" Enabled="false" CssClass="form-control" />
                
            
            </div>
        </div>

		<div class="form-group">
            <asp:Label runat="server" Font-Bold="true" CssClass="col-md-2 control-label">Título</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tituloTextBox" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tituloTextBox"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="O campo Título é obrigatório." />
            
            </div>
        </div>

		<div class="form-group">
            <asp:Label runat="server" Font-Bold="true"
				CssClass="col-md-2 control-label">Edição</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="edicaoTextBox" TextMode="Number" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="edicaoTextBox"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="O campo Edição é obrigatório." />
            
            </div>
        </div>




        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Ano</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="anoTextBox" CssClass="form-control" TextMode="Number" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="anoTextBox"
                    CssClass="text-danger" ErrorMessage="O campo Ano é obrigatório." />
            </div>
        </div>


        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">ISBN</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="isbnTextBox" TextMode="Number" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="isbnTextBox"
                    CssClass="text-danger" ErrorMessage="The campo ISBN é obrigatório." />
            </div>
        </div>
        

	<div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Localização</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="localizacaoTextBox" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="localizacaoTextBox"
                    CssClass="text-danger" ErrorMessage="The campo Localização é obrigatório." />
            </div>
        </div>


    <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Assunto</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="assuntoTextBox" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="assuntoTextBox"
                    CssClass="text-danger" ErrorMessage="The campo Assunto é obrigatório." />
            </div>
        </div>   

	<div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Autor</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="autorTextBox" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="autorTextBox"
                    CssClass="text-danger" ErrorMessage="The campo Autor é obrigatório." />
            </div>
        </div>    

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="alterarButton_Click" Text="Alterar" CssClass="btn btn-default" />
            </div>
        </div>
	<asp:Label ID="mensagemLabel" runat="server" Text=""></asp:Label>
    </div>

</asp:Content>




