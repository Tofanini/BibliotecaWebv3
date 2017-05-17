using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BibliotecaWeb
{
	public partial class Emprestimo : System.Web.UI.Page
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
				using (var cmd = new SqlCommand("SELECT lo.idLivro, lo.DataEntrega, l.Titulo, u.Nome, u.CPF from Locacao as lo, Livro as l, Usuario as u where lo.idLivro = l.idLivro AND u.idUsuario = lo.idUsuario AND u.CPF = @cpf", cn))
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


	protected void RenovarButton_Click(object sender, EventArgs e)
	{
		mensagemLabel.Text = string.Empty;
		mensagemLabel.ForeColor = Color.Black;



		var DataEntrega = System.DateTime.Now.AddDays(7).Date;

		



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
							using (var cmd = new SqlCommand("UPDATE LOCACAO SET DataEntrega = @DataEntrega", cn))
							{
								cmd.CommandType = CommandType.StoredProcedure;

								cmd.Parameters.AddWithValue("@DataEntrega", DataEntrega.AddDays(7).Date);


								cn.Open();



								cmd.ExecuteNonQuery();

								if (cn.State != ConnectionState.Closed)
								{ cn.Close(); }



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
							using (SqlCommand cmd = new SqlCommand("DELETE FROM Locacao WHERE IdLivro = @idLivro", cn))
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

