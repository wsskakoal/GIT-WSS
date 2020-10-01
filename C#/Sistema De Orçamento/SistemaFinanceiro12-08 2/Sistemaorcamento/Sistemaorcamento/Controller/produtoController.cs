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
    public class produtoController
    {
        MySqlCommand sql;
        Conexao con = new Conexao();

        public DataTable Listar()
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("SELECT prod.id_produto, prod.codigo, forn.nome, prod.nome, prod.descricao, unid.unidade, prod.valor FROM produtos prod INNER JOIN fornecedores forn on (forn.id_fornecedor = prod.id_fornecedor) INNER JOIN unidades unid on (unid.id_unidade = prod.id_unidade) ORDER BY prod.nome desc", con.con);
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

        public void Editar(Produtos dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("UPDATE produtos SET codigo = @codigo, id_fornecedor = @idfornecedor, nome = @nome,descricao = @descricao,id_unidade = @idunidade, valor = @valor WHERE id_produto = @id", con.con);

                sql.Parameters.AddWithValue("@codigo", dado.Codigo);
                sql.Parameters.AddWithValue("@idfornecedor", dado.Id_fornecedor);
                sql.Parameters.AddWithValue("@nome", dado.Nome);
                sql.Parameters.AddWithValue("@descricao", dado.Descricao);
                sql.Parameters.AddWithValue("@idunidade", dado.Id_unidade);
                sql.Parameters.AddWithValue("@valor", dado.Valor);
                sql.Parameters.AddWithValue("@id", dado.Id_produto);
                sql.ExecuteNonQuery();
                con.FecharConexao();

            }
            catch (Exception ex)
            {
                MessageBox.Show("Erro ao Editar" + ex.Message);
                con.FecharConexao();

            }
        }

        public DataTable Buscar(Produtos dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("SELECT * FROM Produtos WHERE nome like @nome or codigo like @codigo", con.con);
                sql.Parameters.AddWithValue("@codigo", dado.Codigo + "%");
                sql.Parameters.AddWithValue("@nome", dado.Nome + "%");
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

        public void Excluir(Produtos dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("DELETE FROM unidades WHERE id_unidade = @id", con.con);
                sql.Parameters.AddWithValue("@id", dado.Id_unidade);
                sql.ExecuteNonQuery();
                con.FecharConexao();

            }
            catch (Exception ex)
            {
                con.FecharConexao();

                throw ex;

            }
        }

        public void Inserir(Produtos dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("INSERT INTO produtos (codigo, id_fornecedor, nome, descricao, id_unidade, valor) VALUES (@codigo, @idfornecedor, @nome, @descricao, @idunidade, @valor)", con.con);
                sql.Parameters.AddWithValue("@codigo", dado.Codigo);
                sql.Parameters.AddWithValue("@idfornecedor", dado.Id_fornecedor);
                sql.Parameters.AddWithValue("@nome", dado.Nome);
                sql.Parameters.AddWithValue("@descricao", dado.Descricao);
                sql.Parameters.AddWithValue("@idunidade", dado.Id_unidade);
                sql.Parameters.AddWithValue("@valor", dado.Valor);


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
