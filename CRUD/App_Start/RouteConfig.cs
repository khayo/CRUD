using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace CRUD
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                "diretores",
                "diretores",
                new { controller = "Diretores", action = "Index" }
                );

            routes.MapRoute(
                "diretores_criar",
                "diretores/criar",
                new { controller = "Diretores", action = "Criar" }
                );

            routes.MapRoute(
                "diretores_cadastrar",
                "diretores/cadastrar",
                new { controller = "Diretores", action = "Cadastrar" }
                );

            routes.MapRoute(
                "diretores_alterar",
                "diretores/alterar/{id}",
                new { controller = "Diretores", action = "Alterar", id = 0 }
                );

            routes.MapRoute(
                "diretores_excluir",
                "diretores/excluir/{id}",
                new { controller = "Diretores", action = "Excluir", id = 0 }
                );

            routes.MapRoute(
                "diretores_editar",
                "diretores/editar/{id}",
                new { controller = "Diretores", action = "Editar", id = 0 }
                );

            routes.MapRoute(
                "filmes",
                "filmes",
                new { controller = "Filmes", action = "Index" }
                );

            routes.MapRoute(
                "filmes_criar",
                "filmes/criar",
                new { controller = "Filmes", action = "Criar" }
                );

            routes.MapRoute(
                "filmes_cadastrar",
                "filmes/cadastrar",
                new { controller = "Filmes", action = "Cadastrar" }
                );

            routes.MapRoute(
                "filmes_alterar",
                "filmes/alterar/{id}",
                new { controller = "Filmes", action = "Alterar", id = 0 }
                );

            routes.MapRoute(
                "filmes_excluir",
                "filmes/excluir/{id}",
                new { controller = "Filmes", action = "Excluir", id = 0 }
                );

            routes.MapRoute(
                "filmes_editar",
                "filmes/editar/{id}",
                new { controller = "Filmes", action = "Editar", id = 0 }
                );

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
                defaults: new { controller = "Filmes", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}
