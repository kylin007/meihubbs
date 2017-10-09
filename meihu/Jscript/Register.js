﻿//*********************************************************
//-----------------------kylin-----------------------------
//
//用户登录 时 JS代码
//
//***********************伊世林*****************************




/// <reference path="../Login.ascx" />
/// <reference path="../Login.ascx" />
window.onload = function () {
    
    var oDiv = document.getElementById('mian').getElementsByTagName('input'); //  input 输入框的判断
    for (var i = 0; i < oDiv.length; i++) {
        oDiv[i].index = i;
        var oDiv1;
        oDiv[i].onclick = function () {
            for (var j = 0; j < oDiv.length; j++) {
                oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                oDiv1.style.display = "none";
            }
            oDiv1 = oDiv[this.index].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
            oDiv1.style.display = "block";
            var flag = false;
            for(j = 0; j<this.index; j++)
            {
                var text = oDiv[j].value;
                if (j == 0)
                {
                    if (text.length < 3)
                    {
                        oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                        oDiv1.innerHTML = "用户名不得小于 3 个字符";
                        oDiv1.style.color = "red";
                        oDiv1.style.display = "block";
                    }
                    else {

                        $.ajax({
                            url: "/Home/Register_on?text=" + text,
                            dataType: 'json',
                            async: false,//请求是否异步，默认异步;
                            type: "POST",
                            success: function (result) {
                                //请求成功处理
                                if (result) {

                                    $.ajax({
                                        url: "/Home/User_name_right?text=" + text,
                                        dataType: 'json',
                                        async: false,//请求是否异步，默认异步;
                                        type: "POST",
                                        success: function (result) {
                                            if (result) {
                                                oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                                                oDiv1.innerHTML = "<img src=\"../../image/check_right.gif\" />";
                                                oDiv1.style.display = "block";
                                            }
                                            else {
                                                oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                                                oDiv1.innerHTML = "用户名包含无效字符 请重新输入";
                                                oDiv1.style.color = "red";
                                                oDiv1.style.display = "block";
                                            }
                                        },
                                        error: function (result) {
                                            alert("出现未知错误 请联系管理员-----kylin");
                                        }
                                    });

                                }
                                else {
                                    oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                                    oDiv1.innerHTML = "该用户名已注册，请更换用户名或<a onclick=\"Login();\" style=\"color:blue;\">登陆</a>";
                                    oDiv1.style.color = "red";
                                    oDiv1.style.display = "block";
                                };
                            },
                            error: function (result) {
                                oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                                oDiv1.innerHTML = "出现错误 请刷新";
                                oDiv1.style.color = "red";
                                oDiv1.style.display = "block";
                            }
                        });
                    }
                }
                else if(j == 1)
                {
                    var pwd = text;
                    if(pwd==null || pwd=="")
                    {
                        oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                        oDiv1.innerHTML = "密码不能为空";
                        oDiv1.style.color = "red";
                        oDiv1.style.display = "block";
                        flag = false;
                    }
                    else {

                        oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                        oDiv1.innerHTML = "<img src=\"../../image/check_right.gif\" />";
                        oDiv1.style.display = "block";
                        flag = true;
                    }
                    
                }
                else if(j==2)
                {
                    if(text!=pwd)
                    {
                        oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                        oDiv1.innerHTML = "两次输入的密码不一致";
                        oDiv1.style.color = "red";
                        oDiv1.style.display = "block";
                    }
                    else if (flag && text == pwd)
                    {
                        oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                        oDiv1.innerHTML = "<img src=\"../../image/check_right.gif\" />";
                        oDiv1.style.display = "block";
                    }
                    else {
                        oDiv1.innerHTML = "密码出错";
                        oDiv1.style.color = "red";
                        oDiv1.style.display = "block";
                    }

                }
                else if (j == 3)
                {
                    apos = text.indexOf("@");
                    dotpos = text.lastIndexOf(".");
                    if (apos<1||dotpos-apos<2) 
                    {
                        oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                        oDiv1.innerHTML = "Email 地址无效";
                        oDiv1.style.color = "red";
                        oDiv1.style.display = "block";
                    }
                    else
                    {
                        $.ajax({
                            url: "/Home/Register_on?text=" + text,
                            dataType: 'json',
                            async: false,//请求是否异步，默认异步;
                            type: "POST",
                            success: function (result) {
                                //请求成功处理
                                if (result) {
                                    oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                                    oDiv1.innerHTML = "<img src=\"../../image/check_right.gif\" />";
                                    oDiv1.style.display = "block";

                                }
                                else {
                                    oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                                    oDiv1.innerHTML = "该邮箱已注册，请更换邮箱或<a onclick=\"Login();\" style=\"color:blue;\">登陆</a>";
                                    oDiv1.style.color = "red";
                                    oDiv1.style.display = "block";
                                };
                            },
                            error: function (result) {
                                oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                                oDiv1.innerHTML = "出现错误 请刷新";
                                oDiv1.style.color = "red";
                                oDiv1.style.display = "block";
                            }
                        });
                    }
                }
               
            }
        }
    }

   
}
function Register() {

    var oButn = document.getElementById('layer_reginfo_b').getElementsByTagName('button'); // button 的判断
    var oDiv = document.getElementById('mian').getElementsByTagName('input');
    var flag0 = false;
    var flag1 = false;
    var flag2 = false;
    var flag3 = false;
    var flag4 = false;
    var flag5 = false;
    var name;
    var pwd;
    var Email;
    var Grade;
    var Major;

    var oDiv1;
    for (j = 0; j <= 5; j++) {
        var text = oDiv[j].value;
        if (j == 0) {
            if (text.length < 3) {
                oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                oDiv1.innerHTML = "用户名不得小于 3 个字符";
                oDiv1.style.color = "red";
                oDiv1.style.display = "block";
                flag0 = false;
            }
            else {
                $.ajax({
                    url: "/Home/Register_on?text=" + text,
                    dataType: 'json',
                    async: false,//请求是否异步，默认异步;
                    type: "POST",
                    success: function (result) {
                        //请求成功处理
                        if (result) {

                            $.ajax({
                                url: "/Home/User_name_right?text=" + text,
                                dataType: 'json',
                                async: false,//请求是否异步，默认异步;
                                type: "POST",
                                success: function (result) {
                                    if (result) {
                                        oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                                        oDiv1.innerHTML = "<img src=\"../../image/check_right.gif\" />";
                                        oDiv1.style.display = "block";
                                        flag0 = true;
                                        name = text;
                                    }
                                    else {
                                        oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                                        oDiv1.innerHTML = "用户名包含无效字符 请重新输入";
                                        oDiv1.style.color = "red";
                                        oDiv1.style.display = "block";
                                        flag0 = false;
                                    }
                                },
                                error: function (result) {
                                    alert("出现未知错误 请联系管理员");
                                    flag0 = false;
                                }
                            });

                        }
                        else {
                            oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                            oDiv1.innerHTML = "该用户名已注册，请更换用户名或<a onclick=\"Login();\" style=\"color:blue;\">登陆</a>";
                            oDiv1.style.color = "red";
                            oDiv1.style.display = "block";
                            flag0 = false;
                        };
                    },
                    error: function (result) {
                        oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                        oDiv1.innerHTML = "出现错误 请刷新";
                        oDiv1.style.color = "red";
                        oDiv1.style.display = "block";
                        flag0 = false;
                    }
                });
            }
        }
        else if (j == 1) {
            if (text == null || text == "") {
                oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                oDiv1.innerHTML = "密码不能为空";
                oDiv1.style.color = "red";
                oDiv1.style.display = "block";
                flag1 = false;
            }
            else {

                oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                oDiv1.innerHTML = "<img src=\"../../image/check_right.gif\" />";
                oDiv1.style.display = "block";
                flag1 = true;
                pwd = text;
            }
        }
        else if (j == 2) {
            if (text != pwd) {
                oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                oDiv1.innerHTML = "两次输入的密码不一致";
                oDiv1.style.color = "red";
                oDiv1.style.display = "block";
                flag2 = false;
            }
            else if (flag1 && text == pwd) {
                oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                oDiv1.innerHTML = "<img src=\"../../image/check_right.gif\" />";
                oDiv1.style.display = "block";
                flag2 = true;
                pwd = text;
            }
            else {
                flag2 = false;
            }
        }
        else if (j == 3) {
            apos = text.indexOf("@")
            dotpos = text.lastIndexOf(".")
            if (apos < 1 || dotpos - apos < 2) {
                oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                oDiv1.innerHTML = "Email 地址无效";
                oDiv1.style.color = "red";
                oDiv1.style.display = "block";
                flag3 = false;
            }
            else {
                $.ajax({
                    url: "/Home/Register_on?text=" + text,
                    dataType: 'json',
                    async: false,//请求是否异步，默认异步;
                    type: "POST",
                    success: function (result) {
                        //请求成功处理
                        if (result) {
                            oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                            oDiv1.innerHTML = "<img src=\"../../image/check_right.gif\" />";
                            oDiv1.style.display = "block";
                            flag3 = true;
                            Email = text;

                        }
                        else {
                            oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                            oDiv1.innerHTML = "该邮箱已注册，请更换邮箱或<a onclick=\"Login();\" style=\"color:blue;\">登陆</a>";
                            oDiv1.style.color = "red";
                            oDiv1.style.display = "block";
                            flag3 = false;
                        };
                    },
                    error: function (result) {
                        oDiv1 = oDiv[j].parentNode.parentNode.lastElementChild.getElementsByTagName("i")[0];
                        oDiv1.innerHTML = "出现错误 请刷新";
                        oDiv1.style.color = "red";
                        oDiv1.style.display = "block";
                        flag3 = false;
                    }
                });
                
            }
        }
        else if (j == 4) {
            if (text == null || text == "") {
                flag4 = false;
            }
            else {
                flag4 = true;
                Grade = text;
            }
        }
        else if(j==5)
        {
            if (text == null || text == "") {
                flag5 = false;
            }
            else {
                flag5 = true;
                Major = text;
            }
        }
    }

    if (flag0 && flag1 && flag2 && flag3 && flag4 && flag5)
    {
        if (document.getElementById("checkboxid").checked) //如果表单1的复选框没被选中。则执行以下语句
        {
            $.ajax({
                url: "/Home/Register_in",
                dataType: 'json',
                data: {
                    "name": name,
                    "pwd": pwd,
                    "Email": Email,
                    "Grade": Grade,
                    "Major": Major,
                },
                async: false,//请求是否异步，默认异步;
                type: "POST",
                success: function (result) {
                    if(result)
                    {
                        layer.msg("欢迎新会员" + name + "\n 即将跳转至首页");
                        window.location.href = '../';
                    }
                    else {
                        layer.alert("出现未知错误 请联系管理员-----kylin");

                    }
                    //请求成功处理
                },
                error: function (result) {
                    layer.alert("出现未知错误 请联系管理员-----kylin");
                }
            });


        }
        else {
            layer.alert("您必须同意服务条款后才能注册");
        }
    }
    else {
        layer.alert("请完整填写以上信息");
    }
    
}