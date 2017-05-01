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
    public partial class CadastroEditora : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

	

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
                    using (var cmd = new SqlCommand("PROC_INSERT_EDITORA", cn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@nomeEditora", nomeTextBox.Text);
                        cmd.Parameters.AddWithValue("@endereco", rua.Text);
                        cmd.Parameters.AddWithValue("@bairro", bairro.Text);
                        cmd.Parameters.AddWithValue("@cidade", cidade.Text);
                        cmd.Parameters.AddWithValue("@telefone", telefoneTextBox.Text);
                        cmd.Parameters.AddWithValue("@cep", cep.Text);
                        cmd.Parameters.AddWithValue("@cnpj", cnpjTextBox.Text);
                        cmd.Parameters.AddWithValue("@uf", uf.Text);

                        cn.Open();
                        if (nomeTextBox.Text == string.Empty)
                        {
                            mensagemLabel.Text = ("O campo Nome é obrigatório!");
                            mensagemLabel.ForeColor = Color.Red;

                        }
                        else if (cnpjTextBox.Text == string.Empty)
                        {
                            mensagemLabel.Text = ("O campo CNPJ é obrigatório!");
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