using System;
using System.Collections.Generic;
using System.Text;

namespace Curso.Fundamentos
{

    public static class ExtensoesInteiro
    {
        public static int Soma(this int num, int outroNumero)
        {
            return num + outroNumero;
        }

    }
    class metodosdeextensao
    {

    public static void Executar()
    {
            int numero = 5;
            Console.WriteLine(numero.Soma(3));

    }
    }
   
}
