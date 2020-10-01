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
    class DadosCaixa
    {
        MySqlCommand sql;
        Conexao con = new Conexao();


        public void Pesquisa(Caixas dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("SELECT * FROM caixa WHERE id_caixa like @id", con.con);
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

        public void Cadastro(Caixas dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("INSERT INTO caixas (id_cliente, data, valortotal) VALUES (@id_cliente, @data, @valortotal)", con.con);
                sql.Parameters.AddWithValue("@id_cliente", dado.Id_cliente);
                sql.Parameters.AddWithValue("@data", dado.Data);
                sql.Parameters.AddWithValue("@valortotal", dado.Valortotal);
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
