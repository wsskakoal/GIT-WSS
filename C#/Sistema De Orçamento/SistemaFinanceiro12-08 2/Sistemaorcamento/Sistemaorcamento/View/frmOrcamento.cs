using Sistemaorcamento.Entidades;
using Sistemaorcamento.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Sistemaorcamento.View
{
    public partial class frmOrcamento : Form
    {
        OrcamentoModel model = new OrcamentoModel();
        ProdutoModel modelP = new ProdutoModel();
        ClienteModel modelC = new ClienteModel();
        public frmOrcamento()
        {
            
            InitializeComponent();
            Listar();
            PreencherCB();
        }

     

        private void BtnNovo_Click(object sender, EventArgs e)
        {
            HabilitarCampos();
            LimparCampos();
            btnSalvar.Enabled = true;
        }
        private void button2_Click(object sender, EventArgs e)
        {
            if (txtorcamento.Text == "")
            {
                MessageBox.Show("Preencha o campo n orçamento");
                return;
            }

            Orcamento dados = new Orcamento();
            Salvar(dados);
            LimparCampos();
            DesabilitarCampos();
            Listar();
            btnSalvar.Enabled = false;
        }

        private void BtnEditar_Click(object sender, EventArgs e)
        {
            if (txtorcamento.Text == "")
            {
                MessageBox.Show("selecione um registro", "Alerta", MessageBoxButtons.OK);
                return;
            }

            Orcamento dados = new Orcamento();
            Editar(dados);
            Listar();
            LimparCampos();
            DesabilitarCampos();
        }

        private void BtnExcluir_Click(object sender, EventArgs e)
        {
            if (txtId.Text == "")
            {
                MessageBox.Show("Selecione um registro", "Alerta", MessageBoxButtons.OK);
                return;
            }

            if (MessageBox.Show("Deseja Excluir o Orçamento?", "Alerta", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == DialogResult.No)

            {
                return;
            }

            Orcamento dados = new Orcamento();
            Excluir(dados);
            Listar();
            LimparCampos();
            DesabilitarCampos();
        }

        private void Dg_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtId.Text = dg.CurrentRow.Cells[0].Value.ToString();
            txtorcamento.Text = dg.CurrentRow.Cells[1].Value.ToString();
            cbProduto.Text = dg.CurrentRow.Cells[2].Value.ToString();
            cbCliente.Text = dg.CurrentRow.Cells[3].Value.ToString();
            txtQuantidade.Text = dg.CurrentRow.Cells[4].Value.ToString();
            lbTotal.Text = dg.CurrentRow.Cells[5].Value.ToString();
            dtData.Text = dg.CurrentRow.Cells[6].Value.ToString();
            PreencherCB();
            HabilitarCampos();
        }

        private void TxtBuscar_TextChanged(object sender, EventArgs e)
        {
            Orcamento dados = new Orcamento();
            Buscar(dados);
            if (txtBuscar.Text == "")
            {
                Listar();
                return;
            }
        }


        private void HabilitarCampos()
        {
            txtorcamento.Enabled = true;
            txtQuantidade.Enabled = true;
            cbCliente.Enabled = true;
            dtData.Enabled = true;
            cbProduto.Enabled = true;
           


        }

        private void DesabilitarCampos()
        {
            txtorcamento.Enabled = false;
            txtQuantidade.Enabled = false;
            cbCliente.Enabled = false;
            dtData.Enabled = false;
            cbProduto.Enabled = false;

        }

        private void LimparCampos()
        {
            txtorcamento.Text = "";
            txtQuantidade.Text = "";
            cbCliente.Text = "";
            dtData.Text = "";
            cbProduto.Text = "";
            txtId.Text = "";
            lbTotal.Text = "";
          

        }
        private void PreencherCB()
        {
            cbProduto.DataSource = modelP.Listar();
            cbProduto.ValueMember = "id_produto";
            cbProduto.DisplayMember = "codigo";

            cbCliente.DataSource = modelC.Listar();
            cbCliente.ValueMember = "id_cliente";
            cbCliente.DisplayMember = "nome";


        }

        private void Listar()
        {
            try
            {
                dg.DataSource = model.Listar();
                dg.Columns[0].Visible = false;
                dg.Columns[1].HeaderText = "N Orcamento";
                dg.Columns[2].HeaderText = "Produto";
                dg.Columns[3].HeaderText = "Cliente";
                dg.Columns[4].HeaderText = "Quantidade";
                dg.Columns[5].HeaderText = "Valor Total";
                dg.Columns[6].HeaderText = "Data";

                dg.Columns[3].Width = 150;
                dg.Columns[2].Width = 150;
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao listar " + ex.Message);
            }
        }
        private void Salvar(Orcamento dado)
        {
            try
            {
                

                dado.Numero_orcamento = txtorcamento.Text;
                dado.Id_produto = Convert.ToInt32(cbProduto.SelectedValue);
                dado.Id_cliente = Convert.ToInt32(cbCliente.SelectedValue);
                dado.Quantidade = Convert.ToInt32(txtQuantidade.Text);
                dado.Valor_total = 0;
                dado.Data = dtData.Value;
                model.Salvar(dado);
                MessageBox.Show("salvo com sucesso!");
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao salvar " + ex.Message);
            }
        }
        private void Buscar(Orcamento dado)
        {
            try
            {
                dado.Numero_orcamento = txtBuscar.Text;
                
                dg.DataSource = model.Buscar(dado);
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Pesquisa " + ex.Message);
            }
        }

        private void Editar(Orcamento dado)
        {
            try
            {
                dado.Id_produto = Convert.ToInt32(txtId.Text);
                dado.Numero_orcamento = txtorcamento.Text;
                dado.Id_produto = Convert.ToInt32(cbProduto.SelectedValue);
                dado.Id_cliente = Convert.ToInt32(cbCliente.SelectedValue);
                dado.Quantidade = Convert.ToInt32(txtQuantidade.Text);
                dado.Valor_total = 0;
                dado.Data = Convert.ToDateTime(dtData.Value);


                //model.Editar(dado);
                MessageBox.Show("Editado com sucesso");

            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Editar " + ex.Message);
            }
        }
        private void Excluir(Orcamento dados)
        {
            dados.Id_produto = Convert.ToInt32(txtId.Text);
            model.Excluir(dados);
            MessageBox.Show("Fornecedor excluido com Sucesso");
        }

      
    }
}
