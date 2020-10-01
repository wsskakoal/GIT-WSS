using System;
using System.Collections.Generic;
using System.Text;

namespace Curso.Fundamentos
{
    class DelegatesComoParametros
    {
        public delegate int Operacao(int x, int y);
        public static int soma(int x, int y)
        {
            return x + y;
        }
        public static string Calculadora(Operacao op, int x, int y)
        {
            var resultado = op(x, y);
            return "resultado: " + resultado;
        }
        public static void Executar()
        {
            Operacao subtracao = (int x, int y) => x - y;
            Console.WriteLine(Calculadora(subtracao, 3, 2));
            Console.WriteLine(Calculadora(soma, 3, 2));
        }
    }
}
