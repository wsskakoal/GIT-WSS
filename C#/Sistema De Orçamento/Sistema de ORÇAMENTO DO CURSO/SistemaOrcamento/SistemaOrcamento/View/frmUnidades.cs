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
    public partial class frmUnidades : Form
    {
        UnidadeModel model = new UnidadeModel();

        public frmUnidades()
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


        private void Salvar(Unidades dado)
        {

            try
            {
                dado.Unidade = txtUnidade.Text;
                model.Salvar(dado);


                MessageBox.Show("Registro salvo com sucesso!");
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao salvar " + ex.Message);
            }
        }

       


        public void Editar(Unidades dado)
        {

            try
            {
                dado.Id_unidade = Convert.ToInt32(txtCodigo.Text);
                dado.Unidade = txtUnidade.Text;
                


                model.Editar(dado);
                MessageBox.Show("Registro Editado com Sucesso!");
            }
            catch (Exception ex)
            {

                MessageBox.Show("Erro ao Editar " + ex.Message);
            }
        }


        public void Excluir(Unidades dado)
        {

            try
            {
                dado.Id_unidade = Convert.ToInt32(txtCodigo.Text);


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
            txtUnidade.Enabled = true;
            btnSalvar.Enabled = true;
            txtUnidade.Text = "";
        }

        private void btnSalvar_Click(object sender, EventArgs e)
        {
            if (txtUnidade.Text == "")
            {
                MessageBox.Show("Preencha o Campo Unidade!");
                return;
            }

            Unidades dados = new Unidades();
            Salvar(dados);
            Listar();
            txtUnidade.Enabled = false;
            btnSalvar.Enabled = false;
            txtUnidade.Text = "";
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            if (txtCodigo.Text == "")
            {
                MessageBox.Show("Selecione na tabela um registro para edição!");
                return;
            }
            Unidades dados = new Unidades();
            Editar(dados);
            Listar();
            txtUnidade.Enabled = false;
            btnSalvar.Enabled = false;
            txtUnidade.Text = "";
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
            Unidades dados = new Unidades();
            Excluir(dados);
            Listar();
            txtUnidade.Enabled = false;
            btnSalvar.Enabled = false;
            txtUnidade.Text = "";
        }

        private void dg_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtCodigo.Text = dg.CurrentRow.Cells[0].Value.ToString();
            txtUnidade.Text = dg.CurrentRow.Cells[1].Value.ToString();
            txtUnidade.Enabled = true;
           
        }
    }
}
