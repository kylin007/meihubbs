﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using System.Data;
using System.Data.SqlClient;
using Newtonsoft.Json;
using System.Globalization;
using meihu.Models;

namespace meihu.Controllers
{
    public class HomeController : Controller
    {
        // GET: /Home/
		RegisterModel RegisterM = new RegisterModel();
        PersonDataModel Pmodel = new PersonDataModel();
        My_post My = new My_post();
        public ActionResult Index()
        {
            return View();
        }
        #region  邓春
        public ActionResult PersonData() //-----------------个人资料，点击用户名或者头像显示
        {
            var id1 = "";
            var id2 = "";
            try
            {
                id1 = Request.QueryString.ToString().Split('=')[1];
            }
            catch
            {
                Response.Write("<script>window.location.href='" + "../" + "';</script>");
                Response.Write("<script>layer.alert('加载失败，请重新打开!')</script>");
                return View();
            }
            try
            {
                id2 = Pmodel.Find_name(Convert.ToInt32(Session["User_id"].ToString()));
            }
            catch
            {
                Response.Write("<script>layer.alert('未登录!')</script>");
            }
            //Pmodel.PersonData(id1, id2);

            int id = 0;
            if (id1 != "")
            {
                id = Convert.ToInt32(id1);//获取到点击某个人名传的id
            }
            else
            {

                Response.Write("<script>layer.alert('加载失败，请重新打开!')</script>");
                return View();
            }

            ViewData["stackholder"] = Pmodel.PersonData(id, id2);
        
            return View();
        }
        public ContentResult insert_friends()//-----------判断是否为好友，信息是否发送成功
        {
            var end = "";
            try
            {
                string user_name = Request.Form[0].ToString().Trim();//自己名字:Demo
                string fri_name = Request.Form[1].ToString().Trim();//好友名称:不知的天堂
                string text = Request.Form[2].ToString();//好友附言
                string groups = Request.Form[3].ToString().Trim();//认识方式
                end = Pmodel.Addfriends(user_name, fri_name, text, groups);
            }
            catch
            {
                var error = Pmodel.Find_ID(Request.Form[1].ToString().Trim());
                Response.Write("<script>window.location.href='" + "../Home/PersonData?id=" + error + "';</script>");
                Response.Write("<script>layer.alert('请您先登录!')</script>");
            }
           
            // Response.Write("<script>window.location.href='"+"/Home/PersonData"+"';</script>");
            var result = JsonConvert.SerializeObject(end);//强制转换为json数据;
            return Content(result);
        }
        public ContentResult Send_message()//--------------发消息
        {
            var result = "";
            try
            {
                string user_name = Request.Form[0].ToString();//自己名字:Demo
                string fri_name = Request.Form[1].ToString();//交流对象的名字:不知的天堂
                string text = Request.Form[2].ToString();//交流的内容 lei
                DataTable dt = Pmodel.SendMessage(user_name, fri_name, text);
                result = JsonConvert.SerializeObject(dt);

            }
            catch
            {
                return Content(result);
                var error = Pmodel.Find_ID(Request.Form[1].ToString().Trim());
                Response.Write("<script>window.location.href='" + "/Home/PersonData?id=" + error + "';</script>");
                Response.Write("<script>alert('请您先登录!')</script>");
            }
            return Content(result);
        }
        public ContentResult Topic_show()//-------------------获取个人资料帖子部分所需内容
        {
            string user_name = Request.Form[0].ToString();
            DataTable dt = Pmodel.TopicShow(user_name);
            var result = JsonConvert.SerializeObject(dt);//强制转换为json数据;
            return Content(result);
        }
        public ContentResult Reply_show() //回帖时按照最后回复
        {
            string user_name = Request.Form[0].ToString();
            DataTable dt = Pmodel.ReplyShow(user_name);
            var result = JsonConvert.SerializeObject(dt);//强制转换为json数据;
            return Content(result);
        }

#endregion
        public ActionResult Test()
        {
            return View();
        }

        #region 伊世林
        public ActionResult User_Register()
        {
            return View();
        }

        #region 注册
        public ContentResult Register_on(string text)//判断注册姓名 邮箱是否重复
        {
            string result = null;
            result = RegisterM.Register_on(text);
            return Content(result);
        }

        public ContentResult User_name_right(string text)//判断用户名是否满足要求
        {
            if ((text.IndexOf('@') > 0) || (text.IndexOf(':') > 0) || (text.IndexOf('*') > 0) || (text.IndexOf('\'') > 0) || (text.IndexOf('-') > 0) || (text.IndexOf('\\') > 0) || (text.IndexOf('.') > 0) || (text.IndexOf('_') > 0))
            {
                return Content("false");
            }
            else
            {
                return Content("true");
            }
        }

        public ContentResult Register_in(string text)//注册账号
        {
            string[] val = new string[7];
            for(int i = 0; i<3; i++)
            {
                val[i] = Request.Form[i].ToString();
            }
            val[3] = "安全提问(未设置请忽略)";
            val[4] = null;
            for (int i = 5; i < 7; i++)
            {
                val[i] = Request.Form[i-2].ToString();
            }


            string result = null;
            result = RegisterM.Register_in(val);
            return Content(result);
        }

        #endregion
        #region 登陆

        public ContentResult Login_in(string text)//用户登陆
        {
            string[] val = new string[5];
            for (int i = 0; i < 5; i++)
            {
                val[i] = Request.Form[i].ToString();
            }
           
            string result = null;
            result = RegisterM.Login_in(val);
            return Content(result);
        }

        public ContentResult Is_online(string text)//判断是否在线
        {
            string result = null;
            result = RegisterM.Is_online();
            var result1 = JsonConvert.SerializeObject(result);//强制转换为json数据;
            return Content(result1);
        }

        public ContentResult backdown(string text)//  退出
        {
            string result = null;
            result = RegisterM.backdown(text);
            return Content(result);
        }

        #endregion
        #endregion
        


        #region 张宏乾
        public ActionResult Mypost()
        {
            return View();
        }
        public ActionResult My_post()
        {
            return View();
        }
        public ContentResult getlist(string id, string curpage, string repl, string Text)
        {
           List< Latest_hot > models = new My_post().aaa(id, curpage, repl, Text);
            //result = My.getlist(id,curpage,repl,Text)
         var  result = new
          {

              modellist = models
          };//JsonConvert.SerializeObject(models);
         return Content(JsonConvert.SerializeObject(result));
      
        }
        public ActionResult Introduction()
        {
            return View();
        }
        public ActionResult Send_post()
        {
            return View();
        }
        #endregion

    }
}
