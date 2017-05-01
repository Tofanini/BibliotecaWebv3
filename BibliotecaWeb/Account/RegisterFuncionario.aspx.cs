using BibliotecaWeb.Enum;
using BibliotecaWeb.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BibliotecaWeb.Account
{
	public partial class RegisterFuncionario : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void CreateUser_Click(object sender, EventArgs e)


		{
			try
			{
				using (var cn = new SqlConnection(
				  ConfigurationManager.ConnectionStrings["Biblioteca"].ConnectionString))
				{
					using (var cmd = new SqlCommand("PROC_INSERT_FUNCIONARIO", cn))
					{
						cmd.CommandType = CommandType.StoredProcedure;
						cmd.Parameters.AddWithValue("@nome", nomeTextBox.Text);
						cmd.Parameters.AddWithValue("@datanasc", datanascimentoTextBox.Text);
						cmd.Parameters.AddWithValue("@rg", RG.Text);
						cmd.Parameters.AddWithValue("@cpf", CPF.Text);
						cmd.Parameters.AddWithValue("@email", Email.Text);
						cmd.Parameters.AddWithValue("@senha", Password.Text);
						cmd.Parameters.AddWithValue("@confirmasenha", ConfirmPassword.Text);

						cn.Open();



						cmd.ExecuteNonQuery();

						var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
						var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
						var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
						IdentityResult result = manager.Create(user, Password.Text);

						if (result.Succeeded)
						{
							IdentityResult createRoleResult = null;
							var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new ApplicationDbContext()));
							if (!roleManager.RoleExists(Roles.Funcionario.ToString()))
							{
								createRoleResult = roleManager.Create(new IdentityRole(Roles.Funcionario.ToString()));
							}
							if (createRoleResult.Succeeded)
							{
								var addToRoleResult = manager.AddToRole(user.Id, Roles.Funcionario.ToString());
							}


							// For more information on how to enable account confirmation and password reset please visit http://go.microsoft.com/fwlink/?LinkID=320771
							string code = manager.GenerateEmailConfirmationToken(user.Id);
							string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
							manager.SendEmail(user.Id, "Confirmação de conta", "Por favor, confirme sua conta clicando <a href=\"" + callbackUrl + "\">aqui</a>.");

							if (user.EmailConfirmed)
							{
								var resultSignIn = signInManager.PasswordSignIn(Email.Text, Password.Text, false, shouldLockout: false);
								SigninValidation(resultSignIn);
							}
							else
							{
								ErrorMessage.Text = "Um email foi enviado para sua conta. Por favor, veja o seu email e confirme sua conta para completar o processo de cadastro.";
							}
						}



						else
						{
							ErrorMessage.Text = "Funcionário já existe!";
						}




						if (cn.State != ConnectionState.Closed)
						{ cn.Close(); }
					}
				}
			}
			catch (Exception ex)
			{
				throw ex;
			}


		}

		private void SigninValidation(SignInStatus result)
		{
			switch (result)
			{
				case SignInStatus.Success:

					IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
					break;
				case SignInStatus.LockedOut:
					Response.Redirect("/Account/Lockout");
					break;
				case SignInStatus.RequiresVerification:
					Response.Redirect(String.Format("/Account/TwoFactorAuthenticationSignIn?ReturnUrl={0}&RememberMe={1}",
													Request.QueryString["ReturnUrl"],
													false),
									  true);
					break;
				case SignInStatus.Failure:
				default:
					//FailureText.Text = "Invalid login attempt";
					ErrorMessage.Visible = true;
					break;

			}
		}


	}
}


