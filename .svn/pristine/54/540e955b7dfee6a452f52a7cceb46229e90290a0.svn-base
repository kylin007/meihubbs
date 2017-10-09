using meihu.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace meihu.Models
{
    public class HomeModel
    {
        DataBase db = new DataBase();
        
        SqlConnection con = new SqlConnection();
        public HomeModel()
        {
            db = new DataBase();
           
        }
        public int selectUserCount()
        {
            
            int count = 0;
            string str = "select count(*) from User_registration";
            DataTable dom = new DataBase().getdata(str);
            count = dom.Rows.Count;
            db.Close();
            return count;
        }

    }
}