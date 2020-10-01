using System;
using System.Collections.Generic;
using System.Text;

namespace Curso.Fundamentos
{
    class OperadoresRelacionais
    {
        public static void Executar()
        {
            double nota = 6.0;
            double notadecorte = 7.0;

            Console.WriteLine("Nota invalida? {0}", nota > 10.0);
            Console.WriteLine("Nota invalida? {0}", nota < 10.0);

            Console.WriteLine("Nota Perfeita? {0}", nota == 10.0);
            Console.WriteLine("tem como melhorar?{0}", nota != 10.0);
            Console.WriteLine("Passou ?{0}", nota >= notadecorte);
            Console.WriteLine("reprovou ?{0}", nota < notadecorte);
            Console.WriteLine("reprovou ?{0}", nota < 3.0);
        }
    }
}
