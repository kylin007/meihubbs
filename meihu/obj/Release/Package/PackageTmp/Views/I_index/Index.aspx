<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Register Src="~/News.ascx" TagPrefix="uc1" TagName="News" %>
<%@ Register Src="~/Login.ascx" TagPrefix="uc1" TagName="Login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    原郑州大学论坛更名为眉湖论坛 -  Powered by Discuz!
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    

    <div id="en">
        <div id="log1">
            <a class="mvhm" href="./" title="首页" style="">郑州大学论坛，郑大眉湖论坛</a>
            <em>></em>
            <a href="./">论坛</a>
        </div>
    </div>
    <script src="../../Jscript/My_post.js"></script>
    <style>       .Member_name a:hover{
    text-decoration: underline;
}
    </style>
     <div class="Member_name" style="height: 18px;width: 960px;margin-bottom: 5px;display: inline-block;">
         <p  style=" float: left; padding-left: 22px; background: url(../../image/chart.png) no-repeat 0 50%; color: #999;margin-top: 0px; margin-bottom: 0px;">
             <span  style=" margin: 0 5px;color: #ccc;">|</span>帖子:
             <em id="post_num" style="color: #444;"></em>
            <span style=" margin: 0 5px;color: #ccc;">|</span>会员:
             <em id="user_num" style="color: #444;"></em>
             <span style=" margin: 0 5px;color: #ccc;">|</span>欢迎新会员：
             <em style="color: #444;" id="uu"></em>
         </p>
         <div style="float: right;">
             <a id="MY" href="/Home/My_post?1" style="color: #000; " title="我的帖子">我的帖子</a>
             <span id="img" style=" margin: 0 5px;color: #ccc;">|</span>
             <a href="/Home/My_post?2" style="color: #000;" title="查看新帖">查看新帖</a>
         </div>
     </div>

<%--************************************郑小同************************************************************************--%>
    <uc1:News runat="server" ID="News" />
    &nbsp;
    <link href="../../Css/I_index.css" rel="stylesheet" />

    <div class="block">
        <% List<meihu.Models.I_indexModel> modellist = TempData["forum"] as List<meihu.Models.I_indexModel>;
           foreach (var item in modellist)
           {%>
        <%int i = 0; %>
        <%if (item.First_forum == "新人发帖区")
          {%>
        <div class="version">
            <div class="version-name">
                <h2><a href="/Classify/OneLeveL?name=新人发帖区">新人发帖区</a></h2>
                <span class="x">
                    <img class="eleven_img" src="../../image/collapsed_no.gif" onclick="slide1('eleven')" /></span>
            </div>
            <div class="version-message" id="eleven" style="border-bottom: 1px solid #CDCDCD;">
                <ul class="new-man">
                    <li style="width: 41px; height: 49px; margin-top: 20px; margin-left: 10px;">

                        <%
                            
                    if (Convert.ToInt32(item.listmodel[0].list[7]) >= 1)
                    {%>

                        <%if(Session["User_id"] == null)
                          {%>
                          <a href="#"  onclick="Login();">

                            <img src="../../image/forum_new.gif" /></a>
                    </li>
                    <li style="width: 510px; height: 49px; margin-left: -10px;">

                        <h2><a href="#"  onclick="Login();">新人发帖区</a><em>(<%=item.listmodel[0].list[7]%>)</em></h2>
                        <%}
                          else
                          {%>
                          <a href="/TwoLevel/TwoLevel?name=新人发帖区">

                            <img src="../../image/bubble.gif" /></a>
                    </li>
                    <li style="width: 510px; height: 49px; margin-left: -10px;">
                        <h2><a href="/TwoLevel/TwoLevel?name=新人发帖区">新人发帖区</a></h2>
                        <%} %>
                      
                        <%}
              else
              {%><%if(Session["User_id"] == null)
                          {%>
                          <a href="#"  onclick="Login();">

                            <img src="../../image/bubble.gif" /></a>
                    </li>
                    <li style="width: 510px; height: 49px; margin-left: -10px;">

                        <h2><a href="#"  onclick="Login();">新人发帖区</a></h2>
                        <%}
                          else
                          {%>
                          <a href="/TwoLevel/TwoLevel?name=新人发帖区">

                            <img src="../../image/bubble.gif" /></a>
                    </li>
                    <li style="width: 510px; height: 49px; margin-left: -10px;">
                        <h2><a href="/TwoLevel/TwoLevel?name=新人发帖区">新人发帖区</a></h2>
                        <%} %>
                       
                         <%}
                          
                        %>
                    </li>
                    <li style="width: 50px; margin-left: 125px; padding-top: 10px;">
                        <span style="color: #000;"><%=item.listmodel[0].list[0]%></span>
                        <span style="color: #999 !important;">&nbsp;/&nbsp;<%=item.listmodel[0].list[1]%></span>
                    </li>


                    <%
                    if (Session["User_id"] != null)
                    { %>
                    <li style="width: auto;">
                        <a href="/postInfor/post?id=<%=item.listmodel[0].list[5]%>"><%=item.listmodel[0].list[3]%></a><br />
                        <span style="margin-top: -8px; display: block;"><%=item.listmodel[0].list[2]%>&nbsp;<a href="/Home/PersonData?id=<%=item.listmodel[0].list[6]%>"><%=item.listmodel[0].list[4]%></a></span>
                    </li>
                    <%}
              else
              { %>
                    <li style="width: auto;">

                        <span style="margin-top: 9px; display: block;">私密板块</span>
                    </li>

                    <%}
                    %>
                </ul>

            </div>
        </div>
        <% }
          else
          {%>
        <div class="version">
            <div class="version-name">
                <h2><a href="/Classify/OneLeveL?name=<%=item.First_forum%>"><%=item.First_forum%></a></h2>
                <span class="x">
                    <img class="<%=item.First_forum%>_img" src="../../image/collapsed_no.gif" onclick="slide1('<%=item.First_forum%>')" /></span>
            </div>
            <div class="version-message" id="<%=item.First_forum%>">
                <ul class="version1">
                    <%
              foreach (var itemj in item.listmodel)
              {%>
                    <%i++;
                      if (item.listmodel.Count > 3)
                      {%>
                    <%
                          if (i <= 3)
                          {%>
                    <li style="border-bottom: 1px dashed #CDCDCD;">
                        <%if (itemj.childname == "灌水聊天" && Session["User_id"] == null)
                          {%>
                         <a href="#" onclick="Login();">
                            <%if (Convert.ToInt32(itemj.list[7]) >= 1)
                              {%>
                            <img src="../../image/forum_new.gif" />
                            <% }
                              else
                              {%>
                            <img src="../../image/bubble.gif" />
                            <%} %>
                        </a>
                        <%}
                          else 
                          {%>
                         <a href="/TwoLevel/TwoLevel?name=<%=itemj.childname.Replace('&','0')%>">
                            <%if (Convert.ToInt32(itemj.list[7]) >= 1)
                              {%>
                            <img src="../../image/forum_new.gif" />
                            <% }
                              else
                              {%>
                            <img src="../../image/bubble.gif" />
                            <%} %>
                        </a>
                        <% }%>
                       
                        <ul class="version2">
                            <%
                              if (itemj.childname == "灌水聊天" && Session["User_id"] == null)
                              { 
                                   if (Convert.ToInt32(itemj.list[7]) >= 1)
                              {%>
                            <li class="subject"><a href="#" onclick="Login();"><%=itemj.childname%></a><em>(<%=itemj.list[7]%>)</em></li>
                            <% }
                              else
                              {%>
                            <li class="subject"><a href="#" onclick="Login();"><%=itemj.childname%></a></li>
                            <%}
                              }
                              else
                              {
                                   if (Convert.ToInt32(itemj.list[7]) >= 1)
                              {%>
                            <li class="subject"><a href="/TwoLevel/TwoLevel?name=<%=itemj.childname.Replace('&','0')%>"><%=itemj.childname%></a><em>(<%=itemj.list[7]%>)</em></li>
                            <% }
                              else
                              {%>
                            <li class="subject"><a href="/TwoLevel/TwoLevel?name=<%=itemj.childname.Replace('&','0')%>"><%=itemj.childname%></a></li>
                            <%}
                                  
                              }
                             
                            %>
                            <li>主题:<%=itemj.list[0]%>,帖数:<%=itemj.list[1]%></li>


                            <%
                              if (itemj.childname == "灌水聊天")
                              { %>

                            <%if (Session["User_id"] == null)
                              { %>

                            <li>私密板块</li>
                            <%}
                              else
                              {%>

                            <% if (itemj.list[2].IsEmpty())
                               {%>
                            <li>从未</li>
                            <% }

                               else
                               {%>
                            <li><a href="/postInfor/post?id=<%=itemj.list[5]%>">最后发表:<%=itemj.list[2]%></a></li>
                            <%}
                              
                              
                            %>

                            <%}%>

                            <%}
                              else
                              {%>
                            <% if (itemj.list[2].IsEmpty())
                               {%>
                            <li>从未</li>
                            <% }
                               else
                               {%>
                            <li><a href="/postInfor/post?id=<%=itemj.list[5]%>">最后发表:<%=itemj.list[2]%></a></li>
                            <%}  
                            %>
                            <%}
                            %>
                        </ul>
                    </li>
                    <% }
                          else
                          {%>
                   
                    <li>
                         <% if (itemj.childname == "灌水聊天" && Session["User_id"] == null)
                       { %>
                         <a href="#" onclick="Login();">
                            <%if (Convert.ToInt32(itemj.list[7]) >= 1)
                              {%>
                            <img src="../../image/forum_new.gif" />
                            <% }
                              else
                              {%>
                            <img src="../../image/bubble.gif" />
                            <%} %>
                        </a>
                    <%}
                       else 
                       {%>
                         <a href="/TwoLevel/TwoLevel?name=<%=itemj.childname.Replace('&', '0')%>">
                            <%if (Convert.ToInt32(itemj.list[7]) >= 1)
                              {%>
                            <img src="../../image/forum_new.gif" />
                            <% }
                              else
                              {%>
                            <img src="../../image/bubble.gif" />
                            <%} %>
                        </a>
                    <% }
                         %>
                       
                        <ul class="version2">
                            <%
                              if (Convert.ToInt32(itemj.list[7]) >= 1)
                              {%>

                            <%
                                  if (itemj.childname == ("个人show").ToString() || itemj.childname == ("原创空间").ToString() || itemj.childname == ("论坛帮助和问题反馈").ToString())
                                  {%>
                            <li class="subject"><a href="/TwoLevel/TwoLevel?name=<%=itemj.childname.Replace('&','0')%>" style="color: red;"><%=itemj.childname%></a><em>(<%=itemj.list[7]%>)</em></li>
                            <%}
                                  else
                                  {%>

                            <%if (itemj.childname == "灌水聊天" && Session["User_id"] == null)
                              { %>
                            <li class="subject"><a href="#" onclick="Login();"><%=itemj.childname%></a><em>(<%=itemj.list[7]%>)</em></li>
                            <%}
                              else
                              {%>
                            <li class="subject"><a href="/TwoLevel/TwoLevel?name=<%=itemj.childname.Replace('&','0')%>"><%=itemj.childname%></a><em>(<%=itemj.list[7]%>)</em></li>
                            <%}   %>
                            
                            <%}
                            %>
                            <% }
                              else
                              {%>
                            <%
                                  if (itemj.childname == ("个人show").ToString() || itemj.childname == ("原创空间").ToString() || itemj.childname == ("论坛帮助和问题反馈").ToString())
                                  {%>
                            <li class="subject"><a href="/TwoLevel/TwoLevel?name=<%=itemj.childname.Replace('&','0')%>" style="color: red;"><%=itemj.childname%></a></li>
                            <%}
                                  else
                                  {%>
                            <%if (itemj.childname == "灌水聊天" && Session["User_id"] == null)
                              { %>
                            <li class="subject"><a href="#" onclick="Login();"><%=itemj.childname%></a></li>
                            <%}
                              else
                              {%>
                            <li class="subject"><a href="/TwoLevel/TwoLevel?name=<%=itemj.childname.Replace('&','0')%>"><%=itemj.childname%></a></li>
                            <%}   %>
                            <%}
                            %>
                            <%}
                            %>
                            <li>主题:<%=itemj.list[0]%>,帖数:<%=itemj.list[1]%></li>
                            <%
                              if (itemj.childname == "灌水聊天")
                              { %>

                            <%if (Session["User_id"] == null)
                              { %>

                            <li>私密板块</li>
                            <%}
                              else
                              {%>

                            <% if (itemj.list[2].IsEmpty())
                               {%>
                            <li>从未</li>
                            <% }


                               else
                               {%>
                            <li><a href="/postInfor/post?id=<%=itemj.list[5]%>">最后发表:<%=itemj.list[2]%></a></li>
                            <%}
                              
                              
                            %>

                            <%}%>

                            <%}
                              else
                              {%>
                            <% if (itemj.list[2].IsEmpty())
                               {%>
                            <li>从未</li>
                            <% }


                               else
                               {%>
                            <li><a href="/postInfor/post?id=<%=itemj.list[5]%>">最后发表:<%=itemj.list[2]%></a></li>
                            <%}
                              
                              
                            %>
                            <%}
                            %>
                        </ul>
                    </li>
                    <%}
                    %>
                    <% }
                      else
                      {%>
                    <li>
                         <% if (itemj.childname == "灌水聊天" && Session["User_id"] == null)
                       { %>
                         <a href="#" onclick="Login();">
                            <%if (Convert.ToInt32(itemj.list[7]) >= 1)
                              {%>
                            <img src="../../image/forum_new.gif" />
                            <% }
                              else
                              {%>
                            <img src="../../image/bubble.gif" />
                            <%} %>
                        </a>
                    <%}
                       else 
                       {%>
                         <a href="/TwoLevel/TwoLevel?name=<%=itemj.childname.Replace('&', '0')%>">
                            <%if (Convert.ToInt32(itemj.list[7]) >= 1)
                              {%>
                            <img src="../../image/forum_new.gif" />
                            <% }
                              else
                              {%>
                            <img src="../../image/bubble.gif" />
                            <%} %>
                        </a>
                    <% }
                         %>
                        <ul class="version2">

                            <%
                          if (Convert.ToInt32(itemj.list[7]) >= 1)
                          {%>
                            <%
                              if (itemj.childname == ("个人show").ToString() || itemj.childname == ("原创空间").ToString() || itemj.childname == ("论坛帮助和问题反馈").ToString())
                              {%>
                            <li class="subject"><a href="/TwoLevel/TwoLevel?name=<%=itemj.childname.Replace('&','0')%>" style="color: red;"><%=itemj.childname%></a><em>(<%=itemj.list[7]%>)</em></li>
                            <%}
                              else
                              {%>
                            <%if (itemj.childname == "灌水聊天" && Session["User_id"] == null)
                              { %>
                            <li class="subject"><a href="#" onclick="Login();"><%=itemj.childname%></a><em>(<%=itemj.list[7]%>)</em></li>
                            <%}
                              else
                              {%>
                            <li class="subject"><a href="/TwoLevel/TwoLevel?name=<%=itemj.childname.Replace('&','0')%>"><%=itemj.childname%></a><em>(<%=itemj.list[7]%>)</em></li>
                            <%}   %>
                            <%}
                            %>
                            <% }
                          else
                          {%>
                            <%
                              if (itemj.childname == ("个人show").ToString() || itemj.childname == ("原创空间").ToString() || itemj.childname == ("论坛帮助和问题反馈").ToString())
                              {%>
                            <li class="subject"><a href="/TwoLevel/TwoLevel?name=<%=itemj.childname.Replace('&','0')%>" style="color: red;"><%=itemj.childname%></a></li>
                            <%}
                              else
                              {%>
                            <%if (itemj.childname == "灌水聊天" && Session["User_id"] == null)
                              { %>
                            <li class="subject"><a href="#" onclick="Login();"><%=itemj.childname%></a></li>
                            <%}
                              else
                              {%>
                            <li class="subject"><a href="/TwoLevel/TwoLevel?name=<%=itemj.childname.Replace('&','0')%>"><%=itemj.childname%></a></li>
                            <%}   %>
                            <%}
                            %>
                            <%}
                            %>

                            <li>主题:<%=itemj.list[0]%>,帖数:<%=itemj.list[1]%></li>

                            <%
                          if (itemj.childname == "灌水聊天")
                          { %>

                            <%if (Session["User_id"] == null)
                              { %>

                            <li>私密板块</li>
                            <%}
                              else
                              {%>

                            <% if (itemj.list[2].IsEmpty())
                               {%>
                            <li>从未</li>
                            <% }


                               else
                               {%>
                            <li><a href="/postInfor/post?id=<%=itemj.list[5]%>">最后发表:<%=itemj.list[2]%></a></li>
                            <%}
                              
                              
                            %>

                            <%}%>

                            <%}
                          else
                          {%>
                            <% if (itemj.list[2].IsEmpty())
                               {%>
                            <li>从未</li>
                            <% }


                               else
                               {%>
                            <li><a href="/postInfor/post?id=<%=itemj.list[5]%>">最后发表:<%=itemj.list[2]%></a></li>
                            <%}
                              
                              
                            %>
                            <%}
                            %>
                        </ul>
                    </li>
                    <% }
                    %>
                    <% }
                    %>
                </ul>
            </div>
        </div>
        <% } %>

        <%  } %>
    </div>
</asp:Content>
