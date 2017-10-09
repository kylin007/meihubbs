﻿
//************************************郑小同***********************************************************
using meihu.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace meihu.Controllers
{
    public class I_indexController : Controller
    {
        //
        // GET: /I_index/

        public ActionResult Index()
        {
            #region 用户控件News部分
            int num1 = 0, num2 = 0, num3 = 0, num4 = 0;
            List<I_indexModel> list1 = new List<I_indexModel>();
            List<I_indexModel> list2 = new List<I_indexModel>();
            List<I_indexModel> list3 = new List<I_indexModel>();
            List<I_indexModel> list4 = new List<I_indexModel>();
            I_indexModel hm = new I_indexModel();
            DataTable dt1 = hm.selectTopics();
            DataTable dt2 = hm.selectReply();
            for (int i = 0; i < dt1.Rows.Count; i++)
            {
                 I_indexModel model = new I_indexModel();
                model.Title = dt1.Rows[i]["Title"].ToString();
                model.ID = dt1.Rows[i]["ID"].ToString();
                for (int j = 0; j < dt2.Rows.Count; j++)
                {
                    model.Topic_id = dt2.Rows[j]["Topic_id"].ToString();

                    model.is_img = dt2.Rows[j]["is_img"].ToString();
                    if (model.Topic_id == model.ID)
                    {
                        model.Title1 = model.Title;
                        if (num2 < 9)
                        {
                            list2.Add(model);
                            num2++;
                        }
                        if (num4 < 2 && model.is_img == "1")
                        {
                            model.img = dt2.Rows[j]["img_url"].ToString();
                            list4.Add(model);
                            num4++;
                        }
                    }
                    model.Is_good = dt2.Rows[j]["Is_good"].ToString();
                    if (model.Is_good == "1" && model.Topic_id == model.ID)
                    {
                        model.Title2 = model.Title;
                        if (num3 < 9)
                        {
                            list3.Add(model);
                            num3++;
                        }
                    }
                }
                if (num1 < 9)
                {
                    list1.Add(model);
                    num1++;
                }
            }
            TempData["list1"] = list1;//最新图片
            TempData["list2"] = list2;//最新主题
            TempData["list3"] = list3;//最新回复
            TempData["list4"] = list4;//精华帖
            //News
            #endregion

            #region 首页I_index部分
            List<I_indexModel> forum = new List<I_indexModel>();
            DataTable dt = hm.selectFirst_forum();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                I_indexModel model = new I_indexModel();
                model.First_forum = dt.Rows[i]["First_forum"].ToString();
                DataTable dt_sf = hm.selectSecond_form(dt.Rows[i]["ID"].ToString());
                for (int j = 0; j < dt_sf.Rows.Count; j++)
                {
                    childModel cmodel = new childModel();
                    cmodel.childname = dt_sf.Rows[j]["Second_forum"].ToString();

                    DataTable dt_tf = hm.selectThird_form(dt_sf.Rows[j]["ID"].ToString());
                    int topic_num = dt_tf.Rows.Count;
                    int tie_num = 0;
                    string topic_id = string.Empty;
                    string user_id = string.Empty;
                    string topic_name = string.Empty;
                    string use_name = string.Empty;
                    string last_Replay = string.Empty; 
                    for (int k = 0; k < dt_tf.Rows.Count; k++)
                    {
                        last_Replay = dt_tf.Rows[0]["Last_reply_time"].ToString();
                        topic_id = dt_tf.Rows[0]["ID"].ToString();
                        tie_num += Convert.ToInt32(dt_tf.Rows[k]["Reply_num"].ToString());  
                        if (dt_sf.Rows[j]["ID"].ToString() == Convert.ToString(66))
                        {
                            topic_name = dt_tf.Rows[0]["Title"].ToString();
                            use_name = dt_tf.Rows[0]["User_name"].ToString();
                            user_id = dt_tf.Rows[0]["ID1"].ToString();
                        }
                    }



                    DataTable dtt = hm.selectFith_form(dt_sf.Rows[j]["ID"].ToString());
                    string a = DateTime.Now.ToShortDateString().ToString();
                    int num = 0;
                    for(int k = 0 ; k < dtt.Rows.Count ; k++)
                    {
                        string c = dtt.Rows[k]["Create_on_time"].ToString().Split(' ')[0];
                        if (a == c)
                        {
                            num++;
                        }
                    }

                    DataTable dt_ff = hm.selectFourth_form(dt_sf.Rows[j]["ID"].ToString());
                    for (int k = 0; k < dt_ff.Rows.Count; k++ )
                    {
                        string b = dt_ff.Rows[k]["Reply_time"].ToString().Split(' ')[0];
                        if (b == a)
                        {
                            num++;
                        }
                    }//统计当天的发帖数


                        tie_num += topic_num;
                    cmodel.list.Add(topic_num.ToString());
                    cmodel.list.Add(tie_num.ToString());
                    cmodel.list.Add(last_Replay);
                    cmodel.list.Add(topic_name);
                    cmodel.list.Add(use_name);
                    cmodel.list.Add(topic_id);
                    cmodel.list.Add(user_id);
                    cmodel.list.Add(num.ToString());
                    model.listmodel.Add(cmodel);
                }
                forum.Add(model);
            }
            TempData["forum"] = forum;
            #endregion
            return View("Index");
        }
    }
}