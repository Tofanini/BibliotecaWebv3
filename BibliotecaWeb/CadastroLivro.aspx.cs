using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BibliotecaWeb
{
	public partial class CadastroLivro : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

			mensagemLabel.Text = string.Empty;
			mensagemLabel.ForeColor = Color.Black;
			try
			{
				using (var cn = new SqlConnection(
				  ConfigurationManager.ConnectionStrings["Biblioteca"].ConnectionString))
				{

					using (var cmd = new SqlCommand("SELECT nomeEditora FROM Editora", cn))
					{

						SqlDataReader dr;
						//Abre a conexão
						cn.Open();

						dr = cmd.ExecuteReader();

						while (dr.Read())
						{

							string nome = dr["nomeEditora"].ToString();
							//Adiciona nos itens do DropDown
							nomeEditoraDropDownList.Items.Add(nome);
						}
						//Fecha o leitor de dados
						dr.Close();
						//Fecha a conexão
						cn.Close();
					}

				}
			}
				
			catch (Exception ex)
			{
				mensagemLabel.Text = ex.Message;
				mensagemLabel.ForeColor = Color.Red;
			}

}


public void LimparTODOSTextBox(Control controle)
{
	//Faz um laço para todos os controles passados no parâmetro
	foreach (Control ctrl in controle.Controls)
	{
		//Se o contorle for um TextBox...
		if (ctrl is TextBox)
		{
			((TextBox)(ctrl)).Text = String.Empty;

		}
		else if (ctrl.Controls.Count > 0)
		{
			LimparTODOSTextBox(ctrl);

		}
	}
}

protected void cadastrarButton_Click(object sender, EventArgs e)
{

	mensagemLabel.Text = string.Empty;
	mensagemLabel.ForeColor = Color.Black;
	try
	{
		using (var cn = new SqlConnection(
		  ConfigurationManager.ConnectionStrings["Biblioteca"].ConnectionString))
		{
			using (var cmd = new SqlCommand("PROC_INSERT_LIVRO", cn))
			{
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.AddWithValue("@nomeEditora", nomeEditoraDropDownList.Text);
				cmd.Parameters.AddWithValue("@titulo", tituloTextBox.Text);
				cmd.Parameters.AddWithValue("@edicao", edicaoTextBox.Text);
				cmd.Parameters.AddWithValue("@ano", anoTextBox.Text);
				cmd.Parameters.AddWithValue("@isbn", isbnTextBox.Text);
				cmd.Parameters.AddWithValue("@localizacao", localizacaoTextBox.Text);
				cmd.Parameters.AddWithValue("@assunto", assuntoTextBox.Text);
				cmd.Parameters.AddWithValue("@autor", autorTextBox.Text);

				cn.Open();
				if (tituloTextBox.Text == string.Empty)
				{
					mensagemLabel.Text = ("O campo Título é obrigatório!");
					mensagemLabel.ForeColor = Color.Red;

				}
				else if (nomeEditoraDropDownList.Text == string.Empty)
				{
					mensagemLabel.Text = ("O campo Editora é obrigatório!");
					mensagemLabel.ForeColor = Color.Red;

				}

				else
				{
					cmd.ExecuteNonQuery();

					LimparTODOSTextBox(this);


					mensagemLabel.Text = ("Dados cadastrados com sucesso!!!");

				}


				if (cn.State != ConnectionState.Closed)
				{ cn.Close(); }
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
