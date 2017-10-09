
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace meihu.Models
{
    //刘彩迪
    public class OneLevel
    {
        public string Second_forum { get; set; }       
        public string Is_son { get; set; }
        public string Title { get; set; }
        public string Create_on_time { get; set; }
        public string User_name { get; set; }
        public string number { get; set; }
        public string addnum { get; set; }
        public string str { get; set; }
        public string OT { get; set; }
        public string ID { get; set; }

        public List<string> secondlist = new List<string>();//zibankuaimingcheng

        SqlCommon db = new SqlCommon();
        SqlConnection con = new SqlConnection();   
        //取出一级目录对应的二级目录
        public DataTable selectForm(string one) 
        {
            string m = "select * from Second_forum where First_forum_id = (select ID from First_forum where First_forum='"+one+"')";           
            DataTable form = db.getdata(m);            
            return form;
        }
        //取子版块
        public DataTable selectSon(string onename) 
        { 
         string n = "select Son_forum from Son_forum where Second_forum_id=(select ID from Second_forum where Second_forum='"+onename+"')";
         DataTable form1 = db.getdata(n);
         return form1;
        }
        //取子版块对应的值用于判断是否有子版块
        public DataTable is_son(string one)
        {
            string r = "select Is_son from Second_forum where Second_forum='" + one + "'";
            DataTable form2 = db.getdata(r);
            return form2;
        }
        //从Create_topic 表中取出所有子版块为0的列
        public DataTable selectTime(string one)
        {
            string s = "select * from Create_topic where Is_son=0 and Forum_id=(select ID from Second_forum where Second_forum='"+one+"') order by Create_on_time desc";
            DataTable form = db.getdata(s);
            return form;
        }
        //从数据库中取用户名
        public DataTable selectname(string one)
        {
            string s = "select User_name from User_registration where ID='"+one+"'";
            DataTable form = db.getdata(s);
            return form;
        }
        //取Create_topic表的所有列
        public DataTable selectnum(string one)
        {
            string s = "select count(*) from Create_topic where Forum_id=(select ID from Second_forum where Second_forum='"+one+"')";
            DataTable form = db.getdata(s);
            return form;
        }
        public DataTable selectnumber(string one)
        {  
    
           string s = "select Create_topic.Title, Topic_message.Last_reply_time, Topic_message.Reply_num, Create_topic.ID, User_registration.ID, User_registration.User_name from Create_topic,Topic_message, User_registration where Create_topic.ID = Topic_message.Topic_id and Create_topic.Forum_id = '" + one + "' and User_registration.ID = Create_topic.User_id order by Topic_message.Last_reply_time";
           
            DataTable form = db.getdata(s);
            return form;
        }       
             
    }   
}                                                                                                                                                                                                                                         