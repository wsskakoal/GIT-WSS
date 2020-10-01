using Login.Entidades;
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
    class DadosUsuarios
    {
        MySqlCommand sql;
        Conexao con = new Conexao();
        

        public void Login(Usuarios dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("SELECT * FROM usuarios WHERE usuario like @usuario and senha like @senha", con.con);
                sql.Parameters.AddWithValue("@usuario", dado.Usuario);
                sql.Parameters.AddWithValue("@senha", dado.Senha);
                MySqlDataAdapter da = new MySqlDataAdapter();
                da.SelectCommand = sql;
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    frmPainel frm = new frmPainel();
                    frm.ShowDialog();
                }
                else
                {
                    MessageBox.Show("Usuario ou Senha Incorreto");
                }
              
            }
            catch (Exception ex)
            {
                con.FecharConexao();
                throw ex;
            }
        }

        public void Cadastro(Usuarios dado)
        {
            try
            {
                con.AbrirConexao();
                sql = new MySqlCommand("INSERT INTO usuarios (usuario, senha) VALUES (@usuario, @senha)", con.con);
                sql.Parameters.AddWithValue("@id", dado.Id_usuario);
                sql.Parameters.AddWithValue("@usuario", dado.Usuario);
                sql.Parameters.AddWithValue("@senha", dado.Senha);
                sql.ExecuteNonQuery();
                con.FecharConexao();
                MessageBox.Show("Usuario cadastrado com Sucesso");
            }
            catch (Exception ex)
            {
                con.FecharConexao();
                throw ex;
            }
        }
    }
}
