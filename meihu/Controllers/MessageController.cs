﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using meihu.Models;
using System.Data;
using System.Globalization;


namespace meihu.Controllers
{
    public class MessageController : Controller
    {
        //
        // GET: /Message/
        Goodfriend goods = new Goodfriend();
       
        //public string USER() //获取用户名
        //{
        //    string user = Request.Form[0].ToString();
        //    DataTable shu = goods.User_registration(user);  //根据姓名查找用户ID;
        //  Session["User_ID"] = Convert.ToInt32(shu.Rows[0]["ID"].ToString());
        //    return "success";
        //}
        public int falg = 0;
        public ActionResult Indexmessage()
        {
            getmessage();
            return View();

        }
        public ActionResult Indexreform()
        {
            getfriend();
            return View();
        }
        public ActionResult Indexlistform()
        {
            List<Goodfriend> goodlist = new List<Goodfriend>();
           
            DataTable ds =goods.user_friend(Convert.ToInt32(Session["User_ID"]) ); //
            for (int i = 0; i < ds.Rows.Count; i++) //一对多
            {
              
                try
                {
                    Goodfriend goodd = new Goodfriend();
                    int Friend_id = Convert.ToInt32(ds.Rows[i]["Friend_id"].ToString());//转成整型
                    DataTable ds0 = goods.user_friend(Friend_id); //duifang
                    for (int J = 0; J < ds0.Rows.Count; J++)
                    {
                       
                        int ID0 = Convert.ToInt32(ds0.Rows[J]["Friend_id"].ToString());//从对方中查找自己的id
                        if (ID0 == Convert.ToInt32(Session["User_ID"]) )
                        {
                            DataTable ds1 = goodd.user_friends(Friend_id); //根据id获取对方名字
                            goodd.goodname = ds1.Rows[0]["User_name"].ToString();
                            goodlist.Add(goodd);
                        }
                    }
                   

                }
                catch { };
               
            }
            ViewBag.userfriend = goodlist;
            return View();
        }
        //获取信息
        public int getmessage()
        {
            Session["data"] = 0;
            List<Goodfriend> list= new List<Goodfriend>();
            List<Goodfriend> listfri = new List<Goodfriend>();
            try
            {
                string user = Request.Form[0].ToString().Trim();
                DataTable shu = goods.User_registration(user);  //根据姓名查找用户ID;
                Session["User_ID"] = Convert.ToInt32(shu.Rows[0]["ID"].ToString());
            }
            catch { }
            //获取Talk_message中的用户信息
            //获取group
            int userid = Convert.ToInt32(Session["User_ID"]);       
            DataTable Talk_group = goods.Talk_group(); //获取Talk_group-Talk_id_all；
            for (int i = 0; i < Talk_group.Rows.Count; i++)
            {
               
                try
                {
                   
                    string[] Talk_groups = Talk_group.Rows[i]["Talk_id_all"].ToString().Split(',');
                    if (Talk_groups.Length == 2)
                    {
                        int flag = 0,flad=0;
                        string friendid = ""; //判断是否有user--id从而获得好友id                     
                        if (string.Compare(Talk_groups[1],userid.ToString())== 0&&!(string.Compare(Talk_groups[0], userid.ToString()) == 0))//获取对方id 
                        {
                            friendid = Talk_groups[0]; flag=1;
                        }
                        else if(string.Compare(Talk_groups[0], userid.ToString()) == 0&&!(string.Compare(Talk_groups[1], userid.ToString()) == 0))
                        {
                            friendid = Talk_groups[1];flag = 1;
                        }
                        if (flag == 0)
                            continue;

                        //Goodfriend goods = new Goodfriend();
                        Goodfriend goodfri = new Goodfriend();
                        DataTable fritalk = goods.Talk_messagegroup(userid.ToString(), Talk_group.Rows[i]["ID"].ToString());//自己发的消息
                        goodfri.count = fritalk.Rows.Count.ToString();//消息总数                      
                        if (Convert.ToInt32(goodfri.count) > 0)
                        {
                            flad = 1;
                            goodfri.ID =Convert.ToInt32(fritalk.Rows[0]["ID"].ToString());//消息id
                            goodfri.talk = fritalk.Rows[0]["Talk_message"].ToString();//消息
                            goodfri.time = fritalk.Rows[0]["Talk_time"].ToString();//时间                                              
                            DataTable names = goodfri.user_friends(Convert.ToInt32(friendid));
                            goodfri.name = names.Rows[0]["User_name"].ToString();//好友name
                            DataTable urls = goodfri.User_Message(Convert.ToInt32(friendid));
                            string utl = urls.Rows[0]["Data_cont"].ToString();//图片的路径
                            string[] url0 = utl.Split('/');
                            goodfri.url = url0[url0.Length - 1];
                            listfri.Add(goodfri);
                        }
                        DataTable talk = goods.Talk_messagegroup(friendid, Talk_group.Rows[i]["ID"].ToString());  //对方发的消息                         
                          goods.count = talk.Rows.Count.ToString();//消息总数 
                        if (flad == 0 && talk.Rows.Count > 0)  //对方发的消息，你没有发消息
                        {                         
                            int countd = talk.Rows.Count;
                            if (countd > 2)
                            {
                                countd = 2;
                            }
                            Goodfriend goodds = new Goodfriend();
                            for (int d = 0; d < countd; d++)
                            {
                                meihu.Models.Goodfriend.s_child childs = new meihu.Models.Goodfriend.s_child();
                                 childs.IDS = Convert.ToInt32(talk.Rows[0]["ID"].ToString());//消息id
                                childs.talks = talk.Rows[d]["Talk_message"].ToString();//消息0
                                childs.times = talk.Rows[d]["Talk_time"].ToString();//时间1
                                string stry = talk.Rows[d]["Is_Read"].ToString();//falg 
                                if (string.Compare(stry, "1") == 0)
                                {
                                    Session["data"] = 1;
                                }
                                DataTable names = goods.user_friends(Convert.ToInt32(friendid));
                                childs.names = names.Rows[0]["User_name"].ToString();//好友name2
                                DataTable urls = goods.User_Message(Convert.ToInt32(friendid));
                                string utl = urls.Rows[0]["Data_cont"].ToString();//图片的路径3
                                string[] url0 = utl.Split('/');
                                childs.urls = url0[url0.Length - 1];
                                goodds.list.Add(childs);
                                if (countd == 2)
                                {
                                    if (d == 1)
                                    {
                                        goodfri.ID = 0;                         
                                        goodfri.talk = null;
                                        goodfri.time = null;
                                        goodfri.name = childs.names;
                                        goodfri.url = childs.urls;
                                        goodfri.count = "0";
                                        listfri.Add(goodfri);
                                    }
                                }
                                else {
                                    goodfri.ID = 0;                     
                                    goodfri.talk = null;
                                    goodfri.time = null;
                                    goodfri.name = childs.names;
                                    goodfri.url = childs.urls;
                                    goodfri.count = "0";
                                    listfri.Add(goodfri);
                                }
                            }
                            list.Add(goodds);

                        }
                        else  if (flad == 1)  //你发消息了
                        {
                            int countd = talk.Rows.Count;
                            if (countd > 2)
                            {
                                countd = 2;
                            }
                            Goodfriend goodds = new Goodfriend();
                            for (int d = 0; d < countd; d++)
                            {
                                meihu.Models.Goodfriend.s_child childs = new meihu.Models.Goodfriend.s_child();
                                childs.IDS = Convert.ToInt32(talk.Rows[0]["ID"].ToString());//消息id
                                childs.talks = talk.Rows[d]["Talk_message"].ToString();//消息0
                                childs.times = talk.Rows[d]["Talk_time"].ToString();//时间1
                                string stry = talk.Rows[d]["Is_Read"].ToString();//falg 
                                if (string.Compare(stry, "1") == 0)
                                {
                                    Session["data"] = 1;
                                }
                                DataTable names = goods.user_friends(Convert.ToInt32(friendid));
                                childs.names = names.Rows[0]["User_name"].ToString();//好友name2
                                DataTable urls = goods.User_Message(Convert.ToInt32(friendid));
                                string utl = urls.Rows[0]["Data_cont"].ToString();//图片的路径3
                                string[] url0 = utl.Split('/');
                                childs.urls = url0[url0.Length - 1];
                                goodds.list.Add(childs);

                            }
                            list.Add(goodds);
                        }                 
                       
                 
                    
                    }
                    else {
                        continue;
                    }
                   
                }
                catch { }
            }
            ViewBag.talkcontent = listfri;
            ViewBag.talkcontent2 = list;
            return 1;
        }
        //私聊
        public string friend()
        {
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            string contenta = Request.Form[0].ToString().Replace(",", "，");
            string name = Request.Form[1].ToString();  //收件人姓名：
            DataTable shu = goods.User_registration(name);
            if (shu.Rows.Count < 1)
                return "0";//根据姓名查找用户ID;
            int friendid = Convert.ToInt32(shu.Rows[0]["ID"].ToString());

            //查找组
            int groupid =0;
            DataTable shugroup = goods.Talk_group();
            for (int i = 0; i < shugroup.Rows.Count; i++)
            {
                string[] shudata = shugroup.Rows[i]["Talk_id_all"].ToString().Trim().Split(',');
                if (shudata.Length == 2)
                {
                    if (Convert.ToInt32(shudata[0]) == Convert.ToInt32(Session["User_ID"]) && Convert.ToInt32(shudata[1]) == friendid || Convert.ToInt32(shudata[1]) == Convert.ToInt32(Session["User_ID"]) && Convert.ToInt32(shudata[0]) == friendid)
                    {
                        groupid = Convert.ToInt32(shugroup.Rows[i]["ID"].ToString());
                        break;
                    }
                }
            }
            if (!(groupid == 0))
            {
                goods.Talk_message(Convert.ToInt32(Session["User_ID"]), groupid, contenta, date);
            }
            else {
                string nameids = friendid +","+Convert.ToInt32(Session["User_ID"]).ToString();           
                goods.User_friend8(nameids);
                // 获取组 id
                DataTable ids = goods.Talk_group2(nameids);
                int ida = Convert.ToInt32(ids.Rows[0]["ID"].ToString());
                goods.Talk_message(Convert.ToInt32(Session["User_ID"]), ida, contenta, date);
            }

            return "1";
        }
       // 群聊
        public string friends()
        {
            string date = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            //时间
            string contenta = Request.Form[0].ToString().Replace(",", "，"); //文本
            string title = Request.Form[1].ToString(); //标题
            string name = Request.Form[2].ToString(); //姓名

            string titles = null;
            string[] namestr = name.Split(',');
            string[] nameid=new string[namestr.Length+1];
            for (int j = 0; j < namestr.Length; j++)
            {  
                         
                DataTable shu = goods.User_registration(namestr[j]);
                if (shu.Rows.Count < 1)
                    return "0";
                nameid[j] = shu.Rows[0]["ID"].ToString();
            }
            //查找组
            nameid[namestr.Length] = Convert.ToInt32(Session["User_ID"]) .ToString();
            int groupid =0;
            DataTable shugroup =goods.Talk_group();
            for (int i = 0; i < shugroup.Rows.Count; i++)
            {
                string[] shudata = shugroup.Rows[i]["Talk_id_all"].ToString().Trim().Split(',');
                //比较
                if (shudata.Length == nameid.Length)
                {
                    for (int t = 0; t < nameid.Length; t++)
                    {
                           shudata=updatechange(shudata);
                        if (comapredata(shudata, nameid) == 1)
                        {
                            try
                            {
                                titles = shugroup.Rows[i]["Talk_name"].ToString();
                                groupid = Convert.ToInt32(shugroup.Rows[i]["ID"].ToString());
                                break;
                            }
                            catch { }
                        }
                    }
                }
                if (groupid != 0)
                {
                    //插入标题
                    if (!(string.Compare(title.Trim(), titles.Trim()) == 0))
                    {
                        goods.Talk_group1(title, shugroup.Rows[i]["Talk_id_all"].ToString().Trim());
                    }
                    else
                    {
                        goods.Talk_group2(title, shugroup.Rows[i]["Talk_id_all"].ToString().Trim());
                    }
                    break;
                }
            }

            //插入文本
            if (!(groupid == 0))
            {
                goods.Talk_message(Convert.ToInt32(Session["User_ID"]), groupid, contenta, date);
            }
            //没有对应的  添加组id
            else {
                string strnameids =nameid[0];
                for (int i=1; i < nameid.Length; i++)
                {
                    strnameids = ','+nameid[i] ;
                }
                goods.User_friend8(strnameids);
                // 获取组 id
                DataTable ids = goods.Talk_group2(strnameids);
                int  ida = Convert.ToInt32(ids.Rows[0]["ID"].ToString());
                goods.Talk_message(Convert.ToInt32(Session["User_ID"]),ida,contenta, date);
            }
            return "1";
        }

        //表两个数组
        public int  comapredata(string[] a,string[] b)
        {
            int fal = 1;
            for (int y = 0; y < a.Length; y++)
            {
                if (!(string.Compare(a[y].ToString(), b[y].ToString()) == 0))
                {
                    fal = 0;
                }
            }
            return fal;
        }
        //改变数组位置
        public string[] updatechange(string[] a)
        {
            string[] b = new string[a.Length];
            int u = 0;
            for (int y = 1; y < a.Length; y++)
            {
                b[y-1] = a[y];
            }
            b[a.Length - 1] = a[0];
            return b;
        }

        //删除部分用户对话
        public string deltalk()
        {
            string name = Request.Form[0].ToString().Trim();
            string messageid = Request.Form[1].ToString().Trim();
            //DataTable nameid = goods.User_registration(name);
            //string  id = nameid.Rows[0]["ID"].ToString();
            goods.Talk_groupa(messageid);
            return "OK";
        }
        //删除用户对话
        public string deltalktotal()
        {
            string name = Request.Form[0].ToString().Trim();
            DataTable nameid = goods.User_registration(name);
            string id = nameid.Rows[0]["ID"].ToString();
            goods.Talk_group(Convert.ToInt32(Session["User_ID"]).ToString(), id);
            return "OK";
        }
        //判断未读消息
        public string func()
        {
            string str = Convert.ToInt32(Session["data"]).ToString();
            return str;
        }
        public string fund()
        {
            int id = Convert.ToInt32(Session["User_ID"]);

            goods.Talk_message3(id);
            DataTable group = goods.Talk_messagegroup(id); //获取组id
            for (int i = 0;i<group.Rows.Count; i++)
            {
                int ids =Convert.ToInt32(group.Rows[i]["Talk_group_id"].ToString());
                goods.Talk_message4(ids);
            }
            return "success";
        }
        // 加好友提醒（未读提醒）
        public int  getfriend()
        {          
            List<Goodfriend> list3 = new List<Goodfriend>();
            DataTable da = goods.User_friend3(Convert.ToInt32(Session["User_ID"])); //获取对方id
            for (int i = 0; i < da.Rows.Count; i++)
            {
              
                   DataTable db = goods.User_friend6(da.Rows[i]["User_id"].ToString(), Convert.ToInt32(Session["User_ID"]).ToString()); //获取对方id是否有自己对应的id(无)               
                  if(db.Rows.Count<1)
                 {
                    //Goodfriend goods = new Goodfriend();
                    int friendid = Convert.ToInt32(da.Rows[i]["User_id"].ToString());
                    DataTable dc= goods.user_friends(friendid);
                    goods.friendname = dc.Rows[0]["User_name"].ToString();
                    //获取发送文本
                    DataTable das = goods.User_friend7(Convert.ToInt32(Session["User_ID"]),Convert.ToInt32(da.Rows[i]["User_id"].ToString()));
                    goods.freiendmessage = das.Rows[0]["text"].ToString();
                    falg++;
                    list3.Add(goods);
                }
               
            }
            ViewBag.introduce = list3;
            return falg;
        }
        //t同意好友
        public int getfriend1()
        {
            string name = Request.Form[0].ToString().Trim();
            DataTable ids= goods.User_registration(name);
            int id = Convert.ToInt32(ids.Rows[0]["ID"].ToString());
           int check=goods.User_friend5(Convert.ToInt32(Session["User_ID"]),id);
            if (check < 1)
            {
                goods.User_friend4(Convert.ToInt32(Session["User_ID"]),id);
            }
            return 1;
        }
        //忽视好友
        public int getfriend2()
        {
            string name = Request.Form[0].ToString();
            return 1;
        }





    }
}
