using Login.Entidades;
using Login.Paginas;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Login.Dados
{
    class DadosPedidos
    {
        MySqlCommand sql;
        Conexao con = new Conexao();


        public void Pesquisa(Pedidos dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("SELECT * FROM pedidos WHERE id_caixa like @id", con.con);
                sql.Parameters.AddWithValue("@id", dado.Id_caixa);

                MySqlDataAdapter da = new MySqlDataAdapter();
                da.SelectCommand = sql;
                DataTable dt = new DataTable();
                da.Fill(dt);
             

            }
            catch (Exception ex)
            {
                con.FecharConexao();
                throw ex;
            }
        }

        public void Cadastro(Pedidos dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("INSERT INTO pedidos (id_caixa, id_produto, quatidade, subtotal) VALUES (@idcaixa, @idprod, @quantidade, @subtotal)", con.con);
                sql.Parameters.AddWithValue("@idcaixa", dado.Id_caixa);
                sql.Parameters.AddWithValue("@idprod", dado.Id_produto);
                sql.Parameters.AddWithValue("@quantidade", dado.Quantidade);
                sql.Parameters.AddWithValue("@subtotal", dado.Subtotal);
                sql.ExecuteNonQuery();
                con.FecharConexao();
                MessageBox.Show(" cadastrado com Sucesso");
            }
            catch (Exception ex)
            {
                con.FecharConexao();
                throw ex;
            }
        }
    }
}
