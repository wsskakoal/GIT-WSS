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
            if (txtId.Text == "")
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
                MessageBox.Show("selecione um registro", "Alerta", MessageBoxButtons.OK);
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
            Produtos dados = new Produtos();
            ListarValor(dados);
            txtId.Text = dg.CurrentRow.Cells[0].Value.ToString();
            txtorcamento.Text = dg.CurrentRow.Cells[1].Value.ToString();
            cbProduto.SelectedValue = dg.CurrentRow.Cells[2].Value.ToString();
            cbCliente.SelectedValue = dg.CurrentRow.Cells[3].Value.ToString();
            txtQuantidade.Text = dg.CurrentRow.Cells[4].Value.ToString();
            lbTotal.Text = dg.CurrentRow.Cells[5].Value.ToString();
            dtData.Text = dg.CurrentRow.Cells[6].Value.ToString();
            ListarValor(dados);
            HabilitarCampos();
            txtQuantidade.Enabled = true;
            btnSalvar.Enabled = false;
           
        }

        private void TxtBuscar_TextChanged(object sender, EventArgs e)
        {
            Orcamento dados = new Orcamento();
            Buscar(dados);
            txtTotalorcamento.Text = ValorTotal().ToString();
            if (txtBuscar.Text == "")
            {
                Listar();
                return;
            }
        }


        private void HabilitarCampos()
        {
            txtorcamento.Enabled = true;
            //txtQuantidade.Enabled = true;
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
            cbProduto.DataSource = modelP.ListarNormal();
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
              
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao listar " + ex.Message);
            }
        }
        private void ListarValor(Produtos dado)
        {
            try
            {
                dado.Id_produto = Convert.ToInt32(cbProduto.SelectedValue);
                dgValor.DataSource = modelP.ListarValor(dado);
                txtValor.Text = dgValor.CurrentRow.Cells[0].Value.ToString();

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
                dado.Valor_total = Convert.ToDecimal(lbTotal.Text);
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
                dado.Id_orcamento = Convert.ToInt32(txtId.Text);
                dado.Numero_orcamento = txtorcamento.Text;
                dado.Id_produto = Convert.ToInt32(cbProduto.SelectedValue);
                dado.Id_cliente = Convert.ToInt32(cbCliente.SelectedValue);
                dado.Quantidade = Convert.ToInt32(txtQuantidade.Text);
                dado.Valor_total = Convert.ToDecimal(lbTotal.Text);
                dado.Data = Convert.ToDateTime(dtData.Value);


                model.Editar(dado);
                MessageBox.Show("Editado com sucesso");

            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Editar " + ex.Message);
            }
        }
        private void Excluir(Orcamento dados)
        {
            dados.Id_orcamento = Convert.ToInt32(txtId.Text);
            model.Excluir(dados);
            MessageBox.Show("Fornecedor excluido com Sucesso");
        }

        private void CbProduto_SelectionChangeCommitted(object sender, EventArgs e)
        {
            txtQuantidade.Enabled = true;
            Produtos dados = new Produtos();
            ListarValor(dados);

        }

        private void TxtQuantidade_TextChanged(object sender, EventArgs e)
        {
            if (txtQuantidade.Text == "")
            {
                lbTotal.Text = "";
                return;
            }
            decimal total;
            total = Convert.ToDecimal(txtQuantidade.Text) * Convert.ToDecimal(txtValor.Text);
            lbTotal.Text = total.ToString();
           
        }

        private void CbProduto_SelectedIndexChanged(object sender, EventArgs e)
        {
          
        }

        private void BtnAdd_Click(object sender, EventArgs e)
        {
            if (txtQuantidade.Text == "")
            {
                MessageBox.Show("Digite a quantidade");
                return;
            }
            Orcamento dados = new Orcamento();
            Salvar(dados);
            Listar();


            

            cbCliente.Enabled = false;
            txtorcamento.Enabled = false;
            txtQuantidade.Text = "";
            btnEditar.Enabled = false;
            btnExcluir.Enabled = false;
            cbProduto.Enabled = true;
         
        }

        private decimal ValorTotal()
        {
            decimal total = 0;
            int i = 0;

            for (i = 0; i < dg.Rows.Count; i++)
            {
                total = total + Convert.ToDecimal(dg.Rows[i].Cells[5].Value);
                
            }
            return total;
        }
    }
}
