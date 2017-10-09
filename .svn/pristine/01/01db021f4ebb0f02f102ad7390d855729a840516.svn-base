<%@ Page Title="" Language="C#" MasterPageFile="~/Views/shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Register Src="~/Posted.ascx" TagPrefix="uc1" TagName="Posted" %>
<%@ Register Src="~/Login.ascx" TagPrefix="uc1" TagName="Login" %>

<%--林玲--%>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%List<meihu.Models.TwoLevel> mlName = TempData["listN"] as List<meihu.Models.TwoLevel>;
      List<meihu.Models.TwoLevel> mlF = TempData["listF"] as List<meihu.Models.TwoLevel>;
      %>
      <%=mlName[0].Second_forum%> - 郑州大学论坛,郑大眉湖论坛 - Powered by Discuz!
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Jscript/jquery-2.2.0.min.js"></script>
    <script src="../../Jscript/TwoLevel.js"></script>
    <link href="../../Css/TwoLevel.css" rel="stylesheet" />
    <%List<meihu.Models.TwoLevel> mlNormal = TempData["listNM"] as List<meihu.Models.TwoLevel>;%>
    <%List<meihu.Models.TwoLevel> mlCount = TempData["listC"] as List<meihu.Models.TwoLevel>;
      List<meihu.Models.TwoLevel> mlName = TempData["listN"] as List<meihu.Models.TwoLevel>;
      List<meihu.Models.TwoLevel> mlData = TempData["listD"] as List<meihu.Models.TwoLevel>;
      List<meihu.Models.TwoLevel> mlF = TempData["listF"] as List<meihu.Models.TwoLevel>;
    %>
    <div class="Roofest">
        <a href="/I_index/Index" title="首页" class="oImg"></a>
        <span></span>
        <a href="/I_index/Index">论坛</a>
        <span></span>
        <a href="/Classify/OneLevel?name=<%=mlF[0].First_forum%>"><%=mlF[0].First_forum%></a>
        <%if (mlF[0].Second_forum == null)
          {%>
               <span></span>
               <a href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>"><%=mlName[0].Second_forum%></a>
        <%}
          else
          {%>
               <span></span>
               <a href="/TwoLevel/TwoLevel?name=<%=mlF[0].Second_forum.Replace('&', '0')%>"><%=mlF[0].Second_forum%></a>
        <%}%>
        <%if (mlF[0].Second_forum != null)
          {%>
               <span></span>
               <a href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>"><%=mlName[0].Second_forum%></a>
        <%}%>
    </div>
    <div class="Roof">
        <a><%=mlName[0].Second_forum%></a> 
        <div class="Digit">
            <p>今日:</p>
            <%if (mlCount.Count > 0)
              {%>
                  <strong class="Today"><%=mlCount[0].Today_topic_num%></strong>
              <%}
              else
              {%> 
                  <strong class="Today">0</strong>
              <%}%>
            <span>|</span>
            <p>主题:</p>
            <%if (mlCount.Count > 0)
              {%>
                   <strong class="Topic"><%=mlCount[0].Sum_topic_num%></strong>
              <%}
              else
              {%>  
                   <strong class="Topic">0</strong>
             <%}%>
        </div>
        <%if (mlName[0].Second_forum == "毕业生交流")
          {%>
                <div class="lala">只准发布交流帖子，禁止发布物品买卖帖子</div>
        <%}%>
    </div>
    <%List<meihu.Models.TwoLevel> mlIs_Son = TempData["listIS"] as List<meihu.Models.TwoLevel>;
      if (mlIs_Son.Count > 0)
      {
          if (mlIs_Son[0].Is_son == "1")
          {%>
            <div class="ChildSection">
                <div class="csRoof">
                    <h2>子版块</h2>
                    <img src="../../image/zoom.gif" />
                </div>
                <div class="csContent">
                    <ul>
                         <%List<meihu.Models.TwoLevel> ModelList = TempData["list"] as List<meihu.Models.TwoLevel>;
                        for (var i=0; i<ModelList.Count; i++)
                        {%>
                            <li class="csLi">
                                <img src="/image/bubble.gif" />
                                <div class="ChildPost"><a href="/TwoLevel/TwoLevel?name=<%=ModelList[i].Son_forum.Replace('&', '0')%>"><%=ModelList[i].Son_forum%></a></div>
                                <div class="csFigure"><span class="Former"><%=ModelList[i].Topic_num%></span><span class="Latter"> / <%=ModelList[i].Post_num%></span></div>
                                <div class="csLast">
                                    <%List<meihu.Models.TwoLevel> mlSonPn = TempData["listSM"] as List<meihu.Models.TwoLevel>;
                                      if (mlSonPn.Count > 0)
                                      {%>
                                        <a class="csPostName" href="/postInfor/post?id=<%=mlSonPn[i].ID%>"><%=mlSonPn[i].Title%></a>
                                        <div class="csPost">
                                            <p class="csTime" style="float: left; font-weight: 500;"><%=mlSonPn[i].Create_on_time%></p>
                                            <a class="csPeople" style="float: left; font-weight: 500;" href="/Home/PersonData?id=<%=mlSonPn[i].Person_Data%>"><%=mlSonPn[i].User_name%></a>
                                        </div>
                                       <%}%>
                                </div>
                            </li>
                        <%}%>
                    </ul>
                </div>
           </div>
       <% }
    }%>
    <div class="Separation">
        <div class="sLeft">
            <%if (Session["User_id"] == null)
              {%>
                   <a onclick="Login();"><img src="/image/pn_post.png" /></a>
             <%}   
              else
              {%>
                   <a><img src="/image/pn_post.png" /></a>                   
            <%}%>
            <div class="OnlyYou"><%=mlData[0].Page_num%></div>
        </div>   
         <%if (Session["User_id"] != null)
           {%>   
                <div class="Control">                           
                     <uc1:Posted runat="server" ID="Posted" />
                </div> 
           <%}
           if (mlCount.Count > 0)
           { 
            if(mlCount[0].Sum_topic_num > 23)
            {%>
                <div class="sRight">
                    <div class="sPage">                        
                        <%int C = (mlCount[0].Sum_topic_num - 23) / 25;
                          if ((mlCount[0].Sum_topic_num - 23) % 25 != 0) C++;%>
                          <%if (Convert.ToInt32(mlData[0].Page_num) == 1)
                          {
                               var CC = C;%>
                               <a class="active y o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=1">1</a>
                               <%if (C > 9) 
                                 {
                                     CC = 9;   
                                     for(var i=0; i<CC; i++)
                                     {%>
                                           <a class="active o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=i+2%>"><%=i+2%></a>
                                    <%}%>
                                     <a class="sLast o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=C+1%>">...<%=C+1%></a>                              
                                <%}
                                  else
                                  {
                                        for(var i=0; i<CC; i++)
                                        {%>
                                           <a class="active 0" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=i+2%>"><%=i+2%></a>
                                       <%}%>
                                 <%}                                 
                          }
                          else if (Convert.ToInt32(mlData[0].Page_num) <= 6) 
                          {
                               var CC = C;%> 
                               <a class="LastPage" style="width:8px;" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=Convert.ToInt32(mlData[0].Page_num)-1%>"><img style="margin-left:-2px;" src="/image/arw_l.gif"/></a>
                               <a class="active o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=1">1</a>                               
                               <%if (C > 9) 
                                 {
                                     CC = 9;   
                                     for(var i=0; i<CC; i++)
                                     {%>
                                           <a class="active o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=i+2%>"><%=i+2%></a>
                                    <%}%>
                                     <a class="sLast o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=C+1%>">...<%=C+1%></a>                              
                                <%}
                                 else
                                  {
                                        for(var i=0; i<CC; i++)
                                        {%>
                                           <a class="active o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=i+2%>"><%=i+2%></a>
                                       <%}
                                 }  
                          }
                          else
                          {
                               if (C > 9)
                               {%>
                                    <a class="active o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=1">1...</a>
                                    <a class="LastPage" style="width:8px;" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=Convert.ToInt32(mlData[0].Page_num)-1%>"><img style="margin-left:-2px;" src="/image/arw_l.gif"/></a>
                                   <%if (Convert.ToInt32(mlData[0].Page_num) >= C+1)
                                     {
                                         for (var i = C - 10; i < C; i++)
                                         {%>
                                                <a class="active o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=i+2%>"><%=i+2%></a>                                                   
                                         <%}
                                     }
                                     else 
                                     {
                                         for (var i = Convert.ToInt32(mlData[0].Page_num)-5; i<Convert.ToInt32(mlData[0].Page_num)+5; i++)
                                         {%>
                                               <a class="active o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=i+2%>"><%=i%></a>                                                   
                                         <%}%>
                                         <a class="sLast o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=C+1%>">...<%=C+1%></a>
                                     <%}
                               }
                               else
                               {%>
                                    <a class="LastPage" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=Convert.ToInt32(mlData[0].Page_num)-1%>"><img src="/image/arw_l.gif"/></a>
                                    <a class="active o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=1">1</a> 
                                  <%for(var i=0; i<C; i++)
                                    {%>                           
                                         <a class="active o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=i+2%>"><%=i+2%></a>                                                   
                                   <%}  
                               }                         
                          }%>                        
                        <label>
                            <input type="text" size="1" title="输入页码，按回车快速跳转" value="<%=mlData[0].Page_num%>" />
                            <span title="共 <%=C+1%> 页">/ <%=C+1%> 页</span>
                        </label>
                        <%if (Convert.ToInt32(mlData[0].Page_num)<C+1)
                          {%>
                                <a class="sNext" style="padding-right: 25px;" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=Convert.ToInt32(mlData[0].Page_num)+1%>">下一页</a>
                          <%}%>
                    </div>
                </div>
            <%}
        }%>
        <div class="sBack">            
            <a class="Back" href="/I_index/Index" >返&nbsp;回</a>
        </div>
    </div>
    <div class="PostsName">
        <div class="pnRoof">
            <div class="pnrLeft">
                <div class="Select">
                    <span>筛选:</span>
                    <div class="Together1">
                        <a>全部主题</a>
                        <ul class="Only" style="height: 35px;">
                            <li style="margin-top: 5px;">全部主题</li>
                        </ul>
                    </div>
                    <div class="Together2">
                        <a>全部时间</a>
                        <ul class="Six">
                            <li class="Pink" style="margin-top: 5px;">全部时间</li>
                            <li class="Pink">一天</li>
                            <li class="Pink">两天</li>
                            <li class="Pink">一周</li>
                            <li class="Pink">一个月</li>
                            <li style="margin-bottom: 5px;">三个月</li>
                        </ul>
                    </div>
                </div>
                <div class="Sort">
                    <span>排序:</span>
                    <div class="Together3">
                        <a>发帖时间</a>
                        <ul class="TwoSix">
                            <li class="Pink" style="margin-top: 5px;">默认顺序</li>
                            <li class="Pink">发帖时间</li>
                            <li class="Pink">回复/查看</li>
                            <li class="Pink">查看</li>
                            <li class="Pink">最后发表</li>
                            <li style="margin-bottom: 5px;">热门</li>
                        </ul>
                    </div>
                </div>
                <div class="Essence"><span>|</span><a href="#">精华</a></div>
            </div>
            <div class="pnrRight">
                <div class="NewWindow">
                    <%--<span id="atarget" onclick="setatarget(-1)" class="y atarget_1" title="在新窗口中打开帖子">新窗</span>--%>
                    <span id="nwCheck" onclick="setnwCheck(Two)" class="nwCheck_One" title="在新窗口中打开帖子">新窗</span>
                </div>
                <p class="Writer">作者</p>
                <p class="Reply_View">回复/查看</p>
                <p class="LastPost">最后发表</p>
            </div>
        </div>
        <div class="Stickied">
            <ul>
                <%if (mlData[0].Page_num == "1" && mlName[0].Second_forum != "站点管理")
                  {%>
                    <li>
                        <a class="Stick" href="/postInfor/post?id=3051" title="全局置顶主题 - 新窗口打开" target="_blank">
                            <img src="../../image/stick.gif" />
                        </a>
                        <div class="sName"><a href="/postInfor/post?id=3051">新账户注册之后去 新人发帖区 发帖之后才可以使用</a></div>
                        <div class="wTime">
                            <div class="One"><a href="/Home/PersonData?id=17">yzg</a></div>
                            <span>2013-8-31 00:58</span>
                        </div>
                        <div class="sCount">
                            <div class="One"><a href="/postInfor/post?id=3051">1</a></div>
                            <span>7092</span>
                        </div>
                        <div class="sLastName">
                             <div class="One"><a href="/Home/PersonData?id=26">阳光与淼淼味道</a></div>
                             <span>2013-8-31 22:26</span>
                        </div>
                    </li>
                    <li> 
                         <a class="Stick" href="/postInfor/post?id=3052" title="全局置顶主题 - 新窗口打开" target="_blank">
                             <img src="../../image/stick.gif" />
                         </a>
                         <div class="sName"><a href="/postInfor/post?id=3052">所有帖子一律30天后自动关闭</a></div>
                         <div class="wTime">
                             <div class="One"><a href="/Home/PersonData?id=17">yzg</a></div>
                             <span>2013-8-30 19:25</span>
                         </div>
                         <div class="sCount">
                             <div class="One"><a href="/postInfor/post?id=3052">5</a></div>
                             <span>4620</span>
                         </div>
                         <div class="sLastName">
                             <div class="One"><a href="/Home/PersonData?id=29">zimufengliy</a></div>
                             <span>2013-9-1 22:44</span>
                          </div>
                     </li>
                <% }%>
                <%List<meihu.Models.TwoLevel> mlSticked = TempData["listSN"] as List<meihu.Models.TwoLevel>;
                  int SC = 0, SI = 0;
                  if (mlData[0].Page_num == "1")
                      {
                          if (mlSticked.Count < Convert.ToInt32(mlData[0].Page_num) * 23)
                              SC = mlSticked.Count;
                          else SC = Convert.ToInt32(mlData[0].Page_num) * 23;
                          SI = 0;
                      }
                      else
                      {
                          if (mlSticked.Count < 23 * 1 + (Convert.ToInt32(mlData[0].Page_num) - 1) * 25)
                              SC = mlSticked.Count;
                          else SC = 23 * 1 + (Convert.ToInt32(mlData[0].Page_num) - 1) * 25;
                          SI = 23 * 1 + (Convert.ToInt32(mlData[0].Page_num) - 2) * 25;
                      }
                  for (var i = SI; i < SC; i++)
                  {%>
                        <li>
                             <a class="Stick" href="/postInfor/post?id=<%=mlSticked[i].ID%>" title="<%=mlSticked[i].Mouse_title%>" target="_blank">
                                <img src="<%=mlSticked[i].Top_img%>" />
                             </a>
                             <div class="sName">
                                 <a href="/postInfor/post?id=<%=mlSticked[i].ID%>"><%=mlSticked[i].Title%></a>
                                 <%if (mlSticked[i].Is_img == "1")
                                   {%>
                                        <img src="../../image/image_s.gif"/>
                                 <%}%>
                                 <%if (mlSticked[i].Is_good == "1")
                                   {%>
                                        <img src="../../image/digest_3.gif"/>
                                 <%}%>
                                 <%if (mlSticked[i].Evaluation_num != "0")
                                   {%>
                                        <img src="../../image/agree.gif"/>
                                 <%}%>
                             </div>
                             <div class="wTime">
                                 <div class="One"><a href="/Home/PersonData?id=<%=mlSticked[i].Person_Data%>"><%=mlSticked[i].User_name%></a></div>
                                 <% DateTime now = DateTime.Now.ToLocalTime();
                                    string Now_time = now.ToLocalTime().ToString("yyyy-M-d HH:mm:ss");
                                    if (mlSticked[i].Create_on_time.ToString().Split(' ')[0] == Now_time.Split(' ')[0])
                                    {%>
                                        <span style="color:#BA350F;"><%=mlSticked[i].Create_on_time%></span>
                                    <%}
                                    else
                                   {%>
                                        <span><%=mlSticked[i].Create_on_time%></span>
                                  <%}%>
                             </div>
                             <div class="sCount">
                                 <div class="One"><a href="/postInfor/post?id=<%=mlSticked[i].ID%>"><%=mlSticked[i].Reply_num%></a></div>
                                 <span><%=mlSticked[i].Visit_num%></span>
                             </div>
                             <div class="sLastName">
                                 <div class="One"><a href="/Home/PersonData?id=<%=mlSticked[i].Last_person_data%>"><%=mlSticked[i].Last_user_name%></a></div>
                                 <span><%=mlSticked[i].Last_reply_time%></span>
                             </div>
                        </li>
                   <%}%>
              </ul>
          </div>
        <%if (mlNormal.Count > 0 && (mlSticked.Count > 23 * 1 + ((Convert.ToInt32(mlData[0].Page_num)) - 2) * 25 || (mlSticked.Count < 23 && mlData[0].Page_num == "1")))
        {%>
            <div class="pnSeparation">
            </div>
        <%}%>
        <div class="Normal">
            <ul>     
                  <%int NC = 0, NI = 0;
                    if (mlData[0].Page_num == "1")
                        {
                            if (mlSticked.Count < 23)
                            {
                                if (mlNormal.Count < Convert.ToInt32(mlData[0].Page_num) * 23 - mlSticked.Count)
                                    NC = mlNormal.Count;
                                else NC = Convert.ToInt32(mlData[0].Page_num) * 23;
                                NI = 0;
                            }
                        }
                        else
                        {
                            if (mlSticked.Count < 23 * 1 + (Convert.ToInt32(mlData[0].Page_num) - 1) * 25)
                            {
                                if (mlNormal.Count < 23 * 1 + (Convert.ToInt32(mlData[0].Page_num) - 1) * 25 - mlSticked.Count)
                                    NC = mlNormal.Count;
                                else NC = 23 * 1 + (Convert.ToInt32(mlData[0].Page_num) - 1) * 25;
                                if (mlSticked.Count > 23 * 1 + (Convert.ToInt32(mlData[0].Page_num) - 2) * 25)
                                    NI = 0;
                                else NI = 23 * 1 + (Convert.ToInt32(mlData[0].Page_num) - 2) * 25 - mlSticked.Count;
                            }
                        }
                  for (var i = NI; i < NC; i++)
                   {%>
                        <li>
                            <a class="Stick" href="/postInfor/post?id=<%=mlNormal[i].ID%>" title="<%=mlNormal[i].Mouse_title%>" target="_blank">
                                <img src="<%=mlNormal[i].Top_img%>" />
                            </a>
                            <div class="sName">
                                <a href="/postInfor/post?id=<%=mlNormal[i].ID%>"><%=mlNormal[i].Title%></a>
                                <%if (mlNormal[i].Is_img == "1")
                                   {%>
                                        <img src="../../image/image_s.gif"/>
                                 <%}%>
                                 <%if (mlNormal[i].Is_good == "1")
                                   {%>
                                        <img src="../../image/digest_3.gif"/>
                                 <%}%>
                                 <%if (mlNormal[i].Evaluation_num != "0")
                                   {%>
                                        <img src="../../image/agree.gif"/>
                                 <%}%>
                            </div>
                            <div class="wTime">
                                <div class="One"><a href="/Home/PersonData?id=<%=mlNormal[i].Person_Data%>"><%=mlNormal[i].User_name%></a></div>
                                <% DateTime now = DateTime.Now.ToLocalTime();
                                    string Now_time = now.ToLocalTime().ToString("yyyy-M-d HH:mm:ss");
                                    if (mlNormal[i].Create_on_time.ToString().Split(' ')[0] == Now_time.Split(' ')[0])
                                    {%>
                                        <span style="color:#BA350F;"><%=mlNormal[i].Create_on_time%></span>
                                    <%}
                                    else
                                   {%>
                                        <span><%=mlNormal[i].Create_on_time%></span>
                                  <%}%>
                            </div>
                            <div class="sCount">
                                <div class="One"><a href="/postInfor/post?id=<%=mlNormal[i].ID%>"><%=mlNormal[i].Reply_num%></a></div>
                                <span><%=mlNormal[i].Visit_num%></span>
                            </div>
                            <div class="sLastName">
                                <div class="One"><a href="/Home/PersonData?id=<%=mlNormal[i].Last_person_data%>"><%=mlNormal[i].Last_user_name%></a></div>
                                <span><%=mlNormal[i].Last_reply_time%></span>
                            </div>
                        </li>
                    <%}%>               
            </ul>
        </div>
    </div>
    <div class="Separation">
        <div class="sLeft">
            <%if (Session["User_id"] == null)
              {%>
                   <a onclick="Login();"><img src="/image/pn_post.png" /></a>
             <%}
              else
              {%>
                   <a><img src="/image/pn_post.png" /></a>                   
            <%}%>
        </div>
        <%if (mlCount.Count > 0)
          { 
            if(mlCount[0].Sum_topic_num > 23)
            {%>
                <div class="sRight">
                    <div class="sPage">
                        <%int C = (mlCount[0].Sum_topic_num - 23) / 25;
                          if ((mlCount[0].Sum_topic_num - 23) % 25 != 0) C++;%>
                          <%if (Convert.ToInt32(mlData[0].Page_num) == 1)
                          {
                               var CC = C;%>
                               <a class="active y o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=1">1</a>
                               <%if (C > 9) 
                                 {
                                     CC = 9;   
                                     for(var i=0; i<CC; i++)
                                     {%>
                                           <a class="active o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=i+2%>"><%=i+2%></a>
                                    <%}%>
                                     <a class="sLast o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=C+1%>">...<%=C+1%></a>                              
                                <%}
                                  else
                                  {
                                        for(var i=0; i<CC; i++)
                                        {%>
                                           <a class="active 0" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=i+2%>"><%=i+2%></a>
                                       <%}%>
                                 <%}                                 
                          }
                          else if (Convert.ToInt32(mlData[0].Page_num) <= 6) 
                          {
                               var CC = C;%> 
                               <a class="LastPage" style="width:8px;" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=Convert.ToInt32(mlData[0].Page_num)-1%>"><img style="margin-left:-2px;" src="/image/arw_l.gif"/></a>
                               <a class="active o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=1">1</a>                               
                               <%if (C > 9) 
                                 {
                                     CC = 9;   
                                     for(var i=0; i<CC; i++)
                                     {%>
                                           <a class="active o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=i+2%>"><%=i+2%></a>
                                    <%}%>
                                     <a class="sLast o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=C+1%>">...<%=C+1%></a>                              
                                <%}
                                 else
                                  {
                                        for(var i=0; i<CC; i++)
                                        {%>
                                           <a class="active o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=i+2%>"><%=i+2%></a>
                                       <%}
                                 }  
                          }
                          else
                          {
                               if (C > 9)
                               {%>
                                    <a class="active o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=1">1...</a>
                                    <a class="LastPage" style="width:8px;" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=Convert.ToInt32(mlData[0].Page_num)-1%>"><img style="margin-left:-2px;" src="/image/arw_l.gif"/></a>
                                   <%if (Convert.ToInt32(mlData[0].Page_num) >= C+1)
                                     {
                                         for (var i = C - 10; i < C; i++)
                                         {%>
                                                <a class="active o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=i+2%>"><%=i+2%></a>                                                   
                                         <%}
                                     }
                                     else 
                                     {
                                         for (var i = Convert.ToInt32(mlData[0].Page_num)-5; i<Convert.ToInt32(mlData[0].Page_num)+5; i++)
                                         {%>
                                               <a class="active o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=i+2%>"><%=i%></a>                                                   
                                         <%}%>
                                         <a class="sLast o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=C+1%>">...<%=C+1%></a>
                                     <%}
                               }
                               else
                               {%>
                                    <a class="LastPage" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=Convert.ToInt32(mlData[0].Page_num)-1%>"><img src="/image/arw_l.gif"/></a>
                                    <a class="active o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=1">1</a> 
                                  <%for(var i=0; i<C; i++)
                                    {%>                           
                                         <a class="active o" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=i+2%>"><%=i+2%></a>                                                   
                                   <%}  
                               }                         
                          }%>                     
                        <label>
                            <input type="text" size="1" title="输入页码，按回车快速跳转" value="<%=mlData[0].Page_num%>" />
                            <span title="共 <%=C+1%> 页">/ <%=C+1%> 页</span>
                        </label>
                        <%if (Convert.ToInt32(mlData[0].Page_num)<C+1)
                          {%>
                                <a class="sNext" style="padding-right: 25px;" href="/TwoLevel/TwoLevel?name=<%=mlName[0].Second_forum.Replace('&', '0')%>&pagenum=<%=Convert.ToInt32(mlData[0].Page_num)+1%>">下一页</a>
                          <%}%>
                    </div>
                </div>
            <%}
        }%>
        <div class="sBack">
            <a class="Back" href="/I_index/Index" >返&nbsp;回</a>
        </div>
    </div>
    <div class="FastPost">
        <div class="fpRoof">
            <p>快速发帖</p>
        </div>
        <div class="Posting">
            <div class="pTitle">
                <input type="text" name="text1" maxlength="80"/>
                <p>还可输入<strong class="s"> 80 </strong>个字符</p>
            </div>
            <div class="pContent">
                <div class="pLeft">
                    <div class="pTop">
                        <div class="Function">
                            <a title="文字加粗" class="fBold"></a>
                            <a title="设置文字颜色" class="fColor"></a>
                            <a style="margin-top: 2px;" title="图片" class="fImg"></a>
                            <a title="添加链接" class="fUrl"></a>
                            <a style="margin-top: 3px;" title="引用" class="fQuote"></a>
                            <a title="代码" class="fCode"></a>
                            <a class="fSmile"></a>
                        </div>
                        <div class="Advanced">
                            <a>高级模式</a>
                        </div>
                    </div>
                    <%if (Session["User_id"] == null)
                      {%>
                           <textarea disabled="disabled" style="background-color:white; border:solid 1px #CDCDCD; margin-top:0px; width:744px;"></textarea>
                           <div class="Tcenter"><span>您需要登录后才可以发帖</span><a onclick="Login();">登录</a></div>
                    <%}
                      else
                      {%>
                           <textarea style="border:solid 1px #CDCDCD; margin-top:0px; width:744px;"></textarea>
                    <%}%>
                </div>
                <div class="pRight">
                    <ul class="Face">
                        <li>
                            <img src="/image/smile.gif" /></li>
                        <li>
                            <img src="/image/sad.gif" /></li>
                        <li>
                            <img src="/image/cry.gif" /></li>
                        <li>
                            <img src="/image/huffy.gif" /></li>
                        <li>
                            <img src="/image/shocked.gif" /></li>
                        <li>
                            <img src="/image/tongue.gif" /></li>
                        <li>
                            <img src="/image/shy.gif" /></li>
                        <li>
                            <img src="/image/titter.gif" /></li>
                        <li>
                            <img src="/image/sweat.gif" /></li>
                        <li>
                            <img src="/image/lol.gif" /></li>
                        <li>
                            <img src="/image/victory.gif" /></li>
                    </ul>
                </div>
            </div>
            <div class="Publish">
                <button><strong>发表帖子</strong></button>
            </div>
        </div>
    </div>
    <div class="hidden">
        <div class="tt">
            <div class="tt_l"></div>
            <div class="tt_c"></div>
            <div class="tt_r"></div>
        </div>
        <div class="cc">
            <div class="ll"></div>
            <div class="roofroof">
                <p>提示信息</p>
                <a title="关闭"></a>
            </div>
            <div class="ccc">
                <p>非常感谢，您的主题已发布，现在将转入主题<br/>&nbsp&nbsp页，请稍候……[ 点击这里转入主题列表 ]</p>
            </div>
            <div class="cccc">
                <button><strong>确定</strong></button>
            </div>
            <div class="rr"></div>
        </div>
        <div class="bb">
            <div class="bb_l"></div>
            <div class="bb_c"></div>
            <div class="bb_r"></div>
        </div>
    </div>
</asp:Content>
