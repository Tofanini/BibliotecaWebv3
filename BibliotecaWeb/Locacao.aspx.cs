using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using Microsoft.AspNet.Identity;

namespace BibliotecaWeb
{
	public partial class Locacao : System.Web.UI.Page
	{

		protected void Page_Load(object sender, EventArgs e)
		{

		}



		protected void pesquisarButton_Click(object sender, EventArgs e)
		{
			mensagemLabel.Text = string.Empty;
			mensagemLabel.ForeColor = Color.Black;

			try
			{
				using (var cn = new SqlConnection(
				  ConfigurationManager.ConnectionStrings["Biblioteca"].ConnectionString))
				{
					using (var cmd = new SqlCommand("SELECT asp.Id, r.idReserva, r.idLivro, l.Autor, l.Titulo, u.Nome, u.CPF from AspNetUsers as asp, Reserva as r, Livro as l, Usuario as u where r.idLocatario = asp.Id AND r.idLivro = l.idLivro AND asp.Id = u.idUsuario AND CPF = @cpf ", cn))
					{
						cn.Open();

						cmd.CommandType = CommandType.Text;
						cmd.Parameters.AddWithValue("@cpf", CPF.Text);




						cmd.ExecuteNonQuery();

						using (DataTable Livro = new DataTable())
						{

							using (SqlDataAdapter da = new SqlDataAdapter(cmd))
							{

								da.Fill(Livro);


								locacaoGridView.DataSource = Livro;
								locacaoGridView.DataBind();

								cn.Close();


							}

						}
					}
				}
			}

			catch (Exception ex)
			{
				mensagemLabel.Text = ex.Message;
				mensagemLabel.ForeColor = Color.Red;
			}
		}


		protected void AlocarButton_Click(object sender, EventArgs e)
		{
			mensagemLabel.Text = string.Empty;
			mensagemLabel.ForeColor = Color.Black;


			var DataSaida = System.DateTime.Now.Date;

			var DataEntrega = System.DateTime.Now.AddDays(7).Date;

			var idFuncionario = Context.User.Identity.GetUserId().Trim();

			var idUsuario = Context.User.Identity.GetUserId().Trim();//Ajustar para o ID do usuario.



			try
			{

				foreach (GridViewRow row in locacaoGridView.Rows)
				{
					if (row.RowType == DataControlRowType.DataRow)
					{
						CheckBox chkRow = (row.Cells[0].FindControl("CheckBox1") as CheckBox);
						if (chkRow.Checked)
						{
							var idLivro = Convert.ToInt32(row.Cells[1].Text);

							using (var cn = new SqlConnection(
					 ConfigurationManager.ConnectionStrings["Biblioteca"].ConnectionString))
							{

								//Insere na base de dados;
								using (var cmd = new SqlCommand("PROC_INSERT_LOCACAO", cn))
								{
									cmd.CommandType = CommandType.StoredProcedure;


									cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
									cmd.Parameters.AddWithValue("@idFuncionario", idFuncionario);
									cmd.Parameters.AddWithValue("@idLivro", idLivro);
									cmd.Parameters.AddWithValue("@DataSaida", DataSaida);
									cmd.Parameters.AddWithValue("@DataEntrega", DataEntrega);


									cn.Open();



									cmd.ExecuteNonQuery();



									if (cn.State != ConnectionState.Closed)
									{ cn.Close(); }

									mensagemLabel.Text = "Livro alocado com sucesso!";

								}

							}

						}
					}
				}
			}





			catch (Exception ex)
			{
				mensagemLabel.Text = ex.Message;
				mensagemLabel.ForeColor = Color.Red;
			}

		}
		protected void ExcluirButton_Click(object sender, EventArgs e)
		{


			try
			{

				foreach (GridViewRow row in locacaoGridView.Rows)
				{
					if (row.RowType == DataControlRowType.DataRow)
					{
						CheckBox chkRow = (row.Cells[0].FindControl("CheckBox1") as CheckBox);
						if (chkRow.Checked)


						{
							var idLivro = Convert.ToInt32(row.Cells[1].Text);

							using (var cn = new SqlConnection(
				  ConfigurationManager.ConnectionStrings["Biblioteca"].ConnectionString))
							{
								using (SqlCommand cmd = new SqlCommand("DELETE FROM Reserva WHERE IdLivro = @idLivro", cn))
								{
									cmd.CommandType = CommandType.Text;
									cmd.Parameters.AddWithValue("@idLivro", idLivro);
									cn.Open();
									cmd.ExecuteNonQuery();
									locacaoGridView.DataBind();

									cn.Close();
								}

								mensagemLabel.Text = "Registro excluído com sucesso!";
							}
						}

					

						//Implementar o Refresh da pagina para atualizar o grid em tempo real.







					}
				}
			}



			catch (Exception ex)
			{
				mensagemLabel.Text = ex.Message;
				mensagemLabel.ForeColor = Color.Red;
			}
		}

	}
}



