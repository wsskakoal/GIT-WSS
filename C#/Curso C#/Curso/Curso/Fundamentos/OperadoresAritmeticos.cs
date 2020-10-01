using System;
using System.Collections.Generic;
using System.Text;

namespace Curso.Fundamentos
{
    class OperadoresAritmeticos
    {
        public  static  void Executar()
        {
            var preco = 1000.0;
            var imposto = 300;
            var desconto = 0.1;

            double total = preco + imposto;
            var totalComDesconto = total - (total * desconto);
            Console.WriteLine("o preco final é {0}", totalComDesconto);

            // imc

            double peso = 92.2;
            double altura = 1.82;
            double imc = peso / Math.Pow(altura, 2);
            Console.WriteLine($"o imc é {imc}.");

            // modulo
            int par = 24;
            Console.WriteLine("{0} /2 tem resto {1}", par, par % 2);

        }
    }
}
