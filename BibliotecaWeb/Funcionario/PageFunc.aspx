<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageFunc.aspx.cs" Inherits="BibliotecaWeb.Funcionario.PageFunc" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title><%: Page.Title %> - Minha Biblioteca Web</title>

    <asp:PlaceHolder runat="server">
        <%: Scripts.Render("~/bundles/modernizr") %>
    </asp:PlaceHolder>
    <webopt:BundleReference runat="server" Path="~/Content/css" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />

</head>
<body>
    <form runat="server">
        <asp:ScriptManager runat="server">
            <Scripts>
                <%--To learn more about bundling scripts in ScriptManager see http://go.microsoft.com/fwlink/?LinkID=301884 --%>
                <%--Framework Scripts--%>
                <asp:ScriptReference Name="MsAjaxBundle" />
                <asp:ScriptReference Name="jquery" />
                <asp:ScriptReference Name="bootstrap" />
                <asp:ScriptReference Name="respond" />
                <asp:ScriptReference Name="WebForms.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebForms.js" />
                <asp:ScriptReference Name="WebUIValidation.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebUIValidation.js" />
                <asp:ScriptReference Name="MenuStandards.js" Assembly="System.Web" Path="~/Scripts/WebForms/MenuStandards.js" />
                <asp:ScriptReference Name="GridView.js" Assembly="System.Web" Path="~/Scripts/WebForms/GridView.js" />
                <asp:ScriptReference Name="DetailsView.js" Assembly="System.Web" Path="~/Scripts/WebForms/DetailsView.js" />
                <asp:ScriptReference Name="TreeView.js" Assembly="System.Web" Path="~/Scripts/WebForms/TreeView.js" />
                <asp:ScriptReference Name="WebParts.js" Assembly="System.Web" Path="~/Scripts/WebForms/WebParts.js" />
                <asp:ScriptReference Name="Focus.js" Assembly="System.Web" Path="~/Scripts/WebForms/Focus.js" />
                <asp:ScriptReference Name="WebFormsBundle" />
                <%--Site Scripts--%>
            </Scripts>
        </asp:ScriptManager>

        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" runat="server" href="~/">Application name</a>
                </div>

                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav">
                            <li><a runat="server" href="~/">Home</a></li>
                            <li><a runat="server" href="PesquisaLivros.aspx">PesquisaLivros</a></li>
                            <li class="dropdown">
                                <a class="dropdown-toggle" data-toggle="dropdown" href="#">Cadastro
        <span class="caret"></span></a>
                                <ul class="dropdown-menu">
                                    <li><a runat="server" href="CadastroUsuario.aspx">Usuário</a></li>
                                    <li><a runat="server" href="CadastroEditora.aspx">Editora</a></li>
                                    <li><a runat="server" href="CadastroLivro.aspx">Livro</a></li>
                                </ul>
                            </li>

                            <li><a runat="server" href="~/About">About</a></li>
                            <li><a runat="server" href="~/Contact">Contact</a></li>
                        </ul>
                        <asp:LoginView runat="server" ViewStateMode="Disabled">
                            <LoggedInTemplate>
                                <ul class="nav navbar-nav navbar-right">
                                    <li><a runat="server" href="~/Account/Manage" title="Manage your account">Hello, <%: Context.User.Identity.GetUserName()  %> !</a></li>
                                    <li>
                                        <asp:LoginStatus runat="server" LogoutAction="Redirect" LogoutText="Log off" LogoutPageUrl="~/" />
                                    </li>
                                </ul>
                            </LoggedInTemplate>
                        </asp:LoginView>
                    </div>
                </div>
            </div>
       

        <div>

            <h2>Bem-vindo ao sistema Funcionário!</h2>


        </div>






        <div class="container body-content">
            <hr />
            <footer>
                <p>&copy; <%: DateTime.Now.Year %> - Minha Biblioteca Web</p>
            </footer>
        </div>

    </form>
</body>
</html>






