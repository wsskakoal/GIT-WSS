using Login.Dados;
using Login.Entidades;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Login.Paginas
{
    public partial class frmNovoCaixa : Form
    {
        DadosProdutos dadoP = new DadosProdutos();
        DadosCaixa dadoC = new DadosCaixa();
        DadosPedidos dadoPedidos = new DadosPedidos();
        public frmNovoCaixa()
        {
            InitializeComponent();
            Novocaixa();

        }

        private void Novocaixa()
        {
            Caixas dado = new Caixas();
            dado.Valortotal = 0;
            dadoC.Cadastro(dado);
            txtIdcaixa.Text = Convert.ToString(dado.Id_caixa);
        }

        private void Button1_Click(object sender, EventArgs e)
        {
            Pedidos dado = new Pedidos();
            dado.Id_caixa = Convert.ToInt32(txtIdcaixa.Text);
            dado.Id_produto = Convert.ToInt32(txtCodigo);
            dado.Quantidade = Convert.ToInt32(Numquantidade.Value);
            dadoPedidos.Cadastro(dado);
            
        }
    }
}
