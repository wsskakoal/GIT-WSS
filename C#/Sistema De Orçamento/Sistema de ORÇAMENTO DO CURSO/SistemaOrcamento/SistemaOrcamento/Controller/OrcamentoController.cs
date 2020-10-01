using MySql.Data.MySqlClient;
using SistemaOrcamento.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SistemaOrcamento.Controller
{
   public class OrcamentoController
    {
        MySqlCommand sql;
        Conexao con = new Conexao();

        public DataTable Listar()
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("SELECT * FROM orcamentos order by data desc", con.con);
                MySqlDataAdapter da = new MySqlDataAdapter();
                da.SelectCommand = sql;
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public DataTable ListarOrcamento()
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("SELECT orc.id_orcamento, orc.numero_orcamento, pro.nome, cli.nome, pro.valor, orc.quantidade, orc.valor_total, orc.data, orc.id_produto, orc.id_cliente FROM orcamentos orc INNER JOIN produtos pro on (pro.id_produto = orc.id_produto) INNER JOIN clientes cli on (cli.id_cliente = orc.id_cliente) order by id_orcamento desc", con.con);
                MySqlDataAdapter da = new MySqlDataAdapter();
                da.SelectCommand = sql;
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }


        public void Editar(Orcamentos dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("UPDATE orcamentos SET numero_orcamento = @numero_orcamento, id_produto = @id_produto, id_cliente = @id_cliente, quantidade = @quantidade, valor_total = @valor_total, data = @data WHERE id_orcamento = @id", con.con);
                ;
                sql.Parameters.AddWithValue("@numero_orcamento", dado.Num_orcamento);
                sql.Parameters.AddWithValue("@id_produto", dado.Id_produto);
                sql.Parameters.AddWithValue("@id_cliente", dado.Id_cliente);
                sql.Parameters.AddWithValue("@quantidade", dado.Quantidade);
                sql.Parameters.AddWithValue("@valor_total", dado.Valor_total);
                sql.Parameters.AddWithValue("@data", dado.Data);
                sql.Parameters.AddWithValue("@id", dado.Id_orcamento);

                sql.ExecuteNonQuery();
                con.FecharConexao();
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Editar " + ex.Message);
                con.FecharConexao();
            }
        }


        public DataTable Buscar(Orcamentos dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("SELECT orc.id_orcamento, orc.numero_orcamento, pro.nome, cli.nome, pro.valor, orc.quantidade, orc.valor_total, orc.data, orc.id_produto, orc.id_cliente FROM orcamentos orc INNER JOIN produtos pro on (pro.id_produto = orc.id_produto) INNER JOIN clientes cli on (cli.id_cliente = orc.id_cliente) where orc.numero_orcamento = @num_orcamento or orc.id_cliente = @id_Cliente or orc.data = @data", con.con);

                sql.Parameters.AddWithValue("@num_orcamento", dado.Num_orcamento);
                sql.Parameters.AddWithValue("@id_cliente", dado.Id_cliente);
                sql.Parameters.AddWithValue("@data", dado.Data);

                MySqlDataAdapter da = new MySqlDataAdapter();
                da.SelectCommand = sql;
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {

                throw ex;
                con.FecharConexao();
            }
        }


        public void Excluir(Orcamentos dado)
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

                MessageBox.Show("Erro ao Excluir " + ex.Message);
                con.FecharConexao();
            }
        }



        public void Inserir(Orcamentos dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("INSERT INTO orcamentos (numero_orcamento, id_produto, id_cliente, quantidade, valor_total, data) values (@numero_orcamento, @id_produto, @id_cliente, @quantidade, @valor_total, @data)", con.con);

                sql.Parameters.AddWithValue("@numero_orcamento", dado.Num_orcamento);
                sql.Parameters.AddWithValue("@id_produto", dado.Id_produto);
                sql.Parameters.AddWithValue("@id_cliente", dado.Id_cliente);
                sql.Parameters.AddWithValue("@quantidade", dado.Quantidade);
                sql.Parameters.AddWithValue("@valor_total", dado.Valor_total);
                sql.Parameters.AddWithValue("@data", dado.Data);

                sql.ExecuteNonQuery();
                con.FecharConexao();
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Salvar " + ex.Message);
                con.FecharConexao();
            }
        }
    }
}
