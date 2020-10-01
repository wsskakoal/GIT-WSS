using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sistemaorcamento
{
    public class Conexao
    {
        string conexao = "SERVER=localhost;PORT=3307;DATABASE=orcamento;UID=root;PWD=";
        public MySqlConnection con = null;
        public void AbrirConexao()
        {
            try
            {
                con = new MySqlConnection(conexao);
                con.Open();
            }
            catch(Exception ex)
            {
                System.Windows.Forms.MessageBox.Show ("Erro ao conectar " + ex.Message);
            }
        }
        public void FecharConexao()
        {
            try
            {
                con = new MySqlConnection(conexao);
                con.Close();
            }
            catch (Exception ex)
            {
                System.Windows.Forms.MessageBox.Show("Erro ao Fechar " + ex.Message);
            }
        }

    }
}
