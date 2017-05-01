using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace BibliotecaWeb
{
    public partial class EditarLivro1 : System.Web.UI.Page
    {
		protected void Page_Load(object sender, EventArgs e)
		{

			//if (!IsPostBack)
			



				string idLivro = Request.QueryString["idLivro"];

				using (var cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Biblioteca"].ConnectionString))
				{



					string sql = "SELECT * FROM Livro where idLivro=@idLivro";


					var cmd = new SqlCommand(sql, cn);

					cmd.CommandType = CommandType.Text;
					cmd.Parameters.AddWithValue("@idLivro", idLivro);


					//Abre a conexão
					cn.Open();

					SqlDataReader dr = cmd.ExecuteReader();

					while (dr.Read())


					{

						idLivroTextBox.Text = dr["idLivro"].ToString();
						tituloTextBox.Text = dr["Titulo"].ToString();
						edicaoTextBox.Text = dr["Edicao"].ToString();
						anoTextBox.Text = dr["Ano"].ToString();
						isbnTextBox.Text = dr["ISBN"].ToString();
						localizacaoTextBox.Text = dr["Localizacao"].ToString();
						assuntoTextBox.Text = dr["Assunto"].ToString();
						autorTextBox.Text = dr["Autor"].ToString();
						nomeEditoraTextBox.Text = dr["nomeEditora"].ToString();


					}
					//Fecha o leitor de dados
					dr.Close();


					//Fecha a conexão
					cn.Close();


				}
			}
		
		

        protected void alterarButton_Click(object sender, EventArgs e)
        {
            try
            {




                //cria a conexão com o banco de dados 
                using (var cn = new SqlConnection(ConfigurationManager.ConnectionStrings["Biblioteca"].ConnectionString))
                {
                    using (var cmd = new SqlCommand("UPDATE_LIVRO", cn))
                    {


                        cn.Open();
                        string idLivro = Request.QueryString["idLivro"];

                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@idLivro", idLivro.ToString());
                        cmd.Parameters.AddWithValue("@titulo", tituloTextBox.Text);
                        cmd.Parameters.AddWithValue("@edicao", edicaoTextBox.Text);
                        cmd.Parameters.AddWithValue("@ano", anoTextBox.Text);
                        cmd.Parameters.AddWithValue("@isbn", isbnTextBox.Text);
                        cmd.Parameters.AddWithValue("@localizacao", localizacaoTextBox.Text);
                        cmd.Parameters.AddWithValue("@assunto", assuntoTextBox.Text);
                        cmd.Parameters.AddWithValue("@autor", autorTextBox.Text);





                        cmd.ExecuteNonQuery();



                        mensagemLabel.Text = "Dados alterados com sucesso!";

                        if (cn.State != ConnectionState.Closed)
                        {
                            cn.Close();
                        }
                    }
                }
            }

            catch (Exception ex)
            {
                mensagemLabel.Text = ex.Message;
            }




        }
    }


}
