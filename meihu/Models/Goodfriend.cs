﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
namespace meihu.Models
{
    
    public class Goodfriend
    {
        
        SqlCommon db = new SqlCommon();
       //消息属性
        public string goodname { get; set; }
        public string name;
        public string time;
        public string url;
        public string talk;
        public string friendtalk;
        public string count;
        public int ID;
        //判断是否好友属性
        public string friendname;
        public string freiendmessage;
        public List<s_child> list = new List<s_child>();
        public DataTable  user_friend(int id)
        {
            string str = "select *from  User_friend where User_id='" + id + "'";
            DataTable ds=db.getdata(str);
            return ds;
        }
        public DataTable user_friends(int id) 
        {
            string str = "select *from  User_registration where ID='" + id + "'";
            DataTable ds = db.getdata(str);
            return ds;
        }
        //注册表由name中查找id
        public DataTable User_registration(string name)
        {
            string strname = "select ID from User_registration where User_name='" + name + "'";
            DataTable shu =db.getdata(strname);
            return shu;
        }
        public void Talk_message(int User_ID, int  groupid, string contenta, string date)
        {
            //string insert = "insert into Talk_message values('" + User_ID + "','" + groupid + "','" + contenta + "','" + date + "')";
            string insert = string.Format("insert into Talk_message values('{0}','{1}','{2}','{3}',{4})",User_ID,groupid, contenta,date,1);
            int dom =db.check(insert);        
        }
        public DataTable Talk_group()
        {
            string strgroup = "select * from Talk_group";
            DataTable shugroup =db.getdata(strgroup);
            return shugroup;
        }
        //获取Talk_group--Talk_id_all
        public DataTable Talk_group2(string str)
        {
            string strgroup = "select * from Talk_group where Talk_id_all='"+str+"'";
            DataTable shugroup = db.getdata(strgroup);
            return shugroup;
        }      

        public void Talk_group1(string title,string groupid)
        {
            string insert = "update  Talk_group set Talk_name='" + title + "' where ID='" + groupid + "'";
            int dom =db.check(insert);
        }

        public void Talk_group2(string title, string groupid)
        {
            string insert = "insert into  Talk_group  values('" + title + "','" + groupid + "')";
           int dom = db.check(insert);
        }
        //通过id获取Talk_message组id
        public DataTable Talk_messagegroup(int User_ID)
        {
            string insert = "select distinct Talk_group_id,Talk_time from Talk_message where Talk_user_id='" + User_ID+ "' order by Talk_time desc";
            DataTable dom = db.getdata(insert);
            return dom;
        }
        //通过Talk_group_id -未读消息为无
        public void Talk_message4(int Talk_group_id)
        {
            string str = " update Talk_message set Is_Read=0 where Talk_group_id='" + Talk_group_id + "'";
            int ds = db.check(str);
        }
        //通过id获取Talk_message信息
        public DataTable Talk_messagegroup(string User_ID, string  Talk_group_id)
        {
            string insert = "select *from Talk_message where Talk_user_id='" + User_ID + "' and Talk_group_id='"+Talk_group_id+ "' order by Talk_time desc ";
            DataTable dom = db.getdata(insert);
            return dom;
        }
        //获取图像路径
        public DataTable User_Message(int user_id)
        {
            string str = "select *from User_message where  User_id='" + user_id + "' and Data_name='头像(小)'";
            DataTable ds = db.getdata(str);
            return ds;
        }
        //删除部分对话信息
        public void Talk_groupa(string messageid)
        {
            string str = "delete from Talk_message  where ID='" + messageid + "' "; //删除Talk_group信息
            int ds = db.check(str);
        }
        //删除对话信息
        public void Talk_group(string  user_id,string friendid)
        {

            string stra=user_id+","+friendid;
            string strb = friendid + ","+user_id;
            //string str = "delete from Talk_group  where Talk_id_all='" + stra + "' or Talk_id_all='" + strb + "'"; //删除Talk_group信息
            //int ds = db.check(str);
            string strc = "select  *from Talk_group  where Talk_id_all='" + stra + "' or Talk_id_all='" + strb + "'";
            DataTable dsc = db.getdata(strc);
            string strd = "delete from Talk_message  where  Talk_group_id='" + dsc.Rows[0]["ID"].ToString()+"'";//   删除Talk_message信息
            int dsd = db.check(strd);
        }
        //p判断未读消息
        public void Talk_message3(int user_id)
        {
            string str = " update Talk_message set Is_Read=0 where Talk_user_id='" + user_id + "'";
            int ds = db.check(str);
        }
        //判断User_friend中是否为好友
        public DataTable User_friend3(int user_id)
        {
            string str = "select distinct User_id from User_friend where Friend_id='" + user_id + "'";
            DataTable  ds = db.getdata(str);
            return ds;
        }
        //判断User_friend中是否为好友
        public DataTable User_friend6(string  user_id,string  fri_id)
        {
            string str = "select distinct User_id from User_friend where Friend_id='" + user_id + "' and  User_id='"+fri_id+"' ";
            DataTable ds = db.getdata(str);
            return ds;
        }
        //判断User_friend中是否为好友de 文本
        public DataTable User_friend7(int fri_id, int user_id)
        {
            string str = "select text from User_friend where Friend_id='" + fri_id + "' and  User_id='" + user_id + "' ";
            DataTable ds = db.getdata(str);
            return ds;
        }
        //加为好友

        public void User_friend4(int user_id,int id)
        {
            string str = "insert into User_friend values('"+user_id+"','"+id+"',NULL,2)";
           int  ds = db.check(str);
            string strA = "insert into Talk_group values( 'NULL','" + user_id +","+ id + "')";
            int dsA = db.check(strA);
        }
        //群聊时，id没有对应时，添加的Talk_group-id
        public void User_friend8(string str)
        {
            string strA = "insert into Talk_group values( 'NULL','" + str + "')";
            int dsA = db.check(strA);
        }
        //加为好友 检查是否重复 
        public int  User_friend5(int user_id,int id)
        {
            string str = "select *from User_friend where User_id='" + user_id + "' and Friend_id='" + id + "'";
            DataTable ds = db.getdata(str);
            if (ds.Rows.Count > 0)
                return 1;
            else
                return 0;
        }
        public  class s_child
        {
            public string names;
            public string times;
            public string urls;
            public string talks;
            public int IDS;
        }
    }
}