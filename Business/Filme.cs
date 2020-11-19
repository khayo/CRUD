using System;
using System.Collections.Generic;
using System.Data;

namespace Business
{
    public class Filme
    {
        public int Id { get; set; }
        public string Nome { get; set; }
        public string Diretor { get; set; }
        public DateTime DataLancamento { get; set; }

        public List<Filme> Lista()
        {
            var lista = new List<Filme>();
            var filmeDb = new Database.Filme();
            foreach (DataRow row in filmeDb.Lista().Rows)
            {
                var filme = new Filme();
                filme.Id = Convert.ToInt32(row["id"]);
                filme.Nome = row["nome"].ToString();
                filme.Diretor = row["diretor"].ToString();
                filme.DataLancamento = Convert.ToDateTime(row["dataLancamento"]);

                lista.Add(filme);
            }
            return lista;
        }

        public static Filme BuscaPorId(int id)
        {

            var filme = new Filme();
            var filmeDb = new Database.Filme();
            foreach (DataRow row in filmeDb.BuscaPorId(id).Rows)
            {
                filme.Id = Convert.ToInt32(row["id"]);
                filme.Nome = row["nome"].ToString();
                filme.Diretor = row["diretor"].ToString();
                filme.DataLancamento = Convert.ToDateTime(row["dataLancamento"]);                
            }
            return filme;
        }

        public void Save()
        {
            new Database.Filme().Salvar(this.Id, this.Nome, this.Diretor, this.DataLancamento);
        }

        public static void Excluir(int id)
        {
            new Database.Filme().Excluir(id);
        }
    }
}
