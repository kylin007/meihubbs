﻿<%--------------------------张宏乾--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../CSS/Mypost.css" rel="stylesheet" />
    <script src="../../Jscript/jquery-2.2.0.min.js"></script>

    <script src="../../Jscript/Jspager.js"></script>
    <%@ Import Namespace="meihu.Models" %>
    <script type="text/javascript">
        function func() {
            location.reload();
        }
    </script>
    <div class="zy" id="pt">
        <div class="z">
            <a class=" House" title="首页" href="http://localhost:3741/">郑州大学论坛,郑大眉湖论坛</a>
            <em>></em>
            <a id="top" href='javascript:void(0);' onclick='func()'>我的帖子</a>
        </div>
    </div>
    <div class="My_top">
        <div id="ct">
            <div class="mn">
                <div class="bk gd">
                    <div class="bk_n">
                        <span class="y" style="display: none" id="subscribe">
                            <a href class="dy">订阅</a>
                        </span>
                        <h1 class="zt" id="title">我的帖子</h1>
                    </div>
                    <div class="k" id="kg" style="display: none">
                        <div id="jz">
                            <div class="btn"></div>
                        </div>
                    </div>
                </div>
                <div class="bj bk">
                    <div class="pg cl ">
                        <div id="Nav">
                        </div>
                    </div>
                    <a href="Send_post">
                        <img src="../../image/pn_post.png" alt="发新帖" /></a>
                </div>
                <ul class="ti bk cl" id="bt">
                    <li>
                        <a href='javascript:void(0);'>最新热门</a>
                    </li>
                    <li>
                        <a href='javascript:void(0);'>最新精华</a>
                    </li>
                    <li>
                        <a href='javascript:void(0);'>查看新帖</a>
                    </li>
                    <li>
                        <a onmouseover="menu()" onmouseout="dis()" href='javascript:void(0);'>我的帖子</a>
                    </li>
                </ul>
                <div id="content">
                    <div class="bk" style="display: none">
                        <div class="th">
                            <table cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <th colspan="2">标题 &nbsp;&nbsp;&nbsp;
                        
                                        </th>
                                        <td class="by">版块/群组</td>
                                        <td class="by">作者</td>
                                        <td class="num">回复/查看</td>
                                        <td class="by">最后发表</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="nr">
                            <table cellspacing="0" cellpadding="0" id="contentval">
                            </table>
                        </div>
                    </div>

                    <div class="bk" style="display: none" id="Mypo">
                        <div class="th">
                            <table cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <th colspan="2">标题 &nbsp;&nbsp;&nbsp;
                                        <a onclick="hide1()" href='javascript:void(0);'>主题</a>
                                            <span class="pipe">|</span>
                                            <a onclick="show1()" href='javascript:void(0);'>回复</a>
                                            <span class="pipe">|</span>
                                            <a onclick="comment()"href='javascript:void(0);'>点评</a>
                                            <span class="pipe">|</span>
                                            <a onclick="sel()" href='javascript:void(0);' id="sx">筛选</a>
                                        </th>
                                        <td class="by">版块/群组</td>
                                        <td class="by">作者</td>
                                        <td class="num">回复/查看</td>
                                        <td class="by">最后发表</td>
                                    </tr>
                                </tbody>
                                <tbody id="screen" style="display: none">
                                    <tr>
                                        <th colspan="6">&nbsp;
                                        <form class="from">
                                            状态:
                                            <select class="sel" id="search1">
                                                <option>全部</option>
                                                <option>已发表</option>
                                                <option>草稿</option>
                                                <option>关闭</option>
                                                <option>待审核</option>
                                                <option>已忽略</option>
                                                <option>回收站</option>
                                            </select>
                                            选择板块:
                                            <select class="sele" id="search2">
                                                <option>全部</option>
                                                <optgroup label="--ZZU专版">
                                                    <option>郑大生活</option>
                                                    <option>&nbsp; &nbsp; &nbsp; 美术系</option>
                                                    <option>&nbsp; &nbsp; &nbsp; 郑州介绍</option>
                                                    <option>郑州大学图片</option>
                                                    <option>郑大名人&amp;校友咨询</option>
                                                    <option>&nbsp; &nbsp; &nbsp; 郑大专业介绍</option>
                                                    <option>大一新生</option>
                                                    <option>研究生交流</option>
                                                    <option>毕业生交流</option>
                                                </optgroup>
                                                <optgroup label="--灌水休闲">
                                                    <option>影音动漫</option>
                                                    <option>&nbsp; &nbsp; &nbsp; 卡通动漫</option>
                                                    <option>灌水聊天</option>
                                                    <option>娱乐休闲</option>
                                                </optgroup>
                                                <optgroup label="--学习专区">
                                                    <option>考研交流/考研资料</option>
                                                    <option>学习考试/公务员考试</option>
                                                    <option>&nbsp; &nbsp; &nbsp; 图书馆&amp;资料交流</option>
                                                    <option>英语相关 English Corner</option>
                                                </optgroup>
                                                <optgroup label="--图片专区">
                                                    <option>个人show</option>
                                                    <option>贴图版</option>
                                                    <option>美女图片</option>
                                                </optgroup>
                                                <optgroup label="--实用信息">
                                                    <option>自由交易区[二手市场】</option>
                                                    <option>招聘信息/兼职信息</option>
                                                    <option>&nbsp; &nbsp; &nbsp; 求职面试技巧</option>
                                                    <option>租房/床位信息</option>
                                                </optgroup>
                                                <optgroup label="--知性情感">
                                                    <option>征友交友</option>
                                                    <option>情感驿站</option>
                                                    <option>美丽女生</option>
                                                </optgroup>
                                                <optgroup label="--电脑游戏">
                                                    <option>电脑网络</option>
                                                    <option>游戏一族</option>
                                                    <option>资源共享&amp;软件下载</option>
                                                </optgroup>
                                                <optgroup label="--兴趣专区">
                                                    <option>体育天地</option>
                                                    <option>舞蹈专栏</option>
                                                    <option>军事科技</option>
                                                </optgroup>
                                                <optgroup label="--人文社科">
                                                    <option>原创空间</option>
                                                    <option>文学草坪</option>
                                                    <option>谈古论今(历史版)</option>
                                                </optgroup>
                                                <optgroup label="--站点管理">
                                                    <option>站点管理</option>
                                                    <option>论坛帮助和问题反馈</option>
                                                </optgroup>
                                                <optgroup label="--新人发帖区">
                                                    <option>新人发帖区</option>
                                                </optgroup>
                                            </select>
                                            <div id="key" style="display: inline">
                                                &nbsp; 关键字:
                                            <input type="text" class="gj" id="text" />
                                            </div>
                                            <button class="ss" id="search3" type="button" onclick="search()">
                                                <em>搜索</em>
                                            </button>
                                        </form>
                                        </th>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="nr" id="con">
                            <table cellspacing="0" cellpadding="0" id="contentval1">
                            </table>
                        </div>
                        <div id="commen" class="nr" style="display: none">
                            <table cellspacing="0" cellpadding="0">
                                <th colspan="5" style="border-bottom: none;">
                                    <p class="emp">暂时没有帖子</p>
                                </th>
                            </table>
                        </div>
                    </div>
                    <div class="p_pop" style="position: absolute; z-index: 301; top: 354px; left: 524.5px;" id="menu1" onmouseout="dis2()" onmouseover="hide()">
                        <ul>
                            <li><a>投票</a></li>
                            <li><a>商品</a></li>
                            <li><a>悬赏</a></li>
                            <li><a>活动</a></li>
                        </ul>
                    </div>
                </div>

                <div class="bk cl bj">
                    <div class="pg cl ">
                        <div id="Nar" onkeydown="keydown()">
                        </div>
                    </div>
                    <span class="pgb y">
                        <a href="Introduction?3">导读首页</a>
                    </span>
                </div>
            </div>
        </div>

    </div>

    <script src="../../Jscript/My_post.js"></script>
</asp:Content>
