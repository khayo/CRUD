using Business;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CRUD.Controllers
{
    public class DiretoresController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Diretores = new Diretor().Lista();
            return View();
        }

        public ActionResult Cadastrar()
        {
            return View();
        }

        [HttpPost]
        public void Criar()
        {
            var diretor = new Diretor();
            diretor.Nome = Request["nome"];
            diretor.Save();
            Response.Redirect("/diretores");
        }

        public void Excluir(int id)
        {
            Diretor.Excluir(id);
            Response.Redirect("/diretores");
        }


        public ActionResult Editar(int id)
        {
            var diretor = Diretor.BuscaPorId(id);
            ViewBag.Diretor = diretor;
            return View();
        }

        [HttpPost]
        public void Alterar(int id)
        {
            try
            {
                var diretor = Diretor.BuscaPorId(id);
                diretor.Nome = Request["nome"];
                diretor.Save();

                TempData["sucesso"] = "Diretor alterado com sucesso";
            }
            catch
            {
                TempData["erro"] = "Não foi possível realizar a alteração";
            }
            Response.Redirect("/diretores");
        }
    }
}