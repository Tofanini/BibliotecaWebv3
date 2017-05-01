<%@ Page Title="Cadastro de Livros" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadastroLivro.aspx.cs" Inherits="BibliotecaWeb.CadastroLivro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    


	<p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
    <div class="form-horizontal">
        <h4>Cadastro de Livros.</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Editora</asp:Label>

            <div class="col-md-10">
                <asp:DropDownList ID="nomeEditoraDropDownList" runat="server" AutoPostBack="True" CssClass="form-control">
                <asp:ListItem Value="nomeEditora">N/S</asp:ListItem>
            </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="nomeEditoraDropDownList"
                    CssClass="text-danger" ErrorMessage="O campo Editora é obrigatório!" />
            </div>
        </div>



		<div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Título</asp:Label>

            <div class="col-md-10">
                <asp:TextBox runat="server" ID="tituloTextBox" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="tituloTextBox"
                    CssClass="text-danger" ErrorMessage="O campo Título é obrigatório!" />
            </div>
        </div>


		<div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Edição</asp:Label>

            <div class="col-md-10">
                <asp:TextBox runat="server" ID="edicaoTextBox" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="edicaoTextBox"
                    CssClass="text-danger" ErrorMessage="O campo Edição é obrigatório!" />
            </div>
        </div>

   
   <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Ano</asp:Label>

            <div class="col-md-10">
                <asp:TextBox runat="server" ID="anoTextBox" CssClass="form-control" TextMode="Number" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="anoTextBox"
                    CssClass="text-danger" ErrorMessage="O campo Ano é obrigatório!" />
            </div>
        </div>
   

		<div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">ISBN</asp:Label>

            <div class="col-md-10">
                <asp:TextBox runat="server" ID="isbnTextBox" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="isbnTextBox"
                    CssClass="text-danger" ErrorMessage="O campo ISBN é obrigatório!" />
            </div>
        </div>
    
		<div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Localização</asp:Label>

            <div class="col-md-10">
                <asp:TextBox runat="server" ID="localizacaoTextBox" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="localizacaoTextBox"
                    CssClass="text-danger" ErrorMessage="O campo Localização é obrigatório!" />
            </div>
        </div>

		<div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Assunto</asp:Label>

            <div class="col-md-10">
                <asp:TextBox runat="server" ID="assuntoTextBox" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="assuntoTextBox"
                    CssClass="text-danger" ErrorMessage="O campo Assunto é obrigatório!" />
            </div>
        </div>

    
		<div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Autor</asp:Label>

            <div class="col-md-10">
                <asp:TextBox runat="server" ID="autorTextBox" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="autorTextBox"
                    CssClass="text-danger" ErrorMessage="O campo Autor é obrigatório!" />
            </div>
        </div>


    
   
    


    <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
        <asp:Button ID="cadastrarButton" runat="server" Text="Cadastrar" OnClick="cadastrarButton_Click" CssClass="btn btn-default" />



    </div></div>
    <br />
<div>

	 <asp:Label ID="mensagemLabel" runat="server" Text=""></asp:Label>
</div>
   
</div>
</asp:Content>
