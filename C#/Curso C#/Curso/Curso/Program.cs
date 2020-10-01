using System;
using System.Collections.Generic;

using Curso.Fundamentos;

namespace Curso {
    class Program {
        static void Main(string[] args) {
            var central = new CentralDeExercicios(new Dictionary<string, Action>() {
                {"Primeiro Programa - Fundamentos", Primeiroprograma.Executar},
                {"Interpolação - Fundamentos", Interpolacao.Executar},
                {"Variaveis Constantes - Fundamentos", VariaveisConstantes.Executar},
                {"Lendo Dados - Fundamentos", LendoDados.Executar},
                {"OperadoresAritimeticos - Fundamentos", OperadoresAritmeticos.Executar},
                {"Operadores logicos - Fundamentos", OperadoresLogicos.Executar},
                { "Delegates", DelegatesComoParametros.Executar},
                { "metodosdeextensao", metodosdeextensao.Executar},
                { "2", exercicio2.executar},


            });

            central.SelecionarEExecutar();
        }
    }
}