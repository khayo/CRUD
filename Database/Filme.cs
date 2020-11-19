using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Database
{
    public class Filme
    {
        private string sqlConn()
        {
            return ConfigurationManager.AppSettings["sqlConn"];
        }

        public DataTable Lista()
        {
            using (SqlConnection connection = new SqlConnection(sqlConn()))
            {
                string queryString = "exec dbo.spFilmes_GetAll";
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Connection.Open();

                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = command;

                DataTable table = new DataTable();
                adapter.Fill(table);
                return table;
            }
        }

        public void Salvar(int id, string nome, string diretor, DateTime dataLancamento)
        {
            using (SqlConnection connection = new SqlConnection(sqlConn()))
            {
                string queryString = "exec dbo.spInserirFilme '" + nome + "' , '" + diretor + "' , '" + dataLancamento.ToString("d") + "'";
                if(id != 0)
                {
                queryString = "exec dbo.spAlteraFilme " + id + ", '" + nome + "' , '" + diretor + "' , '" + dataLancamento.ToString("d") + "'";

                }
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Connection.Open();

                command.ExecuteNonQuery();
            }
        }

        public DataTable BuscaPorId(int id)
        {
            using (SqlConnection connection = new SqlConnection(sqlConn()))
            {
                string queryString = "EXEC dbo.spBuscaFilmePorId " + id ;
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Connection.Open();

                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = command;

                DataTable table = new DataTable();
                adapter.Fill(table);
                return table;
            }
        }

        public void Excluir(int id)
        {
            using (SqlConnection connection = new SqlConnection(sqlConn()))
            {
                string queryString = "exec dbo.spApagaPorId " + id;

                SqlCommand command = new SqlCommand(queryString, connection);
                
                command.Connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
}
