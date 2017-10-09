<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div id="fwin_showmess" class="fwinmask" initialized="true" style="position: fixed; z-index: 201; left: 583.5px; top: 105px; display:none;" >
    <style type="text/css">object {visibility:hidden;}</style>
        <table class="fwin_show" >
            <tbody>
                <tr>
                    <td class="t_l"></td>
                    <td style="cursor:move" class="t_c" id="chagauto"></td> <%--class="t_c" 由于冲突被我删掉，但不影响界面--%>
                    <td class="t_r"></td>
                </tr>
                <tr>
                    <td class="m_l" style="cursor:move">&nbsp;&nbsp;</td>
                    <td class="m_c" style="">
                    <div class="pm">
                        <h3 id="fctrl_show" class="flb" style="cursor:move">
                            <em>正在与</em>
                                <%
                                    if(ViewData["stackholder"]!=null)
                                    {
                                        foreach(var stakerholder in ViewData["stackholder"] as Dictionary<string,string>)
                                        {
                                            if(stakerholder.Key =="用户名")
                                            {%>
                                                <%= stakerholder.Value %>  
                                            <%} 
                                         }
                                   }%>

                                <span class="onlyf">&nbsp 聊天中……[在线]</span>
                            <span class="close1"><a class="flbc" href="javascript:;" title="关闭" onclick="Quit(2)">关闭</a></span>
                        </h3>
                        <div class="pm_tac bbda cl">
                            <a class="y sbsky" href="javascript:;" target="_blank">查看与<span class="frinam"></span><%
                                     if(ViewData["stackholder"]!=null)
                                     {
                                         foreach(var stakerholder in ViewData["stackholder"] as Dictionary<string,string>)
                                         {
                                             if(stakerholder.Key =="用户名")
                                             {%>
                                               <%= stakerholder.Value %>
                                             <%} 
                                         }
                                   }%>的聊天记录</a>
                            <a href="javascript:;" target="_blank" id="adher">访问<span class="frinam"></span>
                                <% if(ViewData["stackholder"]!=null)
                                   {
                                       foreach(var stakerholder in ViewData["stackholder"] as Dictionary<string,string>)
                                       {
                                           if(stakerholder.Key =="用户名")
                                           {%>
                                               <%= stakerholder.Value %>
                                           <%} 
                                        }
                                   }%>的空间</a>
                        </div>
                        <div class="c">
                            <ul id="msglist" class="pmb">
                               
                            </ul>
                            <div class="pmfm">
                                 <div id="return_showMsgBox" class="xi1" style="margin-bottom:5px;"></div>
                                <div class="tedt">
                                    <div class="bar">   
                                        <div class="fpd">
                                            <a class="fbld" title="文字加粗">B</a>
                                            <a id="pmforecolor" class="fclr" href="javascript:;" title="设置文字颜色" onclick="showColorBox(this.id, 2, 'pm');doane(event);">Color</a>
                                            <a id="pmimg" class="fmg" href="javascript:;" title="图片">Image</a>
                                            <a id="pmurl" class="flnk" href="javascript:;" title="添加链接">Link</a>
                                            <a id="pmquote" class="fqt" href="javascript:;" title="引用">Quote</a>
                                            <a id="pmcode" class="fcd" href="javascript:;" title="代码" onclick="seditor_menu('pm', 'code');doane(event);">Code</a>
                                            <a id="pmsml" class="fsml" href="javascript:;" onclick="showMenu({'ctrlid':this.id,'evt':'click','layer':2});return false;">Smilies</a>
                                        </div>
                                    </div><%-- bar --%>
                                    <div class="area">
                                        <textarea id="pmmessage" class="pt" rows="3" cols="80" name="message"></textarea>
                                        <input id="messageappend" name="messageappend" value="" type="hidden"/>
                                       
                                    </div><%--area --%>
                                </div>
                                <div class="mtn pns cl">
                                    <button id="pmsubmit_btn" class="pn pnc sedofpost" type="submit" onclick="sentqf()"><strong>发送</strong></button>
                                <a href="javascript:;" title="刷新" onclick="reset()">
                                    <img class="vm" src="../../image/pm-ico5.png" />
                                    刷新
                                </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    </td>
                    <td class="m_r" style="cursor:move" ></td>
                </tr>
                <tr>
                    <td class="b_l"></td>
                    <td class="b_c" style="cursor:move"></td>
                    <td class="b_r"></td>
                </tr>
            </tbody>
        </table>
 </div>                 