using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using meihu.Models;
using System.Data;
using System.Web.UI.WebControls;


namespace meihu.Controllers  
{
    public class TestController : Controller
    {
        //
        // GET: /Test/
        HomeModel hm = new HomeModel();
        public ActionResult Index()
        {
            ViewData["firstfroum"]= hm.selectUserCount();

            ViewData["dtFROUM"] =hm.froum();
            return View();
        }

    }
}
