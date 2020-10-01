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
    public partial class frmClientes : Form
    {
        ClienteModel model = new ClienteModel();

        public frmClientes()
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

                MessageBox.Show("Erro ao Listar os Dados" + ex.Message);
            }
        }


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


        private void Limpar()
        {
            txtNome.Text = "";
            
            txtEmail.Text = "";
            txtTelefone.Text = "";
            txtBuscar.Text = "";
            txtCodigo.Text = "";
        }


        private void Salvar(Clientes dado)
        {

            try
            {
                dado.Nome = txtNome.Text;
               
                dado.Email = txtEmail.Text;
                dado.Telefone = txtTelefone.Text;
                model.Salvar(dado);

                MessageBox.Show("Registro salvo com sucesso!");
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao salvar " + ex.Message);
            }
        }

        public void Buscar(Clientes dado)
        {
            try
            {
                dado.Nome = txtBuscar.Text;
                
                dg.DataSource = model.Buscar(dado);

            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Listar os Dados" + ex.Message);
            }
        }


        public void Editar(Clientes dado)
        {

            try
            {
                dado.Id_cliente = Convert.ToInt32(txtCodigo.Text);
                dado.Nome = txtNome.Text;
                dado.Telefone = txtTelefone.Text;
                dado.Email = txtEmail.Text;
                

                model.Editar(dado);
                MessageBox.Show("Registro Editado com Sucesso!");
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Editar " + ex.Message);
            }
        }


        public void Excluir(Clientes dado)
        {

            try
            {
                dado.Id_cliente = Convert.ToInt32(txtCodigo.Text);


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

            Clientes dados = new Clientes();
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
            Clientes dados = new Clientes();
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
            Clientes dados = new Clientes();
            Excluir(dados);
            Listar();
            Limpar();
            DesabilitarCampos();
        }

        private void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            Clientes dados = new Clientes();
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
            txtNome.Text = dg.CurrentRow.Cells[1].Value.ToString();
           
            txtEmail.Text = dg.CurrentRow.Cells[3].Value.ToString();
            txtTelefone.Text = dg.CurrentRow.Cells[2].Value.ToString();
            HabilitarCampos();
        }
    }
}
