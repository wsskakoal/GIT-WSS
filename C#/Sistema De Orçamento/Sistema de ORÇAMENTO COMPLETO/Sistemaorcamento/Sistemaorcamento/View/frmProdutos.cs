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
   
    public partial class frmProdutos : Form
    {
        ProdutoModel model = new ProdutoModel();
        UnidadeModel modelU = new UnidadeModel();
        FornecedorModel modelF = new FornecedorModel();
        public frmProdutos()
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

        private void BtnSalvar_Click(object sender, EventArgs e)
        {
            if (txtNome.Text == "")
            {
                MessageBox.Show("Preencha o campo Nome");
                return;
            }

            Produtos dados = new Produtos();
            Salvar(dados);
            LimparCampos();
            DesabilitarCampos();
            Listar();
            btnSalvar.Enabled = false;
        }

        private void BtnEditar_Click(object sender, EventArgs e)
        {
            if (txtCodigo.Text == "")
            {
                MessageBox.Show("selecione um registro", "Alerta", MessageBoxButtons.OK);
                return;
            }

            Produtos dados = new Produtos();
            Editar(dados);
            Listar();
            LimparCampos();
            DesabilitarCampos();
        }

        private void BtnExcluir_Click(object sender, EventArgs e)
        {
            if (txtCodigo.Text == "")
            {
                MessageBox.Show("selecione um registro", "Alerta", MessageBoxButtons.OK);
                return;
            }

            if (MessageBox.Show("Deseja Excluir o Orçamento?", "Alerta", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == DialogResult.No)

            {
                return;
            }

            Produtos dados = new Produtos();
            Excluir(dados);
            Listar();
            LimparCampos();
            DesabilitarCampos();
        }

        private void Dg_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtId.Text = dg.CurrentRow.Cells[0].Value.ToString();
            txtCodigo.Text = dg.CurrentRow.Cells[1].Value.ToString();
            cbFornecedor.Text = dg.CurrentRow.Cells[2].Value.ToString();
            txtNome.Text = dg.CurrentRow.Cells[3].Value.ToString();
            txtDescricao.Text = dg.CurrentRow.Cells[4].Value.ToString();
            cbUnidade.Text = dg.CurrentRow.Cells[5].Value.ToString();
            txtValor.Text = dg.CurrentRow.Cells[6].Value.ToString();
            btnSalvar.Enabled = false;
            HabilitarCampos();
        }

        private void TxtBuscar_TextChanged(object sender, EventArgs e)
        {
            Produtos dados = new Produtos();
            Buscar(dados);
            if (txtBuscar.Text == "")
            {
                Listar();
                return;
            }
        }



        // INICIO DA IMPLEMENTACAO DOS CHAMADOS 

        private void HabilitarCampos()
        {
            txtNome.Enabled = true;
            txtCodigo.Enabled = true;
            txtDescricao.Enabled = true;
            txtValor.Enabled = true;
            cbUnidade.Enabled = true;
            cbFornecedor.Enabled = true;


        }

        private void DesabilitarCampos()
        {
            txtNome.Enabled = false;
            txtCodigo.Enabled = false;
            txtDescricao.Enabled = false;
            txtValor.Enabled = false;
            cbUnidade.Enabled = false;
            cbFornecedor.Enabled = false;

        }

        private void LimparCampos()
        {
            txtNome.Text = "";
            txtCodigo.Text = "";
            txtDescricao.Text = "";
            txtValor.Text = "";
            cbUnidade.Text = "";
            txtId.Text = "";
            cbFornecedor.Text = "";

        }
        private void PreencherCB()
        {
            cbUnidade.DataSource = modelU.Listar();
            cbUnidade.ValueMember = "id_unidade";
            cbUnidade.DisplayMember = "unidade";

            cbFornecedor.DataSource = modelF.Listar();
            cbFornecedor.ValueMember = "id_fornecedor";
            cbFornecedor.DisplayMember = "nome";
        }

        private void Listar()
        {
            try
            {
                dg.DataSource = model.Listar();
                dg.Columns[0].Visible = false;
                dg.Columns[1].HeaderText = "Código";
                dg.Columns[2].HeaderText = "Fornecedor";
                dg.Columns[3].HeaderText = "Nome";
                dg.Columns[4].HeaderText = "Descrição";
                dg.Columns[5].HeaderText = "Unidade";
                dg.Columns[6].HeaderText = "Valor";

                dg.Columns[3].Width = 150;
                dg.Columns[4].Width = 150;
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao listar " + ex.Message);
            }
        }
        private void Salvar(Produtos dado)
        {
            try
            {
               
                dado.Codigo = txtCodigo.Text;
                dado.Nome = txtNome.Text;
                dado.Descricao = txtDescricao.Text;
                dado.Valor = Convert.ToDecimal(txtValor.Text);
                dado.Id_fornecedor = Convert.ToInt32(cbFornecedor.SelectedValue);
                dado.Id_unidade = Convert.ToInt32(cbUnidade.SelectedValue);
                model.Salvar(dado);
                MessageBox.Show("salvo com sucesso!");
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao salvar " + ex.Message);
            }
        }
        private void Buscar(Produtos dado)
        {
            try
            {
                dado.Nome = txtBuscar.Text;
                dado.Codigo = txtBuscar.Text;
                dg.DataSource = model.Buscar(dado);
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Pesquisa " + ex.Message);
            }
        }

        private void Editar(Produtos dado)
        {
            try
            {
                dado.Id_produto = Convert.ToInt32(txtId.Text);
                dado.Codigo = txtCodigo.Text;
                dado.Nome = txtNome.Text;
                dado.Descricao = txtDescricao.Text;
                dado.Valor = Convert.ToDecimal(txtValor.Text);
                dado.Id_fornecedor = Convert.ToInt32(cbFornecedor.SelectedValue);
                dado.Id_unidade = Convert.ToInt32(cbUnidade.SelectedValue);
               
            
                model.Editar(dado);
                MessageBox.Show("Editado com sucesso");

            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Editar " + ex.Message);
            }
        }
        private void Excluir(Produtos dados)
        {
            dados.Id_produto = Convert.ToInt32(txtId.Text);
            model.Excluir(dados);
            MessageBox.Show("Fornecedor excluido com Sucesso");
        }
    }
}
