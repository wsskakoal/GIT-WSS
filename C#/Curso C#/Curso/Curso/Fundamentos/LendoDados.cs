using System;
using System.Collections.Generic;
using System.Text;

namespace Curso.Fundamentos
{
    class LendoDados
    {
        public static void Executar()
        {
            Console.WriteLine("qual seu nome?");
            string nome = Console.ReadLine();

            Console.WriteLine("qual sua idade");
            int idade = int.Parse(Console.ReadLine());

            Console.WriteLine("qual seu salario");
            double salario = double.Parse(Console.ReadLine(),
                System.Globalization.CultureInfo.InvariantCulture);

            Console.WriteLine($"{nome} sua idade é {idade} e seu salario é {salario}"); ;


        }
    }
}
