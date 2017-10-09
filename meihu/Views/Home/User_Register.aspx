<%@ Page Title="" Language="C#" MasterPageFile="~/Views/shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%--
//*********************************************************
//-----------------------kylin-----------------------------
//
//用户注册页面
//
//***********************伊世林*****************************
--%>
<%@ Register Src="~/Login.ascx" TagPrefix="uc1" TagName="Login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Jscript/Register.js"></script>

 <div id="top" style="width:958px; margin: 0 auto; border:1px solid #CDCDCD; background:#FFF;font:12px/1.5 Tahoma,'Microsoft Yahei','Simsun';color:#444;  margin-bottom:10px;">
    
    <div id="first" style="height:31px;padding:0 10px; border-top:1px solid #FFF;border-bottom:1px solid #C2D5E3; background:#FFECEC;line-height:31px;white-space:nowrap;overflow:hidden;">
        <h3 class="regior" style="float:left;font-size:14px !important; margin:0; padding:0;">注册</h3>
        <span class="Ishava" style="float: right;font-weight:400;"><a href="../Home/User_Register" onclick="Login();">已有账号？现在登录</a></span>
    </div>

    <div id="sciend" style="height: 440px; width:958px;background-color: white;">
        <div id="mian" style="height:290px; width:938px;padding :10px;">
            <div class="mtw" style="width:938px; height:270px; margin-top:20px;">
                <div class="rediv" style="width:760px; height:44px; margin:0 auto; border-bottom:1px dotted #CDCDCD;">
                    <table style="border-collapse:collapse;">
                        <tbody>
                            <tr>
                                <th style="width:10em; text-align:right;padding:10px 2px 10px 2px;padding-right:10px;vertical-align:top;line-height:24px; font-weight:400;">
                                    <span style="color:red;">*</span>
                                    <label>用户名:</label>
                                </th>
                                <td>
                                    <input type="text" id="Registername" name="Registername" class="px" tabindex="1" autocomplete="off" size="25" maxlength="15" style="width:220px; border:1px solid;border-color:#848484 #E0E0E0 #E0E0E0 #848484;padding:2px 4px;"/>
                                </td>
                                <td>
                                    <i class="p_tip" id="p_tip1" style="display:none; font-style:normal;">用户名由 3 到 15 个字符组成</i>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="rediv" style="width:760px; height:44px; margin:0 auto; border-bottom:1px dotted #CDCDCD;">
                    <table style="border-collapse:collapse;">
                        <tbody>
                            <tr>
                                <th style="width:10em; text-align:right;padding:10px 2px 10px 2px;padding-right:10px;vertical-align:top;line-height:24px; font-weight:400;">
                                    <span style="color:red;">*</span>
                                    <label>密码:</label>
                                </th>
                                <td>
                                    <input type="password" id="Bt1Vx2" name="Bt1Vx2" class="px" tabindex="1" autocomplete="off" size="25" maxlength="15" style="width:220px; border:1px solid;border-color:#848484 #E0E0E0 #E0E0E0 #848484;padding:2px 4px;"/>
                                </td>
                                <td>
                                    <i class="p_tip" id="p_tip2" style="display:none;font-style:normal;">请填写密码</i>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="rediv" style="width:760px; height:44px; margin:0 auto; border-bottom:1px dotted #CDCDCD;">
                    <table style="border-collapse:collapse;">
                        <tbody>
                            <tr>
                                <th style="width:10em; text-align:right;padding:10px 2px 10px 2px;padding-right:10px;vertical-align:top;line-height:24px; font-weight:400;">
                                    <span style="color:red;">*</span>
                                    <label>确认密码:</label>
                                </th>
                                <td>
                                    <input type="password" id="Bt1Vx3" name="Bt1Vx3" class="px" tabindex="1" autocomplete="off" size="25" maxlength="15" style="width:220px; border:1px solid;border-color:#848484 #E0E0E0 #E0E0E0 #848484;padding:2px 4px;"/>
                                </td>
                                <td>
                                    <i class="p_tip" id="p_tip3" style="display:none;font-style:normal;">请再次输入密码</i>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="rediv" style="width:760px; height:44px; margin:0 auto; border-bottom:1px dotted #CDCDCD;">
                    <table style="border-collapse:collapse;">
                        <tbody>
                            <tr>
                                <th style="width:10em; text-align:right;padding:10px 2px 10px 2px;padding-right:10px;vertical-align:top;line-height:24px; font-weight:400;">
                                    <span style="color:red;">*</span>
                                    <label>Email:</label>
                                </th>
                                <td>
                                    <input type="text" id="Bt1Vx4" name="Bt1Vx4" class="px" tabindex="1" autocomplete="off" size="25" style="width:220px; border:1px solid;border-color:#848484 #E0E0E0 #E0E0E0 #848484;padding:2px 4px;"/>
                                </td>
                                <td>
                                    <i class="p_tip" id="p_tip4" style="display:none;font-style:normal;">请输入正确的邮箱地址</i>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="rediv" style="width:760px; height:44px; margin:0 auto; border-bottom:1px dotted #CDCDCD;">
                    <table style="border-collapse:collapse;">
                        <tbody>
                            <tr>
                                <th style="width:10em; text-align:right;padding:10px 2px 10px 2px;padding-right:10px;vertical-align:top;line-height:24px; font-weight:400;">
                                    <span style="color:red;">*</span>
                                    <label>年级:</label>
                                </th>
                                <td>
                                    <input type="text" id="Bt1Vx5" name="Bt1Vx5" class="px" tabindex="1" autocomplete="off" size="25" style="width:220px; border:1px solid;border-color:#848484 #E0E0E0 #E0E0E0 #848484;padding:2px 4px;"/>
                                </td>
                                <td>
                                    <i class="p_tip" id="p_tip5" style="display:none;font-style:normal;">你加入郑师的年份？譬如2016，非郑师学生填写校外</i>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="rediv" style="width:760px; height:44px; margin:0 auto; border-bottom:1px dotted #CDCDCD;">
                    <table style="border-collapse:collapse;">
                        <tbody>
                            <tr>
                                <th style="width:10em; text-align:right;padding:10px 2px 10px 2px;padding-right:10px;vertical-align:top;line-height:24px; font-weight:400;">
                                    <span style="color:red;">*</span>
                                    <label>专业:</label>
                                </th>
                                <td>
                                    <input type="text" id="Bt1Vx6" name="Bt1Vx6" class="px" tabindex="1" autocomplete="off" size="25"  style="width:220px; border:1px solid;border-color:#848484 #E0E0E0 #E0E0E0 #848484;padding:2px 4px;"/>
                                </td>
                                <td>
                                    <i class="p_tip" id="p_tip6" style="display:none;font-style:normal;">譬如 计科 ，不清楚请填写 未知</i>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div id="layer_reginfo_b" style="height:110px; width:958px;">
            <div style="width:760px; height:45px;margin:0 auto; padding-bottom:20px;">
                <table style="border-collapse:collapse;">
                        <tbody>
                            <tr>
                                <th style="width:10em; text-align:right;padding:10px 2px 10px 2px;padding-right:10px;vertical-align:top;line-height:24px; font-weight:400;">
                                    &nbsp;
                                </th>
                                <td>
                                    <span>
                                        <em>&nbsp;</em>
                                        <button type="submit" onclick="Register();" value="true" style="background-color:#900; border-color:#900;color:white;font-weight:700;"><strong>提交</strong></button>
                                        <input type="checkbox" id="checkboxid" value="b152ffa7" checked="checked"/>
                                        <label>同意<a href="#">网站服务条款</a></label>
                                    </span>
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
            </div>
            <div style="width:760px;margin:0 auto; margin-bottom:20px !important;">
                <hr style="color:#CDCDCD; height:1px;border:none;background:#CDCDCD;margin:0; padding:0;" />
                <table style="border-collapse:collapse;">
                        <tbody>
                            <tr>
                                <th style="width:10em; text-align:right;padding:10px 2px 10px 2px;padding-right:10px;vertical-align:top;line-height:24px; font-weight:400;">
                                   快捷登录:
                                </th>
                                <td>
                                    <a href="#"><img src="../../image/qqlogo.gif" /></a>
                                </td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
            </div>
        </div>
       
    </div>

 </div>
 
</asp:Content>
