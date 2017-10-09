﻿//*********************************************************
//-----------------------kylin-----------------------------
//
//用户 注册 登录 退出 时 JS代码
//
//***********************伊世林*****************************



function down()
{
    var oDiv = document.getElementById('Logindiv');
    oDiv.style.display = 'none';
}//退出//---------------------------------------------------------------------------退出登录框

function Login() {
   
    $.ajax({
        url: "/Home/Is_online",
        dataType: 'json',
        async: false,//请求是否异步，默认异步;
        type: "POST",
        success: function (result) {
            if (result != "false") {
                layer.alert("您已登录  无需继续登陆");
            }
            else {
                var oDiv = document.getElementById('Logindiv');
                oDiv.style.display = 'block';
            }
            //请求成功处理
        },
        error: function (result) {
            layer.alert("出现未知错误 请联系管理员-----kylin");
        }
    });

}//登陆//---------------------------------------------------------------------------打开登录框

function select_change()
{
    var oQE = document.getElementById('select_ques');
    var index = oQE.selectedIndex; //序号，取当前选中选项的序号
    var val = oQE.options[index].value;
    if (val > 0) {
        var oDiv = document.getElementById('answer');
        oDiv.style.display = "block";
    }
    else {
        var oDiv = document.getElementById('answer');
        oDiv.style.display = "none";
    }
}//问题列表//---------------------------------------------------------------------------登陆问题

function login_butn()
{ 
    var oNE = document.getElementById('select_name');
    var name_index = oNE.selectedIndex; //序号，取当前选中选项的序号
    var name_val = oNE.options[name_index].value;

    var oInpt1 = document.getElementById('name_text');
    var name_text = oInpt1.value;// 账号

    var oInpt2 = document.getElementById('pwd_text');
    var pwd_text = oInpt2.value;//密码

    var oQE = document.getElementById('select_ques');
    var question_index = oQE.selectedIndex; //序号，取当前选中选项的序号
    var question_val = oQE.options[question_index].value;
    var answer_text = null;
    var question_text = oQE.options[question_index].text; //问题0
    if (question_val == 0)
    {
        answer_text = null;
    }
    else
    {
        var oAN = document.getElementById('answer').getElementsByTagName("input")[0];
        answer_text = oAN.value;//答案
    }


    $.ajax({
        url: "/Home/Login_in",
        dataType: 'json',
        data: {
            "name_val": name_val, //用户名&邮箱
            "name_text": name_text,//内容
            "pwd_text": pwd_text,//密码
            "question_text": question_text,//问题
            "answer_text": answer_text,///答案
        },
        async: false,//请求是否异步，默认异步;
        type: "POST",
        success: function (result) {
            if (result) {
                layer.msg("欢迎会员" + name_text + "  即将跳转至首页");
                //window.location.href = 'http://localhost:3741/';
                window.location.href = '../';
            }
            else {
                layer.alert("账号密码错误   请重新输入");

            }
            //请求成功处理
        },
        error: function (result) {
            layer.alert("出现未知错误 请联系管理员-----kylin");
        }
    });
}//-------------------------------------------------------------------登录框登陆

function SY_Login_in() {

    var oNE = document.getElementById('select');
    var name_index = oNE.selectedIndex; //序号，取当前选中选项的序号
    var name_val = oNE.options[name_index].value;

    var oInpt1 = document.getElementById('SY_name_text');
    var name_text = oInpt1.value;// 账号

    var oInpt2 = document.getElementById('SY_pwd_text');
    var pwd_text = oInpt2.value;//密码

    var answer_text = null;
    var question_text = "安全提问(未设置请忽略)";


    $.ajax({
        url: "/Home/Login_in",
        dataType: 'json',
        data: {
            "name_val": name_val, //用户名&邮箱
            "name_text": name_text,//内容
            "pwd_text": pwd_text,//密码
            "question_text": question_text,//问题
            "answer_text": answer_text,///答案
        },
        async: false,//请求是否异步，默认异步;
        type: "POST",
        success: function (result) {
            if (result) {
                layer.msg("欢迎会员" + name_text + "                          即将跳转至首页");
                //window.location.href = 'http://localhost:3741/';
                window.location.href = '../';
            }
            else {
                layer.alert("账号密码错误   请重新输入");

            }
            //请求成功处理
        },
        error: function (result) {
            layer.alert("出现未知错误 请联系管理员-----kylin");
        }
    });
}//---------------------------------------------------------------------------首页标题登陆

function backdown() {   
    var text = document.getElementById('SY_Uname').innerText;
    $.ajax({
        url: "/Home/backdown?text=" + text,
        dataType: 'json',
        async: false,//请求是否异步，默认异步;
        type: "POST",
        success: function (result) {
            if (result) {
                layer.msg('退出成功');
                //alert("退出成功");
                //window.location.href = 'http://localhost:3741/';
                window.location.href = '../';
            }
            else {
                layer.msg('退出失败！');
                //alert("退出失败！");
                //window.location.href = 'http://localhost:3741/';
                window.location.href = '../';
            }
        },
        error: function (result) {
            layer.alert("出现未知错误 请联系管理员-----kylin");
        }
    });
}//---------------------------------------------------------------------------退出


//------------------------------------判断用户名是否存在 （陈）
$(document).ready(function usergroup() {
    var user = $("#SY_Uname").html(); //判断用户名
    user = user.replace(/(^\s*)|(\s*$)/g, '');
    if(user!='用户名'&&user.length>1)
    {
        $.ajax({
            url: '/Setting/Index',
            data: {
                "user": user,
            },
            type: "POST",
            success: function (data) {
            },
            error: function () {
                   }
        });
        //未读消息提示
        $.ajax({
            url: '/Message/getmessage',
            data: {
                "user": user,
            },
            type: "POST",
            success: function (data) {
                $.ajax({
                    url: '/Message/func',
                    data: {
                        "user": user,
                    },
                    type: "POST",
                    success: function (data) {
                        if (data == "1")
                        {
                            document.getElementById('getcontent').innerHTML = "消息(1)";
                            layer.msg("你有新消息",{time:50});
                        }
                    },
                    error: function () {
                    }
                });
            },
            error: function () {
                        }
        });
        //未读提醒
        $.ajax({
            url: '/Message/getfriend',
            data: {
                "user": user,
            },
            type: "POST",
            success: function (data) {
                if (data > 0) {
                    document.getElementById('getfriendsid').innerHTML = "提醒(" + data + ")";
                    document.getElementById('rereformsub1').style.display = 'none';
                    document.getElementById('rereformsub2').style.display = 'block';
                    layer.msg('有好友要加你哦，快去到--应用消息中 看看吧', {time:4000});
                }
                else {
                    document.getElementById('rereformsub1').style.display = 'block';
                    document.getElementById('rereformsub2').style.display = 'none';
                }
            },
            error: function () {
            
            }
        });
        $.ajax({
            url: '/Setting/img',
            data: {
            },
            type: "POST",
            success: function (data) {
                if (data != "") {
                    try {
                        var domm= document.getElementById('SY_user_img');
                        domm.style.width = '54px';
                        domm.style.height = '54px';
                        domm.src = "../../image/imgs/" + data;
                        var dom = document.getElementById('imagepoistion');
                        dom.style.width = '200px';
                        dom.style.height = '200px';
                        dom.src = "../../image/imgs/" + data;
                    }
                    catch (erer) {
                        var doma = document.getElementById('imagesmessageimg');
                        doma.style.width = '54px';
                        doma.style.height = '54px';
                        doma.src = "../../image/imgs/" + data;
                    };
                }
            },
            error: function () {
            }
        });
        var dom = document.getElementById('Labelcheckimg').innerHTML;
        if (dom=="2"){
           layer.msg("姓名重复");
        }
    }
});