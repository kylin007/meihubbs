<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Friend/Friend.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="FriendContent" runat="server">
<link href="../../Css/friendCss.css" rel="stylesheet" />
    <div style="margin: 2px 0;height: 29px;border: none; background: transparent;line-height: 29px; font: 12px/1.5 Tahoma,'Microsoft Yahei','Simsun'; color: #444;">
        <div style="float: left;">
            <img src="../../image/room.png" style="position:relative; top:6px;" />&nbsp>&nbsp<a href="#" style="position:relative; top:2px;">好友</a>&nbsp>&nbsp<a href="#" style="position:relative; top:2px;">好友列表</a>
        </div>
    </div>
        <div id="friendModel">
            <div id="fdModel1">
                <h2 id="oh" style="position:relative; top:5px; border-bottom:1px dashed #ccc;"><span style="position:relative; left:7px; top:-10px;">好友</span></h2>
                <ul>
                    <li><div>好友列表</div></li>
                    <li><div>查找好友</div></li>
                    <li><div>可能认识的人</div></li>
                    <li><div>好友请求</div></li>
                    <li><div>好友分组</div></li>
                </ul>
            </div>
                
            <div id="fdModel2">
                <%--好友列表--%>
                <div class="fdsList"">
                    <ul id="ul1">
                        <li><a href="#">全部好友列表</a></li>
                        <li><a href="#">当前在线的好友</a></li>
                        <li><a href="#">在线成员</a></li>
                        <li><a href="#">就在我附近的朋友</a></li>
                        <li><a href="#">我的访客</a></li>
                        <li><a href="#">我的足迹</a></li>
                        <li><a href="#">我的黑名单</a></li>
                    </ul>
                </div>
                <%--全部好友列表--%>
                <div id="allFdsList"">
                    <div class="fdsList1">
                        <div>
                            <br />
                            按照<a href="#">好友热度</a>排名
                            <span style="float: right;">当前共有0个好友（最多可添加2个好友）</span>
                        </div>
                    </div>

                    <div class="fdsList2">
                        <h2 style="font-size: 1em;"><b>在线成员</b></h2>
                        <div style="float:left; width:250px;">
                            <div style="float:left;">
                                <a href="#"><img  style="position:relative; z-index:2;" src="../../image/onlineMember.png" /></a>
                            </div>
                            <ul style="position:relative; top:-9px; left: 3px; list-style-type:none;">
                                <li><a href="#"><b>陌忆心LL</b></a></li>
                                <li>测试</li>
                                <li><a href="#"><span style="color: #999;">加为好友</span></a></li>
                            </ul>
                        </div>
                    </div>

                    <div class="fdsList3">
                        <div style="margin: 20px 0 0 0;position: relative; left: -10px;">
                            <div class="fdsList3h3" style="border:1px solid #CDCDCD; width: 220px; height: 29px;">
                                <h3>查找好友</h3>
                            </div>
                            <div style="background:#FFF; border:1px solid #CDCDCD; width: 240px; height: 41px; line-height: 40px;border-top: none;">
                                <input type="text" size ="20" style="position: relative; left: 5px;" />
                                <button style="position: relative; left: 5px;">搜索</button>
                            </div>
                        </div>

                        <div style="margin: 20px 0 0 0;position: relative; left: -10px;">
                            <div class="fdsList3h3" style="border:1px solid #CDCDCD; width: 220px; height: 29px;">
                                <h3>在游戏中找不到自己的好友？</h3>
                            </div>
                            <div style="background:#FFF; border:1px solid #CDCDCD; width: 240px; height: 71px; line-height: 40px;border-top: none; text-align: center;">
                                请点击下面的按钮，将好友信息同步到里面
                                <button style="position: relative; top: -10px;">刷新好友信息</button>
                            </div>
                        </div>

                        <div style="margin: 20px 0 0 0;position: relative; left: -10px;">
                            <div class="fdsList3h3" style="border:1px solid #CDCDCD; width: 220px; height: 29px;">
                                <h3>好友分组 <span style="position: relative; left: 122px;">批量分组</span></h3>
                            </div>
                            <div style="background:#FFF; border:1px solid #CDCDCD; width: 240px; height: 71px; line-height: 40px;border-top: none; text-align: center;  height: 294px;">
                                <img src="../../image/ls1.png" style="position: relative; top:14px; left: 0px; width:233px;" />
                            </div>
                        </div>
                   </div>
                 </div>
                <%--当前在线的好友--%>
                <div id="onlineFriends">
                    <div class="fdsList1">
                        <div>
                            <br />
                            这些好友当前在线，赶快去拜访一下吧
                        </div>
                    </div>

                    <div class="fdsList2">
                        <br />
                        没有相关用户列表
                    </div>

                    <div class="fdsList3">
                   </div>
                </div>
                <%--在线成员--%>
                <div id="onlineMember">
                    <div class="fdsList1">
                        <div>
                            <br />
                            显示当前全部在线的用户
                        </div>
                    </div>

                    <div class="fdsList2">
                        <br />
                        <%--<img src="../../image/ls2.png" />--%>
                            <a href="#"><img  style="position:relative; left:0px; top:0px; border:2px solid #FFF;" src="../../image/onlineMember.png" /></a>
                        <ul style="position:relative; top:-70px; left:30px; list-style-type:none;">
                            <li><a href="#"><b>请叫我小新</b></a><span style="color: #999; position:relative; left:73px; top:0px;">10:21</span></li>
                            <li>网页网址读错了吧</li>
                        </ul>
                   </div>

                    <div class="fdsList3">
                   </div>
                </div>
                <%--就在我附近的朋友--%>
                <div id="nearFriends">
                    <div class="fdsList1">
                        <div>
                            <br />
                            通过系统匹配，这些朋友就在您附近，您可能认识他们 
                        </div>
                    </div>

                    <div class="fdsList2">
                        <br />
                        没有相关用户列表
                    </div>

                    <div class="fdsList3">
                   </div>
                </div>
                <%--我的访客--%>
                <div id="myVisitor">
                    <div class="fdsList1">
                        <div>
                            <br />
                            他们拜访过您，回访一下吧 
                        </div>
                    </div>

                    <div class="fdsList2">
                        <br />
                        没有相关用户列表
                    </div>

                    <div class="fdsList3">
                   </div>
                </div>
                <%--我的足迹--%>
                <div id="myFootprint">
                    <div class="fdsList1">
                        <div>
                            <br />
                            您曾经拜访过的用户列表
                        </div>
                    </div>

                    <div class="fdsList2">
                        <br />
                        没有相关用户列表
                    </div>

                    <div class="fdsList3">
                   </div>
                </div>
                <%--我的黑名单--%>
                <div id="blackList">
                    <div class="fdsList1">
                        <div>
                            <br />
                            加入到黑名单的用户，将会从您的好友列表中删除。同时，对方将不能进行与您相关的打招呼、踩日志、加好友、评论、留言、短消息等互动行为
                            <br />
                        </div>
                    </div>

                    <div class="fdsList2">
                        <br />
                        <%--<img src="../../image/ls4.png" style="position:relative; left:-10px;"/>--%>
                        <span style="font-size: 13px; font-weight: 600;">添加黑名单用户</span>
                        <div style="background:#FFECEC;width: 780px; height: 53px;border: 1px solid rgb(255, 204, 204); line-height: 50px;">
                            <table>
                                <tr><th style="width: 135px; text-align: left;">用户名</th><td><input type="text" size="50" style=" -moz-box-shadow:inset 5px 5px 10px #06c; -webkit-box-shadow: inset 5px 5px 10px #06c; box-shadow: inset 5px 5px 10px #06c;" /> <button>添加</button></td></tr>
                            </table>
                        </div>
                        <br /><br />
                        没有相关用户列表
                    </div>

                    <div class="fdsList3">
                   </div>
                </div>
        </div>
            <%--查找好友--%>
            <div id="searchFriends">
                <%--查找列表--%>
                <div class="searchList"">
                    <ul>
                        <li><a href="#">查找男女朋友</a></li>
                        <li><a href="#">查找同城的人</a></li>
                        <li><a href="#">查找老乡</a></li>
                        <li><a href="#">查找同年同月同日生的人</a></li>
                        <li><a href="#">高级方式查找</a></li>
                    </ul>
                </div>

                
                <%--查找男女朋友--%>
                <div id="sea1">
                    <div class="sea">
                        <h2>查找男女朋友</h2>
                    </div>
                    <div id="sea1-2">
                        <table>
                            <tbody>
                                <tr>
                                    <th style="width:135px;">&nbsp;性别：</th>
                                    <td><select>
                                        <option value = "0">任意</option>
                                        <option value = "1">男</option>
                                        <option value = "2">女</option>
                                        </select></td>
                                </tr>
                                 <tr>
                                    <th>&nbsp;年龄段</th>
                                    <td><input type="text" size="10" style="width: 124px;" /> ~ <input type="text" size="10" style="width: 124px;" /></td>
                                </tr>
                                 <tr>
                                    <th>&nbsp;上传头像</th>
                                    <td><input type="checkbox" />已经上传头像</td>
                                </tr>
                                 <tr>
                                    <th>&nbsp;用户名</th>
                                    <td><input type="text" style="width: 340px;" /></td>
                                </tr>
                                 <tr>
                                    <th>&nbsp;</th>
                                    <td><button type="submit">查找</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%--查找同城的人--%>
                <div id="sea2">
                    <div class="sea">
                        <h2>查找同城的人</h2>
                    </div>
                    <div id="sea2-2">
                        <table>
                            <tbody>
                                <tr>
                                    <th style="width:135px;">&nbsp;居住地：</th>
                                    <td><select>
                                        <option value = "0">-省份-</option>
                                        <option value = "1">北京市</option>
                                        <option value = "2">天津市</option>
                                        <option value = "3">河北市</option>
                                        <option value = "4">山西市</option>
                                        <option value = "5">内蒙古自治区</option>
                                        <option value = "6">辽宁省</option>
                                        <option value = "7">吉林省</option>
                                        <option value = "8">黑龙江省</option>
                                        <option value = "9">上海市</option>
                                        <option value = "10">江苏省</option>
                                        </select></td>
                                </tr>
                                 <tr>
                                    <th>&nbsp;用户名</th>
                                    <td><input type="text" style="width: 340px;" /></td>
                                </tr>
                                 <tr>
                                    <th>&nbsp;</th>
                                    <td><button type="submit">查找</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%--查找老乡--%>
                <div id="sea3">
                    <div class="sea">
                        <h2>查找老乡</h2>
                    </div>
                    <div id="sea3-2">
                        <table>
                            <tbody>
                                <tr>
                                    <th style="width:135px;">&nbsp;出生地：</th>
                                    <td><select>
                                        <option value = "0">-省份-</option>
                                        <option value = "1">北京市</option>
                                        <option value = "2">天津市</option>
                                        <option value = "3">河北市</option>
                                        <option value = "4">山西市</option>
                                        <option value = "5">内蒙古自治区</option>
                                        <option value = "6">辽宁省</option>
                                        <option value = "7">吉林省</option>
                                        <option value = "8">黑龙江省</option>
                                        <option value = "9">上海市</option>
                                        <option value = "10">江苏省</option>
                                        </select></td>
                                </tr>
                                 <tr>
                                    <th>&nbsp;用户名</th>
                                    <td><input type="text" style="width: 340px;" /></td>
                                </tr>
                                 <tr>
                                    <th>&nbsp;</th>
                                    <td><button type="submit">查找</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%--查找同年同月同日生的人--%>
                <div id="sea4">
                    <div class="sea">
                        <h2>查找同年同月同日生的人</h2>
                    </div>
                    <div id="sea4-2">
                        <%--<img src="../../image/sea4-2.png" style="position:relative; left:-10px;" />--%>
                        <table>
                            <tbody>
                                <tr>
                                    <th style="width:135px;">&nbsp;生日：</th>
                                    <td><select><option>&nbsp;</option></select>年<select><option>&nbsp;</option></select>月<select><option>&nbsp;</option></select>日</td>
                                </tr>
                                 <tr>
                                    <th>&nbsp;用户名</th>
                                    <td><input type="text" style="width: 340px;" /></td>
                                </tr>
                                 <tr>
                                    <th>&nbsp;</th>
                                    <td><button type="submit">查找</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%--高级方式查找--%>
                <div id="sea5">
                    <div class="sea">
                        <h2>高级方式查找</h2>
                    </div>
                    <div id="sea5-2">
                        <%--<img src="../../image/sea5-2.png" style="position:relative; left:-7px;" />--%>
                        <table>
                            <tbody>
                                <tr>
                                    <th>&nbsp;用户名</th>
                                    <td><input type="text" style="width: 340px;" /><input type="checkbox" />精确搜索</td>
                                </tr>
                                <tr>
                                    <th>&nbsp;用户UID</th>
                                    <td><input type="text" style="width: 340px;" /></td>
                                </tr>
                                <tr>
                                    <th style="width:135px;">&nbsp;性别：</th>
                                    <td><select>
                                        <option value = "0">任意</option>
                                        <option value = "1">男</option>
                                        <option value = "2">女</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <th>&nbsp;年龄段</th>
                                    <td><input type="text" size="10" style="width: 124px;" /> ~ <input type="text" size="10" style="width: 124px;" /></td>
                                </tr>
                                <tr>
                                    <th>&nbsp;上传头像</th>
                                    <td><input type="checkbox" />已经上传头像</td>
                                </tr>
                                <tr>
                                    <th style="width:135px;">&nbsp;居住地：</th>
                                    <td><select>
                                        <option value = "0">-省份-</option>
                                        <option value = "1">北京市</option>
                                        <option value = "2">天津市</option>
                                        <option value = "3">河北市</option>
                                        <option value = "4">山西市</option>
                                        <option value = "5">内蒙古自治区</option>
                                        <option value = "6">辽宁省</option>
                                        <option value = "7">吉林省</option>
                                        <option value = "8">黑龙江省</option>
                                        <option value = "9">上海市</option>
                                        <option value = "10">江苏省</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <th style="width:135px;">&nbsp;出生地：</th>
                                    <td><select>
                                        <option value = "0">-省份-</option>
                                        <option value = "1">北京市</option>
                                        <option value = "2">天津市</option>
                                        <option value = "3">河北市</option>
                                        <option value = "4">山西市</option>
                                        <option value = "5">内蒙古自治区</option>
                                        <option value = "6">辽宁省</option>
                                        <option value = "7">吉林省</option>
                                        <option value = "8">黑龙江省</option>
                                        <option value = "9">上海市</option>
                                        <option value = "10">江苏省</option>
                                        </select></td>
                                </tr>
                                <tr>
                                    <th style="width:135px;">&nbsp;生日：</th>
                                    <td><select><option>&nbsp;</option></select>年<select><option>&nbsp;</option></select>月<select><option>&nbsp;</option></select>日</td>
                                </tr>
                                <tr>
                                    <th>&nbsp;真实姓名</th>
                                    <td><input type="text" style="width: 340px;" /></td>
                                </tr>
                                <tr>
                                    <th>&nbsp;年级</th>
                                    <td><input type="text" style="width: 340px;" /></td>
                                </tr>
                                <tr>
                                    <th>&nbsp;专业</th>
                                    <td><input type="text" style="width: 340px;" /></td>
                                </tr>
                                 <tr>
                                    <th>&nbsp;</th>
                                    <td><button type="submit">查找</button></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
               
            </div>
            <%--可能认识的人--%>
            <div id="mayKnow">
                <div>
                    <br />
                       <h2 style="font-size: 1em;"><b> &nbsp;&nbsp;他们当前正在线，加为好友就可以互动啦 </b></h2>
                    <br />

                     <div style="position:relative; top:0px; left:136px;">
                        <div>
                            <a href="#"><img  style="position:relative; left:-110px; top:-5px; border:2px solid #FFF;" src="../../image/noavatar_small.gif" /></a>
                        </div>
                        <ul style="position:relative; top:-70px; left:-50px; list-style-type:none;">
                            <li><a href="#"><b>144115060027</b></a></li>
                            <li><a href="#"><img src="../../image/plus.png" /><span style="color: #999;">加为好友</span></a></li>
                        </ul>
                        </div>
                    </div>
            </div>
            <%--好友请求--%>
            <div id="fdsRequest">
                <img src="../../image/fdsRequest.png" />
            </div>
            <%--好友分组--%>
            <div id="group">
                <img src="../../image/group.png" />
            </div>
        </div>
    <script src="../../Jscript/friend.js"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="FriendContentTtitle" runat="server">
</asp:Content>
