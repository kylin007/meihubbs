﻿<%------------------------张宏乾-----------%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<%@ Register Src="~/Posted.ascx" TagPrefix="uc1" TagName="Posted" %>
<%@ Register Src="~/Login.ascx" TagPrefix="uc1" TagName="Login" %>



<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../Css/Mypost.css" rel="stylesheet" />
    <script src="../../Jscript/jquery-2.2.0.min.js"></script>
    <script src="../../Jscript/My_post.js"></script>
    <div id="wp" class="wp">
        <div class="zy" id="pt">
            <div class="z">
                <a class=" House" title="首页" href="../">郑州大学论坛,郑大眉湖论坛</a>
                <em>></em>
            </div>
        </div>
    </div>

    <div class="Control" style="width:640px;height:300px;display:none;position:absolute;z-index:2;">
        <uc1:Posted runat="server" ID="Posted" />
    </div>

    <div id="ct" class="wp">
        <div class="mn ">
            <div class="bk bw0">
                <div style="display: none;">
                    <ul id="fs_group">
                        <li fid="308">ZZU版</li>
                        <li fid="164">灌水休闲</li>
                        <li fid="317">学习专区</li>
                        <li fid="312">图片专区</li>
                        <li fid="295">使用信息</li>
                        <li fid="318">知性情感</li>
                        <li fid="168">电脑游戏</li>
                        <li fid="319">兴趣专区</li>
                        <li fid="178">人文社科</li>
                        <li fid="199">站点管理</li>
                        <li fid="324">新人发帖区</li>
                    </ul>
                    <ul id="fs_forum_common">
                        <li fid=""></li>
                    </ul>
                    <ul id="fs_forum_308">
                        <li fid="151">郑大生活</li>
                        <li fid="4">郑州大学图片</li>
                        <li fid="69">郑大名人&amp;校友咨询</li>
                        <li fid="138">大一新生</li>
                        <li fid="304">研究生交流</li>
                        <li fid="311">毕业生交流</li>
                    </ul>
                    <ul id="fs_forum_164">
                        <li fid="205">影音动漫</li>
                        <li fid="11">灌水聊天</li>
                        <li fid="203">娱乐休闲</li>
                    </ul>
                    <ul id="fs_forum_317">
                        <li fid="221">考研交流/考研资料</li>
                        <li fid="175">学习考试/公务员考试</li>
                        <li fid="238">英语相关</li>
                    </ul>
                    <ul id="fs_forum_312">
                        <li fid="31">个人show</li>
                        <li fid="28">贴图版</li>
                        <li fid="30">美女图片</li>
                    </ul>
                    <ul id="fs_forum_295">
                        <li fid="131">自由交易区[二手市场】</li>
                        <li fid="45">招聘信息/兼职信息</li>
                        <li fid="269">租房/床位信息</li>
                    </ul>
                    <ul id="fs_forum_318">
                        <li fid="147">征友交友</li>
                        <li fid="204">情感驿站</li>
                        <li fid="287">美丽女生</li>
                    </ul>
                    <ul id="fs_forum_168">
                        <li fid="208">电脑网络</li>
                        <li fid="207">游戏一族</li>
                        <li fid="50">资源共享&amp;软件下载</li>
                    </ul>
                    <ul id="fs_forum_319">
                        <li fid="14">体育天地</li>
                        <li fid="271">舞蹈专栏</li>
                        <li fid="44">军事科技</li>
                    </ul>
                    <ul id="fs_forum_178">
                        <li fid="94"><font color="RED">原创空间</font></li>
                        <li fid="40">文学草坪</li>
                        <li fid="42">谈古论今(历史版)</li>
                    </ul>
                    <ul id="fs_forum_199">
                        <li fid="24">站点管理</li>
                        <li fid="62"><font color="RED">论坛帮助和问题反馈</font></li>
                    </ul>
                    <ul id="fs_forum_324">
                        <li fid="325">新人发帖区</li>
                    </ul>
                    <ul id="fs_subforum_151">
                        <li fid="71">美术系</li>
                        <li fid="261">郑州介绍</li>
                    </ul>
                    <ul id="fs_subforum_69">
                        <li fid="145">郑大专业介绍</li>
                    </ul>
                    <ul id="fs_subforum_205">
                        <li fid="262">卡通动漫</li>
                    </ul>
                    <ul id="fs_subforum_175">
                        <li fid="314">图书馆&amp;资料交流</li>
                    </ul>
                    <ul id="fs_subforum_45">
                        <li fid="162">求职面试技巧</li>
                    </ul>
                </div>
                <h3 class="flb">
                    <em>论坛导航</em>
                </h3>
                <div style="width: 620px;">
                    <p class="cl" style="margin: 0;">
                        <button id="postbtn" onclick="show_post()">
                            <span>发新帖</span>
                        </button>
                        <span class="pbnv">郑州大学论坛,郑大眉湖论坛
                            <span id="pbnv"></span>
                            <a id="enterbtn" href="javascript:;" onclick="locationforums(currentblock, currentfid)">[进入版块]</a>
                        </span>
                    </p>
                    <ul class="pbl cl">
                        <li id="block_group"></li>
                        <li id="block_forum"></li>
                        <li id="block_subforum"></li>
                    </ul>
                    <script type="text/javascript">
                        var froum;
                        var s = '<p><a id="commonforum" href="javascript:;" onclick="switchforums(this, 1, \'common\')" class="pbsb lightlink">常用版块</a></p>';
                        var lis = document.getElementById('fs_group').getElementsByTagName('li');
                        for (i = 0; i < lis.length; i++) {
                            var gid = lis[i].getAttribute('fid');
                            if ($('fs_forum_' + gid)) {
                                s += '<p><a href="javascript:;" ondblclick="locationforums(1, ' + gid + ')" onclick="switchforums(this, 1, ' + gid + ')" class="pbsb">' + lis[i].innerHTML + '</a></p>';
                            }

                        }
                        document.getElementById('block_group').innerHTML = s;
                        var lastswitchobj = null;
                        var selectfid = 0;
                        var switchforum = switchsubforum = '';

                        switchforums(document.getElementById('commonforum'), 1, 'common');

                        function switchforums(obj, block, fid) {
                            if (lastswitchobj != obj) {
                                if (lastswitchobj) {
                                    lastswitchobj.parentNode.className = '';
                                }
                                obj.parentNode.className = 'pbls';
                                froum = obj.innerText;
                            }
                            var s = '';
                            if (fid != 'common') {
                                document.getElementById('enterbtn').className = 'xi2';
                                currentblock = block;
                                currentfid = fid;
                            } else {
                                document.getElementById('enterbtn').className = 'xg1';
                            }
                            if (block == 1) {
                                var lis = document.getElementById('fs_forum_' + fid).getElementsByTagName('LI');
                                for (i = 0; i < lis.length; i++) {
                                    fid = lis[i].getAttribute('fid');
                                    if (fid != '') {
                                        s += '<p><a href="javascript:;" ondblclick="locationforums(2, ' + fid + '\)" onclick="switchforums(this, 2, ' + fid + ')"' + (document.getElementById('fs_subforum_' + fid) ? ' class="pbsb"' : '') + '>' + lis[i].innerHTML + '</a></p>';
                                    }
                                }
                                document.getElementById('block_forum').innerHTML = s;
                                document.getElementById('block_subforum').innerHTML = '';
                                switchforum = switchsubforum = '';
                                selectfid = 0;
                                document.getElementById('postbtn').setAttribute("disabled", "disabled");
                                document.getElementById('postbtn').className = 'pn xg1 y';
                            } else if (block == 2) {
                                selectfid = fid;
                                if (document.getElementById('fs_subforum_' + fid)) {
                                    var lis = document.getElementById('fs_subforum_' + fid).getElementsByTagName('LI');
                                    for (i = 0; i < lis.length; i++) {
                                        fid = lis[i].getAttribute('fid');
                                        s += '<p><a href="javascript:;" ondblclick="locationforums(3, ' + fid + ')" onclick="switchforums(this, 3, ' + fid + ')">' + lis[i].innerHTML + '</a></p>';
                                    }
                                    document.getElementById('block_subforum').innerHTML = s;
                                }
                                else {
                                    document.getElementById('block_subforum').innerHTML = '';
                                }
                                switchforum = obj.innerHTML;
                                switchsubforum = '';
                                document.getElementById('postbtn').removeAttribute("disabled");
                                document.getElementById('postbtn').className = 'pn pnc y';
                            } else {
                                selectfid = fid;
                                switchsubforum = obj.innerHTML;
                                document.getElementById('postbtn').removeAttribute("disabled");
                                document.getElementById('postbtn').className = 'pn pnc y';
                            }
                            lastswitchobj = obj;
                            document.getElementById('pbnv').innerHTML = switchforum ? '&nbsp;&gt;&nbsp;' + switchforum + (switchsubforum ? '&nbsp;&gt;&nbsp;' + switchsubforum : '') : '';
                        }

                        function locationforums(block, fid) {
                            location.href = block == 1 ? '../Classify/OneLeveL?name=' + froum.trim() : '../TwoLevel/TwoLevel?name=' + froum.trim();
                        }
                        function show_post() {
                           
                            $.ajax({
                                url: "/Home/Is_online",
                                dataType: 'json',
                                async: false,//请求是否异步，默认异步;
                                type: "POST",
                                success: function (result) {
                                    if (result != "false") {
                                        var oh, ow;
                                        $(".Control").css("display", "block");
                                        oh = parseInt($(window).height() / 2 - $(".Control").height() / 2);
                                        ow = parseInt($(window).width() / 2 - $(".Control").width() / 2);
                                        $(".Control").css("top", oh + 'px');
                                        $(".Control").css("left", ow + 'px');
                                    }
                                    else {
                                        $("#Logindiv").css("display", "block");
                                        $("#Logindiv .t_r").css("float", "none");
                                        $("#Logindiv .t_l").css("float", "none");
                                        $("#Logindiv .b_r").css("float", "none");
                                        $("#Logindiv .b_l").css("float", "none");
                                    }
                                    //请求成功处理
                                },
                                error: function (result) {
                                    layer.alert("出现未知错误 请联系管理员-----kylin");
                                }
                            });
                        }
                        $(".cPublish button").click(function () {
                            var title = $(".title input").val();
                            var content = $(".Mix").val();
                            var str = froum.trim();
                            if (content.length == 0 || title.length == 0) {
                                alert("抱歉，您尚未输入标题或内容!");
                            }
                            else {
                                $.ajax({
                                    url: "/TwoLevel/FastPost",
                                    dataType: 'json',
                                    data: {
                                        "title": title,
                                        "content": content,
                                        "str": str,
                                    },
                                    async: false,//请求是否异步，默认异步;
                                    type: "POST",
                                    success: function (result) {
                                        //alert("success");
                                        //alert($(".hidden"));
                                        alert("非常感谢，您的主题已发布，现在将转入主题页，请稍候......");
                                        window.location.href = "/postInfor/post?id=" + result["topic_id"];
                                        $(".pTitle input").val("").focus();
                                        $(".pLeft textarea").val("").focus();
                                    },
                                    error: function (result) {
                                        alert("出现未知错误,请联系管理员!");
                                    }
                                });
                            }
                        });

                    </script>
                </div>
            </div>
        </div>
    </div>
    <uc1:Login runat="server" ID="Login" />
</asp:Content>
