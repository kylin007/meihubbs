﻿
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

//李小梅

namespace meihu.Models
{
    public class Post
    {
        public string Content { get; set; }
        public string Second_forum { get; set; }
        public string One_forum { get; set; }
        public string title { get; set; }
        public string time { get; set; }
        public string vinum { get; set; }
        public string ronum { get; set; }
        public string ude { get; set; }
        public string theme { get; set; }
        public string firendNum { get; set; }
        public string scoreNum { get; set; }
        public string majorName { get; set; }
        public string gradeName { get; set; }
        public string moneyNum { get; set; }
        public string expression { get; set; }
        public string signtime { get; set; }
        public string day { get; set; }
        public string collect { get; set; }
        public string evaluation { get; set; }
        public string portrait { get; set; }
        public string content { get; set; }
        public string ti { get; set; }
        public string flor { get; set; }
        public string evnum { get; set; }
        public string repcon { get; set; }
        public string evaname { get; set; }
        public string evacont { get; set; }
        public string topic_id { get; set; }
        public string idw { get; set; }
        public string sonof { get; set; }
        public int isusing { get; set; }
        public string evanamehh { get; set; }

        public List<string> secondlist = new List<string>();
        SqlCommon db = new SqlCommon();

        string twoid;
        string oneid;

        public DataTable selectPN()
        {
            string str = "select * from Create_topic order by Create_on_time desc";
            DataTable dt = db.getdata(str);
            return dt;
        }
        public DataTable OneClassify(string toid)
        {
            string isson = "select Is_son from Create_topic where ID = '" + toid + "'";
            DataTable daisso = db.getdata(isson);
            string sonfor = null;
            if (daisso.Rows[0]["Is_son"].ToString() == "1")
            {
                string getTwo = "select Second_forum_id,Son_forum from Son_forum where ID = (select Forum_id from Create_topic where ID = '" + toid + "')";
                DataTable dtgt = db.getdata(getTwo);
                twoid = dtgt.Rows[0]["Second_forum_id"].ToString();
                sonfor = dtgt.Rows[0]["Son_forum"].ToString();

            }
            else
            {
                string getTwo = "select Forum_id from Create_topic where ID = '" + toid + "'";
                DataTable dtgt = db.getdata(getTwo);
                twoid = dtgt.Rows[0]["Forum_id"].ToString();
            }

            string twoidstring = "select First_forum_id from Second_forum where ID = '" + twoid + "'";
            DataTable dttwo = db.getdata(twoidstring);
            oneid = dttwo.Rows[0]["First_forum_id"].ToString();
            string title = "select First_forum from First_forum where ID = '" + oneid + "'";
            DataTable dt = db.getdata(title);
            return dt;
        }
        public DataTable son(string toid)
        {
            string isson = "select Is_son from Create_topic where ID = '" + toid + "'";
            DataTable daisso = db.getdata(isson);
            DataTable dtgt = new DataTable();
            if (daisso.Rows[0]["Is_son"].ToString() == "1")
            {
                string getTwo = "select Son_forum from Son_forum where ID = (select Forum_id from Create_topic where ID = '" + toid + "')";
                dtgt = db.getdata(getTwo);
                
            }
            return dtgt;
        }
        public DataTable twoClassify(string topicId)
        {
            string title = "select Second_forum,ID from Second_forum where ID = '" + twoid + "'";
            DataTable dt = db.getdata(title);

            return dt;
        }

        public DataTable postTitle(string toid)
        {
            string str = "select title,Create_on_time,User_id,Topic_content,User_id from Create_topic where ID = '" + toid + "'";
            DataTable dt = db.getdata(str);
            return dt;
        }
        public DataTable selectSingleMessage(string toid)
        {
            String pmesage = "select Visit_num, Reply_num,Collection_num,Evaluation_num from Topic_message where Topic_id = '" + toid + "'";
            DataTable dt = db.getdata(pmesage);
            return dt;
        }
        public DataTable username(string usid)
        {
            string str = "select User_name from User_registration where ID = '" + usid + "'";
            DataTable dt = db.getdata(str);
            return dt;
        }

        public DataTable susermeage(string sdataName, string usid)
        {
            string str = "select Data_cont from User_message where User_id = '" + usid + "' AND  Data_name = '" + sdataName + "'";
            DataTable dt = db.getdata(str);
            return dt;
        }
        public DataTable signmesge(string usid)
        {
            string str = "select Expression,Sign_time,All_day from User_sign where User_id = '" + usid + "'";
            DataTable dt = db.getdata(str);
            return dt;
        }
        public DataTable reply(string toid)
        {
            string str = "select Reply_user_id,Reply_floor,Evaluation_num,Reply_content,Reply_time from Reply_message where Topic_id = '" + toid + "' order by Reply_floor";
            DataTable dt = db.getdata(str);
            return dt;
        
        }
        public DataTable evamesg(string toid)
        {
            string str = "select Evaluation_user_id, Evaluation_content,Evaluation_time from Evaluation_message where Topic_id = '" + toid + "'";
            DataTable dt = db.getdata(str);
            return dt;
        }
        public void loknum(string toid, string lnk)
        {
            int s = Convert.ToInt32(lnk)+1;
            string str = string.Format("update Topic_message set Visit_num = '"+s+"' where Topic_id = '" + toid + "'");
            int i = db.check(str);
        }
        public int upeva(string toid, string usidse, string evareson)
        {
            DateTime time = DateTime.Now.ToLocalTime();
            string create_time = time.ToLocalTime().ToString("yyyy-M-d HH:mm");
            int x = 0;
            int y = 1;
            int id = Convert.ToInt32(toid);
            int usid = Convert.ToInt32(usidse);
            string str = string.Format("insert into Evaluation_message values ('{0}','{1}','{2}','{3}','{4}','{5}','{6}')", id, x, y, usid, y, evareson, create_time);
           
            int i = db.check(str);
            return i;
        }
        public int repmes(int tid, int x, int lg, string contentre)
        {
            DateTime time = DateTime.Now.ToLocalTime();
            string create_time = time.ToLocalTime().ToString("yyyy-M-d HH:mm");

            string sin = string.Format("INSERT INTO Reply_message VALUES ('{0}','{1}','{2}','{3}','{4}','{5}')", tid, x, lg, 0, create_time, contentre);
           
            int i = db.check(sin);
            return i;
        }
        public DataTable sona(string seconid)
        {
            string sec = "select ID from Son_forum where Second_forum_id = '" + seconid + "'";

            DataTable dtq = db.getdata(sec);
            return dtq;
        }
        public int instop(string sin, string is_son, string usidse, string title, string topic_content)
        {
            DateTime time = DateTime.Now.ToLocalTime();
            string create_time = time.ToLocalTime().ToString("yyyy-M-d HH:mm");
            int is_close = 0;
            int topic_permissions = 0;

            string sql1 = string.Format("INSERT INTO Create_topic VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}')", sin, is_son, usidse, title, topic_content, create_time, is_close, topic_permissions);

            
            int i = db.check(sql1);
            return i;
        }
        public void tomes(int topic_id, int last_reply_id)
        {
            DateTime time = DateTime.Now.ToLocalTime();
            string create_time = time.ToLocalTime().ToString("yyyy-M-d HH:mm");
            int visit_num = 0;
            int reply_num = 0;
            int is_good = 0;
            int is_first_forum = 1;
            int is_img = 0;
            int is_top = 0;
            int collection_num = 0;
            int evaluation_num = 0;
            string img_url = null;
            string last_reply_time = create_time;
            

            string sql2 = string.Format("INSERT INTO Topic_message VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}')", topic_id, visit_num, reply_num, last_reply_id, last_reply_time, is_good, is_first_forum, is_img, is_top, collection_num, evaluation_num, img_url);
            int i = db.check(sql2);
        }
        public DataTable talk(string all_id, string all_id1)
        {
            string str = " ";
            str = "select * from Talk_group where  Talk_id_all ='" + all_id + "'or Talk_id_all = '" + all_id1 + "'";
            DataTable dt = db.getdata(str);
            return dt;
        }
        public void intalkgroup(string all_id)
        {
            string topic = "";
            string str = string.Format("insert into Talk_group values('{0}','{1}')", topic, all_id);
            int i = db.check(str);
        }
        public int talkmess(string usidse,int group_id,string text)
        {
            DateTime Time = DateTime.Now;            //时间
            string time = DateTime.Now.ToString("yyyy-MM-dd");
            int x = 0;
            string str = string.Format("insert into Talk_message values('{0}','{1}','{2}','{3}','{4}')", usidse, group_id, text, time, x);
           
            int n = db.check(str);
            return n;
        }
        public DataTable setalme(int group_id, string time)
        {
            string str = string.Format("select * from Talk_message where Talk_group_id = " + group_id + "and Talk_Time = '" + time + "'");
            DataTable dt2 = db.getdata(str);
            return dt2;
        }
    }
}