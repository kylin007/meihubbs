//----------------张宏乾

var User_N;
var post_count;
var zz;
var zzz = 0;
var Text = "";
var zzzz = 0;
var z = "";
window.onload = function () {
    num(0,-1);                                                                                         //首页 帖子数目
    num1(0,-1);                                                                                        //首页 会员数目
    num2(7,-1);
    login();
    var ss = window.location.href.split('?')[1].toString();                                        //获取我的帖子或者查看新帖的值
    if (ss == 3)
    {
        dd(4, -1);                                                                                          //最新热门 帖子内容
        dd(5, -1);                                                                                          //最新精华 帖子内容
        dd(6, -1);                                                                                          //查看新帖 帖子内容
    }
    var oDiv = document.getElementById('bt').getElementsByTagName('li');                           //获取所有 切换菜单
    var oDiv1 = $("#content").children("div");                                                     //获取所有 内容框架
    var i, j;
    if (ss == 1)                                                            //首页点击我的帖子
    {
        document.getElementById('bt').getElementsByTagName('li')[3].className = 'ztg a';            //我的帖子 样式赋值  
        $("#content").children("div")[1].style.display = 'block';                                   //我的帖子 内容显示
        var state = document.getElementById('commen').style.display;
        document.getElementById('menu1').style.top = '354px';                                       //下拉框定位
        document.getElementById('menu1').style.left = '524.5px';                                    //下拉框定位
        if (User_N != "")
            {
        id(User_N,-1);                                                                                      //获取帖子
        zz = User_N;
        }
        else {
            //alert("请先登录");
            $("#Logindiv").css("display", "block");
            $("#Logindiv .t_r").css("float", "none");
            $("#Logindiv .t_l").css("float", "none");
            $("#Logindiv .b_r").css("float", "none");
            $("#Logindiv .b_l").css("float", "none");
        }
    }
    if (ss == 2)                                                            //首页点击查看新帖
    {
        var name = document.getElementById('bt').getElementsByTagName('a')[ss].text;    //获取切换菜单的 内容
        document.getElementById('top').textContent = name;                                      // 头部链接 
        document.getElementById('title').textContent = name;                                    //标题为 切换菜单的内容
        document.getElementById('kg').style.display = 'block';                              //扩大标题
        document.getElementById('subscribe').style.display = 'block';                       //订阅按钮 显示   
        document.getElementById('bt').getElementsByTagName('li')[3].className = '';                 //我的帖子 样式清空
        document.getElementById('bt').getElementsByTagName('li')[2].className = 'ztg a';            //查看新帖 样式赋值
        $("#content").children("div")[1].style.display = 'none';                                    //我的帖子 内容隐藏
        $("#content").children("div")[0].style.display = 'block';                                   //查看新帖 内容显示
        document.getElementById('menu1').style.left = '532.5px';                                    //下拉框 左移
        document.getElementById('menu1').style.top = '364px';                                    //下拉框 左移
        id(2,-1);                                                                                      //获取帖子
        zz = 2;
    }
  
    for (i = 0; i < oDiv.length; i++) {
            oDiv[i].index = i;/*位置索引*/
            oDiv[i].onclick = function () {/*鼠标点击触发操作*/
                if (User_N == -1 && this.index == 3) {
                    //alert("请先登录！");
                    $("#Logindiv").css("display", "block");
                    $("#Logindiv .t_r").css("float", "none");
                    $("#Logindiv .t_l").css("float", "none");
                    $("#Logindiv .b_r").css("float", "none");
                    $("#Logindiv .b_l").css("float", "none");
                    return false;
                }
                else { 
                for (j = 0; j < oDiv.length; j++) {
                    oDiv[j].className = '';                                                             //所有样式清空
                    oDiv1[1].style.display = 'none';                                                    //我的帖子 内容隐藏
                    oDiv1[0].style.display = 'block';                                                   //其他 内容显示
                }
                this.className = 'ztg a';                                                               //当前切换菜单 样式赋值
                if (this.index == "3")                                                                  //如果点击切换菜单 我的帖子
                {
                    oDiv1[0].style.display = 'none';                                                    //其他 内容隐藏
                    oDiv1[1].style.display = 'block';                                                   //我的帖子 内容显示
                }
                var name = document.getElementById('bt').getElementsByTagName('a')[this.index].text;    //获取切换菜单的 内容
                if (this.index < 3) {
                    id(this.index, -1);                                                                         //获取帖子
                    zz = this.index;
                }  
                else {
                    id(User_N, -1);
                    zz = User_N;
                }
                document.getElementById('top').textContent = name;
                document.getElementById('title').textContent = name;                                    //标题为 切换菜单的内容
                if (this.index < 3)                                                                        //如果点击 最新热门 最新精华 查看新帖
                {
                    document.getElementById('kg').style.display = 'block';                              //扩大标题
                    document.getElementById('subscribe').style.display = 'block';                       //订阅按钮 显示    
                    document.getElementById('menu1').style.top = '364px';                               //下拉框定位
                    document.getElementById('menu1').style.left = '532.5px';                            //下拉框定位
                }
                else {
                    document.getElementById('kg').style.display = 'none';                               //缩小标题                         
                    document.getElementById('subscribe').style.display = 'none';                        //订阅按钮 隐藏
                    document.getElementById('menu1').style.top = '354px';                               //下拉框定位
                    document.getElementById('menu1').style.left = '524.5px';                            //下拉框定位

                }
                }
            }
    }
    for (var q = 1; q <= document.getElementById('bt').getElementsByTagName('li').length; q++)          //导读首页 切换
    {
        if (ss == 'a' + q) {
            for (var w = 0; w < document.getElementById('bt').getElementsByTagName('li').length; w++) {
                document.getElementById('bt').getElementsByTagName('li')[w].className = '';             //所有标题样式清空
            }
            if (q < 4) {                                                                              //判断是否点击 最新热门 最新精华 查看新帖
                document.getElementById('bt').getElementsByTagName('li')[q - 1].className = 'ztg a';        //当前切换菜单 样式赋值
                var name = document.getElementById('bt').getElementsByTagName('a')[q - 1].text;
                document.getElementById('top').textContent = name;
                document.getElementById('title').textContent = name;
                document.getElementById('kg').style.display = 'block';                               //缩小标题                         
                document.getElementById('subscribe').style.display = 'block';                        //订阅按钮 隐藏
                $("#content").children("div")[1].style.display = 'none';                              //我的帖子 内容隐藏
                $("#content").children("div")[0].style.display = 'block';                             //内容显示
                id(q - 1,-1);                                                                            //获取帖子
                zz = q - 1;
                document.getElementById('menu1').style.top = '364px';                               //下拉框定位
                document.getElementById('menu1').style.left = '532.5px';                            //下拉框定位
            }
            if (q == 4)                                                                                  //是否点击 我的帖子
            {
                document.getElementById('bt').getElementsByTagName('li')[q - 1].className = 'ztg a';        //当前切换菜单 样式赋值
                var name = document.getElementById('bt').getElementsByTagName('a')[q - 1].text;
                document.getElementById('title').textContent = name;
                document.getElementById('top').textContent = name;
                document.getElementById('kg').style.display = 'none';                               //缩小标题                         
                document.getElementById('subscribe').style.display = 'none';                        //订阅按钮 隐藏
                document.getElementById('menu1').style.left = '524.5px';                              //下拉框 右移
                $("#content").children("div")[0].style.display = 'none';                              //其他 内容隐藏
                $("#content").children("div")[1].style.display = 'block';                             //我的帖子 内容显示
                id(User_N,-1);                                                                            //获取帖子
                zz = User_N;
            }
        }
    }
}

function show1() {                                                                                  //回复 按钮点击事件

    document.getElementById('sx').style.display = 'inline';//筛选按钮 显示
    document.getElementById('commen').style.display = 'none';//点评内容 隐藏
    document.getElementById('key').style.display = 'none'; //搜索框 隐藏
    zzz = 1;
    iid(User_N, -1);
    zz = ":::";
}
function hide1()                                                                                    //主题 按钮点击事件
{
    zzz = 0;
    document.getElementById('key').style.display = 'inline';  //搜索框显示
    document.getElementById('sx').style.display = 'inline';  //筛选按钮 显示
    document.getElementById('commen').style.display = 'none';  //点评内容框 隐藏
    id(User_N, -1);
    zz = User_N;
}
function comment() {                                                                                //点评按钮 点击事件
    document.getElementById('sx').style.display = 'none';                                           //筛选按钮 隐藏
    $("#contentval1").html('');
    document.getElementById('commen').style.display = 'block';                                     //点评内容 显示
}
function menu() {
    document.getElementById('menu1').style.display = 'block';                                       //下拉框 显示                     
}

function dis() {                                                                                    //我的帖子 鼠标移走事件

    document.getElementById('menu1').style.display = 'none';                                         //下拉框 隐藏     
}
function dis2() {                                                                                    //下拉框 鼠标移走事件
    document.getElementById('menu1').style.display = 'none';                                         //下拉框 隐藏    
}
function hide() {                                                                                    //下拉框 鼠标放上去事件
    document.getElementById('menu1').style.display = 'block';                                        //下拉框 显示   
}
function sel() {                                                                                     //筛选按钮 点击事件
    var displayvalue = document.getElementById('screen').style.display == 'none' ? '' : 'none'; document.getElementById('screen').style.display = displayvalue; return false;

}
function search() {
    var selectIndex = document.getElementById("search2").selectedIndex;
    var selectText = ":" + document.getElementById("search2").options[selectIndex].text;
    zzzz = 1;
    if (zzz == 0)
    {
        id(User_N, selectText);
    }
    else {
        iid(User_N, selectText);
    }
}
function aclick(lei,val)
{
    if(lei!=-1)
         zz = lei;
    if(val!=-1)
     z = val;
     id(zz,z);
}



function id(d, curpage) {                                                              //帖子 内容
    var repl = "1";
    Text = "";
    if (zzzz != 0)
        var Text = $("#text").val();
    $.ajax({
        url: "/Home/getlist",    //请求的url地址
        ////dataType: "json",   //返回格式为json
        data: {
            "id": d,
            "curpage": curpage,
            "repl": repl,
            "Text":Text,
        },
        async: false, //请求是否异步，默认为异步，这也是ajax重要特性              
        type: "GET",   //请求方式              
        success: function (req) {
            req = JSON.parse(req);
            var result = "";
            if (req["modellist"] != "")
                {
            $("#Nav").html(req["modellist"][0]["page"]);
            $("#Nar").html(req["modellist"][0]["page"]);
            if (req["modellist"][0]["page"] != null && req["modellist"][0]["page"] != "" && req["modellist"][0]["page"] != undefined)
            {
                req["modellist"][0]["page"].onclick = function () {
                    var pageindex = this.index;
                }
            }
            }
            for (var i = 0; i < req["modellist"].length; i++) {
                result += '<tbody><tr><td class="icn">' + req["modellist"][i]["Top"] + '</td><th><a class="t" href="/postInfor/post?id= ' + req["modellist"][i]["Topic_id"] + '">' + req["modellist"][i]["title"] + '</a><span class="partake">' + req["modellist"][i]["Partake"] + '</span>' + req["modellist"][i]["Img"] + req["modellist"][i]["Good"] + req["modellist"][i]["Hot"] + req["modellist"][i]["Evaluation"] + '<span class="tps">' + req["modellist"][i]["Reply_page"] + '</span></th><td class="by"><a href="/TwoLevel/TwoLevel?name=' + req["modellist"][i]["Forum_name"] + '">' + req["modellist"][i]["Forum_name"] + '</a></td><td class="by"><cite><a  href="/Home/PersonData?id=' + req["modellist"][i]["User_id"] + '">' + req["modellist"][i]["User_name"] + '</a></cite><em><span>' + req["modellist"][i]["Create_on_time"] + '</span></em></td><td class="num"><a>' + req["modellist"][i]["Reply_num"] + '</a><em>' + req["modellist"][i]["Visit_num"] + '</em></td><td class="by"><cite><a href="/Home/PersonData?id=' + req["modellist"][i]["User_id"] + '">' + req["modellist"][i]["Last_reply_name"] + '</a></cite><em><a href="/postInfor/post?id= ' + req["modellist"][i]["Topic_id"] + '">' + req["modellist"][i]["Last_reply_time"] + '</a></em></td></tr></tbody>';
            }
            if (result == "") {
                $("#contentval").html('');
                $("#contentval1").html('');
                document.getElementById("commen").style.display = "block";
            }
            else {
                document.getElementById("commen").style.display = "none";
                if (d == User_N) {
                    $("#contentval1").html('');
                    $("#contentval1").html(result);
                  
                }
                else {
          
                    $("#contentval").html('');
                    $("#contentval").html(result);                              //最新热门 最新精华 查看新帖   帖子内容 
                }
            }
        },
        error: function () {
            //请求出错处理
        }
    });
}
function iid(d, curpage) {                                                              //帖子 内容
    if (zzz != 0)
        var repl = ":::";
    $.ajax({
        url: "/Home/getlist",
        dataType: 'json',   //返回格式为json
        data:{
            "id": d,
            "curpage":curpage,
            "repl": repl,
            "text": Text,
        },
        async: false, //请求是否异步，默认为异步，这也是ajax重要特性              
        type: "POST",   //请求方式              
        success: function (req) {
            // var post = req[1]["Title"].toString();
            var result = ""; var res = "";
            //$("#Nav").html(req["modellist"][req["modellist"].length - 1]["page"]);
            //$("#Nar").html(req["modellist"][req["modellist"].length - 1]["page"]);
            $("#Nav").html(req["modellist"][0]["page"]);
            $("#Nar").html(req["modellist"][0]["page"]);
            $("#contentval1").html('');
            for (var i = 0; i < req["modellist"].length; i++) {
                result = '<tbody><tr><td class="icn">' + req["modellist"][i]["Top"] + '</td><th><a>' + req["modellist"][i]["title"] + '</a><span class="partake">' + req["modellist"][i]["Partake"] + '</span>' + req["modellist"][i]["Img"] + req["modellist"][i]["Good"] + req["modellist"][i]["Hot"] + req["modellist"][i]["Evaluation"] + '<span class="tps">' + req["modellist"][i]["Reply_page"] + '</span></th><td class="by"><a>' + req["modellist"][i]["Forum_name"] + '</a></td><td class="by"><cite><a>' + req["modellist"][i]["User_name"] + '</a></cite><em><span>' + req["modellist"][i]["Create_on_time"] + '</span></em></td><td class="num"><a>' + req["modellist"][i]["Reply_num"] + '</a><em>' + req["modellist"][i]["Visit_num"] + '</em></td><td class="by"><cite><a>' + req["modellist"][i]["Last_reply_name"] + '</a></cite><em><a>' + req["modellist"][i]["Last_reply_time"] + '</a></em></td></tr></tbody>';
                $("#contentval1").append(result);
                if (req["modellist"][i]["content"].length > 0) {
                    var resu = '<tbody class="reply_con"><tr><td class="icn">&nbsp;</td><td colspan="5">';

                    for (var s = 0; s < req["modellist"][i]["content"].length; s++) {
                        resu += '<div class="reply"><a href="/postInfor/post?id= ' + req["modellist"][i]["Topic_id"] + '">' + req["modellist"][i]["content"] + '</a></div>';

                    }
                    resu+= '</td></tr></tbody><tbody><tr><td colspan="6"></td></tr></tbody>';
                    $("#contentval1").append(resu);
                }
            }
            if (result == "") {
                $("#contentval1").html('');
                document.getElementById("commen").style.display = "block";
            }
            else {
                document.getElementById("commen").style.display = "none";
            }
        },
        error: function () {
            //请求出错处理
        }
    });
}

function dd(q, curpage) {                                                                          //导读首页
   var repl = "1";
    $.ajax({
        url: "/Home/getlist" ,    //请求的url地址
        dataType: "json",   //返回格式为json
        data: {
            "id": q,
            "curpage": curpage,
            "repl": repl,
            "text": Text,
        },
        async: false, //请求是否异步，默认为异步，这也是ajax重要特性              
        type: "GET",   //请求方式              
        success: function (req) {
            // var post = req[1]["Title"].toString();
            var result = "";
            for (var i = 1; i < req["modellist"].length; i = i + 2) {
                if (req["modellist"].length <= 31) {
                    var fo = req["modellist"][i]["Forum_name"].replace("&", "0");
                    var fi = req["modellist"][i-1]["Forum_name"].replace("&", "0");
                    result += '<li>' + req["modellist"][i - 1]["Create_on_time"] + req["modellist"][i - 1]["Partake"] + '<i>·<a href="/postInfor/post?id= ' + req["modellist"][i - 1]["Topic_id"] + '">' + req["modellist"][i - 1]["title"] + '</a></i>&nbsp;<span class="xg1"><a  href="/TwoLevel/TwoLevel?name=' +fi + '">' + req["modellist"][i - 1]["Forum_name"] + '</a></span></li><li class="xl2_r">' + req["modellist"][i]["Create_on_time"] + req["modellist"][i]["Partake"] + '<i>·<a href="/postInfor/post?id= ' + req["modellist"][i]["Topic_id"] + '">' + req["modellist"][i]["title"] + '</a></i>&nbsp;<span class="xg1"><a  href="/TwoLevel/TwoLevel?name=' + fo + '">' + req["modellist"][i]["Forum_name"] + '</a></span></li>';
                }
                else {
                    req["modellist"].length = 31;
                    i = -1;
                }
            }
            if (q == 4)
                {
            $("#q4").html('');
            $("#q4").html(result);                                                            //最新热门 帖子内容
            }
            if(q==5)
            {
                $("#q5").html('');
                $("#q5").html(result);                                                         //最新精华 帖子内容
            }
            if (q == 6) {
                $("#q6").html('');
                $("#q6").html(result);                                                         //查看新帖 帖子内容
            }
        },
        error: function () {
            //请求出错处理
        }
    });
}

function num(s, curpage) {                                                                                 //首页
    var repl = "1";
$.ajax({
    url: "/Home/getlist",    //请求的url地址
    dataType: "json",   //返回格式为json
    data: {
        "id": s,
        "curpage": curpage,
        "repl": repl,
        "text": Text,
    },
    async: false, //请求是否异步，默认为异步，这也是ajax重要特性              
    type: "GET",   //请求方式              
    success: function (req) {
        // var post = req[1]["Title"].toString();
        var result = "";
        result = req["modellist"][0]["post_num"];
        $("#post_num").html('');
        $("#post_num").html(result);                                                               //帖子数目
    },
    error: function () {
        //请求出错处理
    }
});
}
function num1(s, curpage) {                                                                                 //首页
    repl = "1";
    $.ajax({
        url: "/Home/getlist" ,    //请求的url地址
        dataType: "json",   //返回格式为json
        data: {
            "id": s,
            "curpage": curpage,
            "repl": repl,
            "text": Text,
        },
        async: false, //请求是否异步，默认为异步，这也是ajax重要特性              
        type: "GET",   //请求方式              
        success: function (req) {
            // var post = req[1]["Title"].toString();
            var result = "";
            result = req["modellist"][0]["user_num"];
            $("#user_num").html('');
            $("#user_num").html(result);                                                            //会员数目
        },
        error: function () {
            //请求出错处理
        }
    });
}

function num2(s, curpage) {                                                                                 //首页
    var repl = "1";
    $.ajax({
        url: "/Home/getlist" ,    //请求的url地址
        dataType: "json",   //返回格式为json
        data: {
            "id": s,
            "curpage": curpage,
            "repl": repl,
            "text": Text,
        },
        async: false, //请求是否异步，默认为异步，这也是ajax重要特性              
        type: "GET",   //请求方式              
        success: function (req) {
            // var post = req[1]["Title"].toString();
            var result = "";
            result = ' <a id=\"user_name\"  style=\"color: #000;\" href=\"/Home/PersonData?id=' + req["modellist"][0]["User_id"] + '\">' + req["modellist"][0]["User_name"] + '</a>';
            $("#uu").html('');
            $("#uu").html(result);                                                            //会员数目
        },
        error: function () {
            //请求出错处理
        }
    });
}
function login() {                                                                           //首页 我的帖子
    var d = "";
    var curpage = "";
    var repl = 1;
$.ajax({
    url: "/Home/Is_online",
    dataType: 'json',
    data: {
        "id": d,
        "curpage": curpage,
        "repl": repl,
        "text": Text,
    },
    async: false,//请求是否异步，默认异步;
    type: "POST",
    success: function (result) {
        if (result != "false") {
            User_N = result;
            dd(User_N,-1);
            document.getElementById('MY').style.display = "inline";
            document.getElementById('img').style.display = "inline";
        }
        else {
            User_N = -1;
            document.getElementById('MY').style.display = "none";
            document.getElementById('img').style.display = "none";
        }
        //请求成功处理
    },
    error: function (result) {
        alert("出现未知错误 请联系管理员");
    }
});
}
