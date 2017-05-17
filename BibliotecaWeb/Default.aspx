<%@ Page Title="Home Page" Language="C#" Theme="Tema" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BibliotecaWeb._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	
	<script lang= "javascript/text" src=../Scripts/clock.js></script>
		
		<span id='clock_tm' >Hora Atual</span><br><br>
		<span id='clock_dt' >Data Atual</span>

	<style type="text/css">
	#clock_tm {
		position:absolute;
		left:80%;
		top:35%;
		margin-left:-90px;
		margin-top:-80px;
		font-size:xx-large;
		}

	#clock_dt {
		position:absolute;
		left:80%;
		top:35%;
		margin-left:-110px;
		margin-top:-50px;
		font-size:xx-large;

		}
</style>
		
		<script lang='javascript'>
			StartClock('d/m/Y', 'H:i:s');	
	
</script>

    <div class="jumbotron" >
		
        <p >Seja Bem-vindo a sua Biblioteca Web!<br /> Você é novo por aqui? Cadastre-se ou faça login!</p>
        <p><a href="/Account/Register.aspx" class="btn btn-primary btn-lg">Cadastre-se &raquo;</a>
        <a href="/Account/Login.aspx" class="btn btn-primary btn-lg">Login &raquo;</a></p>
       
    </div>


</asp:Content>
