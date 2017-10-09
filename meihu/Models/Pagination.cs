//---------------------------张宏乾

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace meihu.Models
{
    public class Pagination
    {


        #region 张宏乾 分页


        /// <summary>
        /// 分页内容
        /// </summary>
        /// <param name="size">页面大小</param>
        /// <param name="count">页面数量</param>
        /// <param name="currendIndex">当前页</param>
        /// <param name="pattern">url模式：demo.aspx?page={0}</param>
        /// <param name="target">窗口模式</param>
        /// <returns></returns>
        public static string get_pagenation(int size,
           int count,
           int currendIndex,
           string pattern,
           string target)
        {
            //1>打开窗口目标
            target = string.IsNullOrEmpty(target) ? "_top" : target;
            //2>总页数
            int pageCount = count / size;
            pageCount = pageCount * size == count ? pageCount : pageCount + 1;
            //3>分页内容
            StringBuilder strHtml = new StringBuilder();
            strHtml.Append("<div>");

            #region 首部处理
            if (currendIndex > 1)
            {
                strHtml.AppendFormat("<a href='javascript:void(0);'  onclick='aclick(-1,{0})' target='{1}' class='Rjt'></a>", currendIndex - 1, target);
            }
            else
            {
            }
            #endregion

            #region 中间部分
            int i = 1;

            int right = (currendIndex + 4) > pageCount ? pageCount : currendIndex + 4;
            if (currendIndex > 6)
            {
                i = currendIndex - 5;
            }
            else
            {
                right = pageCount >= 10 ? 10 : pageCount;
            }
            for (; i <= right; i++)
            {
                if (i == currendIndex)
                {
                    strHtml.AppendFormat("<strong>{0}</strong>", i);
                    strHtml.AppendLine();
                    continue;
                }
                strHtml.AppendFormat("<a  href='javascript:void(0);'  onclick='aclick(-1,{0})' target='{1}'>{2}</a>", i, target, i);
                strHtml.AppendLine();
            }
            #endregion

            #region 尾部处理
            if (currendIndex == pageCount)
            {
                strHtml.AppendFormat("<label><input type='text' class='an' value='{0}'title='输入页码，按回车快速跳转' onkeydown='if(event.keyCode==13)aclick(-1,this.value);' /><span>/ {1} 页</span></label>", currendIndex, pageCount);
            }
            else
            {
                strHtml.AppendFormat("<label ><input  type='text' class='an' value='{0}'title='输入页码，按回车快速跳转' onkeydown='if(event.keyCode==13)aclick(-1,this.value);' /><span>/ {1} 页</span></label>", currendIndex, pageCount);
                strHtml.AppendFormat("<a href='javascript:void(0);' onclick='aclick(-1,{0})'  target='{1}' class='Ljt'>下一页</a>", currendIndex + 1, target);  
            }
            #endregion

            strHtml.Append("</div>");

            return strHtml.ToString();
        }


        #endregion



    }
}