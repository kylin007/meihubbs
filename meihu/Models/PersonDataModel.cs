using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace meihu.Models
{
    public class PersonDataModel
    {
       

        SqlCommon db = new SqlCommon();

        public int Find_ID(string name)//------------根据用户名查找对应id
        {
            string str = string.Format("select * from User_registration where User_name ='" + name + "'");
            DataTable dt = db.getdata(str);
            int id = Convert.ToInt32(dt.Rows[0]["ID"]);
            return id;
        }

        public string Find_name(int id)//----------------根据用户id查找对应用户名
        {
            string str = string.Format("select * from User_registration where ID = " + id);
            DataTable dt = db.getdata(str);
            var name = dt.Rows[0]["User_name"].ToString();
            return name;
        }
        public Dictionary<string, string> PersonData(int id, string name2)//id:获取到点击某个人名传的id,
        {
            //var url = location.href; 
            // var id = Request.QueryString("id");
            //var id = Convert.ToInt32(Request.Form["id"].ToString());
            ////先获取到user_id
            //根据主页id和获取id是否相等，判断
            string sql = "select * from User_message where user_id = " + id;
            var own_name = Find_name(id);//own_name:对应id的名称
            DataTable dt = db.getdata(sql);
            Dictionary<string, string> stackholder = new Dictionary<string, string>();//定义泛型字典对象
            if (name2 == own_name)
            {
                stackholder.Add("隐藏", "隐藏");
            }
            else
            {
                stackholder.Add("显示", "显示");
            }
            try
            {
                var id3 = Find_ID(name2);
                if (id3 == id)
                {
                    stackholder.Add("是否在线", "在线");
                }
            }
            catch
            {

            }
            stackholder.Add("用户id", Convert.ToString(id));
            stackholder.Add("用户名", own_name);
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string key = dt.Rows[i]["Data_name"].ToString();
                string value = "";
                if (key != null)
                {
                    if (key == "个人签名" || (key == "真实姓名") || (key == "性别") || (key == "生日") || (key == "出生地") || (key == "居住地") || (key == "毕业学校") || (key == "学历") || (key == "公司") || (key == "职业") || (key == "职位") || (key == "交友目的") || (key == "个人主页") || (key == "兴趣爱好") || (key == "在线时间")
                        || (key == "注册时间") || (key == "最后访问") || (key == "注册IP") || (key == "上次访问IP") || (key == "上次活动时间") || (key == "上次发表时间") || (key == "所在时区") || (key == "已用空间") || (key == "积分") || (key == "金钱") || (key == "好友数") || (key == "回帖数") || (key == "主题数"))
                    {
                        value = dt.Rows[i]["Data_cont"].ToString();
                    }
                    if (value != "")
                    {
                        stackholder.Add(key, value);
                    }
                }
            }
            
            return stackholder ;
        }
        public String Addfriends(string user_name,string fri_name,string text,string groups)
        {
            string end = "";
            int user_id = Find_ID(user_name); //自己id
            int fri_id = Find_ID(fri_name); //好友id
            int group = (Convert.ToInt32(groups) + 1);//好友分组id （）
            string str = string.Format("select * from User_friend where User_id = " + user_id + "and Friend_id = " + fri_id);
            string str2 = string.Format("select * from User_friend where Friend_id = " + user_id + "and User_id = " + fri_id);
            DataTable dt = db.getdata(str);
            DataTable dt1 = db.getdata(str2);
            if (dt.Rows.Count > 0 && dt1.Rows.Count > 0)
            {
                end = "你们已经互为好友！";
                //已经互为好友
            }
            else if (dt.Rows.Count > 0)
            {
                end = "等待验证"; //等待验证
            }
            else
            {
                string sql1 = string.Format("insert into User_friend values('{0}','{1}','{2}','{3}')", user_id, fri_id, text, group);
                //SqlCommand cmd = new SqlCommand(sql1, conn);
                //int n = cmd.ExecuteNonQuery();
                int n = db.check(sql1);
                //conn.Close();
                if (dt1.Rows.Count > 0 && n > 0)
                {
                    end = "成功添加为好友";
                }
                else if (n > 0)
                {
                    end = "发送成功";
                }
                else
                {
                    end = "发送失败，请重新发送";
                }
            }
            return end;
        }
        public DataTable SendMessage(string user_name,string fri_name,string text)
        {
                
                DateTime Time = DateTime.Now;            //时间
                string time = DateTime.Now.ToString("yyyy-MM-dd");
                //将名字转换为id
                int user_id = Find_ID(user_name);
                int fri_id = Find_ID(fri_name);
                string all_id = user_id + "," + fri_id;
                string all_id1 = fri_id + "," + user_id;
                string str = " ";
                str = string.Format("select * from Talk_group where  Talk_id_all ='" + all_id + "'or Talk_id_all = '" + all_id1 + "'");
                DataTable dt = db.getdata(str);
                if (dt.Rows.Count == 0)
                {//如果不存在，创建两人聊天组
                    string topic = "";
                    str = string.Format("insert into Talk_group values('{0}','{1}')", topic, all_id);
                    int n = db.check(str);
                    //SqlCommand cmd = new SqlCommand(str, conn);
                    //cmd.ExecuteNonQuery();
                }
                //查找当前组id
                str = string.Format("select * from Talk_group where  Talk_id_all ='" + all_id + "'or Talk_id_all ='" + all_id1 + "'");
                DataTable dt1 = db.getdata(str);
                int group_id = Convert.ToInt32(dt1.Rows[0]["ID"]);
                //插入聊天语句
                if (text != "")
                {
                    int read = 0;
                    str = string.Format("insert into Talk_message values('{0}','{1}','{2}','{3}','{4}')", user_id, group_id, text, time, read);
                    int n = db.check(str);
                }
                //获取聊天组中的信息,并存在dt表中
                str = string.Format("select * from Talk_message where Talk_group_id = " + group_id + "and Talk_Time = '" + time + "'");
                DataTable dt2 = db.getdata(str);
                dt2.Columns.Add("用户名");
                for (int i = 0; i < dt2.Rows.Count; i++)
                {
                    var id = Convert.ToInt32(dt2.Rows[i]["Talk_user_id"]);
                    dt2.Rows[i]["用户名"] = Find_name(id);
                }
                return dt2;
        }
        public DataTable TopicShow(string user_name)
        {
            DataTable dt = new DataTable();
            DataTable dt1 = new DataTable();
            int user_id = Find_ID(user_name);//将用户名转换为ID
            string str = "";
            str = string.Format("select * from (Create_topic inner join Topic_message on Create_topic.ID = Topic_message.Topic_id)inner join User_registration on Topic_message.Last_reply_id = User_registration.ID where User_id = " + user_id);
            dt = db.getdata(str);
            dt.Columns.Add("版块名称");//给DataTable表增加列
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string ss = dt.Rows[i]["Is_son"].ToString();
                var id = Convert.ToInt32(dt.Rows[i]["ID"].ToString());
                if (ss == "0")
                {
                    string str1 = string.Format("select * from ((Create_topic inner join Topic_message on Create_topic.ID = Topic_message.Topic_id)inner join Second_forum on Create_topic.Forum_id = Second_forum.ID)inner join User_registration on Topic_message.Last_reply_id = User_registration.ID where Create_topic.ID = " + id);
                    dt1 = db.getdata(str1);
                    dt.Rows[i]["版块名称"] = dt1.Rows[0]["Second_forum"].ToString();
                }
                else
                {
                    string str1 = string.Format("select * from ((Create_topic inner join Topic_message on Create_topic.ID = Topic_message.Topic_id)inner join Son_forum on Create_topic.Forum_id = Son_forum.ID)inner join User_registration on Topic_message.Last_reply_id = User_registration.ID where Create_topic.ID = " + id);
                    dt1 = db.getdata(str1);
                    dt.Rows[i]["版块名称"] = dt1.Rows[0]["Son_forum"].ToString();
                }
            }
            DataView dv = dt.DefaultView;
            dv.Sort = "Create_on_time desc";
            dt = dv.ToTable();
            return dt;
        }

        public DataTable ReplyShow(string user_name)
        {
            DataTable dt = new DataTable();
            DataTable dt1 = new DataTable();
            int user_id = Find_ID(user_name);//将用户名转换为ID
            string str = "";
            str = string.Format("select * from ((Reply_message inner join Create_topic on Reply_message.Topic_id = Create_topic.ID) inner join Topic_message on Create_topic.ID  = Topic_message.Topic_id)inner join User_registration on Topic_message.Last_reply_id = User_registration.ID where Reply_user_id = " + user_id);
            dt = db.getdata(str);
            dt.Columns.Add("版块名称");//给DataTable表增加列
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                string ss = dt.Rows[i]["Is_son"].ToString();
                var id = Convert.ToInt32(dt.Rows[i]["Topic_id"].ToString());
                if (ss == "0")
                {
                    string str1 = string.Format("select * from((((Reply_message inner join Create_topic on Reply_message.Topic_id = Create_topic.ID) inner join Topic_message on Create_topic.ID = Topic_message.Topic_id)inner join User_registration on Topic_message.Last_reply_id = User_registration.ID )inner join Second_forum on Create_topic.Forum_id = Second_forum.ID) where Create_topic.ID =" + id);
                    dt1 = db.getdata(str1);
                    dt.Rows[i]["版块名称"] = dt1.Rows[0]["Second_forum"].ToString();
                }
                else
                {
                    string str1 = string.Format("select * from((((Reply_message inner join Create_topic on Reply_message.Topic_id = Create_topic.ID) inner join Topic_message on Create_topic.ID = Topic_message.Topic_id)inner join User_registration on Topic_message.Last_reply_id = User_registration.ID )inner join Son_forum on Create_topic.Forum_id = Son_forum.ID) where Create_topic.ID =" + id);
                    dt1 = db.getdata(str1);
                    dt.Rows[i]["版块名称"] = dt1.Rows[0]["Son_forum"].ToString();
                }
            }
            DataView dv = dt.DefaultView;
            dv.Sort = "Reply_time desc";
            dt = dv.ToTable();
            return dt;
        }
    }
}