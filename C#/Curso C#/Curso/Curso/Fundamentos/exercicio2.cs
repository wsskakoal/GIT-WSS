using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace exercicio2
{
    class exercicio2
    {
        static void executar(string[] args)
        {
            string Nome; //Variável que armazena o nome do Usuário.

            Console.Write("Informe o seu nome: ");
            Nome = Console.ReadLine();

            //Console.WriteLine(string.Format("Meu nome é: {0}", Nome));
            //Console.WriteLine("Meu nome é: " + Nome);
            Console.WriteLine("");
            Console.WriteLine("");

            Console.Write("Meu nome é: ");

            Console.ForegroundColor = ConsoleColor.Green;
            Console.Write(Nome);
            Console.ReadKey();
        }
    }
}