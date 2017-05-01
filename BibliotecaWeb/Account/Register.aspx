<%@ Page Title="Cadastro" Language="C#" Theme="Tema2" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BibliotecaWeb.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

	
	<script src="../Scripts/jquery-3.1.1.min.js"></script>
     <script src="../Scripts/jquery.maskedinput.min.js"></script>

	<script type="text/javascript">
		jQuery(function ($) {
			$("#datanascimentoTextBox").mask("99/99/9999");
			$("#RG").mask("99.999.999-9");
			$("#CPF").mask("999.999.999-99");

		});
    </script>
	

	 <link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>     
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
		


		jQuery(function ($) {
			$("#datanascimentoTextBox").datepicker({
				dateFormat: 'dd/mm/yy',
				dayNames: ['Domingo', 'Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado'],
				dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D'],
				dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom'],
				monthNames: ['Janeiro', 'Fevereiro', 'Março', 'Abril', 'Maio', 'Junho', 'Julho', 'Agosto', 'Setembro', 'Outubro', 'Novembro', 'Dezembro'],
				monthNamesShort: ['Jan', 'Fev', 'Mar', 'Abr', 'Mai', 'Jun', 'Jul', 'Ago', 'Set', 'Out', 'Nov', 'Dez'],
				nextText: 'Próximo',
				prevText: 'Anterior'
			});
			
			

		});
</script>



	<script src="https://code.jquery.com/jquery-latest.min.js"></script>
	<script src="../Scripts/valida_cpf_cnpj.js"></script>

    <div class="form-horizontal">
        <h4>Criar uma nova conta</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />


		<div class="form-group">
            <asp:Label runat="server"  Font-Bold="true" CssClass="col-md-2 control-label">Nome Completo</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="nomeTextBox" TextMode="SingleLine" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="nomeTextBox"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="O campo nome é obrigatório." />
            
            </div>
        </div> 

		<div class="form-group">
            <asp:Label runat="server"  Font-Bold="true" CssClass="col-md-2 control-label">Data de Nascimento</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="datanascimentoTextBox" CssClass="form-control" ClientIDMode="Static"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="datanascimentoTextBox"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="O campo Data de Nascimento é obrigatório." />
            
            </div>
        </div>

		<div class="form-group">
            <asp:Label runat="server" Font-Bold="true" CssClass="col-md-2 control-label">RG</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="RG" CssClass="form-control" ClientIDMode="Static" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="RG"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="O campo RG é obrigatório." />
            
            </div>
        </div>

		<div class="form-group">
            <asp:Label runat="server" Font-Bold="true" CssClass="col-md-2 control-label">CPF</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="CPF" CssClass="form-control" ClientIDMode="Static" onblur="javascript:if(!valida_cpf(this.value))alert('CPF inválido!');"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="CPF"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="O campo CPF é obrigatório." />
            
            </div>
        </div>
            
         



        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="O campo email é obrigatório." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Senha</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
				
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="O campo senha é obrigatório." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirmar senha</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="O campo confirmação de senha é obrigatório." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="A senha e a confirmação de senha não conferem." />
            </div>
        </div>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Cadastrar" CssClass="btn btn-default" />
            </div>

	 </div>

		</div>
		
</asp:Content>
