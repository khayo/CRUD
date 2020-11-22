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
    public class Diretor
    {
        private string sqlConn()
        {
            return ConfigurationManager.AppSettings["sqlConn"];
        }

        public DataTable Lista()
        {
            using (SqlConnection connection = new SqlConnection(sqlConn()))
            {
                string queryString = "exec dbo.spDiretores_GetAll";
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Connection.Open();

                SqlDataAdapter adapter = new SqlDataAdapter();
                adapter.SelectCommand = command;

                DataTable table = new DataTable();
                adapter.Fill(table);
                return table;
            }
        }

        public void Salvar(int id, string nome)
        {
            using (SqlConnection connection = new SqlConnection(sqlConn()))
            {
                //string queryString = id != 0 ? "UPDATE dbo.diretores SET nome = @nome WHERE iddiretor = @id" : "INSERT INTO dbo.diretores(nome) values(@nome)";

                string queryString = id != 0 ? "exec dbo.spAlteraDiretor @id , @nome" : "exec dbo.spInserirDiretor @nome";

                SqlCommand command = new SqlCommand(queryString, connection);
                if (id != 0)
                {
                    command.Parameters.Add(new SqlParameter("id", id));
                }
                command.Parameters.Add(new SqlParameter("nome", nome));

                command.Connection.Open();
                command.ExecuteNonQuery();
            }
        }

        public DataTable BuscaPorId(int id)
        {
            using (SqlConnection connection = new SqlConnection(sqlConn()))
            {
                //string queryString = "SELECT * FROM dbo.diretores WHERE iddiretor = @id";
                string queryString = "exec dbo.spBuscarDiretorPorId @id";
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Parameters.Add(new SqlParameter("id", id));
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
                //string queryString = "DELETE FROM dbo.diretores WHERE iddiretor = @id";
                string queryString = "exec spApagarDiretorPorId @id";
                SqlCommand command = new SqlCommand(queryString, connection);
                command.Parameters.Add(new SqlParameter("id", id));
                
                command.Connection.Open();
                command.ExecuteNonQuery();
            }
        }
    }
}
