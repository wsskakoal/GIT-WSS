using MySql.Data.MySqlClient;
using Sistemaorcamento.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Sistemaorcamento.Controller
{
    class orcamentoController
    {
        MySqlCommand sql;
        Conexao con = new Conexao();

        public DataTable Listar()
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("SELECT * FROM orcamentos ORDER BY data desc", con.con);
                MySqlDataAdapter da = new MySqlDataAdapter();
                da.SelectCommand = sql;
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                con.FecharConexao();

                throw ex;


            }
        }

        public void Editar(Orcamento dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("UPDATE orcamentos SET numero_orcamento = @orcamento, id_produto = @idproduto, id_cliente = @idcliente, quantidade = @quantidade, valor_total = @valortotal, data = @data WHERE id_orcamento = @id", con.con);

                sql.Parameters.AddWithValue("@orcamento", dado.Numero_orcamento);
                sql.Parameters.AddWithValue("@idproduto", dado.Id_produto);
                sql.Parameters.AddWithValue("@idcliente", dado.Id_cliente);
                sql.Parameters.AddWithValue("@quantidade", dado.Quantidade);
                sql.Parameters.AddWithValue("@valortotal", dado.Valor_total);
                sql.Parameters.AddWithValue("@data", dado.Data);
                sql.Parameters.AddWithValue("@id", dado.Id_orcamento);
                sql.ExecuteNonQuery();
                con.FecharConexao();

            }
            catch (Exception ex)
            {
                MessageBox.Show("Erro ao Editar" + ex.Message);
                con.FecharConexao();

            }
        }

        public DataTable Buscar(Orcamento dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("SELECT * FROM orcamentos WHERE numero_orcamento like @orcamento", con.con);
                sql.Parameters.AddWithValue("@orcamento", dado.Numero_orcamento);
                
                MySqlDataAdapter da = new MySqlDataAdapter();
                da.SelectCommand = sql;
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;

            }
            catch (Exception ex)
            {
                con.FecharConexao();

                throw ex;


            }
        }

        public void Excluir(Orcamento dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("DELETE FROM orcamentos WHERE id_orcamento = @id", con.con);

                sql.Parameters.AddWithValue("@id", dado.Id_orcamento);
                sql.ExecuteNonQuery();
                con.FecharConexao();

            }
            catch (Exception ex)
            {
                con.FecharConexao();

                throw ex;

            }
        }

        public void Inserir(Orcamento dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("INSERT INTO orcamentos (numero_orcamento, id_produto, id_cliente, quantidade, valor_total, data) VALUES (@orcamento, @idproduto, @idcliente, @quantidade, @valortotal, @data)", con.con);

                sql.Parameters.AddWithValue("@orcamento", dado.Numero_orcamento);
                sql.Parameters.AddWithValue("@idproduto", dado.Id_produto);
                sql.Parameters.AddWithValue("@idcliente", dado.Id_cliente);
                sql.Parameters.AddWithValue("@quantidade", dado.Quantidade);
                sql.Parameters.AddWithValue("@valortotal", dado.Valor_total);
                sql.Parameters.AddWithValue("@data", dado.Data);
               

                sql.ExecuteNonQuery();
                con.FecharConexao();

            }
            catch (Exception ex)
            {

                con.FecharConexao();
                throw ex;


            }
        }
    }
}
