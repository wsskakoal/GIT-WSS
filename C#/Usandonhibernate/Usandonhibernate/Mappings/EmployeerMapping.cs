using FluentNHibernate.Mapping;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Usandonhibernate.Mappings
{
    public class EmployeerMapping: ClassMap<Model.Employeer>
    {
        public EmployeerMapping()
        {
            Id(x => x.Id);
            Map(x => x.Nome).Not.Nullable();
            Map(x => x.Sobrenome).Not.Nullable();
            Map(x => x.Email).Not.Nullable();
            Table("Cliente");
        }
    }
}
