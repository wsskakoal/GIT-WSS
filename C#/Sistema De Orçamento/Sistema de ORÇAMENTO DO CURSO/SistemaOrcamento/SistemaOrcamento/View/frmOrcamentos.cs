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
    public partial class frmOrcamentos : Form
    {

        OrcamentoModel model = new OrcamentoModel();
        ProdutoModel modelP = new ProdutoModel();
        ClienteModel modelC = new ClienteModel();

        public frmOrcamentos()
        {
            InitializeComponent();
            Listar();
            PreencherCB();
           
        }


        private void PreencherCB()
        {
            cbProduto.DataSource = modelP.ListarProdutos();
            cbProduto.ValueMember = "id_produto";
            cbProduto.DisplayMember = "nome";

            cbCliente.DataSource = modelC.Listar();
            cbCliente.ValueMember = "id_cliente";
            cbCliente.DisplayMember = "nome";

            
            cbBuscarCliente.DataSource = modelC.Listar();
           
            cbBuscarCliente.ValueMember = "id_cliente";
            cbBuscarCliente.DisplayMember = "nome";
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


        private void HabilitarCampos()
        {
            txtOrcamento.Enabled = true;
            //txtQuantidade.Enabled = true;
            cbCliente.Enabled = true;
            cbProduto.Enabled = true;
            

        }


        private void DesabilitarCampos()
        {
            txtOrcamento.Enabled = false;
            txtQuantidade.Enabled = false;
            cbCliente.Enabled = false;
            cbProduto.Enabled = false;


        }


        private void Limpar()
        {
            txtOrcamento.Text = "";
            txtQuantidade.Text = "";
            txtCodigo.Text = "";
            lbTotal.Text = "";
            txtValor.Text = "";
        }


        private void Salvar(Orcamentos dado)
        {

            try
            {
                dado.Num_orcamento = txtOrcamento.Text;
                dado.Quantidade  = Convert.ToInt32(txtQuantidade.Text);
                dado.Id_produto = Convert.ToInt32(cbProduto.SelectedValue);
                dado.Id_cliente = Convert.ToInt32(cbCliente.SelectedValue);
                dado.Valor_total = Convert.ToDecimal(lbTotal.Text);
                dado.Data = DateTime.Today;
                

                model.Salvar(dado);

                MessageBox.Show("Registro salvo com sucesso!");
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao salvar " + ex.Message);
            }
        }

        public void Buscar(Orcamentos dado)
        {
            try
            {
                dado.Num_orcamento = txtBuscar.Text;
                //dado.Id_cliente = Convert.ToInt32(cbBuscarCliente.SelectedValue);
                //dado.Data = Convert.ToDateTime(dtBuscar.Text);

                dg.DataSource = model.Buscar(dado);

            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Listar os Dados" + ex.Message);
            }
        }



        public void BuscarDT(Orcamentos dado)
        {
            try
            {
                //dado.Num_orcamento = txtBuscar.Text;
                //dado.Id_cliente = Convert.ToInt32(cbBuscarCliente.SelectedValue);
                dado.Data = Convert.ToDateTime(dtBuscar.Text);

                dg.DataSource = model.Buscar(dado);

            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Listar os Dados" + ex.Message);
            }
        }


        public void BuscarCB(Orcamentos dado)
        {
            try
            {
                //dado.Num_orcamento = txtBuscar.Text;
                dado.Id_cliente = Convert.ToInt32(cbBuscarCliente.SelectedValue);
                //dado.Data = Convert.ToDateTime(dtBuscar.Text);

                dg.DataSource = model.Buscar(dado);

            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Listar os Dados" + ex.Message);
            }
        }



        public void BuscarValor(Produtos dado)
        {
            try
            {
                
                dado.Id_produto = Convert.ToInt32(cbProduto.SelectedValue);
                
                dgValor.DataSource = modelP.BuscarValor(dado);
                txtValor.Text = dgValor.CurrentRow.Cells[0].Value.ToString();
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Listar os Dados" + ex.Message);
            }
        }



        public void Editar(Orcamentos dado)
        {

            try
            {
                dado.Id_orcamento = Convert.ToInt32(txtCodigo.Text);
                dado.Num_orcamento = txtOrcamento.Text;
                dado.Id_produto = Convert.ToInt32(cbProduto.SelectedValue);
                dado.Id_cliente = Convert.ToInt32(cbCliente.SelectedValue);
                dado.Valor_total = Convert.ToDecimal(lbTotal.Text);
                dado.Quantidade = Convert.ToInt32(txtQuantidade.Text);

                dado.Data = DateTime.Today;


                model.Editar(dado);
                MessageBox.Show("Registro Editado com Sucesso!");
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Editar " + ex.Message);
            }
        }


        public void Excluir(Orcamentos dado)
        {

            try
            {
                dado.Id_orcamento = Convert.ToInt32(txtCodigo.Text);


                model.Excluir(dado);
                MessageBox.Show("Registro excluido com Sucesso!");
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Excluir " + ex.Message);
            }
        }

        private void cbProduto_SelectionChangeCommitted(object sender, EventArgs e)
        {
            txtQuantidade.Enabled = true;
            Produtos dados = new Produtos();
            BuscarValor(dados);
        }

        private void btnNovo_Click(object sender, EventArgs e)
        {
            HabilitarCampos();
            btnSalvar.Enabled = true;
            Limpar();
        }

        private void btnSalvar_Click(object sender, EventArgs e)
        {
            if (txtOrcamento.Text == "")
            {
                MessageBox.Show("Preencha o Campo Nome!");
                return;
            }

            Orcamentos dados = new Orcamentos();
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
            Orcamentos dados = new Orcamentos();
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
            Orcamentos dados = new Orcamentos();
            Excluir(dados);
            Listar();
            Limpar();
            DesabilitarCampos();
        }

        private void dg_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            Produtos dados = new Produtos();
            BuscarValor(dados);

            txtCodigo.Text = dg.CurrentRow.Cells[0].Value.ToString();
            txtOrcamento.Text = dg.CurrentRow.Cells[1].Value.ToString();
            cbProduto.SelectedValue = dg.CurrentRow.Cells[8].Value.ToString();
            cbCliente.SelectedValue = dg.CurrentRow.Cells[9].Value.ToString();
            txtQuantidade.Text = dg.CurrentRow.Cells[5].Value.ToString();
            lbTotal.Text = dg.CurrentRow.Cells[6].Value.ToString();

           

            HabilitarCampos();
        }

        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            Orcamentos dados = new Orcamentos();
            Buscar(dados);
            txtTotalOrc.Text = valorTotal().ToString();

        }

        private void cbBuscarCliente_SelectionChangeCommitted(object sender, EventArgs e)
        {
            Orcamentos dados = new Orcamentos();
            BuscarCB(dados);
            txtTotalOrc.Text = valorTotal().ToString();

            
        }

        private void dtBuscar_ValueChanged(object sender, EventArgs e)
        {
            Orcamentos dados = new Orcamentos();
            BuscarDT(dados);
            txtTotalOrc.Text = valorTotal().ToString();

        }

        private void rbCliente_CheckedChanged(object sender, EventArgs e)
        {
            cbBuscarCliente.Visible = true;
            txtBuscar.Visible = false;
            dtBuscar.Visible = false;
            txtBuscar.Text = "";
            cbBuscarCliente.Enabled = true;
        }

        private void rbOrc_CheckedChanged(object sender, EventArgs e)
        {
            cbBuscarCliente.Visible = false;
            txtBuscar.Visible = true;
            dtBuscar.Visible = false;
            txtBuscar.Text = "";
            txtBuscar.Enabled = true;

        }

        private void rbData_CheckedChanged(object sender, EventArgs e)
        {
            cbBuscarCliente.Visible = false;
            txtBuscar.Visible = false;
            dtBuscar.Visible = true;
            txtBuscar.Text = "";
            dtBuscar.Enabled = true;
        }

        private void txtQuantidade_TextChanged(object sender, EventArgs e)
        {
            if(txtQuantidade.Text == "")
            {
                lbTotal.Text = "";
                return;
            }
            
            decimal total;
            total = Convert.ToDecimal(txtQuantidade.Text) * Convert.ToDecimal(txtValor.Text);
            lbTotal.Text = total.ToString();
        }

        private void cbProduto_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {

            if(txtQuantidade.Text == "") {
                return;
            }

            Orcamentos dados = new Orcamentos();
            Salvar(dados);
            Listar();

            cbCliente.Enabled = false;
            txtOrcamento.Enabled = false;
            txtQuantidade.Text = "";
            btnEditar.Enabled = false;
            btnExcluir.Enabled = false;
            cbProduto.Enabled = true;



        }



        private decimal valorTotal()
        {
            decimal total = 0;
            int i = 0;

            for (i = 0; i < dg.Rows.Count; i++)
            {
                total = total + Convert.ToDecimal(dg.Rows[i].Cells[6].Value);
            }
            return total;
        }

    }
}
