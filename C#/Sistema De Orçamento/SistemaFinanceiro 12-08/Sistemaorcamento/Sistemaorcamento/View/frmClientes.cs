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
    public partial class frmClientes : Form
    {
        ClienteModel model = new ClienteModel();
        public frmClientes()
        {
            InitializeComponent();
            Listar();

        }

        private void Button1_Click(object sender, EventArgs e)
        {
            HabilitarCampos();
            LimparCampos();
            btnSalvar.Enabled = true;

        }

        private void Button2_Click(object sender, EventArgs e)
        {
            if (txtNome.Text == "")
            {
                MessageBox.Show("Preencha o campo Nome");
                return;
            }

            Clientes dados = new Clientes();
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

            Clientes dados = new Clientes();
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

            Clientes dados = new Clientes();
            Excluir(dados);
            Listar();
            LimparCampos();
            DesabilitarCampos();
        }
     
     
        private void TextBox5_TextChanged(object sender, EventArgs e)
        {
            Clientes dados = new Clientes();
            Buscar(dados);
            if (txtBuscar.Text == "")
            {
                Listar();
                return;
            }
        }

        private void DataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtId.Text = dg.CurrentRow.Cells[0].Value.ToString();
          
            txtNome.Text = dg.CurrentRow.Cells[1].Value.ToString();
            txtTelefone.Text = dg.CurrentRow.Cells[2].Value.ToString();
            txtEmail.Text = dg.CurrentRow.Cells[3].Value.ToString();
            HabilitarCampos();
        }

        // INICIO DA IMPLEMENTACAO DOS CHAMADOS 

        private void HabilitarCampos()
        {
            txtNome.Enabled = true;
            txtEmail.Enabled = true;
            txtTelefone.Enabled = true;
            

        }

        private void DesabilitarCampos()
        {
            txtNome.Enabled = false;
            txtEmail.Enabled = false;
            txtTelefone.Enabled = false;
     
        }

        private void LimparCampos()
        {
            txtNome.Text = "";
            txtEmail.Text = "";
            txtTelefone.Text = "";
            txtId.Text = "";
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
        private void Salvar(Clientes dado)
        {
            try
            {
                dado.Nome = txtNome.Text;
                dado.Email = txtEmail.Text;
                dado.Telefone = txtTelefone.Text;
                model.Salvar(dado);

                MessageBox.Show("Fornecedor salvo com sucesso!");
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao salvar " + ex.Message);
            }
        }
        private void Buscar(Clientes dado)
        {
            try
            {
                dado.Nome = txtBuscar.Text;
               
                dg.DataSource = model.Buscar(dado);
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Pesquisa " + ex.Message);
            }
        }

        private void Editar(Clientes dado)
        {
            try
            {
                dado.Id_cliente = Convert.ToInt32(txtId.Text);
                dado.Nome = txtNome.Text;
               
                dado.Email = txtEmail.Text;
                dado.Telefone = txtTelefone.Text;
                model.Editar(dado);
                MessageBox.Show("Editado com sucesso");

            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Editar " + ex.Message);
            }
        }
        private void Excluir(Clientes dados)
        {
            dados.Id_cliente = Convert.ToInt32(txtId.Text);
            model.Excluir(dados);
            MessageBox.Show("Fornecedor excluido com Sucesso");
        }
    }
}
