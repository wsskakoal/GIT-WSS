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
    public class UnidadeController
    {
        MySqlCommand sql;
        Conexao con = new Conexao();

        public DataTable Listar()
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("SELECT * FROM unidades order by unidade asc", con.con);
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


        public void Editar(Unidades dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("UPDATE unidades SET unidade = @unidade WHERE id_unidade = @id", con.con);
                ;
                sql.Parameters.AddWithValue("@unidade", dado.Unidade);
               
                sql.Parameters.AddWithValue("@id", dado.Id_unidade);
                sql.ExecuteNonQuery();
                con.FecharConexao();
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Editar " + ex.Message);
                con.FecharConexao();
            }
        }


        

        public void Excluir(Unidades dado)
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

                MessageBox.Show("Erro ao Excluir " + ex.Message);
                con.FecharConexao();
            }
        }



        public void Inserir(Unidades dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("INSERT INTO unidades (unidade) values (@unidade)", con.con);

                sql.Parameters.AddWithValue("@unidade", dado.Unidade);
               

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
