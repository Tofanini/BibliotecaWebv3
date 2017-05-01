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
using System.Globalization;

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
                    using (var cmd = new SqlCommand("SELECT asp.Id, r.idReserva, r.idLivro, l.Autor, l.Titulo, u.Nome, u.RG from AspNetUsers as asp, Reserva as r, Livro as l, Usuario as u where r.idLocatario = asp.Id AND r.idLivro = l.idLivro AND RG = @rg ", cn))
                    {
                        cn.Open();

                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@rg", rgusuarioTextBox.Text);
                       



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


            //DateTime dt = DateTime.ParseExact(dataTextBox.Text.Replace("-", "/"), "dd/MM/yyyy", CultureInfo.InvariantCulture);

            var DataEntrega = System.DateTime.Now.AddDays(7).Date;

            var idFuncionario = Context.User.Identity.GetUserId();

            var rg = rgusuarioTextBox;

            var idreserva = 0;


            try
            {
                using (var cn = new SqlConnection(
                  ConfigurationManager.ConnectionStrings["Biblioteca"].ConnectionString))
                {
                    using (var cmd = new SqlCommand("SELECT r.id from Reserva as r, Usuario as u where r.idLocatario = u.idUsuario AND RG = @rg ", cn))
                    {
                        cn.Open();

                        cmd.CommandType = CommandType.Text;
                        cmd.Parameters.AddWithValue("@rg", rgusuarioTextBox.Text);



                        SqlDataReader dr = cmd.ExecuteReader();

                        while (dr.Read())
                        { 
                            Int32.TryParse(dr["id"].ToString(), out idreserva);
                  
                        }
                        //Fecha o leitor de dados
                        dr.Close();


                        cn.Close();


                    }

                }

                using (var cn = new SqlConnection(
                     ConfigurationManager.ConnectionStrings["Biblioteca"].ConnectionString))
                {
                    using (var cmd = new SqlCommand("PROC_INSERT_LOCACAO", cn))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@idReserva", idreserva);
                        cmd.Parameters.AddWithValue("@idFuncionario", idFuncionario);
                        cmd.Parameters.AddWithValue("@DataSaida", DataSaida );
                        cmd.Parameters.AddWithValue("@DataEntrega",DataEntrega);
                  

                        cn.Open();



                        cmd.ExecuteNonQuery();

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