using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using meihu.Models;
using System.Data;
namespace meihu.Controllers
{
    public class GoodfriController : Controller
    {
        //
        // GET: /Goodfri/
        int ID = 47;
        public ActionResult Index()
        {
            List<Goodfriend>  good = new List<Goodfriend>();
            Goodfriend goods = new Goodfriend();
            DataTable ds =goods.user_friend(ID);
            for (int i = 0; i < ds.Rows.Count; i++)
            {
                string ID1= ds.Rows[i]["User_id"].ToString();//本人ID
                DataTable ds0 = goods.user_friend(this.ID); //duifang
                for (int J = 0; J < ds0.Rows.Count; J++)
                {

                }
                    good.Add(goods);
            }
            ViewBag.userfriend = good;
            return View();
        }

    }
}
