using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Login.Entidades
{
    class Pedidos
    {
        int id_pedido;
        int id_caixa;
        int id_produto;
        int quantidade;
        decimal subtotal;

        public decimal Subtotal { get => subtotal; set => subtotal = value; }
        public int Quantidade { get => quantidade; set => quantidade = value; }
        public int Id_produto { get => id_produto; set => id_produto = value; }
        public int Id_pedido { get => id_pedido; set => id_pedido = value; }
        public int Id_caixa { get => id_caixa; set => id_caixa = value; }
    }
}
