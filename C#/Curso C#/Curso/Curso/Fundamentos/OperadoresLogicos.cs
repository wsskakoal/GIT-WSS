using System;
using System.Collections.Generic;
using System.Text;

namespace Curso.Fundamentos
{
    class OperadoresLogicos
    {
        public static void Executar()
        {
            var executouTrabalho1 = true;
            var executouTrabalho2 = false;

            bool comprouTv50 = executouTrabalho1 && executouTrabalho2;
            Console.WriteLine("Comprou tv 50{0}", comprouTv50);

            var comprouSorvete = executouTrabalho1 || executouTrabalho2;
            Console.WriteLine("Comprou sorvete{0}", comprouSorvete);

            var comprouTv32 = executouTrabalho1 ^ executouTrabalho2;
            Console.WriteLine("Comprou tv 32{0}", comprouTv32);



            //Console.WriteLine("Terca feira deu certo?");
            /// string tercatv = Console.ReadLine();
            // Console.WriteLine("quinta feira deu certo?");
            //  string quintatv = Console.ReadLine();
            // Console.WriteLine("sabado  deu certo?");
            // string sabadotv = Console.ReadLine();


        }
    }
}
