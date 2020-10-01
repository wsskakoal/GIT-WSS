using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Calculadora
{
    public partial class frmCalculadora : Form
    {
        public int numero1 = 0;
        public int numero2 = 0;
        public int ultimoBtn = 0;
        public int resultado = 0;

        public frmCalculadora()
        {
            InitializeComponent();
        }

        private void BtnMais_Click(object sender, EventArgs e)
        {
            numero1 = Convert.ToInt32(txtNumero.Text);
            txtNumero.Text = "";
            ultimoBtn = 1;
        }

        private void BtnMenos_Click(object sender, EventArgs e)
        {
            numero1 = Convert.ToInt32(txtNumero.Text);
            txtNumero.Text = "";
            ultimoBtn = 2;
        }

        private void BtnIgual_Click(object sender, EventArgs e)
        {

            numero2 = Convert.ToInt32(txtNumero.Text);
            
            if (ultimoBtn == 1)
            {
                resultado = numero1 + numero2; 
            }

            else if (ultimoBtn == 2)
            {
                resultado = numero1 - numero2;
            }
            ;
            txtNumero.Text = Convert.ToString(resultado);
        }

        private void BtnLimpar_Click(object sender, EventArgs e)
        {
            txtNumero.Text = "";
        }
    }
}
