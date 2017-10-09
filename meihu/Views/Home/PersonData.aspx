﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>




<%@ Register Src="~/Send_Mess.ascx" TagPrefix="uc1" TagName="Send_Mess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    个人资料
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Css/PersonData.css" rel="stylesheet" />
    <script  src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
    <script src="../../Jscript/PersonData.js"></script>
    <%--    <% List<string> ls = ViewData["aaa"] as List<string>;
       获取值进行拼接
        %>--%>
    <%-- 点击加好友的弹出框 --%>
   <div id="fwin_friend" class="fwinmask" initialized="true" style="position:fixed; z-index:201; left:585.5px; top:262.5px; display:none;">
        <style type="text/css">object{visibility:hidden;}</style>
        <table class="fwin" >
            <tbody>
                <tr>
                    <td class="t_l"></td>
                    <td class="t_c" style="cursor:move" ></td>
                    <td class="t_r"></td>
                </tr>
                <tr>
                    <td class="m_l" style="cursor:move;" ></td>
                    <td id ="fwin_content" class="m_c" style="">
                        <h3 id ="fctrl_friend" class="flb" style="cursor:move;"> 
                            <em >加为好友</em>
                            <span class="close1"> <a class="flbc" href="javascript: ;" onclick="Quit(1)" title="关闭">关闭</a></span>
                        </h3>
                        <form id="addform" >
                            <div class="c">
                                <table>
                                    <tbody>
                                        <tr><%-- 转换为提示信息 --%>
                                           <th class="avt" valign="top" width="60">
                                                <a href="javascript:;"><img src="../../image/noavatar_small.gif" /></a>
                                            </th>
                                            <td valign="top">
                                                添加<strong id="friend_name" name="friend_name" >
                                                     <%
                                                         if(ViewData["stackholder"]!=null)
                                                         {
                                                             foreach(var stakerholder in ViewData["stackholder"] as Dictionary<string,string>)
                                                             {
                                                                 if(stakerholder.Key =="用户名")
                                                                 {%>
                                                                    <a href="space-uid-294442.html"><span></span><%= stakerholder.Value %></a>
                                                                 <%} 
                                                             }
                                                         } %>
                                                  </strong>为好友，附言:<br /><input class="px" id="fri_mess" name="note" value="" size="35"  type="text"/>
                                                <p class="mtn xg1">(附言为可选， 
                                                    <%
                                                        if(ViewData["stackholder"]!=null)
                                                        {
                                                            foreach(var stakerholder in ViewData["stackholder"] as Dictionary<string,string>)
                                                            {
                                                                if(stakerholder.Key =="用户名")
                                                                {%>
                                                                    <a href="space-uid-294442.html"><span></span><%= stakerholder.Value %></a>
                                                                <%} 
                                                             }
                                                         }%> 会看到这条附言，最多50个字符)</p>
                                                <p class="mtm">
                                                    分组：
                                                    <select class="ps" name="gid" id="select1" >
                                                        <option value="0">其他</option>
                                                        <option value="1" selected="selected">通过本站认识</option>
                                                        <option value="2">通过活动认识</option>
                                                        <option value="3">通过朋友认识</option>
                                                        <option value="4">亲人</option>
                                                        <option value="5">同事</option>
                                                        <option value="6">同学</option>
                                                        <option value="7">不认识</option>
                                                    </select>
                                                </p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <p class="o pns">
                                <button id="addsubmit_btn" class="pn pnc" type="button" name="addsubmit_btn" value="true" ><strong>确定</strong></button>
                            </p>
                        </form>
                    </td>
                    <td class="m_r" style="cursor:move;" ></td>
                </tr>
                <tr>
                    <td class="b_l"></td>
                    <td class="b_c" style="cursor:move;"></td>
                    <td class="b_r"></td>
                </tr>
            </tbody>
        </table>
    </div> 
   
    
    <%-- 点击发消息的弹出框 --%>            
    <uc1:Send_Mess runat="server" ID="Send_Mess" />
    
    <%-- 个人资料 --%>

<div id="Mid" class="mid">
    <div id="Mid_menu" class="mid_menu">
        <div class="con" id="menu_con">
            <a href="http://localhost:3741/" class="nvhm" title="首页" style="">郑州大学论坛，郑大眉湖论坛</a><%-- 返回首页图标 --%>
            <em>?</em>
              <% if(ViewData["stackholder"]!=null)
                 {
                     foreach(var stakerholder in ViewData["stackholder"] as Dictionary<string,string>)
                     {
                         if(stakerholder.Key =="用户名")
                         {%>
                              <%foreach(var stakerholder1 in ViewData["stackholder"] as Dictionary<string,string>)
                                {
                                    if(stakerholder1.Key =="用户id")
                                    {%>
                                        <a href="http://localhost:3741/Home/PersonData?id=<%= stakerholder1.Value %>"><span></span><%= stakerholder.Value %></a>
                                    <%} 
                                 }%>     
                           <%} 
                      }
                  }%>
            <em>?</em>
            <span id="Topic_data">个人资料</span>
        </div>
    </div>
    <div class="wp">
        <div id="diy1" class="area"></div>
    </div>
    <div id="Mid_top" class="mid_top">
        <% if(ViewData["stackholder"]!=null)
           {
               foreach(var stakerholder in ViewData["stackholder"] as Dictionary<string,string>)
               {
                   if(stakerholder.Key =="显示")
                   {%>
                      <div class="top_right" style="display:block;" ><%-- 如果资料不是自己让它显示 --%>
                   <%} 
               }
               foreach(var stakerholder in ViewData["stackholder"] as Dictionary<string,string>)
              {
                   if(stakerholder.Key =="隐藏")
                   {%>
                     <div class="top_right" style="display:none;" ><%-- 如果资料不是自己让它显示 --%>
                   <%} 
              }
           }%>
            <ul>
                <li class="addf">
                    <a id="MakeFriend" class="makefriend" href="javascript:;" onclick="Show(1)">加为好友</a>
                </li>
                <li class="pm2">
                    <a id="SendMess" class="sendMess" href="javascript:;" onclick="Show(2)">发送消息</a>
                </li>
            </ul>
        </div>
        <div class="top_center">
            <div class="headphoto">
                <a href="javascript:;"><img src="../../image/noavatar_small.gif" /></a>
            </div>
             <% if(ViewData["stackholder"]!=null)
                {
                    foreach(var stakerholder in ViewData["stackholder"] as Dictionary<string,string>)
                    {
                        if(stakerholder.Key =="用户名")
                        {%>
                             <h2 class="mt" id="user_name"><%= stakerholder.Value %></h2>       
                        <%} 
                     }
                }%>
            <p>
                  <% if(ViewData["stackholder"]!=null)
                     {
                         foreach(var stakerholder in ViewData["stackholder"] as Dictionary<string,string>)
                         {
                             if(stakerholder.Key =="用户id")
                             {%>
                                   <a href="http://localhost:3741/" class="">
                                                http://localhost:3741/?<%= stakerholder.Value %>
                                   </a>
                                       
                                         
                              <%} 
                           }
                      }%>
            </p>
        </div>
        <ul class="tb" id="tb">
            <li ><a href="javascript:;">主题</a></li>
            <li class="a"><a href="javascript:;">个人资料</a></li>
        </ul>
    </div>
    <div id="Data">
       <div class="data">
            <div id="diycontenttop" class="area"></div>
            <div id="data1" class="data1">
                <div class="data4" style="display:none;">
                    <div class="data4_con" id="data4_con">
                        <p class="data4_menu" id="data4_menu">
                            <a href="javascript:;" class="a" id="topic1" onclick="change()">主题</a>
                            <span class="pipe">|</span>
                            <a href="javascript:;" id="reply1" onclick="change()">回复</a>
                        </p>
                        <div class="data5" id="data5_one" style="display:block">
                            <table cellpadding="0" cellspacing="0">
                                <tbody id ="data_topic"><%--个人资料帖子 --%>
                             
                                </tbody>
                            </table>
                        </div>
                        <div class="data5" style="display:none" id="data5_two">
                            <table > 
                                <tbody id="data_reply">
                                </tbody>
                            </table>
                        </div>
                        <div class="pgs cl mtm" >
                            <div class="pg">
                                <span class="pgb">
                                    <a href="javascript:;" id="before" style="display:none;">上一页</a>
                                </span>
                                    <a class="nxt" href="javascript:;" id="next" style="display:none;">下一页</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="data2" style="display:block">
                    <div class="data3">
                        <div class="Text_top1">
                            <h2 class="line1" >
                                <% if(ViewData["stackholder"]!=null)
                                   {
                                       foreach(var stakerholder in ViewData["stackholder"] as Dictionary<string,string>)
                                       {
                                           if(stakerholder.Key =="用户名")
                                           {%>
                                                <%= stakerholder.Value %>
                                           <%} 
                                      }
                                 }%>
                                <% if(ViewData["stackholder"]!=null)
                                   {
                                       foreach(var stakerholder1 in ViewData["stackholder"] as Dictionary<string,string>)
                                       {
                                           if (stakerholder1.Key == "是否在线" )
                                           {%>
                                               <img src="../../image/ol.gif" alt="online" title="在线" class="vm"/>
                                           <%}
                                      }
                                   }%>
                                &nbsp;
                                <span>(UID:
                                    <% if(ViewData["stackholder"]!=null)
                                       {
                                           foreach(var stakerholder in ViewData["stackholder"] as Dictionary<string,string>)
                                           {
                                               if(stakerholder.Key =="用户id")
                                               {%>
                                                    <%= stakerholder.Value %>
                                            <%}
                                       } 
                                 }%>
                                   
                                    )</span></h2>
                            <ul class="line2">
                                <li><em>邮箱状态 </em>未验证</li>
                                <li><em>视频认证 </em>未认证</li>
                                <li><em></em></li>
                            </ul>
                            <ul style="width:918px;  margin:0px; padding:0px;">
                                <%if(ViewData["stackholder"]!=null)
                                  {
                                      foreach(var stakerholder in ViewData["stackholder"] as Dictionary<string,string>)
                                      {
                                          if(stakerholder.Key =="个人签名")
                                          {%>
                                                <li><em class="xg1"><%=stakerholder.Key %></em><table><tbody><tr><td><%= stakerholder.Value %></td></tr></tbody></table></li></ul>
                                          <%}
                                     } 
                                  }%> 
                            <ul class="line3">
                                <li>
                                    <em class="topic">统计信息</em>
                                    <% if(ViewData["stackholder"]!=null)
                                       {
                                           foreach(var stakerholder in  ViewData["stackholder"] as Dictionary<string,string>)
                                           {
                                               if(stakerholder.Key == "好友数")
                                               {%>
                                                    <a href="javascript:;" target="_blank"><%= stakerholder.Key%> <%= stakerholder.Value%></a> 
                                               <%}
                                            }
                                      }%>
                                    <span class="pipe">|</span>
                                    <% if(ViewData["stackholder"]!=null)
                                       {
                                           foreach(var stakerholder in  ViewData["stackholder"] as Dictionary<string,string>)
                                           {
                                               if(stakerholder.Key == "回帖数")
                                               {%>
                                                   <a href="javascript:;" target="_blank"><%= stakerholder.Key%> <%= stakerholder.Value%></a> 
                                               <%}
                                            }
                                      }%>
                                    <span class="pipe">|</span>
                                    <% if(ViewData["stackholder"]!=null)
                                       {
                                           foreach(var stakerholder in  ViewData["stackholder"] as Dictionary<string,string>)
                                           {
                                               if(stakerholder.Key == "主题数")
                                               {%>
                                                   <a href="javascript:;" target="_blank"><%= stakerholder.Key%> <%= stakerholder.Value%></a> 
                                               <%}
                                            }
                                      }%>
                                </li>   
                            </ul>
                            <ul class="line4">
                                <% if(ViewData["stackholder"]!=null)
                                   {
                                       foreach(var stakerholder1 in ViewData["stackholder"] as Dictionary<string,string>)
                                       {
                                           if (stakerholder1.Key == "真实姓名" || (stakerholder1.Key == "性别") || (stakerholder1.Key == "生日") || (stakerholder1.Key == "出生地") || (stakerholder1.Key == "居住地") || (stakerholder1.Key == "毕业学校") || (stakerholder1.Key == "学历") || (stakerholder1.Key == "公司") || (stakerholder1.Key == "职业") || (stakerholder1.Key == "职位") || (stakerholder1.Key == "交友目的") || (stakerholder1.Key == "兴趣爱好"))
                                           {%>
                                               <li><em><%= stakerholder1.Key%></em><%= stakerholder1.Value%></li>
                                           <%}
                                           else if (stakerholder1.Key == "个人主页")
                                           {%> 
                                               <li><em><%= stakerholder1.Key%></em><a href="<%= stakerholder1.Value%>" target="_blank"><%= stakerholder1.Value%></a></li>
                                           <%}
                                      }
                                   }%>
                            </ul>
                        </div>
                        <div class="Text_top2">
                            <h2 class="top2_line1">活跃概况</h2>
                            <ul class="top2_line2">
                                <li>
                                    <em class="user_group">用户组</em>
                                    <span class="xi2"  >
                                        <a href="javascript:;" target="_blank">注册用户</a>
                                    </span>
                                </li>
                            </ul>
                            <ul class="top2_line3">
                                <% if(ViewData["stackholder"]!=null)
                                   {
                                       foreach(var stakerholder2 in ViewData["stackholder"] as Dictionary<string,string>)
                                       {
                                           if ((stakerholder2.Key == "在线时间") || (stakerholder2.Key == "注册时间") || (stakerholder2.Key == "最后访问") || (stakerholder2.Key == "注册IP") || (stakerholder2.Key == "上次访问IP") || (stakerholder2.Key == "上次活动时间") || (stakerholder2.Key == "上次发表时间") || (stakerholder2.Key == "所在时区"))
                                           {%>
                                               <li><em><%= stakerholder2.Key%></em><%= stakerholder2.Value%></li>
                                           <%}
                                      }
                                 }%>
                            </ul>
                        </div>
                        <div class="Text_top3">
                            <h2 class="top3_topic">统计信息</h2>
                            <ul class="top3_line1">
                                 <% if(ViewData["stackholder"]!=null)
                                    {
                                        foreach(var stakerholder3 in ViewData["stackholder"] as Dictionary<string,string>)
                                        {
                                            if( (stakerholder3.Key=="已用空间")||(stakerholder3.Key=="积分")||(stakerholder3.Key=="金钱"))
                                            {%>
                                                <li><em><%= stakerholder3.Key%></em><%=  stakerholder3.Value%></li>
                                            <%}
                                        }
                                    }%>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
       </div>
    </div>
  </div>
</div>
</asp:Content>
