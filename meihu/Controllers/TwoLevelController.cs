﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using meihu.Models;
using System.Data;

using Newtonsoft.Json;

//林玲

namespace meihu.Controllers
{
    public class TwoLevelController : Controller
    {
      
        public ActionResult TwoLevel() //二级版块和子版块显示的内容
        {
            //string STR = "郑大生活";          
            string STR = Request.Params["name"].Replace('0', '&'); //二级版块的名字，或者是子版块名字
            string PAGENUM = Request.Params["pagenum"]; //跳转的页数
            if (PAGENUM == null)
                PAGENUM = "1";
            List<TwoLevel> list = new List<TwoLevel>();
            List<TwoLevel> listIS = new List<TwoLevel>(); //是否有子版块
            List<TwoLevel> listSM = new List<TwoLevel>(); //子版块信息
            List<TwoLevel> listNM = new List<TwoLevel>();
            List<TwoLevel> listSN = new List<TwoLevel>();
            List<TwoLevel> listC = new List<TwoLevel>();
            List<TwoLevel> listN = new List<TwoLevel>();
            List<TwoLevel> listD = new List<TwoLevel>();
            List<TwoLevel> listF = new List<TwoLevel>();

            TwoLevel cs = new TwoLevel();
            TwoLevel tlC = new TwoLevel();
            TwoLevel cn = new TwoLevel();
            TwoLevel cd = new TwoLevel();

            DataTable dt2 = cs.selectIS(STR); //查找二级版块的ID
            DataTable dt100 = cs.selectSID(STR);//查找子版块的ID

            if (dt2.Rows.Count > 0)
            {
                DataTable dt1 = cs.selectS(STR); //查找子版块名字、及是否有子版块
                DataTable dt5 = cs.selectPN(STR);//当STR是二级版块名字时，查找该版块的主题信息
                DataTable dt0 = cs.selectF(dt2.Rows[0]["First_forum_id"].ToString());//查找该二级版块对应的一级板块名字

                cs.First_forum = dt0.Rows[0]["First_forum"].ToString();
                cs.Second_forum = null;
                //cs.User_id = Session["User_id"].ToString();
                listF.Add(cs);
                TempData["listF"] = listF;

                cn.Second_forum = STR;
                listN.Add(cn);
                TempData["listN"] = listN;

                cd.Page_num = PAGENUM;
                listD.Add(cd);
                TempData["listD"] = listD;

                for (var i = 0; i < dt1.Rows.Count; i++) //获取子版块信息
                {
                    TwoLevel tl = new TwoLevel();
                    tl.Son_forum = dt1.Rows[i]["Son_forum"].ToString();

                    DataTable dt3 = tl.selectSM(dt1.Rows[i]["Son_forum"].ToString());
                    int Post_num = 0;
                    for (var j = 0; j < dt3.Rows.Count; j++)
                    {
                        if (dt3.Rows[j]["Is_son"].ToString() == "1") //只有当该主题属于子版块时，才会显示在子版块的页面里
                        {
                            TwoLevel tlSM = new TwoLevel();
                            tlSM.Title = dt3.Rows[j]["Title"].ToString();
                            string s1 = string.Format("{0:g}", dt3.Rows[j]["Create_on_time"]);
                            //string s2 = s1.Split('星')[0].Replace('/', '-');
                            //string s3 = s1.Split('午')[1];
                            //tlSM.Create_on_time = s2 + s3;
                            //tlSM.Create_on_time = dt3.Rows[j]["Create_on_time"].ToString();
                            tlSM.Create_on_time = s1.Replace('/', '-');
                            tlSM.ID = dt3.Rows[j]["ID"].ToString();
                            tlSM.Person_Data = dt3.Rows[j]["User_id"].ToString();

                            DataTable dt4 = tlSM.selectUM(dt3.Rows[j]["User_id"].ToString());
                            tlSM.User_name = dt4.Rows[0]["User_name"].ToString();

                            listSM.Add(tlSM);
                            break;
                        }
                    }
                    TempData["listSM"] = listSM;

                    int Topic_num = 0;
                    for (var k = 0; k < dt3.Rows.Count; k++)
                    {
                        if (dt3.Rows[k]["Is_son"].ToString() == "1")
                        {
                            DataTable dt9 = tl.selectIT(dt3.Rows[k]["ID"].ToString());
                            Post_num += Convert.ToInt32(dt9.Rows[0]["Reply_num"]);
                            Topic_num++;
                        }
                    }

                    tl.Topic_num = Topic_num; //子版块主题数目
                    Post_num += Topic_num;
                    tl.Post_num = Post_num; //子版块帖子数目
                    list.Add(tl);
                }
                TempData["list"] = list;

                for (var i = 0; i < dt2.Rows.Count; i++) //是否该二级版块含有子版块
                {
                    TwoLevel tl = new TwoLevel();
                    tl.Is_son = dt2.Rows[i]["Is_son"].ToString();
                    listIS.Add(tl);
                }
                TempData["listIS"] = listIS;

                int C = 0;
                for (var i = 0; i < dt5.Rows.Count; i++)
                    if (dt5.Rows[i]["Is_son"].ToString() == "0") C++;
                if (C == 0)
                {
                    tlC.Today_topic_num = 0;
                    tlC.Sum_topic_num = 0;
                    listC.Add(tlC);
                    TempData["listC"] = listC;
                }

                for (var i = 0; i < dt5.Rows.Count; i++)
                {
                    TwoLevel tl = new TwoLevel();
                    if (dt5.Rows[i]["Is_son"].ToString() == "0")
                    {
                        tl.Title = dt5.Rows[i]["Title"].ToString();
                        tl.ID = dt5.Rows[i]["ID"].ToString();
                        tl.Person_Data = dt5.Rows[i]["User_id"].ToString();
                        if (dt5.Rows[i]["Is_close"].ToString() == "0")
                        {
                            tl.Top_img = "/image/folder_common.gif";
                            tl.Mouse_title = "新窗口打开";
                        }
                        else tl.Top_img = "/image/folder_lock.gif";
                        string s1 = string.Format("{0:g}", dt5.Rows[i]["Create_on_time"]);
                        //string s2 = s1.Split('星')[0].Replace('/', '-');
                        //string s3 = s1.Split('午')[1];
                        //tl.Create_on_time = s2 + s3;
                        //tl.Create_on_time = dt5.Rows[i]["Create_on_time"].ToString();
                        tl.Create_on_time = s1.Replace('/', '-');
                        DataTable dt6 = tl.selectIT(dt5.Rows[i]["ID"].ToString());
                        tl.Reply_num = dt6.Rows[0]["Reply_num"].ToString();
                        tl.Visit_num = dt6.Rows[0]["Visit_num"].ToString();
                        tl.Is_img = dt6.Rows[0]["Is_img"].ToString();
                        tl.Is_good = dt6.Rows[0]["Is_good"].ToString();
                        tl.Evaluation_num = dt6.Rows[0]["Evaluation_num"].ToString();
                        tl.Last_person_data = dt6.Rows[0]["Last_reply_id"].ToString();
                        string s4 = string.Format("{0:g}", dt6.Rows[0]["Last_reply_time"]);
                        //string s5 = s4.Split('星')[0].Replace('/', '-');
                        //string s6 = s4.Split('午')[1];
                        //tl.Last_reply_time = s5 + s6;
                        //tl.Last_reply_time = dt6.Rows[0]["Last_reply_time"].ToString();
                        tl.Last_reply_time = s4.Replace('/', '-');
                        DataTable dt7 = tl.selectUM(dt5.Rows[i]["User_id"].ToString());
                        tl.User_name = dt7.Rows[0]["User_name"].ToString();
                        DataTable dt8 = tl.selectUM(dt6.Rows[0]["Last_reply_id"].ToString());
                        tl.Last_user_name = dt8.Rows[0]["User_name"].ToString();

                        int Sum_topic_num = 0;
                        for (var j = 0; j < dt5.Rows.Count; j++)
                            if (dt5.Rows[j]["Is_son"].ToString() == "0") Sum_topic_num++;
                        tlC.Sum_topic_num = Sum_topic_num;

                        int Today_topic_num = 0;
                        DateTime now = DateTime.Now.ToLocalTime();
                        string Now_time = now.ToLocalTime().ToString("yyyy-M-d HH:mm:ss");
                        Now_time = Now_time.Replace('-', '/');
                        for (var k = 0; k < dt5.Rows.Count; k++)
                            if (dt5.Rows[k]["Is_son"].ToString() == "0" && dt5.Rows[k]["Create_on_time"].ToString().Split(' ')[0] == Now_time.Split(' ')[0])
                                Today_topic_num++;
                        for (var y = 0; y < dt5.Rows.Count; y++)
                        {
                            if (dt5.Rows[y]["Is_son"].ToString() == "0")
                            {
                                TwoLevel tlRN = new TwoLevel();
                                DataTable dt10 = tlRN.selectRN(dt5.Rows[y]["ID"].ToString());
                                for (var x = 0; x < dt10.Rows.Count; x++)
                                    if (dt10.Rows[x]["Reply_time"].ToString().Split(' ')[0] == Now_time.Split(' ')[0])
                                        Today_topic_num++;
                            }
                        }
                        tlC.Today_topic_num = Today_topic_num;
                        //tlC.Second_forum = STR;
                        //tlC.Page_num = PAGENUM;

                        if (dt6.Rows[0]["Is_top"].ToString() == "1")
                        {
                            if (dt5.Rows[i]["Is_close"].ToString() == "1")
                                tl.Mouse_title = "本版置顶主题 - 关闭的主题 - 新窗口打开";
                            listSN.Add(tl);
                        }
                        else
                        {
                            if (dt5.Rows[i]["Is_close"].ToString() == "1")
                                tl.Mouse_title = "关闭的主题 - 新窗口打开";
                            listNM.Add(tl);
                        }
                        listC.Add(tlC);
                    }
                }
                TempData["listSN"] = listSN;
                TempData["listNM"] = listNM;
                TempData["listC"] = listC;
            }
            else if (dt100.Rows.Count > 0)
            {
                TempData["listIS"] = listIS;

                DataTable dt5 = cs.selectSM(STR);//当STR是子版块名字时，查找该版块的主题信息
                DataTable dt101 = cs.selectSecond(dt100.Rows[0]["Second_forum_id"].ToString());//查找该子版块对应的二级板块名字
                DataTable dt0 = cs.selectF(dt101.Rows[0]["First_forum_id"].ToString());//查找该子版块对应的一级板块名字

                cs.First_forum = dt0.Rows[0]["First_forum"].ToString();
                cs.Second_forum = dt101.Rows[0]["Second_forum"].ToString();
                //cs.User_id = Session["User_id"].ToString();
                listF.Add(cs);
                TempData["listF"] = listF;

                cn.Second_forum = STR;
                listN.Add(cn);
                TempData["listN"] = listN;

                cd.Page_num = PAGENUM;
                listD.Add(cd);
                TempData["listD"] = listD;

                int C = 0;
                for (var i = 0; i < dt5.Rows.Count; i++)
                    if (dt5.Rows[i]["Is_son"].ToString() == "0") C++;
                if (C == 0)
                {
                    tlC.Today_topic_num = 0;
                    tlC.Sum_topic_num = 0;
                    listC.Add(tlC);
                    TempData["listC"] = listC;
                }

                for (var i = 0; i < dt5.Rows.Count; i++)
                {
                    TwoLevel tl = new TwoLevel();
                    if (dt5.Rows[i]["Is_son"].ToString() == "1")
                    {
                        tl.Title = dt5.Rows[i]["Title"].ToString();
                        tl.ID = dt5.Rows[i]["ID"].ToString();
                        tl.Person_Data = dt5.Rows[i]["User_id"].ToString();
                        if (dt5.Rows[i]["Is_close"].ToString() == "0")
                        {
                            tl.Top_img = "/image/folder_common.gif";
                            tl.Mouse_title = "新窗口打开";
                        }
                        else tl.Top_img = "/image/folder_lock.gif";
                        string s1 = string.Format("{0:g}", dt5.Rows[i]["Create_on_time"]);
                        //string s2 = s1.Split('星')[0].Replace('/', '-');
                        //string s3 = s1.Split('午')[1];
                        //tl.Create_on_time = s2 + s3;
                        //tl.Create_on_time = dt5.Rows[i]["Create_on_time"].ToString();
                        tl.Create_on_time = s1.Replace('/', '-');
                        DataTable dt6 = tl.selectIT(dt5.Rows[i]["ID"].ToString());
                        tl.Reply_num = dt6.Rows[0]["Reply_num"].ToString();
                        tl.Visit_num = dt6.Rows[0]["Visit_num"].ToString();
                        tl.Is_img = dt6.Rows[0]["Is_img"].ToString();
                        tl.Is_good = dt6.Rows[0]["Is_good"].ToString();
                        tl.Evaluation_num = dt6.Rows[0]["Evaluation_num"].ToString();
                        tl.Last_person_data = dt6.Rows[0]["Last_reply_id"].ToString();
                        string s4 = string.Format("{0:g}", dt6.Rows[0]["Last_reply_time"]);
                        //string s5 = s4.Split('星')[0].Replace('/', '-');
                        //string s6 = s4.Split('午')[1];
                        //tl.Last_reply_time = s5 + s6;
                        //tl.Last_reply_time = dt6.Rows[0]["Last_reply_time"].ToString();
                        tl.Last_reply_time = s4.Replace('/', '-');
                        DataTable dt7 = tl.selectUM(dt5.Rows[i]["User_id"].ToString());
                        tl.User_name = dt7.Rows[0]["User_name"].ToString();
                        DataTable dt8 = tl.selectUM(dt6.Rows[0]["Last_reply_id"].ToString());
                        tl.Last_user_name = dt8.Rows[0]["User_name"].ToString();

                        int Sum_topic_num = 0;
                        for (var j = 0; j < dt5.Rows.Count; j++)
                            if (dt5.Rows[j]["Is_son"].ToString() == "1") Sum_topic_num++;
                        tlC.Sum_topic_num = Sum_topic_num;

                        int Today_topic_num = 0;
                        DateTime now = DateTime.Now.ToLocalTime();
                        string Now_time = now.ToLocalTime().ToString("yyyy-M-d HH:mm:ss");
                        Now_time = Now_time.Replace('-', '/');
                        for (var k = 0; k < dt5.Rows.Count; k++)
                            if (dt5.Rows[k]["Is_son"].ToString() == "1" && dt5.Rows[k]["Create_on_time"].ToString().Split(' ')[0] == Now_time.Split(' ')[0])
                                Today_topic_num++;
                        for (var y = 0; y < dt5.Rows.Count; y++)
                        {
                            if (dt5.Rows[y]["Is_son"].ToString() == "1")
                            {
                                TwoLevel tlRN = new TwoLevel();
                                DataTable dt10 = tlRN.selectRN(dt5.Rows[y]["ID"].ToString());
                                for (var x = 0; x < dt10.Rows.Count; x++)
                                    if (dt10.Rows[x]["Reply_time"].ToString().Split(' ')[0] == Now_time.Split(' ')[0])
                                        Today_topic_num++;
                            }
                        }
                        tlC.Today_topic_num = Today_topic_num;
                        //tlC.Second_forum = STR;
                        //tlC.Page_num = PAGENUM;

                        if (dt6.Rows[0]["Is_top"].ToString() == "1")
                        {
                            if (dt5.Rows[i]["Is_close"].ToString() == "1")
                                tl.Mouse_title = "本版置顶主题 - 关闭的主题 - 新窗口打开";
                            listSN.Add(tl);
                        }
                        else
                        {
                            if (dt5.Rows[i]["Is_close"].ToString() == "1")
                                tl.Mouse_title = "关闭的主题 - 新窗口打开";
                            listNM.Add(tl);
                        }
                        listC.Add(tlC);
                    }
                }
                TempData["listSN"] = listSN;
                TempData["listNM"] = listNM;
                TempData["listC"] = listC;
            }
            return View();
        }
        public ContentResult FastPost() //发帖时进行数据的插入及跳转
        {           
            try
            {
                string title = Request.Form[0].ToString();
                string topic_content = Request.Form[1].ToString();
                string str = Request.Form[2].ToString();            

                SqlCommon db = new SqlCommon();

                List<TwoLevel> list1 = new List<TwoLevel>();
                TwoLevel cs = new TwoLevel();
                DataTable dt1 = cs.selectIS(str);
                DataTable dt3 = cs.selectSID(str);
                int forum_id, is_son;
                if (dt1.Rows.Count > 0)
                {
                    forum_id = Convert.ToInt32(dt1.Rows[0]["ID"].ToString());
                    is_son = 0;
                }
                else
                {
                    forum_id = Convert.ToInt32(dt3.Rows[0]["ID"].ToString());
                    is_son = 1;
                }
                int user_id = Convert.ToInt32(Session["User_id"].ToString());
                DateTime time = DateTime.Now.ToLocalTime();
                string create_time = time.ToLocalTime().ToString("yyyy-M-d HH:mm:ss");
                int is_close = 0;
                int topic_permissions = 0;

                string sql1 = string.Format("INSERT INTO Create_topic VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')", forum_id, is_son, user_id, title, topic_content, create_time, is_close, topic_permissions);
                if (db.check(sql1) == 1)
                {
                    DataTable dt2 = new DataTable() ;
                    if (dt1.Rows.Count > 0)
                    {
                        dt2 = cs.selectPN(str);
                    }
                    else 
                    {
                        dt2 = cs.selectSM(str);
                    }
                    int topic_id = Convert.ToInt32(dt2.Rows[0]["ID"].ToString());
                    int visit_num = 0;
                    int reply_num = 0;
                    int last_reply_id = user_id;
                    string last_reply_time = create_time;
                    int is_good = 0;
                    int is_first_forum = 1;
                    int is_img = 0;
                    int is_top = 0;
                    int collection_num = 0;
                    int evaluation_num = 0;
                    string img_url = null;

                    string sql2 = string.Format("INSERT INTO Topic_message VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}')", topic_id, visit_num, reply_num, last_reply_id, last_reply_time, is_good, is_first_forum, is_img, is_top, collection_num, evaluation_num, img_url);
                    db.check(sql2);

                    TwoLevel tl = new TwoLevel();
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
    }
}