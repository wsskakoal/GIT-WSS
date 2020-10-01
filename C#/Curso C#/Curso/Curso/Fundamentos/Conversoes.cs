using System;
using System.Collections.Generic;
using System.Text;

namespace Curso.Fundamentos
{
    class Conversoes
    {
        public static void Executar()
        {
            int inteiro = 10;
            double quebrado = inteiro;
            Console.WriteLine(quebrado);

            double nota = 9.7;
            int notaTruncada = (int)nota;
            Console.WriteLine("nota truncada: {0}", notaTruncada);


        }
    }
}
