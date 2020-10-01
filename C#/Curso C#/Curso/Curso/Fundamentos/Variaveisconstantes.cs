using System;
using System.Collections.Generic;
using System.Text;

namespace Curso
{
    class VariaveisConstantes
    {
        public static void Executar()
        {
            //area de circunferencia
            double raio = 4.5;
            const double PI = 3.14;

            double area = PI * raio * raio;
            Console.WriteLine(area);
            Console.WriteLine("area é " + area);

            /* VARIAVEIS TESTE-----------------------
            Boolean;
            byte;
            sbyte saldodegols = sbyte.MinValue;
            Console.WriteLine("saldodegols de gols é" + saldodegols);
            short;
            int;

            uint populacao = 207_600_600;
            Console.WriteLine("populão é "+ populacao);
            long;
            ulong;

            ---------------------------------------*/
            float preco = 1299.00f;
            Console.WriteLine("preco é " + preco);

            double valorapple = 1_000_000_000_000_000_000;
            Console.WriteLine("valor é " +valorapple);

            

            char letra = 'b';
            Console.WriteLine(+letra);



        }
    }
}
