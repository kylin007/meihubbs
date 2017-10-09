
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using meihu.Models;
namespace meihu.Models
{
    public class HomeModel
    {
        SqlCommon db = new SqlCommon();
        public HomeModel()
        {
            //db = new DataBase();
        }
       
        public DataTable selectUserCount()
        {
          string str = "SELECT top 8 * FROM  First_forum";
           DataTable dom = db.getdata(str);
            return dom;
        }
        public DataTable froum()
        {

            //int count = 0;
            //创建虚表
            DataTable mdom = new DataTable("CAT");
            DataColumnCollection columns = mdom.Columns;
            columns.Add("ID", typeof(System.String));
            columns.Add("fatime", typeof(System.String));
            columns.Add("countsub", typeof(System.Int32));
            columns.Add("countFORM", typeof(System.String));
            columns.Add("Second_forum", typeof(System.String));

            string strFORMfirst = "select *FROM First_forum";
            DataTable sdomfirst = db.getdata(strFORMfirst);
            for (int g = 0; g < sdomfirst.Rows.Count; g++)
            {
                string strFORM = "select distinct ID FROM Second_forum WHERE First_forum_id='" + sdomfirst.Rows[g]["ID"].ToString() + "'";
                DataTable sdom = db.getdata(strFORM);
                for (int i = 0; i < sdom.Rows.Count; i++)
                {
                    //string str = "select C.ID,C.Create_on_time,B.Second_forum,C.Topic_content  FROM Create_topic AS C,First_forum AS A,Second_forum AS B  where A.ID=B.First_forum_id AND C.Forum_id=A.ID AND Forum_id=1 AND B.ID='" + sdom.Rows[i]["ID"].ToString() + "'  ORDER BY Create_on_time DESC";
                    string str = "    select C.ID,C.Create_on_time,B.Second_forum FROM Create_topic AS C,Second_forum AS B  where c.Forum_id=b.ID   AND B.ID='" + sdom.Rows[i]["ID"].ToString() + "'  ORDER BY Create_on_time DESC";
                    DataTable domFORM = db.getdata(str);
                    int countFORM = domFORM.Rows.Count;
                    int countsub = 0;
                    for (int J = 0; J < domFORM.Rows.Count; J++)
                    {
                        string strsub = "SELECT COUNT(*) as countsub  FROM Reply_message WHERE ID='" + domFORM.Rows[0]["ID"].ToString() + "'";
                        DataTable domsub = db.getdata(strsub);
                        countsub += Convert.ToInt32(domsub.Rows[0]["countsub"].ToString());

                    }
                    DataRow datarow = mdom.NewRow();
                    datarow["ID"] = sdomfirst.Rows[g]["ID"].ToString();  //ID
                    try
                    {
                        datarow["fatime"] = domFORM.Rows[0]["Create_on_time"]; //最后发表时间
                    }
                    catch { datarow["fatime"] = null; };
                    datarow["countsub"] = countsub.ToString();  //帖数
                    datarow["countFORM"] = countFORM.ToString();//主题数目
                    try
                    {
                        datarow["Second_forum"] = domFORM.Rows[0]["Second_forum"].ToString(); //二级标题
                    }
                    catch
                    {
                        datarow["Second_forum"] = null;
                    }
                    mdom.Rows.Add(datarow);
                }

            }
            return mdom;
        }


        public object First_froum { get; set; }
    }
}
