﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %> 
<%--李小梅--%>

<%@ Register Src="~/Posted.ascx" TagPrefix="uc1" TagName="Posted" %>
<%@ Register Src="~/Send_Mess.ascx" TagPrefix="uc1" TagName="Send_Mess" %>
<%@ Register Src="~/Login.ascx" TagPrefix="uc1" TagName="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%List<meihu.Models.Post> modellist = TempData["list"] as List<meihu.Models.Post>; %>
<%=modellist[0].title %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Css/PersonData.css" rel="stylesheet" />
    <link href="../../Css/post.css" rel="stylesheet" />
    <script src="../../Jscript/jquery-2.2.0.min.js"></script>
    <script src="../../Jscript/post.js"></script>
    <%List<meihu.Models.Post> eva = TempData["listeva"] as List<meihu.Models.Post>; %>
    <div class="sent">
        <uc1:Send_Mess runat="server" ID="Send_Mess" />
    </div>

    <%List<meihu.Models.Post> modellist = TempData["list"] as List<meihu.Models.Post>; %>

    <div id="id"><%=modellist[0].idw %></div>

    <div id="logi">
        <uc1:Login runat="server" ID="Login" />
    </div>
    <div id="usid">
        <%=modellist[0].isusing %>
    </div>
    <div id="scroll">
        <img src="../../image/scrolltop.png"/>
    </div>
    <div class="score">
        <div class="blockPiece headEva">
            <span class="bTitle">评分</span>
            <a class="close"></a>
        </div>
        <div class="blockPiece lineName">
            <span>评分区间</span>
            <span class="flRight">今日剩余</span>
        </div>
        <div class="blockPiece detail">
            <span>金钱</span>
            <input type="text" value="0"/><a></a>
            <div class="grade">
                <div class="oneElse">+1</div>
                <div class="oneElse">自定义</div>
            </div>
            <div class="region">
                0 ~ 1
            </div>
            <div class="surplus">
                num
            </div>
        </div>
        <div class="partiRs">
            <span>可选评分理由：</span>
            <div class="reason">
                <ul class="pt">
                    <li>元芳认为这个13装的好</li>
                    <li>智商不在一个层面上</li>
                    <li>你说的这都是屁啊……</li>
                    <li>Still growing young all alone</li>
                    <li>Where is the wonder? where's the awe?</li>
                    <li>A ballet on a grove'</li>
                </ul>
            </div>
            <input type="text" value=""/>
        </div>
        <div class="endSc">
            <label><input type="checkbox"/>通知作者</label>
            <button type="submit" value="true"><span>确定</span></button>
        </div>
    </div>

    <div class="toolPlsy">
        <div class="blockPiece headEva" id="toolHead">
            <span class="bTitle">提示信息</span>
            <a class="close"></a>
        </div>
        <div class="tooCon">
            <img src="../../image/error.gif"/>
            <span>抱歉，您所在的用户组不允许使用道具</span>
        </div>
        <div class="endSc">
            <button type="submit" value="true"><span>确定</span></button>
        </div>
    </div>

    <div class="toerro toolPlsy">
        <div class="blockPiece headEva">
            <span class="bTitle">提示信息</span>
            <a class="close"></a>
        </div>
        <div class="tooCon">
            <img src="../../image/error.gif"/>
            <span>抱歉，请输入正确的评分或理由</span>
        </div>
        <div class="endSc">
            <button type="submit" value="true"><span>确定</span></button>
        </div>
    </div>

    <div class="Control">
        <uc1:Posted runat="server" ID="Posted" />
    </div>
    
    <div class="replyKey">
        <div class="blockPiece headEva">
            <span class="bTitle">参与/回复主题</span>
            <a class="close"></a>
        </div>
        <div class="replyPart">RE: <span>回复主题名称</span><a>[修改]</a></div>
        <div class="dialogContent">
            <div class="Function">
                <a title="文字加粗" class="fBold"></a>
                <a title="设置文字颜色" class="fColor"></a>
                <a style="margin-top:2px;" title="图片"class="fImg"></a>
                <a title="添加链接" class="fUrl"></a>
                <a style="margin-top:3px;" title="引用" class="fQuote"></a>
                <a title="代码" class="fCode"></a>
                <a class="fSmile"></a>
                <span class="Modeler"><a>高级模式</a></span>
            </div>
            <textarea></textarea>
        </div>
        <div class="endSc">
            <button type="submit" value="true" class="repkyLogin"  id=""><span>参与/回复主题</span></button>
        </div>
    </div>

   
    <div id="form">
        <a href="http://localhost:3741" id="inde"></a>&nbsp > 
        <span id="lunlun">&nbsp <a href="http://localhost:3741"> 论坛 </a>&nbsp >&nbsp</span>
        <span><a href="http://localhost:3741/Classify/OneLeveL?name=<%=modellist[0].One_forum%>"> <%=modellist[0].One_forum %> </a> &nbsp>&nbsp</span> 
        <span><a href="http://localhost:3741/TwoLevel/TwoLevel?name=<%=modellist[0].Second_forum.Replace('&','0')%>"><%=modellist[0].Second_forum %></a> &nbsp>&nbsp</span> 
        <%if(modellist[0].sonof != null) { %>
        <span><a href="http://localhost:3741/TwoLevel/TwoLevel?name=<%=modellist[0].sonof.Replace('&','0')%>"><%=modellist[0].sonof %> </a> &nbsp>&nbsp</span>
        <%} %>
        <span> <a href="http://localhost:3741/postInfor/post?id=<%=modellist[0].idw %>"><%=modellist[0].title %> </a></span>
    </div>
    <div class="before">
        <div class="relHad playPost"><img src="../../image/bg_post.png"/></div> 
        <div class="HadUser reply"><img src="../../image/pn_reply.png"/></div>
        <div class="return"><a>返回列表</a></div>
    </div>
    
    <div id="self">
        <div id="cushion">
            <div class="pinkbg">
                <span class="darker">查看:</span>
                <span class="reder lknum"><%=modellist[0].vinum %></span>
                <span>|</span>       
                <span  class="darker">回复:</span>
                <span class="reder"><%=modellist[0].ronum %></span>
            </div>
            <div class="cRight whitebg">
                <span class="wbgtitle"><%=modellist[0].title %></span>
                <span class="darker">[复制链接]</span>
                <div>
                    <img src="../../image/print.png" />
                    <img src="../../image/thread-prev.png" />
                    <img src="../../image/thread-next.png" />
                </div>
            </div>
        </div>
        <%for (int j = 0; j < modellist.Count;j++ ) {%>
        <div class="userSgle">
        <div class="selfCon">
            <div class="pinkbg">
                <div class="dashbttom"><a><%=modellist[j].ude%></a></div>
                <div>
                    <div class="userSin">
                        <img src="<%=modellist[j].portrait %>"/>
                        <div class="sortOf">
                            <div class="onRight"><%=modellist[j].theme %><br />主题</div>
                            <div class="onRight"><%=modellist[j].firendNum %><br />好友</div>
                            <div><%=modellist[j].scoreNum %><br />积分</div>
                        </div>
                    </div>
                    <%if (modellist[j].expression.ToString() == "该用户从未签到") {%>
                        <div class="od">
                            该用户从未签到
                        </div>
                    <%} %>
                    <%else { %>
                        <div class="mood">
                            <span>TA的每日心情</span>
                            <img src="../../image/yl.gif"/>
                            <div>
                                <h1><%=modellist[j].expression %></h1>
                                <span>
                                    <%=modellist[j].signtime %>
                                </span>
                            </div>
                        </div>
                        <div class="signed">
                            <span>签到天数：<%=modellist[j].day %>天</span>
                            <span>[LV.1]初来乍到</span>
                        </div>
                    <%} %>
                    
                    <div class="onLeft">
                        <span>专业</span>&nbsp&nbsp&nbsp
                        <span><%=modellist[j].majorName %></span><br />
                        <span>年级</span>&nbsp&nbsp&nbsp
                        <span><%=modellist[j].gradeName %></span>
                    </div>
                    <div class="onLeft">
                        <span>金钱</span>&nbsp&nbsp&nbsp
                        <span><%=modellist[j].moneyNum %></span>
                    </div>
                    <div class="onLeft">
                        <img src="../../image/medal5.gif  "/>
                    </div>
                    <div class="onLeft">
                        <img src="../../image/pmto.gif"/>
                        <%--<a href="<uc1:send_mess runat='server' id='Send_Mess' />">发消息</a>--%>
                        <a class="sendme">发消息</a>
                    </div>
                </div>
            </div>  
            <div class="whitebg">
                <div class="dashbttom">
                    <span>
                        <img src="../../image/online_member.gif"/>
                        发表于&nbsp <%=modellist[j].time %> | 只看作者 |  倒序浏览
                    </span>
                    <div>
                        <%if(j == 0) {%>
                        <span>
                            1#楼主  
                        </span>
                        <span>
                            电梯直达 <input type="text" class="inputIn"/> 
                            <a><img src="../../image/fj_btn.png"/></a>
                        </span>
                        <%} %>
                        <%else if(j == 1) {%>
                        <span>
                            2#抢沙发 
                        </span>
                        <%} %>
                        <%else if (j == 2)
                          {%>
                        <span>
                            3#争茶几 
                        </span>
                        <%} %>
                        <%else if (j == 3){%>
                        <span>
                            4#占座椅  
                        </span>
                        <%} %>
                        <%else if (j == 4){%>
                        <span>
                            5#梳妆台
                        </span>
                        <%} %>
                        <%else if (j == 5)
                          {%>
                        <span>
                            6#裹窗帘
                        </span>
                        <%} %>
                        <%else if (j == 6)
                          {%>
                        <span>
                            7#卷地毯  
                        </span>
                        <%} %>
                        <%else if (j == 7)
                          {%>
                        <span>
                            8#敲地板  
                        </span>
                        <%} %>
                        <%else
                          {%>
                        <span>
                            <%=j+1 %>#
                        </span>
                        <%} %>
                    </div>
                </div>
                <div class="concon">
                    <%=modellist[j].content %>
                </div>
                <%if(j == 0) {%>
                <%if (modellist[0].evaname != "暂无用户评分")
                          {%>
                    <div class="evaInfor">
                        <div class="evInPiec linheeva okeva">
                            <span class="linhead">已有<em class="becRed"><%=modellist[0].evaluation %></em>人评分</span>
                            <span class="middevaPie">金钱</span>
                            <span class="endPiec">理由</span>
                            <a class="retract">收起</a>
                        </div>
                            <%int xqt = eva.Count > 1 ? 1 : eva.Count;   for (int q = 0; q < xqt; q++)
                              {%>
                                <div class="evInPiec sorPiec okeva">
                                    <span class="linhead"><img src="../../image/noavatar_small.gif"/><em><%=eva[0].evaname%></em></span>
                                    <span class="becRed middevaPie">+1</span>
                                    <span class="endPiec"><%=eva[0].evacont%></span>
                                </div>
                            <%} %>
                        <div class="evInPiec">
                           <span>总评分：</span>
                            <span class="becRed">金钱+1</span>
                            <a class="lookAll">查看全部评分</a>
                        </div>
                    </div>
                <%} %>
                <%} %>
            </div>
            <div id="forwhite">

            </div>
        </div>
            
        <div class="olwhite">
        <div class="collect relHad" title="<%=modellist[j].collect %>人收藏">
            <img src="../../image/fav.gif"/>
            收藏
            <span>num</span>
        </div>
        <div class="collect HadUser evaluation evalfet" title="<%=modellist[j].evaluation %>人评分">
            <img src="../../image/agree.gif"/>
            评分
        </div>
        </div>
        <div class="botMost">
            <div class="pinkMore pinkbg">
            </div>
            <div class="extraordinary">
                <span class="reply"><img src="../../image/fastreply.gif"/><em>回复</em></span>
                <div>
                    <div class="showmenu">
                        使用道具
                    </div>
                    <div class="useTool">
                        <ul>
                            <li>
                                <img src="../../image/bump.small.gif"/><span>提升卡</span>
                            </li>
                            <li>
                                <img src="../../image/stick.small.gif"/><span>置顶卡</span>
                            </li>
                            <li>
                                <img src="../../image/open.small.gif"/><span>喧嚣卡</span>
                            </li>
                            <li>
                                <img src="../../image/highlight.small.gif"/><span>变色卡</span>
                            </li>
                            <li>
                                <img src="../../image/namepost.small.gif"/><span>显身卡</span>
                            </li>
                        </ul>
                    </div>
                    <a>举报</a>
                </div>
            </div>
        </div>
        </div>
        <%} %>
    </div>

    <div class="before">
        <div class="relHad playPost"><img src="../../image/bg_post.png"/></div> 
        <div class="HadUser reply"><img src="../../image/pn_reply.png"/></div>
        <div class="return"><a>返回列表</a></div>
    </div>

    <div class="replyEnd">
        <div class="pinkbg">
            <img src="../../image/noavatar_middle.gif"/>
        </div>
        <div class="whitebg">
            <div class="dialogContent">
                <div class="Function">
                    <a title="文字加粗" class="fBold"></a>
                    <a title="设置文字颜色" class="fColor"></a>
                    <a style="margin-top:2px;" title="图片"class="fImg"></a>
                    <a title="添加链接" class="fUrl"></a>
                    <a style="margin-top:3px;" title="引用" class="fQuote"></a>
                    <a title="代码" class="fCode"></a>
                    <a class="fSmile"></a>
                    <span class="Modeler"><a>高级模式</a></span>
                </div>
                <textarea></textarea>
            </div>
            <div class="addRep">
                <button class="annouseRep repkyLogi repkyLogin" id="dong"><strong>发表回复</strong></button>
                <input type="checkbox" checked="checked"/>
                <span>回帖后跳转到最后一页</span>
            </div>
            <div class="expression">
                <ul>
                    <li><img src="../../image/smile.gif"/></li>
                    <li><img src="../../image/sad.gif"/></li>
                    <li><img src="../../image/cry.gif"/></li>
                    <li><img src="../../image/huffy.gif"/></li>
                    <li><img src="../../image/shocked.gif"/></li>
                    <li><img src="../../image/tongue.gif"/></li>
                    <li><img src="../../image/shy.gif"/></li>
                    <li><img src="../../image/titter.gif"/></li>
                    <li><img src="../../image/sweat.gif"/></li>
                    <li><img src="../../image/lol.gif"/></li>
                    <li><img src="../../image/victory.gif"/></li>
                </ul>
            </div>
        </div>
    </div>
    
</asp:Content>
