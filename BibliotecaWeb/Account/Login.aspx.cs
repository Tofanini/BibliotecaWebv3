using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using BibliotecaWeb.Models;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;


namespace BibliotecaWeb.Account
{
	public partial class Login : Page
	{




		protected void Page_Load(object sender, EventArgs e)
		{

			


			RegisterHyperLink.NavigateUrl = "Register";
			// Enable this once you have account confirmation enabled for password reset functionality
			ForgotPasswordHyperLink.NavigateUrl = "Forgot";
			OpenAuthLogin.ReturnUrl = Request.QueryString["ReturnUrl"];
			var returnUrl = HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
			if (!String.IsNullOrEmpty(returnUrl))
			{
				RegisterHyperLink.NavigateUrl += "?ReturnUrl=" + returnUrl;
			}
		}

		protected void LogIn(object sender, EventArgs e)
		{
			if (IsValid)
			{

				// Validate the user password
				var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
				var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();
				var user = manager.FindByName(Email.Text);
				//var user = new ApplicationUser();


				if (user != null)
				{
					if (!user.EmailConfirmed)
					{
						FailureText.Text = "Tentativa de login inválida. Você deve ter uma conta de e-mail confirmada.";
						ErrorMessage.Visible = true;
					}
					else
					{



						var result = new SignInStatus();

						// This doen't count login failures towards account lockout
						// To enable password failures to trigger lockout, change to shouldLockout: true
						//var result = user.(Email.Text, Password.Text, RememberMe.Checked, shouldLockout: false);
						using (var cn = new SqlConnection(
						 ConfigurationManager.ConnectionStrings["Biblioteca"].ConnectionString))
						{
							using (var cmd = new SqlCommand(
								"SELECT email, senha FROM Usuario where Email=@email AND PWDCOMPARE(@senha, Senha) = 1", cn))
							{
								cn.Open();

								cmd.CommandType = CommandType.Text;
								cmd.Parameters.AddWithValue("@email", Email.Text);
								cmd.Parameters.AddWithValue("@senha", Password.Text);

								using (SqlDataReader reader = cmd.ExecuteReader())
								{
									if (reader.Read())
									{
										result = signinManager.PasswordSignIn(Email.Text, Password.Text, RememberMe.Checked, shouldLockout: false);
									}
									else
									{
										result = SignInStatus.Failure;

									}
								}



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
																		RememberMe.Checked),
														  true);
										break;
									case SignInStatus.Failure:
									default:
										FailureText.Text = "Tentativa de login inválida";
										ErrorMessage.Visible = true;
										break;

								}
							}
						}
					}
				}
			}
		}
	}
}

