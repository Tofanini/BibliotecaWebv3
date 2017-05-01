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
using Microsoft.AspNet.Identity;

namespace BibliotecaWeb
{
    public partial class PesquisaLivros : System.Web.UI.Page
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




        protected void pesquisarButton_Click(object sender, EventArgs e)
        {
            mensagemLabel.Text = string.Empty;
            mensagemLabel.ForeColor = Color.Black;

            try
            {
                using (var cn = new SqlConnection(
                  ConfigurationManager.ConnectionStrings["Biblioteca"].ConnectionString))
                {
                    using (var cmd = new SqlCommand("SELECT idLivro, Autor, Titulo, nomeEditora, Assunto FROM Livro where Autor = @autor or Titulo = @titulo or nomeEditora = @nomeEditora or Assunto = @assunto ", cn))
                    {
                        cn.Open();

                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@autor", autorTextBox.Text);
                        cmd.Parameters.AddWithValue("@titulo", tituloTextBox.Text);
                        cmd.Parameters.AddWithValue("@nomeEditora", editoraTextBox.Text);
                        cmd.Parameters.AddWithValue("@assunto", assuntoTextBox.Text);



                        cmd.ExecuteNonQuery();

                        using (DataTable Livro = new DataTable())
                        {

                            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                            {

                                da.Fill(Livro);


                                livrosGridView.DataSource = Livro;
                                livrosGridView.DataBind();

                                cn.Close();

                                LimparTODOSTextBox(this);
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
        protected void livrosGridView_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (livrosGridView.SelectedIndex >= 0)
                ViewState["SelectedKey"] = livrosGridView.SelectedValue;
            else
                ViewState["SelectedKey"] = null;
        }


        
        protected void Button_Click(object sender, EventArgs e)
        {
            mensagemLabel.Text = string.Empty;
            mensagemLabel.ForeColor = Color.Black;

            try
            {

               
                using (var cn = new SqlConnection(
                  ConfigurationManager.ConnectionStrings["Biblioteca"].ConnectionString))
                {
                    using (var cmd = new SqlCommand("INSERT INTO Reserva (idLivro, idLocatario, DataReserva) VALUES (@idLivro, @idLocatario, GETDATE())", cn))
                    {

                        cn.Open();


                        cmd.CommandType = CommandType.Text;

                        for (int i = 0; i < livrosGridView.Rows.Count; i++)
                        {
                        
                         
                            cmd.Parameters.AddWithValue("@idLivro",
                                Convert.ToInt32(livrosGridView.Rows[i].Cells[0].Text));
                            cmd.Parameters.AddWithValue("@idLocatario",
                                Context.User.Identity.GetUserId());


                            cmd.ExecuteNonQuery();

                            mensagemLabel.Text = ("Livro Reservado!");
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

    }


    // Add code here to add the item to the shopping cart.
}



        //protected void livrosGridView_DataBound(object sender, EventArgs e)
        //{
        //    for (int i = 0; i < livrosGridView.Rows.Count; i++)
        //    {
        //        // Ignore values that cannot be cast as integer.
        //        try
        //        {
        //            if ((int)livrosGridView.DataKeys[i].Value == (int)ViewState["SelectedKey"])
        //                livrosGridView.SelectedIndex = i;
        //        }
        //        catch { }
        //    }
        //}

        //protected void ContactsGridView_Sorting(object sender, GridViewSortEventArgs e)
        //{
        //    livrosGridView.SelectedIndex = -1;
        //}

        //protected void livrosGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    livrosGridView.SelectedIndex = -1;
        //}
    






    


            