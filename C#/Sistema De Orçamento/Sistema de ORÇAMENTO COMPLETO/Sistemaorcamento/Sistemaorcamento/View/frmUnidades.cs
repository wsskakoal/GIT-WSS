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
    public partial class frmUnidades : Form
    {
        UnidadeModel model = new UnidadeModel();
        public frmUnidades()
        {
            InitializeComponent();
            Listar();
        }

        private void BtnNovo_Click(object sender, EventArgs e)
        {
            HabilitarCampos();
            LimparCampos();
            btnSalvar.Enabled = true;
        }

        private void BtnSalvar_Click(object sender, EventArgs e)
        {
            if (txtUnidade.Text == "")
            {
                MessageBox.Show("Preencha o campo Nome");
                return;
            }

            Unidades dados = new Unidades();
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

            Unidades dados = new Unidades();
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

            Unidades dados = new Unidades();
            Excluir(dados);
            Listar();
            LimparCampos();
            DesabilitarCampos();
        }

        private void Dg_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtId.Text = dg.CurrentRow.Cells[0].Value.ToString();

        
            txtUnidade.Text = dg.CurrentRow.Cells[1].Value.ToString();
            HabilitarCampos();
        }

        //INICIO DOS CHAMADOS

        private void HabilitarCampos()
        {

            txtUnidade.Enabled = true;


        }

        private void DesabilitarCampos()
        {
            txtUnidade.Enabled = false;
   

        }

        private void LimparCampos()
        {
            txtUnidade.Text = "";
          
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
        private void Salvar(Unidades dado)
        {
            try
            {
                dado.Unidade = txtUnidade.Text;
               
                model.Salvar(dado);

                MessageBox.Show("Fornecedor salvo com sucesso!");
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao salvar " + ex.Message);
            }
        }
        private void Buscar(Unidades dado)
        {
            try
            {
                dado.Unidade = txtUnidade.Text;

                dg.DataSource = model.Buscar(dado);
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Pesquisa " + ex.Message);
            }
        }

        private void Editar(Unidades dado)
        {
            try
            {
                dado.Id_unidade = Convert.ToInt32(txtId.Text);
                dado.Unidade = txtUnidade.Text;

                model.Editar(dado);
                MessageBox.Show("Editado com sucesso");

            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Editar " + ex.Message);
            }
        }
        private void Excluir(Unidades dados)
        {
            dados.Id_unidade = Convert.ToInt32(txtId.Text);
            model.Excluir(dados);
            MessageBox.Show("Excluido com Sucesso");
        }
    }

}



