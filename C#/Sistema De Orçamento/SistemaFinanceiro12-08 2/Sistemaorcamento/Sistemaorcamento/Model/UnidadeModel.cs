using Sistemaorcamento.Controller;
using Sistemaorcamento.Entidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Sistemaorcamento.Model
{
    class UnidadeModel
    {
        unidadeController controller = new unidadeController();

        public DataTable Listar()
        {
            try
            {
                DataTable dt = new DataTable();
                dt = controller.Listar();
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;



            }
        }
        public void Salvar(Unidades dado)
        {
            try
            {
                controller.Inserir(dado);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void Editar(Unidades dado)
        {
            try
            {
                controller.Editar(dado);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public object Buscar(Unidades dado)
        {
            try
            {
                DataTable dt = new DataTable();
                dt = controller.Buscar(dado);
                return dt;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void Excluir(Unidades dado)
        {
            try
            {
                controller.Excluir(dado);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
