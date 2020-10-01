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
    public partial class frmFornecedores : Form
    {
        FornecedorModel model = new FornecedorModel();

        public frmFornecedores()
        {
            InitializeComponent();
            Listar();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            HabilitarCampos();
            LimparCampos();
            btnSalvar.Enabled = true;

        }

        private void HabilitarCampos()
        {
            txtNome.Enabled = true;
            txtCnpj.Enabled = true;
            txtTelefone.Enabled = true;
            txtEndereco.Enabled = true;
            
        }

        private void DesabilitarCampos()
        {
            txtNome.Enabled = false;
            txtCnpj.Enabled = false;
            txtTelefone.Enabled = false;
            txtEndereco.Enabled = false;

        }

        private void LimparCampos()
        {
            txtNome.Text = "";
            txtCnpj.Text = "";
            txtTelefone.Text = "";
            txtEndereco.Text = "";
            txtId.Text = "";
        }

        private void btnSalvar_Click(object sender, EventArgs e)
        {
            if(txtNome.Text == "")
            {
                MessageBox.Show("Preencha o campo Nome");
                return;
            }

            Fornecedores dados = new Fornecedores();
            Salvar(dados);
            LimparCampos();
            DesabilitarCampos();
            Listar();
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

                MessageBox.Show("Erro ao listar " + ex.Message);
            }
        }

        private void Salvar(Fornecedores dado)
        {

            try
            {
                dado.Nome = txtNome.Text;
                dado.Cnpj = txtCnpj.Text;
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

    

        private void Dg_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtId.Text = dg.CurrentRow.Cells[0].Value.ToString();
            txtCnpj.Text = dg.CurrentRow.Cells[1].Value.ToString();
            txtNome.Text = dg.CurrentRow.Cells[2].Value.ToString();
            txtTelefone.Text = dg.CurrentRow.Cells[3].Value.ToString();
            txtEndereco.Text = dg.CurrentRow.Cells[4].Value.ToString();
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

        private void Buscar(Fornecedores dado)
        {
            try
            {
                dado.Nome = txtBuscar.Text;
                dado.Cnpj = txtBuscar.Text;
                dg.DataSource = model.Buscar(dado);
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Pesquisa " + ex.Message);
            }
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            if (txtId.Text == "")
            {
                MessageBox.Show("selecione um registro", "Alerta", MessageBoxButtons.OK);
                return;
            }

            Fornecedores dados = new Fornecedores();
            Editar(dados);
            Listar(); 
            LimparCampos();
            DesabilitarCampos();
          

        }

        private void Editar(Fornecedores dado)
        {
            try
            {
                dado.Id_fornecedor = Convert.ToInt32(txtId.Text);
                dado.Nome = txtNome.Text;
                dado.Cnpj = txtCnpj.Text;
                dado.Endereco = txtEndereco.Text;
                dado.Telefone = txtTelefone.Text;
                model.Editar(dado);
                MessageBox.Show("Editado com sucesso");

            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Editar " + ex.Message);
            }
        }

        private void btnExcluir_Click(object sender, EventArgs e)
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

            Fornecedores dados = new Fornecedores();
            Excluir(dados);
            Listar();
            LimparCampos();
            DesabilitarCampos();
        }

        private void Excluir(Fornecedores dados)
        {
            dados.Id_fornecedor = Convert.ToInt32(txtId.Text);
            model.Excluir(dados);
            MessageBox.Show("Fornecedor excluido com Sucesso");
        }

        private void Dg_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
