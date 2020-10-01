using System;
using System.Collections.Generic;
using System.Text;

namespace Curso.Fundamentos
{
 
    public class exercicio
    {
        public static void Executar()
        {
            int numdigitado;
            Console.Write("Insira um numero");
            numdigitado = Console.Read();

            if (numdigitado % 2 == 0)
            {
                Console.WriteLine("É par");
            }

            else
            {
                Console.WriteLine("É impar");
            }
            Console.ReadKey();
        }
    }

}
