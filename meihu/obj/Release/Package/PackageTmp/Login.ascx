<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%--
//*********************************************************
//-----------------------kylin-----------------------------
//
//用户登陆   控件形式
//
//***********************伊世林*****************************
--%>

<div id="Logindiv" style="display:none;position: fixed; z-index: 100; left: 523.5px; top: 218.5px; font:12px/1.5 Tahoma,'Microsoft Yahei','Simsun'; color:#444; border-color:grey; text-decoration:none;">
    <table class="fwin" style="border-collapse: collapse;">
        <tbody>
            <tr>
                <td class="t_l" style="border-radius: 8px 0 0 0; opacity: 0.2; background: #000; overflow: hidden; width: 8px; height: 8px;"></td>
                <td class="t_c" style="height: 8px; opacity: 0.2; background: #000; overflow: hidden;"></td>
                <td class="t_r" style="border-radius: 0 8px 0 0; opacity: 0.2; background: #000; overflow: hidden; width: 8px; height: 8px;"></td>
            </tr>

            <tr>
                <td class="m_l" style="width:8px; opacity:0.2; background:#000; overflow:hidden;"></td>
                <td class="m_c" style="background-color:#FFF;">
                    <div id="main_messaqge_Lhv3w" >
                        <div id="layer_login_Lhv3w">
                            <h3 style="padding:10px 10px 8px; height:20px; line-height:20px; font-size:1em; margin:0;">
                                <em style="float:left; font-size:14px; font-weight:700; color:#369;font-style:normal;">用户登录</em>
                                <span style="float:right; color:#999;" onclick="down();"><a class="flbc" style="width: 20px;height: 20px;overflow: hidden;text-indent: -9999px;background: url(../../image/cls.gif) no-repeat 0 0;cursor: pointer; float: left;text-decoration: none;margin-left: 8px;font-weight: 400;">关闭</a></span>
                            </h3>
                            <form style="margin:0; padding:0;">
                                <div style="padding:0 10px 10px;">
                                    <div style="width:500px; margin:0 auto; border-bottom:1px dotted #CDCDCD;">
                                        <table style="border-collapse:collapse;">
                                            <tbody>
                                                <tr>
                                                    <th style="width:10em; text-align:right;padding:6px 2px;vertical-align:top;line-height:24px; font-weight:400;">
                                                        <select id="select_name" style="border:none;">
                                                            <option value="User_name">用户名</option>
                                                            <option value="Email">Email</option>
                                                        </select>
                                                    </th>
                                                    <td>
                                                        <input type="text" id="name_text" tabindex="1" autocomplete="off" size="25" style="width:180px; border:1px solid;border-color:#848484 #E0E0E0 #E0E0E0 #848484;padding:2px 2px;"/>
                                                    </td>
                                                    <td style="padding:6px 2px; vertical-align: top;line-height: 24px;">
                                                        <a href="Home/User_Register" style="color:#369; text-decoration:none;">注册</a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                     </div>
                                    <div style="width:500px; margin:0 auto; border-bottom:1px dotted #CDCDCD;">
                                        <table style="border-collapse:collapse;">
                                            <tbody>
                                                <tr>
                                                    <th style="width:10em; text-align:right;padding:6px 2px;vertical-align:top;line-height:24px; font-weight:400;">
                                                      <label>密码:</label>
                                                    </th>
                                                    <td>
                                                        <input type="password" id="pwd_text"tabindex="1" autocomplete="off" size="25" style="width:180px; border:1px solid;border-color:#848484 #E0E0E0 #E0E0E0 #848484;padding:2px 2px;"/>
                                                    </td>
                                                    <td style="padding:6px 2px; vertical-align: top;line-height: 24px;">
                                                        <a href="#" style="color:#369; text-decoration:none;">找回密码</a>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                     </div>
                                    <div style="width:500px; height:44px; margin:0 auto; border-bottom:1px dotted #CDCDCD;">
                                        <table style="border-collapse:collapse;">
                                            <tbody>
                                                <tr>
                                                    <th style="width:10em; text-align:right;padding:6px 2px;vertical-align:top;line-height:24px; font-weight:400;">
                                                      <label>安全提问:</label>
                                                    </th>
                                                    <td style="padding:6px 2px;vertical-align: top;line-height: 24px;"">
                                                        <select id="select_ques" onchange="select_change()" style="padding:2px 2px 2px 1px; border:1px solid; border-color:#848484 #E0E0E0 #E0E0E0 #848484; background:#FFF url(image/px.png) repeat-x 0 0;">
                                                            <option value ="0">安全提问(未设置请忽略)</option>
                                                            <option value ="1">母亲的名字</option>
                                                            <option value ="2">爷爷的名字</option>
                                                            <option value ="3">父亲出生的城市</option>
                                                            <option value ="4">您其中一位老师的名字</option>
                                                            <option value ="5">您个人计算机的型号</option>
                                                            <option value ="6">您最喜欢的餐馆名称</option>
                                                            <option value ="7">驾驶执照最后四位数字</option>
                                                        </select>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                     </div>
                                    <div id="answer" style="width:500px; margin:0 auto; border-bottom:1px dotted #CDCDCD; display:none;">
                                        <table style="border-collapse:collapse;">
                                            <tbody>
                                                <tr>
                                                    <th style="width:10em; text-align:right;padding:6px 2px;vertical-align:top;line-height:24px; font-weight:400;">
                                                      <label>答案:</label>
                                                    </th>
                                                    <td>
                                                        <input type="text" class="px" tabindex="1" autocomplete="off" size="25" style="width:180px; border:1px solid;border-color:#848484 #E0E0E0 #E0E0E0 #848484;padding:2px 2px;"/>
                                                    </td>
                                                    <td>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                     </div>
                                    <div style="width:500px; height:44px; margin:0 auto;background:transparent;">
                                        <table style="border-collapse:collapse;">
                                            <tbody>
                                                <tr>
                                                    <th style="width:10em; text-align:right;padding:10px 2px 10px 2px;padding-right:10px;vertical-align:top;line-height:24px; font-weight:400;">
                                                    </th>
                                                    <td>
                                                       <label>
                                                           <input type="checkbox"/>
                                                           自动登录
                                                       </label>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                     </div>
                                    <div style="width:500px; height:44px; margin:0 auto;background:transparent;">
                                        <table style="border-collapse:collapse;">
                                            <tbody>
                                                <tr>
                                                    <th style="width:10em; text-align:right;padding:10px 2px 10px 2px;padding-right:10px;vertical-align:top;line-height:24px; font-weight:400;">
                                                    </th>
                                                    <td>
                                                         <button onclick="login_butn();"   style="background-color:#900; border-color:#900;color:white;font-weight:700;"><strong>登陆</strong></button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                     </div>

                                    <div style="width:500px;margin:0 auto; background:transparent;">
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
                            </form>
                        </div>
                    </div>
                </td>
                <td class="m_r" style="width:8px; opacity:0.2; background:#000; overflow:hidden;"></td>
            </tr>

            <tr>
                <td class="b_l" style="border-radius:0 0 0 8px; opacity:0.2; background:#000; overflow:hidden; width:8px; height:8px;"></td>
                <td class="b_c" style="height:8px; opacity:0.2; background:#000; overflow:hidden;"></td>
                <td class="b_r" style="border-radius:0 0 8px 0; opacity:0.2; background:#000; overflow:hidden; width:8px; height:8px;"></td>
            </tr>

        </tbody>
    </table>
</div>
