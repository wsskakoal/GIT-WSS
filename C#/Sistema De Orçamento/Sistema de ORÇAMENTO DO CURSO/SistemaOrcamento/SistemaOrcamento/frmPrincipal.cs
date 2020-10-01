using SistemaOrcamento.Model;
using SistemaOrcamento.View;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SistemaOrcamento
{
    public partial class frmPrincipal : Form
    {

        OrcamentoModel model = new OrcamentoModel();

        public frmPrincipal()
        {
            InitializeComponent();
            Listar();
        }


        private void Listar()
        {
            try
            {
                dg.DataSource = model.ListarOrcamento();
                dg.Columns[0].Visible = false;
                dg.Columns[8].Visible = false;
                dg.Columns[9].Visible = false;
                dg.Columns[1].HeaderText = "Número Orçamento";
                dg.Columns[2].HeaderText = "Produto";
                dg.Columns[3].HeaderText = "Cliente";
                dg.Columns[5].HeaderText = "Quantidade";
                dg.Columns[4].HeaderText = "Valor Unitário";
                dg.Columns[6].HeaderText = "Valor Total";
                dg.Columns[7].HeaderText = "Data";






            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Listar os Dados" + ex.Message);
            }
        }


        private void sairToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void fornecedoresToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmFornecedores frm = new frmFornecedores();
            frm.ShowDialog();
        }

        private void clientesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmClientes frm = new frmClientes();
            frm.ShowDialog();
        }

        private void unidadesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmUnidades frm = new frmUnidades();
            frm.ShowDialog();
        }

        private void produtosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmProdutos frm = new frmProdutos();
            frm.ShowDialog();
        }

        private void novoOrçamentoToolStripMenuItem_Click(object sender, EventArgs e)
        {
            frmOrcamentos frm = new frmOrcamentos();
            frm.ShowDialog();
        }

        private void panel1_Click(object sender, EventArgs e)
        {
            frmOrcamentos frm = new frmOrcamentos();
            frm.ShowDialog();
        }
    }
}
