using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Login.Entidades
{
    class Produtos
    {
        int id_produto;
        int id_fornecedor;
        string descricao;
        decimal valor;

        public int Id_produto { get => id_produto; set => id_produto = value; }
        public int Id_fornecedor { get => id_fornecedor; set => id_fornecedor = value; }
        public string Descricao { get => descricao; set => descricao = value; }
        public decimal Valor { get => valor; set => valor = value; }
    }
}
