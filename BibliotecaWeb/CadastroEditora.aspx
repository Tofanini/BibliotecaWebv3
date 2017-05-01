<%@ Page Title="Cadastro de Editora" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CadastroEditora.aspx.cs" Inherits="BibliotecaWeb.CadastroEditora" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
     <script src="../Scripts/valida_cpf_cnpj.js"></script>
	 <!-- Adicionando Javascript -->
    <script type="text/javascript" >
    
    function limpa_formulário_cep() {
            //Limpa valores do formulário de cep.
		document.getElementById('MainContent_rua').value=("");
		document.getElementById('MainContent_bairro').value=("");
		document.getElementById('MainContent_cidade').value=("");
		document.getElementById('MainContent_uf').value=("");
            //document.getElementById('ibge').value=("");
    }

    function meu_callback(conteudo) {
        if (!("erro" in conteudo)) {
            //Atualiza os campos com os valores.
			document.getElementById('MainContent_rua').value=(conteudo.logradouro);
			document.getElementById('MainContent_bairro').value=(conteudo.bairro);
			document.getElementById('MainContent_cidade').value=(conteudo.localidade);
			document.getElementById('MainContent_uf').value=(conteudo.uf);
            //document.getElementById('ibge').value=(conteudo.ibge);
        } //end if.
        else {
            //CEP não Encontrado.
            limpa_formulário_cep();
            alert("CEP não encontrado.");
        }
    }
        
    function pesquisacep(valor) {

        //Nova variável "cep" somente com dígitos.
        var cep = valor.replace(/\D/g, '');

        //Verifica se campo cep possui valor informado.
        if (cep != "") {

            //Expressão regular para validar o CEP.
            var validacep = /^[0-9]{8}$/;

            //Valida o formato do CEP.
            if(validacep.test(cep)) {

                //Preenche os campos com "..." enquanto consulta webservice.
				document.getElementById('MainContent_rua').value="...";
				document.getElementById('MainContent_bairro').value="...";
				document.getElementById('MainContent_cidade').value="...";
				document.getElementById('MainContent_uf').value="...";
                //document.getElementById('ibge').value="...";

                //Cria um elemento javascript.
                var script = document.createElement('script');

                //Sincroniza com o callback.
                script.src = '//viacep.com.br/ws/'+ cep + '/json/?callback=meu_callback';

                //Insere script no documento e carrega o conteúdo.
                document.body.appendChild(script);

            } //end if.
            else {
                //cep é inválido.
                limpa_formulário_cep();
                alert("Formato de CEP inválido.");
            }
        } //end if.
        else {
            //cep sem valor, limpa formulário.
            limpa_formulário_cep();
        }
    };

    </script>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>
	
    <div class="form-horizontal">
        <h4>Cadastro de Editora.</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Nome</asp:Label>

            <div class="col-md-10">
                <asp:TextBox runat="server" ID="nomeTextBox" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="nomeTextBox"
                    CssClass="text-danger" ErrorMessage="O campo nome é obrigatório!" />
            </div>
        </div>


		<div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">CEP</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="cep" CssClass="form-control" TextMode="Number" onblur="pesquisacep(this.value);"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="cep"
                    CssClass="text-danger" ErrorMessage="O campo cep é obrigatório!" />
            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Endereço</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="rua" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="rua"
                    CssClass="text-danger" ErrorMessage="O campo endereço é obrigatório!" />

            </div>
        </div>

        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Bairro</asp:Label>
            <div class="col-md-10">

                <asp:TextBox runat="server" ID="bairro" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="bairro"
                    CssClass="text-danger" ErrorMessage="O campo bairro é obrigatório!" />
            </div>
        </div>





        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Cidade</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="cidade" CssClass="form-control" TextMode="SingleLine" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="cidade"
                    CssClass="text-danger" ErrorMessage="O campo cidade é obrigatório!" />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">UF</asp:Label>
            <div class="col-md-10">
                    <asp:DropDownList ID="uf" runat="server" CssClass="form-control">
                        <asp:ListItem>N/S</asp:ListItem>
                        <asp:ListItem>AC</asp:ListItem>
                        <asp:ListItem>AL</asp:ListItem>
                        <asp:ListItem>AM</asp:ListItem>
                        <asp:ListItem>AP</asp:ListItem>
                        <asp:ListItem>BA</asp:ListItem>
                        <asp:ListItem>CE</asp:ListItem>
                        <asp:ListItem>DF</asp:ListItem>
                        <asp:ListItem>ES</asp:ListItem>
                        <asp:ListItem>GO</asp:ListItem>
                        <asp:ListItem>MA</asp:ListItem>
                        <asp:ListItem>MG</asp:ListItem>
                        <asp:ListItem>MS</asp:ListItem>
                        <asp:ListItem>MT</asp:ListItem>
                        <asp:ListItem>PA</asp:ListItem>
                        <asp:ListItem>PE</asp:ListItem>
                        <asp:ListItem>PB</asp:ListItem>
                        <asp:ListItem>PI</asp:ListItem>
                        <asp:ListItem>PR</asp:ListItem>
                        <asp:ListItem>RJ</asp:ListItem>
                        <asp:ListItem>RN</asp:ListItem>
                        <asp:ListItem>RO</asp:ListItem>
                        <asp:ListItem>RR</asp:ListItem>
                        <asp:ListItem>RS</asp:ListItem>
                        <asp:ListItem>SC</asp:ListItem>
                        <asp:ListItem>SE</asp:ListItem>
                        <asp:ListItem>SP</asp:ListItem>
                        <asp:ListItem>TO</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>


        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">Telefone</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="telefoneTextBox" CssClass="form-control" TextMode="Phone" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="telefoneTextBox"
                    CssClass="text-danger" ErrorMessage="O campo telefone é obrigatório!" />
            </div>
        </div>



        



        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-2 control-label">CNPJ</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="cnpjTextBox" CssClass="form-control" TextMode="Number" onblur="javascript:if(!valida_cpf_cnpj(this.value))alert('CNPJ inválido!');" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="cnpjTextBox"
                    CssClass="text-danger" ErrorMessage="O campo cidade é obrigatório!" />
            </div>
        </div>

        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">

            <asp:Button ID="cadastrarButton" runat="server" Text="Cadastrar" OnClick="cadastrarButton_Click" CssClass="btn btn-default"/>
        </div>
        <br />

        <div>

            <asp:Label ID="mensagemLabel" runat="server" Text=""></asp:Label>
        </div>


  </div>
		</div>

</asp:Content>
