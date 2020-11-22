using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Business
{
    public class Diretor
    {
        public int Id { get; set; }
        public string Nome { get; set; }

        public List<Diretor> Lista()
        {
            var lista = new List<Diretor>();
            var diretorDb = new Database.Diretor();

            foreach (DataRow row in diretorDb.Lista().Rows)
            {
                var diretor = new Diretor();
                diretor.Id = Convert.ToInt32(row["iddiretor"]);
                diretor.Nome = row["nome"].ToString();
                lista.Add(diretor);
            }
            return lista;
        }

        public static Diretor BuscaPorId(int id)
        {
            var diretor = new Diretor();
            var diretorDb = new Database.Diretor();
            foreach(DataRow row in diretorDb.BuscaPorId(id).Rows)
            {
                diretor.Id = Convert.ToInt32(row["iddiretor"]);
                diretor.Nome = row["nome"].ToString();
            }
            return diretor;
        }

        public void Save()
        {
            new Database.Diretor().Salvar(this.Id, this.Nome);
        }

        public static void Excluir(int id)
        {
            new Database.Diretor().Excluir(id);
        }
    }
}
