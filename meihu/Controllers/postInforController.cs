﻿using meihu.App_Code;
using meihu.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;


//李小梅
namespace meihu.Controllers //代码重构
{
    public class postInforController : Controller
    {
        //
        // GET: /postInfor/

        //页面运行
        public ActionResult post()
        {
            string pagnum = Request.Params["pageNum"];
            if (pagnum == null)
            {
                pagnum = "1";
            }

            string usidse = null;
            //usidse = "1059";
            if (Session["User_id"] == null)
            {
                usidse = null;
            }
            else
            {
                usidse = Session["User_id"].ToString();
            }

            string id;//帖子id
            //string toid = "1040";
            string toid;
            toid = Request.Params["id"];

            List<Post> list = new List<Post>();
            List<Post> listReply = new List<Post>();
            List<Post> listeva = new List<Post>();
            Post sitem = new Post();


            DataTable dtOneid = sitem.OneClassify(toid);
            DataTable dt = sitem.twoClassify(toid);
            DataTable dttitle = sitem.postTitle(toid);
            DataTable divnum = sitem.selectSingleMessage(toid);

            string lnk = divnum.Rows[0]["Visit_num"].ToString();
            string usid = dttitle.Rows[0]["User_id"].ToString();

            DataTable uenme = sitem.username(usid);

            DataTable them = sitem.susermeage("主题数", usid);
            DataTable friend = sitem.susermeage("好友数", usid);
            DataTable score = sitem.susermeage("积分", usid);
            DataTable major = sitem.susermeage("专业", usid);
            DataTable grade = sitem.susermeage("年级", usid);
            DataTable money = sitem.susermeage("金钱", usid);
            DataTable portrait = sitem.susermeage("头像", usid);
            DataTable usignmessage = sitem.signmesge(usid);
            DataTable reply = sitem.reply(toid);
            DataTable evaluate = sitem.evamesg(toid);
            DataTable son = sitem.son(toid);
            Post po = new Post();
            Post poeva = new Post();

            if (usidse == null)
            {
                po.isusing = 0;
            }
            else
            {
                po.isusing = 1;
            }

            po.idw = toid; // 帖子id
            if (son.Rows.Count == 0)
            {
                po.sonof = null;
            }
            else
            {
                po.sonof = son.Rows[0]["Son_forum"].ToString();
            }
            //po.sonof = dtOneid.Rows[1]["First_forum"].ToString();
            string evaid;
            if(evaluate.Rows.Count == 0)
            {
                evaid = "暂无用户评分";
                po.evaname = "暂无用户评分";
            }
            else{
                for (int i = 0; i < evaluate.Rows.Count; i++)
                {
                    evaid = evaluate.Rows[i]["Evaluation_user_id"].ToString();
                    DataTable evaus = sitem.username(evaid);
                    poeva.evaname = evaus.Rows[0]["User_name"].ToString();
                    poeva.evacont = evaluate.Rows[0]["Evaluation_content"].ToString();
                    listeva.Add(poeva);
                }
            }

            po.Second_forum = dt.Rows[0]["Second_forum"].ToString();
            po.One_forum = dtOneid.Rows[0]["First_forum"].ToString();
            po.title = dttitle.Rows[0]["title"].ToString();

            po.time = dttitle.Rows[0]["Create_on_time"].ToString();
            po.content = dttitle.Rows[0]["Topic_content"].ToString();
            po.vinum = divnum.Rows[0]["Visit_num"].ToString();
            po.ronum = divnum.Rows[0]["Reply_num"].ToString();
            po.collect = divnum.Rows[0]["Collection_num"].ToString();
            po.evaluation = divnum.Rows[0]["Evaluation_num"].ToString();

            po.ude = uenme.Rows[0]["User_name"].ToString();
            try
            {
                po.theme = them.Rows[0]["Data_cont"].ToString();
                po.firendNum = friend.Rows[0]["Data_cont"].ToString();
                po.scoreNum = score.Rows[0]["Data_cont"].ToString();
                po.majorName = major.Rows[0]["Data_cont"].ToString();
                po.gradeName = grade.Rows[0]["Data_cont"].ToString();
                po.moneyNum = money.Rows[0]["Data_cont"].ToString();
                po.portrait = portrait.Rows[0]["Data_cont"].ToString();
            }
            catch (Exception ex)
            {

                //ClientScript.RegisterStartupScript(this.GetType()（当前页面）, "（要传的参数）", " <script lanuage=javascript> alert('修改成功！');location.href='" + ViewState["retu"].ToString() + "';</script>");
            }
            
            if (usignmessage.Rows.Count == 0)
            {
                po.expression = "该用户从未签到";
            }
            else
            {
                po.expression = usignmessage.Rows[0]["Expression"].ToString();
                po.signtime = usignmessage.Rows[0]["Sign_time"].ToString();
                po.day = usignmessage.Rows[0]["All_day"].ToString();
            }

            list.Add(po);

            try
            {
                for (var i = 0; i < reply.Rows.Count; i++)
                {
                    Post rep = new Post();
                    string idreply = reply.Rows[i]["Reply_user_id"].ToString();

                    rep.time = reply.Rows[i]["Reply_time"].ToString();
                    rep.flor = reply.Rows[i]["Reply_floor"].ToString();
                    rep.evaluation = reply.Rows[i]["Evaluation_num"].ToString();
                    rep.content = reply.Rows[i]["Reply_content"].ToString();

                    DataTable uenmere = sitem.username(idreply);
                    rep.ude = uenmere.Rows[0]["User_name"].ToString();

                    DataTable themrep = sitem.susermeage("主题数", idreply);
                    DataTable friendrep = sitem.susermeage("好友数", idreply);
                    DataTable scorerep = sitem.susermeage("积分", idreply);
                    DataTable majorrep = sitem.susermeage("专业", idreply);
                    DataTable graderep = sitem.susermeage("年级", idreply);
                    DataTable moneyrep = sitem.susermeage("金钱", idreply);
                    DataTable portraitrep = sitem.susermeage("头像", idreply);
                    DataTable usignmessagerep = sitem.signmesge(idreply);

                    try
                    {
                        rep.theme = themrep.Rows[0]["Data_cont"].ToString();
                        rep.firendNum = friendrep.Rows[0]["Data_cont"].ToString();
                        rep.scoreNum = scorerep.Rows[0]["Data_cont"].ToString();
                        rep.majorName = majorrep.Rows[0]["Data_cont"].ToString();
                        rep.gradeName = graderep.Rows[0]["Data_cont"].ToString();
                        rep.moneyNum = moneyrep.Rows[0]["Data_cont"].ToString();
                        rep.portrait = portraitrep.Rows[0]["Data_cont"].ToString();
                    }
                    catch
                    {

                    }
                    
                    if (usignmessagerep.Rows.Count == 0)
                    {
                        rep.expression = "该用户从未签到";
                    }
                    else
                    {
                        rep.expression = usignmessagerep.Rows[0]["Expression"].ToString();
                        rep.signtime = usignmessagerep.Rows[0]["Sign_time"].ToString();
                        rep.day = usignmessagerep.Rows[0]["All_day"].ToString();
                    }


                    list.Add(rep);
                }
            }
            catch
            {
                Console.Write("请完善数据库回帖人信息");
            }

            sitem.loknum(toid, lnk);

            TempData["list"] = list;
            TempData["listeva"] = listeva;

            return View();
        }

        //获取用户信息
        public ContentResult process()
        {
            //Response.Write("<script>alert('Attention please 0');</script>");

            List<Post> list = new List<Post>();
            Post sitem = new Post();
            Post rep = new Post();

            //string usidse = "1059";
            string  usidse;
            //usidse = "1059";
            usidse = Session["User_id"].ToString();
            int x = Convert.ToInt32(Session["User_id"].ToString());

            string tim = Request.Form[1].ToString();
            string contentre = Request.Form[0].ToString();
            string length = Request.Form[2].ToString();
            int lg = Convert.ToInt32(length);
            int tid = Convert.ToInt32(Request.Form[3]);

            //DateTime time = DateTime.Now.ToLocalTime();
            //string create_time = time.ToLocalTime().ToString("yyyy-M-d HH:mm");
            int ri = sitem.repmes(tid, x, lg, contentre);
            
            try
            {
                //DataTable divnum = sitem.selectSingleMessage(usidse);
                DataTable uenmere = sitem.username(usidse);
                DataTable themrep = sitem.susermeage("主题数", usidse);
                DataTable friendrep = sitem.susermeage("好友数", usidse);
                DataTable scorerep = sitem.susermeage("积分", usidse);
                DataTable majorrep = sitem.susermeage("专业", usidse);
                DataTable graderep = sitem.susermeage("年级", usidse);
                DataTable moneyrep = sitem.susermeage("金钱", usidse);
                DataTable portraitrep = sitem.susermeage("头像", usidse);
                DataTable usignmessagerep = sitem.signmesge(usidse);

                rep.ude = uenmere.Rows[0]["User_name"].ToString();
                rep.theme = themrep.Rows[0]["Data_cont"].ToString();
                rep.firendNum = friendrep.Rows[0]["Data_cont"].ToString();
                rep.scoreNum = scorerep.Rows[0]["Data_cont"].ToString();
                rep.majorName = majorrep.Rows[0]["Data_cont"].ToString();
                rep.gradeName = graderep.Rows[0]["Data_cont"].ToString();
                rep.moneyNum = moneyrep.Rows[0]["Data_cont"].ToString();
                rep.portrait = portraitrep.Rows[0]["Data_cont"].ToString();

                if (usignmessagerep.Rows.Count == 0)
                {
                    rep.expression = "该用户从未签到";
                }
                else
                {
                    rep.expression = usignmessagerep.Rows[0]["Expression"].ToString();
                    rep.signtime = usignmessagerep.Rows[0]["Sign_time"].ToString();
                    rep.day = usignmessagerep.Rows[0]["All_day"].ToString();
                }
            }
            catch
            {
                //Response.Write("<script>alert('Attention please');</script>");
            }
            list.Add(rep);

            TempData["list"] = list;
            TempData["rep"] = rep;

            var result = JsonConvert.SerializeObject(rep);
            return Content(result);
        }

        //发帖
        public ContentResult FastPost()
        {
            try
            {
                string usidse;
                //usidse = "1059";
                usidse = Session["User_id"].ToString();

                string Forid = "";
                string title = Request.Form[0].ToString();
                string topic_content = Request.Form[1].ToString();

                Post sitem = new Post();
                string nowid = Request.Form[2].ToString();

                DataTable dtOneid = sitem.OneClassify(nowid);
                DataTable dt = sitem.twoClassify(nowid);

                string secid = dt.Rows[0]["Second_forum"].ToString();
                string seconid = dt.Rows[0]["ID"].ToString();
                string oneid = dtOneid.Rows[0]["First_forum"].ToString();

                
                DataTable dtq = new DataTable();
                dtq = sitem.sona(seconid);

                string sin;
                string is_son;
                if (dtq.Rows.Count > 0)
                {
                    sin = dtq.Rows[0]["ID"].ToString();
                    is_son = "1";
                }
                else
                {
                    sin = seconid;
                    is_son = "0";
                }

                int incspr = sitem.instop(sin, is_son, usidse, title, topic_content);

                if (incspr == 1)
                {
                    Post cs = new Post();
                    DataTable dt2 = cs.selectPN();

                    int topic_id = Convert.ToInt32(dt2.Rows[0]["ID"].ToString());
                    int last_reply_id = Convert.ToInt32(usidse);
                    sitem.tomes(topic_id, last_reply_id);

                    Post tl = new Post();
                    tl.topic_id = topic_id.ToString();
                    TempData["tl"] = tl;

                    var result = JsonConvert.SerializeObject(tl);
                    return Content(result);
                }
                else
                {
                    return Content("false");
                }
            }
            catch
            {
                return Content("false");
            }
        }

        //发消息
        public ContentResult sendmess()
        {
            //DataBase db = new DataBase();
            string usidse = null;
            //usidse = "1059";
            usidse = Session["User_id"].ToString();

            Dictionary<string, string> stackholder = new Dictionary<string, string>();//定义泛型字典对象

            var result = "";
            string toid=null;
            try
            {

                string user_name;//自己名字:Demo

                Post sitem = new Post();

                DataTable usna = sitem.username(usidse);
                user_name = usna.Rows[0]["User_name"].ToString();

                toid = Request.Form[0].ToString(); //帖子id；
                int et = Convert.ToInt32(Request.Form[3]);  //回复楼层
                string fri_id;

                if(et == 1){
                    DataTable ftid = sitem.postTitle(toid);
                    fri_id = ftid.Rows[0]["User_id"].ToString();
                }
                else{
                    DataTable reid = sitem.reply(toid);
                    fri_id = reid.Rows[et-2]["Reply_user_id"].ToString();
                }

                string fri_name = Request.Form[1].ToString();//交流对象的名字:不知的天堂
                string text = Request.Form[2].ToString();//交流的内容 lei
                DateTime Time = DateTime.Now;            //时间
                string time = DateTime.Now.ToString("yyyy-MM-dd");

                stackholder.Add("交流对象", fri_name);//交流对象的名字
                ViewData["stackholder"] = stackholder; // 返回交流对象的名字

                string all_id = usidse + "," + fri_id;
                string all_id1 = fri_id + "," + usidse;

                string str = "";
                DataTable dt = sitem.talk(all_id, all_id1);

                if (dt.Rows.Count == 0)
                {//如果不存在，创建两人聊天组
                    sitem.intalkgroup(all_id);
                }

                //查找当前组id
                DataTable dt1 = sitem.talk(all_id, all_id1);

                int group_id = Convert.ToInt32(dt1.Rows[0]["ID"]);
                //插入聊天语句
                if (text != "")
                {
                    int n = sitem.talkmess(usidse, group_id, text);
                }
                //获取聊天组中的信息,并存在dt表中

                DataTable dt2 = sitem.setalme(group_id, time);

                dt2.Columns.Add("用户名");
                dt2.Columns.Add("登录者");
                dt2.Rows[0]["登录者"] = user_name;

                for (int i = 0; i < dt2.Rows.Count; i++)
                {
                    var id = Convert.ToInt32(dt2.Rows[i]["Talk_user_id"]);
                    DataTable df = sitem.username(id.ToString());
                    dt2.Rows[i]["用户名"] = df.Rows[0]["User_name"].ToString();
                }
                result = JsonConvert.SerializeObject(dt2);
            }
            catch
            {
                Response.Write("<script>window.location.href='" + "/postInfor/post?id=" + toid + "';</script>");
                Response.Write("<script>alert('请您先登录!')</script>");
            }

            return Content(result);

        }

        //查找接收消息人的id

        #region 查找接收消息人的id
        public ContentResult onlysky()
        {
            //Response.Write("dfdf");
            Post sitem = new Post();

            string toid = null;

            toid = Request.Form[0].ToString(); //帖子id；
            int et = Convert.ToInt32(Request.Form[1]);  //回复楼层
            string fri_id;

            if (et == 1)
            {
                DataTable ftid = sitem.postTitle(toid);
                fri_id = ftid.Rows[0]["User_id"].ToString();
            }
            else
            {
                DataTable reid = sitem.reply(toid);
                fri_id = reid.Rows[et - 2]["Reply_user_id"].ToString();
            }
           
            Post tl = new Post();
            tl.topic_id = fri_id.ToString();
            TempData["tl"] = tl;

            var result = JsonConvert.SerializeObject(tl);
            
            return Content(result);
        }
        #endregion

        //评分

        #region 评分
        public ContentResult eva()
        {
            Post sitem = new Post();

            string usidse = null;
            //usidse = "1059";
            usidse = Session["User_id"].ToString(); //用户id

            DataTable uenme = sitem.username(usidse);
            string name = uenme.Rows[0]["User_name"].ToString();

            string toid = null;

            toid = Request.Form[0].ToString(); //帖子id；
            string evareson = Request.Form[1].ToString();//评分理由 
            int q = sitem.upeva(toid, usidse, evareson);

            Post tl = new Post();
            tl.evanamehh = name.ToString();
            TempData["tl"] = tl;

            var result = JsonConvert.SerializeObject(tl);
            return Content(result);

            #region 插入数据是否成功
            //if (q > 0)
            //{
            //    return Content(result);
            //}
            //else
            //{
            //    return Content("false");
            //}
            #endregion
        }
        #endregion
    }
}