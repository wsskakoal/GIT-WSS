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
    public partial class frmFornecedores : Form
    {

        FornecedorModel model = new FornecedorModel();

        public frmFornecedores()
        {
            InitializeComponent();
            rbNome.Checked = true;
            Listar();
        }

        private void btnNovo_Click(object sender, EventArgs e)
        {
            HabilitarCampos();
            btnSalvar.Enabled = true;
            Limpar();
        }

        private void HabilitarCampos()
        {
            txtNome.Enabled = true;
            txtCNPJ.Enabled = true;
            txtEndereco.Enabled = true;
            txtTelefone.Enabled = true;
            
        }


        private void DesabilitarCampos()
        {
            txtNome.Enabled = false;
            txtCNPJ.Enabled = false;
            txtEndereco.Enabled = false;
            txtTelefone.Enabled = false;
            
        }


        private void Limpar()
        {
            txtNome.Text = "";
            txtCNPJ.Text = "";
            txtEndereco.Text = "";
            txtTelefone.Text = "";
            txtBuscar.Text = "";
            txtCodigo.Text = "";
        }

        private void btnSalvar_Click(object sender, EventArgs e)
        {
            if(txtNome.Text == "")
            {
                MessageBox.Show("Preencha o Campo Nome!");
                return;
            }

            Fornecedores dados = new Fornecedores();
            Salvar(dados);
            Listar();
            Limpar();
            DesabilitarCampos();
            btnSalvar.Enabled = false;
        }

        private void Listar()
        {
            try
            {
                dg.DataSource = model.Listar();

            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Listar os Dados" + ex.Message);
            }
        }

        private void Salvar(Fornecedores dado)
        {
            
            try
            {
                dado.Nome = txtNome.Text;
                dado.Cnpj = txtCNPJ.Text;
                dado.Endereco = txtEndereco.Text;
                dado.Telefone = txtTelefone.Text;
                model.Salvar(dado);

                MessageBox.Show("Fornecedor salvo com sucesso!");
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao salvar " + ex.Message);
            }
        }

       

        private void dg_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtCodigo.Text = dg.CurrentRow.Cells[0].Value.ToString();
            txtNome.Text = dg.CurrentRow.Cells[2].Value.ToString();
            txtCNPJ.Text = dg.CurrentRow.Cells[1].Value.ToString();
            txtEndereco.Text = dg.CurrentRow.Cells[4].Value.ToString();
            txtTelefone.Text = dg.CurrentRow.Cells[3].Value.ToString();
            HabilitarCampos();
        }

        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            Fornecedores dados = new Fornecedores();
            Buscar(dados);

            if (txtBuscar.Text == "")
            {
                
                Listar();
                return;
            }
        }


        public void Buscar(Fornecedores dado)
        {
            try
            {
                dado.Nome = txtBuscar.Text;
                dado.Cnpj = txtBuscarCNPJ.Text;
                dg.DataSource = model.Buscar(dado);

            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Listar os Dados" + ex.Message);
            }
        }

        private void rbCNPJ_CheckedChanged(object sender, EventArgs e)
        {
            txtBuscarCNPJ.Visible = true;
            txtBuscar.Visible = false;
            txtBuscar.Text = "?";
        }

        private void rbNome_CheckedChanged(object sender, EventArgs e)
        {
          
        }

        private void txtBuscarCNPJ_TextChanged(object sender, EventArgs e)
        {
            
        }

        private void txtBuscarCNPJ_TextChanged_1(object sender, EventArgs e)
        {
            Fornecedores dados = new Fornecedores();
            Buscar(dados);

            if (txtBuscarCNPJ.Text == "")
            {

                Listar();
                return;
            }
        }

        private void rbNome_CheckedChanged_1(object sender, EventArgs e)
        {
            txtBuscar.Visible = true;
            txtBuscarCNPJ.Visible = false;
            txtBuscarCNPJ.Text = "";
            txtBuscar.Text = "";
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            if (txtCodigo.Text == "")
            {
                MessageBox.Show("Selecione na tabela um registro para edição!");
                return;
            }
            Fornecedores dados = new Fornecedores();
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
            Fornecedores dados = new Fornecedores();
            Excluir(dados);
            Listar();
            Limpar();
            DesabilitarCampos();
        }



        public void Editar(Fornecedores dado)
        {

            try
            {
                dado.Id_fornecedor = Convert.ToInt32(txtCodigo.Text);
                dado.Nome = txtNome.Text;
                dado.Telefone = txtTelefone.Text;
                dado.Endereco = txtEndereco.Text;
                dado.Cnpj = txtCNPJ.Text;

                model.Editar(dado);
                MessageBox.Show("Registro Editado com Sucesso!");
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Editar " + ex.Message);
            }
        }


        public void Excluir(Fornecedores dado)
        {

            try
            {
                dado.Id_fornecedor = Convert.ToInt32(txtCodigo.Text);


                model.Excluir(dado);
                MessageBox.Show("Registro excluido com Sucesso!");
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Excluir " + ex.Message);
            }
        }

        
    }


}

