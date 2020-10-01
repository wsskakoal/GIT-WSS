using SistemaOrcamento.Entidades;
using SistemaOrcamento.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SistemaOrcamento.View
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


                dg.Columns[4].Width = 150;
                dg.Columns[3].Width = 120;

                

            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Listar os Dados" + ex.Message);
            }
        }


        private void HabilitarCampos()
        {
            txtNome.Enabled = true;
            txtValor.Enabled = true;
            txtCodProduto.Enabled = true;
            txtDescricao.Enabled = true;
            cbUnidade.Enabled = true;
            cbFornecedor.Enabled = true;

        }


        private void DesabilitarCampos()
        {
            txtNome.Enabled = false;
            txtValor.Enabled = false;
            txtCodProduto.Enabled = false;
            txtDescricao.Enabled = false;
            cbUnidade.Enabled = false;
            cbFornecedor.Enabled = false;


        }


        private void Limpar()
        {
            txtNome.Text = "";
            txtValor.Text = "";
            txtCodigo.Text = "";
            txtDescricao.Text = "";
            txtCodProduto.Text = ""; ;
        }


        private void Salvar(Produtos dado)
        {

            try
            {
                dado.Codigo = txtCodProduto.Text;
                dado.Nome = txtNome.Text;
                dado.Descricao = txtDescricao.Text;
                dado.Valor = Convert.ToDecimal(txtValor.Text);
                dado.Id_fornecedor = Convert.ToInt32(cbFornecedor.SelectedValue);
                dado.Id_unidade = Convert.ToInt32(cbUnidade.SelectedValue);

                model.Salvar(dado);

                MessageBox.Show("Registro salvo com sucesso!");
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao salvar " + ex.Message);
            }
        }

        public void Buscar(Produtos dado)
        {
            try
            {
                dado.Nome = txtBuscar.Text;
                dado.Codigo = txtBuscar.Text;

                dg.DataSource = model.Buscar(dado);

            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Listar os Dados" + ex.Message);
            }
        }


        public void Editar(Produtos dado)
        {

            try
            {
                dado.Id_produto = Convert.ToInt32(txtCodigo.Text);
                dado.Codigo = txtCodProduto.Text;
                dado.Nome = txtNome.Text;
                dado.Descricao = txtDescricao.Text;
                dado.Valor = Convert.ToDecimal(txtValor.Text);
                dado.Id_fornecedor = Convert.ToInt32(cbFornecedor.SelectedValue);
                dado.Id_unidade = Convert.ToInt32(cbUnidade.SelectedValue);


                model.Editar(dado);
                MessageBox.Show("Registro Editado com Sucesso!");
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Editar " + ex.Message);
            }
        }


        public void Excluir(Produtos dado)
        {

            try
            {
                dado.Id_produto = Convert.ToInt32(txtCodigo.Text);


                model.Excluir(dado);
                MessageBox.Show("Registro excluido com Sucesso!");
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Excluir " + ex.Message);
            }
        }

        private void btnNovo_Click(object sender, EventArgs e)
        {
            HabilitarCampos();
            btnSalvar.Enabled = true;
            Limpar();
        }

        private void btnSalvar_Click(object sender, EventArgs e)
        {
            if (txtNome.Text == "")
            {
                MessageBox.Show("Preencha o Campo Nome!");
                return;
            }

            Produtos dados = new Produtos();
            Salvar(dados);
            Listar();
            Limpar();
            DesabilitarCampos();
            btnSalvar.Enabled = false;
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            if (txtCodigo.Text == "")
            {
                MessageBox.Show("Selecione na tabela um registro para edição!");
                return;
            }
            Produtos dados = new Produtos();
            Editar(dados);
            Listar();
            Limpar();
            DesabilitarCampos();
        }

        private void btnExcluir_Click(object sender, EventArgs e)
        {
            if (txtCodigo.Text == "")
            {
                MessageBox.Show("Selecione na tabela um registro para excluir!", "Alerta", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }

            if (MessageBox.Show("Deseja Excluir o Orçamento?", "Alerta", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2) == DialogResult.No)
            {
                return;
            }
            Produtos dados = new Produtos();
            Excluir(dados);
            Listar();
            Limpar();
            DesabilitarCampos();
        }

        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            Produtos dados = new Produtos();
            Buscar(dados);

            if (txtBuscar.Text == "")
            {

                Listar();
                return;
            }
        }

        private void dg_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtCodigo.Text = dg.CurrentRow.Cells[0].Value.ToString();
            txtCodProduto.Text = dg.CurrentRow.Cells[1].Value.ToString();
            cbFornecedor.Text = dg.CurrentRow.Cells[2].Value.ToString();
            txtNome.Text = dg.CurrentRow.Cells[3].Value.ToString();
            txtDescricao.Text = dg.CurrentRow.Cells[4].Value.ToString();
            cbUnidade.Text = dg.CurrentRow.Cells[5].Value.ToString();
            txtValor.Text = dg.CurrentRow.Cells[6].Value.ToString();

            HabilitarCampos();
        }
    }
}
