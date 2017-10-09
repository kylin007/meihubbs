//------------- 张宏乾---------------

using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace meihu.Models
{
    public class My_post
    {

        public List<Latest_hot> aaa(string id, string curpage, string repl, string Text)
        {
            string sql = ""; string Topic_id = ""; string title = ""; string Is_son = ""; string Partake = ""; int Reply_num = 0; string Forum_id = ""; string Forum_name = ""; int Visit_num = 0; string Last_reply_id = ""; string Last_reply_time = ""; string User_id = ""; string Create_on_time = ""; string Is_top = ""; string Is_img = ""; string Is_good = ""; string User_name = ""; string Last_reply_name = ""; string Top = ""; string Good = ""; string Img = ""; string time1 = ""; string time2 = ""; string Hot = ""; string Evaluation_num = ""; string Evaluation = ""; string Reply_page = ""; int Partake1 = 0; int post_num = 0; int user_num = 0; string user_name = ""; string content = ""; string na = ""; string Reply_user_id = ""; string search2 = ""; string forum = ""; string sul = ""; string sqll = ""; string forum_id = ""; int z = 0; string forum_n = ""; var zzz = 0;
            #region

            DataTable dt = new DataTable();
            DataTable dta = getlist(id, curpage, repl, Text);
            List<Latest_hot> models = new List<Latest_hot>();
            int aa;
            try
            {
                aa = (Convert.ToInt32(curpage) != -1 && Convert.ToInt32(curpage) != 0) ? Convert.ToInt32(curpage) : 1;
            }
            catch { aa = 1; }
            int count = dta.Rows.Count;
            if (aa != 0)
            {

                dt = dta.Clone();

                for (int i = 50 * (aa - 1); i < aa * 50; i++)
                {
                    try
                    {
                        dt.Rows.Add(dta.Rows[i].ItemArray);
                    }
                    catch { break; }
                }

            }
            try { 
            na = HttpContext.Current.Session["User_id"].ToString();
                }
            catch { }
            for (var i = 0; i < dt.Rows.Count; i++)
            {
                DataTable dt1 = new DataTable();
                if (id != "7")
                {
                    sql = "select User_name from User_registration as a inner join User_message as b on a.ID=b.User_id where Data_name='注册时间' order by Data_cont desc";
                    dt1 = new SqlCommon().getdata(sql);
                    user_name = dt1.Rows[0][0].ToString();
                    sql = "select count(ID) from Create_topic";
                    dt1 = new SqlCommon().getdata(sql);
                    post_num = int.Parse(dt1.Rows[0][0].ToString());
                    sql = "select count(ID) from User_registration";
                    dt1 = new SqlCommon().getdata(sql);
                    user_num = int.Parse(dt1.Rows[0][0].ToString());
                    title = dt.Rows[i]["Title"].ToString();                         //帖子标题
                    User_id = dt.Rows[i]["User_id"].ToString();                     //用户ID
                    DateTime time = Convert.ToDateTime(dt.Rows[i]["Create_on_time"].ToString());       //获取发帖时间
                    if (id == "2")
                    {
                        time1 = time.ToString("yyyy-M-d HH:mm", DateTimeFormatInfo.InvariantInfo);          //转换格式
                    }
                    else if (id == "6")
                    {
                        time1 = time.ToString("yyyy-M-d HH:mm", DateTimeFormatInfo.InvariantInfo);          //转换格式
                        time1 = "<em>" + time1 + "</em>";
                    }
                    else
                    {
                        time1 = "";
                    }
                    Topic_id = dt.Rows[i]["Topic_id"].ToString();                   //帖子ID
                    Evaluation_num = dt.Rows[i]["Evaluation_num"].ToString();
                    Reply_num = Convert.ToInt32(dt.Rows[i]["Reply_num"].ToString());                 //回复数
                    Visit_num = Convert.ToInt32(dt.Rows[i]["Visit_num"].ToString());                 //查看数
                    Last_reply_id = dt.Rows[i]["Last_reply_id"].ToString();         //最后回复的用户id
                    DateTime time3 = Convert.ToDateTime(dt.Rows[i]["Create_on_time"].ToString());       //获取最后回复时间
                    time2 = time3.ToString("yyyy-M-d HH:mm", DateTimeFormatInfo.InvariantInfo);         //转换格式
                    // Last_reply_time = dt.Rows[i]["Last_reply_time"].ToString();     //最后回复的时间
                    Is_son = dt.Rows[i]["Is_son"].ToString();                       //是否是三级板块
                    Forum_id = dt.Rows[i]["Forum_id"].ToString();                   //板块id
                    Is_top = dt.Rows[i]["Is_top"].ToString();                       //是否置顶
                    Is_good = dt.Rows[i]["Is_good"].ToString();                     //是否精华
                    Is_img = dt.Rows[i]["Is_img"].ToString();                       //是否有图片
                    if (repl == ":::" && z < 1)
                    {
                        try
                        {
                            Reply_user_id = dt.Rows[i]["Reply_user_id"].ToString();
                        }
                        catch { }
                    }
                    sql = "select User_name from User_registration where ID=" + User_id;
                    dt1 = new SqlCommon().getdata(sql);
                    try
                    {
                        User_name = dt1.Rows[0][0].ToString();                //用户名称
                    }
                    catch { }
                    sql = "select User_name from User_registration where ID=" + Last_reply_id;
                    dt1 = new SqlCommon().getdata(sql);
                    try
                    {
                        Last_reply_name = dt1.Rows[0][0].ToString();             //回复人名称
                    }
                    catch { }
                    if (Is_son == "1")
                    {
                        sql = "select Son_forum from Son_forum where ID=" + Forum_id;
                    }
                    else
                    {
                        sql = "select Second_forum from Second_forum where ID=" + Forum_id;
                    }
                    dt1 = new SqlCommon().getdata(sql);
                    try
                    {
                        Forum_name = dt1.Rows[0][0].ToString();                  //板块名称
                    }
                    catch { }
                    if (Is_top == "1")
                    {
                        Top = "<a title=\"本版置顶主题 - 新窗口打开\"><img src=\"../../image/pin_1.gif\" /></a>";                 //置顶图标
                    }
                    else
                    {
                        Top = "<a title=\"新窗口打开\"><img src=\"../../image/folder_common.gif\" /></a>";         //普通图标
                    }
                    if (Is_good == "1")
                    {
                        Good = "<img src=\"../../image/digest_1.gif\"align=\"absmiddle\" title=\"1级精华\" />";
                    }
                    else
                    {
                        Good = "";
                    }
                    if (Convert.ToInt32(Visit_num) > 1000)
                    {
                        Hot = "<img src=\"../../image/hot_1.gif\" align=\"absmiddle\" title=\"1 级热门\" />";
                    }
                    else
                    {
                        Hot = "";
                    }
                    if (Is_img == "1")
                    {
                        Img = "<img src=\"../../image/image_s.gif\"align=\"absmiddle\" title=\"图片附件\" />";
                    }
                    else
                    {
                        Img = "";
                    }
                    if (Convert.ToInt32(Evaluation_num) > 0)
                    {
                        Evaluation = "<img src=\"../../image/agree.gif\"align=\"absmiddle\" title=\"帖子被加分\" />";
                    }
                    else
                    {
                        Evaluation = "";
                    }
                    sql = "select distinct Reply_user_id from Reply_message where Topic_id=" + Topic_id + "and Reply_user_id!=" + User_id;
                    DataTable dt2 = new DataTable();
                    dt2 = new SqlCommon().getdata(sql);
                    if (id == "0")
                    {
                        Partake1 = dt2.Rows.Count;
                        Partake1 = Partake1 + 1;
                        Partake = "&nbsp;" + Partake1 + "人参与";
                    }
                    else if (id == "4")
                    {
                        Partake1 = dt2.Rows.Count;
                        Partake1 = Partake1 + 1;
                        Partake = "<em><span class=\"xi1\">" + Partake1 + "人参与" + "</span></em>";
                    }
                    else
                    {
                        Partake = "";
                    }
                    int w = 0;
                    if (Reply_num > 9 && Reply_num < 60)
                    {
                        Reply_page = "&nbsp;...";
                        for (int q = 2; q <= Reply_num / 10 + 1; q++)
                        {
                            Reply_page = Reply_page + "<a>" + q + "</a>";
                        }
                    }
                    else if (Reply_num > 59)
                    {
                        Reply_page = "&nbsp;...";
                        for (int q = 2; q <= Reply_num / 10 + 1; q++)
                        {
                            if (q == 7)
                            {
                                Reply_page = Reply_page + "..";
                                w = 1;
                            }
                            if (w < 1)
                            {
                                Reply_page = Reply_page + "<a>" + q + "</a>";
                            }
                            else
                            {
                                break;
                            }
                        }
                        w = Reply_num / 10 + 1;
                        Reply_page = Reply_page + "<a>" + w + "</a>";
                    }
                    else
                    {
                        Reply_page = "";
                    }
                    if (repl == ":::")
                    {
                        if (User_id == na)
                        {
                            content = dt.Rows[i]["Topic_content"].ToString();
                        }
                        else if (Reply_user_id == na)
                        {
                            content = dt.Rows[i]["Reply_content"].ToString();
                        }
                    }
                }
                else
                {
                    User_name = dt.Rows[0]["User_name"].ToString();
                    User_id = dt.Rows[0]["id"].ToString();
                }
                    Latest_hot ls = new Latest_hot()
                    {
                        title = title,                          // 帖子标题
                        Topic_id = Topic_id.Trim(),                                               //帖子ID
                        Create_on_time = time1,                                          //发帖时间
                        Reply_num = Reply_num,                  //回复数
                        Visit_num = Visit_num,                  //查看数   
                        Last_reply_time = time2,                                         //最后回复时间
                        User_id = User_id,                                                 //发帖人ID
                        User_name = User_name,                                           //发帖人名称
                        Last_reply_name = Last_reply_name,                               //最后回复人名称
                        Forum_name = Forum_name,                                         //板块名称
                        Partake = Partake,                                                 //参与人数
                        Reply_page = Reply_page,                                           //回复页数
                        Top = Top,                                                       //图标
                        Good = Good,                                                     //精华图标
                        Img = Img,                                                       //图片附件
                        Hot = Hot,                                                         //热门
                        Evaluation = Evaluation,                                           //评分
                        user_num = user_num,                                                   //会员数目
                        post_num = post_num,                                                  //帖子数目
                        user_name = user_name,                                               //会员名称
                        content = content,                                                   //回复内容
                        post_count = count,
                    };


                    if (i == 0)
                        count = ls.post_count;




                    models.Add(ls);
               
                }
                #region
                int pagenum = 50;

                int curindex = aa;
                string pattern = "";
                string target = "";
                string pageresult = "";
                if (count > 50)
                {
                    pageresult = Pagination.get_pagenation(pagenum, count, curindex, pattern, target);
                }
                #endregion

            #endregion
                try
                {
                    models[0].page = pageresult;
                }
                catch { }


                return models;
           
        }
        public DataTable getlist(string id, string curpage, string repl, string Text)
        {
            string sql = ""; string Topic_id = ""; string title = ""; string Is_son = ""; string Partake = ""; int Reply_num = 0; string Forum_id = ""; string Forum_name = ""; int Visit_num = 0; string Last_reply_id = ""; string Last_reply_time = ""; string User_id = ""; string Create_on_time = ""; string Is_top = ""; string Is_img = ""; string Is_good = ""; string User_name = ""; string Last_reply_name = ""; string Top = ""; string Good = ""; string Img = ""; string time1 = ""; string time2 = ""; string Hot = ""; string Evaluation_num = ""; string Evaluation = ""; string Reply_page = ""; int Partake1 = 0; int post_num = 0; int user_num = 0; string user_name = ""; string content = ""; string na = ""; string Reply_user_id = ""; string search2 = ""; string forum = ""; string sul = ""; string sqll = ""; string forum_id = ""; int z = 0; string forum_n = ""; var zzz = 0;
            DataTable dt = new DataTable();
            DataTable dta = new DataTable();
            DataTable dtb = new System.Data.DataTable();
            try { 
            na = HttpContext.Current.Session["User_id"].ToString();
                }
            catch { }
            if (repl == ":::")     //是否 点击回复
            {
                try
                {
                    na = HttpContext.Current.Session["User_id"].ToString();
                    sql = "select * from ((User_registration as a inner join Create_topic as b on a.ID=b.User_id) inner join Reply_message as c on b.ID=c.Topic_id) inner join Topic_message as d on c.Topic_id=d.Topic_id where c.Reply_user_id=" + na;
                    dt = new SqlCommon().getdata(sql);
                    sql = "select * from( User_registration as a inner join Create_topic as b on a.ID=b.User_id) inner join Topic_message as c on b.ID=c.Topic_id where User_id=" + na;
                    dtb = new SqlCommon().getdata(sql);
                    dt.Merge(dtb);
                    DataView dv = dt.DefaultView;
                    dv.Sort = "Create_on_time desc";
                    dta = dv.ToTable();
                    zzz = 1;
                }
                catch { }
            }
            else
            {
                if (id == "0" || id == "4")
                {
                    sql = "select * from Topic_message as a inner join Create_topic as b on a.Topic_id=b.id where Visit_num>1000 order by Create_on_time desc";
                }
                else if (id == "1" || id == "5")
                {
                    sql = "select * from Topic_message as a inner join Create_topic as b on a.Topic_id=b.id where Is_good=1 order by Create_on_time desc";
                }
                else if (id == "2" || id == "6")
                {
                    sql = "select * from Topic_message as a inner join Create_topic as b on a.Topic_id=b.id order by Create_on_time desc";
                }
                else if (id == "3")
                {
                    sql = "select * from Topic_message as a inner join Create_topic as b on a.Topic_id=b.id where Visit_num>1000 order by Create_on_time desc";
                }
                else if (id == "7")
                {
                    sql = "select top(1) User_name,ID from User_registration  order by ID desc";
                    dt = new SqlCommon().getdata(sql);
                    user_name = dt.Rows[0]["User_name"].ToString();
                    User_id = dt.Rows[0]["ID"].ToString();
                    //return JsonConvert.SerializeObject(dt);
                    return dt;
                }
                else { zzz = 2; }
            }

            if (zzz > 0)
            {
                try
                {
                    if (curpage.Substring(0, 1) == ":")   //是否点击  搜索按钮
                    {
                        forum_n = id.Split(':')[1];
                        var plate = curpage.Substring(1);
                        plate = plate.Trim();
                        if (plate != "全部")
                        {
                            sql = "select id,Is_son,Second_forum from Second_forum ";
                            dt = new SqlCommon().getdata(sql);
                            for (var i = 0; i < dt.Rows.Count; i++)
                            {
                                forum = dt.Rows[i]["Second_forum"].ToString();
                                forum = forum.Trim();
                                if (forum == plate)
                                {
                                    forum_id = dt.Rows[i]["id"].ToString();
                                    Is_son = "0";
                                    if(zzz==1)
                                    {
                                        sql = "select * from ((Topic_message as a inner join Create_topic as b on a.Topic_id=b.id )inner join User_registration as c on b.User_id= c.ID)inner join Reply_message as d on b.ID=d.Topic_id where Forum_id=" + forum_id + " and (User_id=" + forum_n + " or Reply_user_id=" + forum_n + " )and Is_son=" + Is_son + "and b.Title like '%" + Text + "%' order by Create_on_time desc";
                                        dt = new SqlCommon().getdata(sql);
                                        sql = "select * from (Topic_message as a inner join Create_topic as b on a.Topic_id=b.id )inner join User_registration as c on b.User_id= c.ID where Forum_id=" + forum_id + " and User_id=" + forum_n + " and Is_son=" + Is_son + "and b.Title like '%" + Text + "%' order by Create_on_time desc";
                                        dtb = new SqlCommon().getdata(sql);
                                        dt.Merge(dtb);
                                        DataView dv = dt.DefaultView;
                                        dv.Sort = "Create_on_time desc";
                                        dta = dv.ToTable();
                                    }
                                    else {
                                        sql = "select * from ((Topic_message as a inner join Create_topic as b on a.Topic_id=b.id )inner join User_registration as c on b.User_id= c.ID)inner join Reply_message as d on b.ID=d.Topic_id where Forum_id=" + forum_id + " and (User_id=" + forum_n + " or Reply_user_id=" + forum_n + " )and Is_son=" + Is_son + "and b.Title like '%" + Text + "%' order by Create_on_time desc";
                                        dta = new SqlCommon().getdata(sql);
                                    }
                                    z = 1;
                                    break;
                                }
                            }
                            if (z == 0)
                            {
                                //dt.Clear();
                                //dta.Clear();
                                sql = "select id,Son_forum  from Son_forum";
                                dt = new SqlCommon().getdata(sql);
                                for (var i = 0; i < dt.Rows.Count; i++)
                                {
                                    forum = dt.Rows[i]["Son_forum"].ToString();
                                    forum = forum.Trim();
                                    if (forum == plate)
                                    {
                                        forum_id = dt.Rows[i]["id"].ToString();
                                        Is_son = "1";
                                        if (zzz == 1)
                                        {
                                            sql = "select * from ((Topic_message as a inner join Create_topic as b on a.Topic_id=b.id )inner join User_registration as c on b.User_id= c.ID)inner join Reply_message as d on b.ID=d.Topic_id where Forum_id=" + forum_id + " and (User_id=" + forum_n + " or Reply_user_id=" + forum_n + " )and Is_son=" + Is_son + "and b.Title like '%" + Text + "%' order by Create_on_time desc";
                                            dt = new SqlCommon().getdata(sql);
                                            sql = "select * from (Topic_message as a inner join Create_topic as b on a.Topic_id=b.id )inner join User_registration as c on b.User_id= c.ID where Forum_id=" + forum_id + " and User_id=" + forum_n + " and Is_son=" + Is_son + "and b.Title like '%" + Text + "%' order by Create_on_time desc";
                                            dtb = new SqlCommon().getdata(sql);
                                            dt.Merge(dtb);
                                            DataView dv = dt.DefaultView;
                                            dv.Sort = "Create_on_time desc";
                                            dta = dv.ToTable();
                                        }
                                        else
                                        {
                                            //sql = "select * from ((Topic_message as a inner join Create_topic as b on a.Topic_id=b.id )inner join User_registration as c on b.User_id= c.ID)inner join Reply_message as d on b.ID=d.Topic_id where Forum_id=" + forum_id + " and (User_id=" + forum_n + " or Reply_user_id=" + forum_n + " )and Is_son=" + Is_son + "and b.Title like '%" + Text + "%' order by Create_on_time desc";
                                            sql = "select * from (Topic_message as a inner join Create_topic as b on a.Topic_id=b.id )inner join User_registration as c on b.User_id= c.ID where Forum_id=" + forum_id + " and User_id=" + forum_n + " and Is_son=" + Is_son + "and b.Title like '%" + Text + "%' order by Create_on_time desc";
                                            dta = new SqlCommon().getdata(sql);
                                        }
                                        //sql = "select * from ((Topic_message as a inner join Create_topic as b on a.Topic_id=b.id )inner join User_registration as c on b.User_id= c.ID)inner join Reply_message as d on b.ID=d.Topic_id where Forum_id=" + forum_id + " and ( User_id=" + forum_n + " or Reply_user_id=" + forum_n + " )and Is_son=" + Is_son + "and b.Title like '%" + Text + "%' order by Create_on_time desc";
                                        z = 2;
                                        break;
                                    }
                                }
                            }
                            if (z < 1)
                            {
                                //return Content(sul);
                                dt = new SqlCommon().getdata(sql);
                                return dt;
                            }


                            else if(zzz==2||zzz==0)
                            {
                                //sql = "select * from ((Topic_message as a inner join Create_topic as b on a.Topic_id=b.id )inner join User_registration as c on b.User_id= c.ID)inner join Reply_message as d on b.ID=d.Topic_id where Forum_id=" + forum_id + " and ( User_id=" + forum_n + " or Reply_user_id=" + forum_n + " )and Is_son=" + Is_son + "and b.Title like '%" + Text + "%' order by Create_on_time desc";
                                sql = "select * from (Topic_message as a inner join Create_topic as b on a.Topic_id=b.id )inner join User_registration as c on b.User_id= c.ID where Forum_id=" + forum_id + " and User_id=" + forum_n + " and Is_son=" + Is_son + "and b.Title like '%" + Text + "%' order by Create_on_time desc";
                                dta = new SqlCommon().getdata(sql);
                            }
                            else
                            {

                            }
                            //dta = new SqlCommon().getdata(sql);
                        }
                        else if (Text != "")
                        {
                            sql = "select * from (Topic_message as a inner join Create_topic as b on a.Topic_id=b.id )inner join User_registration as c on b.User_id= c.ID where User_id=" + forum_n + " and b.Title like '%" + Text + "%' order by Create_on_time desc";
                            dta = new SqlCommon().getdata(sql);
                        }
                        else if(repl!=":::")
                        {
                            id = id.Split(':')[1];
                            sql = "select * from (Topic_message as a inner join Create_topic as b on a.Topic_id=b.id )inner join User_registration as c on b.User_id= c.ID where c.ID='" + id + "' order by Create_on_time desc";
                            dta = new SqlCommon().getdata(sql);
                        }
                        else
                        {
                            sql = "select * from ((User_registration as a inner join Create_topic as b on a.ID=b.User_id) inner join Reply_message as c on b.ID=c.Topic_id) inner join Topic_message as d on c.Topic_id=d.Topic_id where c.Reply_user_id=" + na;
                            dt = new SqlCommon().getdata(sql);
                            sql = "select * from( User_registration as a inner join Create_topic as b on a.ID=b.User_id) inner join Topic_message as c on b.ID=c.Topic_id where User_id=" + na;
                            dtb = new SqlCommon().getdata(sql);
                            dt.Merge(dtb);
                            DataView dv = dt.DefaultView;
                            dv.Sort = "Create_on_time desc";
                            dta = dv.ToTable();
                        }
                        
                    }
                    else if (zzz == 2)
                    {
                        id = id.Split(':')[1];
                        sql = "select * from (Topic_message as a inner join Create_topic as b on a.Topic_id=b.id )inner join User_registration as c on b.User_id= c.ID where c.ID='" + id + "' order by Create_on_time desc";
                        dta = new SqlCommon().getdata(sql);
                    }
                }
                catch
                {
                    //return Content(sul);
                    dta = new SqlCommon().getdata(sql);
                    return dt;
                }
            }
            else
            {
                dta = new SqlCommon().getdata(sql);
            }
            return dta;
           
        }

    }
}