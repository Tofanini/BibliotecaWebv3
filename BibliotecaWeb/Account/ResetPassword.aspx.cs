using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using BibliotecaWeb.Models;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace BibliotecaWeb.Account
{
	public partial class ResetPassword : Page
	{
		protected string StatusMessage
		{
			get;
			private set;
		}

		protected void Reset_Click(object sender, EventArgs e)
		{
			string code = IdentityHelper.GetCodeFromRequest(Request);
			if (code != null)
			{
				var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();

				var user = manager.FindByName(Email.Text);
				if (user == null)
				{
					ErrorMessage.Text = "Usuário não encontrado";
					return;
				}
				var result = manager.ResetPassword(user.Id, code, Password.Text);



				if (result.Succeeded)
				{
					using (var cn = new SqlConnection(
				  ConfigurationManager.ConnectionStrings["Biblioteca"].ConnectionString))
					{
						using (var cmd = new SqlCommand("PROC_UPDATE_SENHA", cn))
						{

							cn.Open();


							cmd.CommandType = CommandType.StoredProcedure;

							cmd.Parameters.AddWithValue("@senha", Password.Text);
							cmd.Parameters.AddWithValue("@confirmasenha", ConfirmPassword.Text);
							cmd.Parameters.AddWithValue("@idusuario", user.Id);


							cmd.ExecuteNonQuery();

							if (cn.State != ConnectionState.Closed)
							{ cn.Close(); }


							Response.Redirect("~/Account/ResetPasswordConfirmation");
							return;
						}
						
					}


				}

					ErrorMessage.Text = result.Errors.FirstOrDefault();
					return;
				}

				ErrorMessage.Text = "Um erro ocorreu.";
			}


		}
	}