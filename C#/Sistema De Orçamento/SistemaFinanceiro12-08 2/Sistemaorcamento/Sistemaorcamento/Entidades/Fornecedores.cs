﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sistemaorcamento.Entidades
{
    public class Fornecedores
    {
        int id_fornecedor;
        string cnpj;
        string nome;
        string telefone;
        string endereco;

        public int Id_fornecedor { get => id_fornecedor; set => id_fornecedor = value; }
        public string Cnpj { get => cnpj; set => cnpj = value; }
        public string Nome { get => nome; set => nome = value; }
        public string Telefone { get => telefone; set => telefone = value; }
        public string Endereco { get => endereco; set => endereco = value; }
     
    }
}
