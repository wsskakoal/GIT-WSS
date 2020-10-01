using Login.Dados;
using Login.Entidades;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Login
{
    public partial class frmLogin : Form
    {
        DadosUsuarios dados = new DadosUsuarios();
        public frmLogin()
        {
            InitializeComponent();
        }

        private void BtnEntrar_Click(object sender, EventArgs e)
        {
            Usuarios logar = new Usuarios();
            logar.Usuario = txtUsuario.Text;
            logar.Senha = GerarMD5(txtSenha.Text);
            dados.Login(logar);
        }

        public static string GerarMD5(string input)
        {
            MD5 md5Hash = MD5.Create();
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }
            return sBuilder.ToString();
        }

        private void BtnCadastrar_Click(object sender, EventArgs e)
        {
            Usuarios logar = new Usuarios();
            logar.Usuario = txtUsuario.Text;
            logar.Senha = GerarMD5(txtSenha.Text);
            dados.Cadastro(logar);
            txtUsuario.Text = "";
            txtSenha.Text = "";
        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void timer1_Tick(object sender, EventArgs e)
        {

        }
    }
}
