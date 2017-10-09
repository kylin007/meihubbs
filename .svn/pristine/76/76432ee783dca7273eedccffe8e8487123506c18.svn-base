
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using meihu.Models;

//林玲

namespace meihu.Models
{
    public class TwoLevel
    {
        public string Son_forum { get; set; }
        public string Is_son { get; set; }
        public string Title { get; set; }
        public string Create_on_time { get; set; }
        public string User_name { get; set; }
        public string Reply_num { get; set; }
        public string Visit_num { get; set; }
        public string Last_reply_time { get; set; }
        public string Last_user_name { get; set; }
        public int Topic_num { get; set; }
        public int Post_num { get; set; }
        public int Sum_topic_num { get; set; }
        public int Today_topic_num { get; set; }
        public string Top_img { get; set; }
        public string Mouse_title { get; set; }
        public string Second_forum { get; set; }
        public string Page_num { get; set; }
        public string ID { get; set; }
        public string Person_Data { get; set; }
        public string Last_person_data { get; set; }
        public string Is_img { get; set; }
        public string Is_good { get; set; }
        public string Evaluation_num { get; set; }
        public string topic_id { get; set; }
        public string First_forum { get; set; }
        public string User_id { get; set; }

        SqlCommon db = new SqlCommon();
        //SqlConnection sc = new SqlConnection();

        public DataTable selectS(string s) //查询二级版块下的子版块
        {
            string str = "select * from Son_forum where Second_forum_id = (select ID from Second_forum where Second_forum = '"+s+"')";
            DataTable dt = db.getdata(str);
            return dt;
        }

        public DataTable selectIS(string s) //查询二级板块的内容
        {
            string str = "select * from Second_forum where Second_forum = '" + s + "'";
            DataTable dt = db.getdata(str);
            return dt;
        }

        public DataTable selectSM(string s) //查询子版块下的主题内容
        {
            string str = "select * from Create_topic where Forum_id = (select ID from Son_forum where Son_forum = '"+s+"') order by Create_on_time desc";
            DataTable dt = db.getdata(str);
            return dt;
        }

        public DataTable selectUM(string s) //查找用户昵称
        {
            string str = "select User_name from User_registration where ID = '" + s + "'";
            DataTable dt = db.getdata(str);
            return dt;
        }

        public DataTable selectPN(string s) //查找二级版块下的主题
        {
            string str = "select * from Create_topic where Forum_id = (select ID from Second_forum where Second_forum = '"+s+"') order by Create_on_time desc";
            DataTable dt = db.getdata(str);
            return dt;
        }

        public DataTable selectIT(string s) //查找主题的具体信息
        {
            string str = "select * from Topic_message where Topic_id = '"+s+"'";
            DataTable dt = db.getdata(str);
            return dt;
        }

        public DataTable selectRN(string s) //查找主题的回复信息
        {
            string str = "select * from Reply_message where Topic_id = '" + s + "'";
            DataTable dt = db.getdata(str);
            return dt;
        }

        public DataTable selectSID(string s) //查找子版块的内容
        {
            string str = "select * from Son_forum where Son_forum = '" + s + "'";
            DataTable dt = db.getdata(str);
            return dt;
        }

        public DataTable selectF(string s) //查找一级版块的名称
        {
            string str = "select * from First_forum where ID = '" + s + "'";
            DataTable dt = db.getdata(str);
            return dt;
        }

        public DataTable selectSecond(string s)
        {
            string str = "select * from Second_forum where ID = '" + s + "'";
            DataTable dt = db.getdata(str);
            return dt;
        }
    }
}



