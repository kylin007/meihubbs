using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace meihu.Models
{
    public class SqlCommon
    {
        public static string connew = "Data Source=.;Initial Catalog=BBS_zzn;Integrated Security=True";

        //提取数据
        public  DataTable getdata(string str)
        {
            using (SqlConnection conn = new SqlConnection(connew))
            {
                conn.Open();
                DataTable dt = new DataTable();
                SqlDataAdapter dom = new SqlDataAdapter(str.Trim(), conn);
                dom.Fill(dt);
                conn.Close();
                return dt;
            }
        }
        //添加 修改 删除 数据
        //成功返回受影响的行数，否则返回0
        public  int check(string str)
        {
            using (SqlConnection conn = new SqlConnection(connew))
            {
                conn.Open();
                SqlCommand dom = new SqlCommand(str,conn);
                int d = dom.ExecuteNonQuery();
                conn.Close();
                if (d > 0)
                    return d;
                else
                    return 0;
            }

        }
        /// <summary>
        /// 返回DataReader 异常返回null
        /// </summary>
        /// <param name="Sqlstr"></param>
        /// <returns></returns>
        public static SqlDataReader ExecuteReader(String Sqlstr)
        {

            SqlConnection conn = new SqlConnection(connew);//返回DataReader时,是不可以用using()的
            try
            {
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = Sqlstr;
                conn.Open();
                return cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection);//关闭关联的Connection
            }
            catch //(Exception ex)
            {
                return null;
            }
        }
  



    }
}