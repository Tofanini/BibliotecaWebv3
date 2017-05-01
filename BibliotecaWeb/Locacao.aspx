<%@ Page Title="Locação de Livro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Locacao.aspx.cs" Inherits="BibliotecaWeb.Locacao" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

	<h2><%: Page.Title %></h2>




	<script type="text/javascript">
		$(document).ready(function () {

			$("input[type=checkbox]").addClass("EventoCheckBox")
			$("#Button").hide();
			$(".EventoCheckBox").click(function () {
				if ($(this).is(":checked")) {

					$("#Button").show();
					//$("#Button").removeProp("Visible", false);
					//$("#Button").prop("Visible", true);
				} else {


					//$("#Button").prop("Visible", false);

					$("#Button").hide();
				};
			});
		});



	</script>


	<%--<script type="text/javascript">
		$(function () {
			document.getElementById('<%=alocarButton.ClientID %>').style.visibility = "hidden";
		$(function unhide(){
			if (document.getElementById('CheckBox2').checked = true) {

				document.getElementById('<%=alocarButton.ClientID %>').style.visibility = "visible";
				}
			});
		});

		
		</script>--%>



	<div>
		<asp:Label ID="rgusuarioLabel" runat="server" Text="RG do usuário"></asp:Label>

		<div>

			<asp:TextBox ID="rgusuarioTextBox" runat="server"></asp:TextBox>
		</div>

	</div>
	<br />
	<br />


	


		<asp:Button ID="pesquisarButton" runat="server" Text="Pesquisar" OnClick="pesquisarButton_Click" CssClass="btn btn-default" />
	


	<div>
		<asp:Label ID="mensagemLabel" runat="server" Text=""></asp:Label>

	</div>
	<br />
	<br />
	<div>
			<asp:Button ID="Button" runat="server" Text="Alocar" OnClick="AlocarButton_Click" CssClass="btn btn-default" ClientIDMode="static"/>
		</div>

	<div>
		<br />

		
		<br />

		<asp:GridView ID="locacaoGridView" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" Width="530px" AllowSorting="True" BorderStyle="Solid" EmptyDataText="Nenhum resultado encontrado.">
			<AlternatingRowStyle BackColor="White" />


			<Columns>

				<asp:TemplateField>
					<HeaderTemplate>
						<asp:CheckBox ID="CheckBox2" runat="server" />
					</HeaderTemplate>
					<ItemTemplate>
						<asp:CheckBox ID="CheckBox1" runat="server" ClientIDMode="static"  />
					</ItemTemplate>
				</asp:TemplateField>
				<asp:BoundField DataField="idLivro" HeaderText="ID_Livro" />
				<asp:BoundField DataField="Autor" HeaderText="Autor" />
				<asp:BoundField DataField="Titulo" HeaderText="Título" />
				<asp:BoundField DataField="Nome" HeaderText="Locatário" />
				<asp:BoundField DataField="RG" HeaderText="RG" />


				<asp:HyperLinkField Text="Detalhes..." DataNavigateUrlFields="idLivro" DataNavigateUrlFormatString="DetalhesLivro.aspx?idLivro={0}" NavigateUrl="~/DetalhesLivro.aspx" />









			</Columns>



			<EditRowStyle BackColor="#2461BF" />
			<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
			<HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
			<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
			<RowStyle BackColor="#EFF3FB" />
			<SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
			<SortedAscendingCellStyle BackColor="#F5F7FB" />
			<SortedAscendingHeaderStyle BackColor="#6D95E1" />
			<SortedDescendingCellStyle BackColor="#E9EBEF" />
			<SortedDescendingHeaderStyle BackColor="#4870BE" />



		</asp:GridView>



	</div>



</asp:Content>
