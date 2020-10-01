using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Login.Entidades
{
    class Caixas
    {
        int id_caixa;
        int id_cliente;
        DateTime data;
        decimal valortotal;

        public int Id_caixa { get => id_caixa; set => id_caixa = value; }
        public int Id_cliente { get => id_cliente; set => id_cliente = value; }
        public DateTime Data { get => data; set => data = value; }
        public decimal Valortotal { get => valortotal; set => valortotal = value; }
    }
}
