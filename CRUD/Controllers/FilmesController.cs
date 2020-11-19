using Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CRUD.Controllers
{
    public class FilmesController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Filmes = new Filme().Lista();
            return View();
        }

        public ActionResult Cadastrar()
        {
            return View();
        }
        [HttpPost]
        public void Criar()
        {
            DateTime data;
            DateTime.TryParse(Request["dataLancamento"], out data);

            var filme = new Filme();
            filme.Nome = Request["nome"];
            filme.Diretor = Request["diretor"];
            filme.DataLancamento = data;
            filme.Save();
            Response.Redirect("/filmes");
        }

        public void Excluir(int id)
        {           
            Filme.Excluir(id);
            Response.Redirect("/filmes");
        }


        public ActionResult Editar(int id)
        {
            var filme = Filme.BuscaPorId(id);
            ViewBag.Filme = filme;
            return View();
        }

        [HttpPost]
        public void Alterar(int id)
        {
            try
            {
                var filme = Filme.BuscaPorId(id);
                DateTime data;
                DateTime.TryParse(Request["dataLancamento"], out data);

                filme.Nome = Request["nome"];
                filme.Diretor = Request["diretor"];
                filme.DataLancamento = data;
                filme.Save();

                TempData["sucesso"] = "Filme alterado com sucesso";
            }
            catch
            {
                TempData["erro"] = "Não foi possível realizar a alteração";

            }

            Response.Redirect("/filmes");
        }

    }

}