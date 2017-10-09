using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace meihu.Models
{
    public class SettingModel
    {
        SqlCommon db = new SqlCommon();
         public int User_ID { get; set; }
        //查询 年月 日 省份 等
        public DataTable Dates(string flag)
        {
            if (string.Compare(flag, "Year") == 0)
            {
                string str = "select *from Year order by Year desc";
                DataTable ds = db.getdata(str);
                return ds;
            }
            else if (string.Compare(flag, "Month") == 0)
            {
                string str = "select *from Month";
                DataTable ds = db.getdata(str);
                return ds;
            }
            else if (string.Compare(flag, "Day") == 0)
            {
                string str = "select *from Day where Flag <= 3";
                DataTable ds = db.getdata(str);
                return ds;
            }
            else if (string.Compare(flag, "User_province") == 0)
            {
                string str = "select *from User_province";
                DataTable ds = db.getdata(str);
                return ds;
            }
            else if (string.Compare(flag, "User_city") == 0)
            {
                string str = "select *from User_city";
                DataTable ds = db.getdata(str);
                return ds;
            }
            else if (string.Compare(flag, "User_country") == 0)
            {
                string str = "select *from User_country";
                DataTable ds = db.getdata(str);
                return ds;
            }
            else if (string.Compare(flag, "User_town") == 0)
            {
                string str = "select *from User_town";
                DataTable ds = db.getdata(str);
                return ds;
            }
            else
            {
                return null;
            }

        }
        //查询  User_message 用户信息
        public DataTable User_Message(int user_id)
        {
            string str = "select *from User_message where  User_id='" + user_id + "'";
            DataTable ds = db.getdata(str);
            return ds;
        }
        //查询 User_Registration 注册
        public DataTable User_Registration(int user_id)
        {
            string str = "select *from User_registration where ID='" + user_id + "'";
            DataTable ds = db.getdata(str);
            return ds;
        }
        //基本资料等
        public void  Baseic(string Data_cont,string Is_show,string Data_name,int user_id)
        {
             string tra = "update User_message set Data_cont='" + Data_cont + "', Is_show='" + Is_show + "' where Data_name='" + Data_name + "' and User_id='" + user_id + "' ";
             int don = db.check(tra);
        }
        //密码安全
        public void password(string User_pwd, string Email, string Question, string Answer,int user_id)
        {
            string tra = "update User_registration set User_pwd='" + User_pwd + "', Email='" + Email + "',Question='" + Question + "', Answer='" + Answer + "' where  ID='" + user_id + "' ";
            int don = db.check(tra);
        }
        //省份变化
        public DataTable province(string Dataid,string User_province,string Provincevalue,string data)
        {
            string str0 = "select "+ Dataid + " from " + User_province + " where " + Provincevalue + "='" + data + "'";
            DataTable ds = db.getdata(str0);
            return ds;
        }
        //比较图像路径
        public DataTable Urlimage1()
        {
            string str0 = "select distinct Data_cont from User_message where Data_name='头像'";
            DataTable ds = db.getdata(str0);
            return ds;
        }
        //对比图像路径
        public DataTable Urlimage2(int user_id)
        {
           string str0 = "select *from User_message where Data_name='头像'  and  User_id='" + user_id + "'";
           DataTable ds = db.getdata(str0);
            return ds;
        }
        //插入图像路径
        public void Urlimage3(string url,string str,int user_id)
        {
            string str1 = "update User_message set Data_cont='" + url + "' where   Data_name='"+str+"'  and  User_id='" + user_id + "'";
           int ds = db.check(str1);
        }
        //插入图像路径
        public void Urlimage4(string url, string str, int user_id)
        {
            string str1 = "insert into User_message values('" + user_id + "','"+str+"' ,'" + url + "','公开')";
            int ds = db.check(str1);
        }
    }
}