using Sistemaorcamento.Model;
using Sistemaorcamento.View;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Sistemaorcamento
{
    public partial class Principal : Form

    {
        OrcamentoModel model = new OrcamentoModel();
       
        public Principal()
        {
            InitializeComponent();
            Listar();
        }

        private void Listar()
        {
            try
            {
                dg.DataSource = model.Listar();

            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao listar " + ex.Message);
            }
        }

        private void cadastroToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void fornecedorToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmFornecedores frm = new frmFornecedores();
            frm.ShowDialog();
        }

        private void sairToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            Application.Exit();

        }

        private void ClienteToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmClientes frm = new frmClientes();
            frm.ShowDialog();
        }

        private void ProdutosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmProdutos frm = new frmProdutos();
            frm.ShowDialog();
        }

        private void UnidadesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmUnidades frm = new frmUnidades();
            frm.ShowDialog();
        }

        private void NovoOrçamentoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmOrcamento frm = new frmOrcamento();
            frm.ShowDialog();
        }

        private void Panel1_Click(object sender, EventArgs e)
        {
            frmOrcamento frm = new frmOrcamento();
            frm.ShowDialog();
        }
    }
}
