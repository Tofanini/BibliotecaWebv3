using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using BibliotecaWeb.Models;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Microsoft.AspNet.Identity.EntityFramework;
using BibliotecaWeb.Enum;
using System.Linq;
using System.Text;
using Microsoft.Ajax.Utilities;
using System.Data.Entity.Infrastructure;

namespace BibliotecaWeb.Account
{
	public partial class Register : Page
	{
		


		protected void CreateUser_Click(object sender, EventArgs e)


		{
			try
			{



				using (var cn = new SqlConnection(
				  ConfigurationManager.ConnectionStrings["Biblioteca"].ConnectionString))





				{
					cn.Open();

					string consulta = "SELECT CPF from Usuario where CPF = @cpf";


					SqlCommand cmd = new SqlCommand(consulta, cn);


					//Passo o parametro
					cmd.Parameters.AddWithValue("@cpf", CPF.Text);

					SqlDataReader read = cmd.ExecuteReader();

					//SE EXISTIR ELE ENTRA NO IF
					if (read.Read())
					{
						ErrorMessage.Text = ("CPF já cadastrado");


						read.Close();
						cn.Close();

						//aqui você colocaria a pagina na qual vai redirecionar caso o usuário exista...
					}

					//SENÃO NÃO ENTRA
					else
					{


						using (var cn2 = new SqlConnection(
						  ConfigurationManager.ConnectionStrings["Biblioteca"].ConnectionString))
						using (var cmd2 = new SqlCommand("PROC_INSERT_USUARIO", cn2))
						{

							cn2.Open();

							var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
							var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
							var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
							IdentityResult result = manager.Create(user, Password.Text);


							if (result.Succeeded)
							{



								cmd2.CommandType = CommandType.StoredProcedure;
								cmd2.Parameters.AddWithValue("@nome", nomeTextBox.Text);
								cmd2.Parameters.AddWithValue("@datanasc", datanascimentoTextBox.Text);
								cmd2.Parameters.AddWithValue("@rg", RG.Text);
								cmd2.Parameters.AddWithValue("@cpf", CPF.Text);
								cmd2.Parameters.AddWithValue("@email", Email.Text);
								cmd2.Parameters.AddWithValue("@senha", Password.Text);
								cmd2.Parameters.AddWithValue("@confirmasenha", ConfirmPassword.Text);
								cmd2.Parameters.AddWithValue("@idUsuario", user.Id);



								cmd2.ExecuteNonQuery();

								read.Close();
								IdentityResult createRoleResult = null;
								var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(new ApplicationDbContext()));
								if (!roleManager.RoleExists(Roles.Estudante.ToString()))
								{
									createRoleResult = roleManager.Create(new IdentityRole(Roles.Estudante.ToString()));
								}
								//if (createRoleResult.Succeeded)
								
								var addToRoleResult = manager.AddToRole(user.Id, Roles.Estudante.ToString());
								


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
								ErrorMessage.Text = result.Errors.ToList().FirstOrDefault().ToString();
							}






							if (cn.State != ConnectionState.Closed)
							{ cn2.Close(); }
						}
					}
				}
			}
			catch (Exception ex)
			{

				ErrorMessage.Text = "Ops!Um erro ocorreu.";

			}


		}

		

		private void SigninValidation(SignInStatus result)
		{
			switch (result)
			{
				case SignInStatus.Success:

					IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
					break;
				//case SignInStatus.LockedOut:
				//	Response.Redirect("/Account/Lockout");
				//	break;
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

