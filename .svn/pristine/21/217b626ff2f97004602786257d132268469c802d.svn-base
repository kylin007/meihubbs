<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Setting/SettingSet.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderTtitle" runat="server">
    隐私筛选
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="subcontent" runat="server">
   <form runat="server">
     <script>
         function scrolls() {
             var dom = $("#S-right").innerHeight() + 2;
             if (dom < 348) {
                 dom = 348;
             }
             document.getElementById("S-center").style.height = dom + "px";
             document.getElementById("S-left").style.height = dom + "px";

         }
         window.setInterval("scrolls()", 50);
         $(document).ready(function settingscore() {
           
         })

        window.onload = function settingscore() {
            $("#S-left tr").eq(4).removeClass("current");
            $("#S-left tr").eq(4).removeClass("current1").addClass("current");
            var dom = document.getElementById('S-screen');
            var td = dom.getElementsByTagName('td');
            var tdclass = document.getElementsByClassName("S-screenclass");
            for (var i = 0; i < td.length; i++) {
                td[i].index = i;
                td[i].onclick = function fun() {
                    for (var j = 0; j < tdclass.length; j++) {
                        tdclass.item(j).style.display = 'none';
                    }
                    tdclass.item(this.index).style.display = 'block';
                };
            }
        }
    </script>
<div id="SS-screen">
    <div id="S-screen">
    <table>
        <tr><td><a href="#">个人隐私设置</a></td><td><a href="#">个人动态发布设置</a></td><td><a href="#">动态赛选</a></td></tr>
    </table>
     </div>
      

    <div id="S-screen0" style="display:none" class="S-screenclass">
        <div>
            <div class="screen0">
                您可以完全控制哪些人可以看到您的主页上面的内容
            </div>
            <div class="screen1">
                <table>
                    <tr><td>
好友列表</td><td>
    <asp:DropDownList ID="DropDownListfriend" runat="server" Height="18px" Width="150px">
        <asp:ListItem>公开</asp:ListItem>
        <asp:ListItem>好友可见</asp:ListItem>
        <asp:ListItem>保密</asp:ListItem>
        <asp:ListItem>仅注册用户可见</asp:ListItem>
                            </asp:DropDownList></td></tr>
                      <tr><td>动态</td><td>
                          <asp:DropDownList ID="DropDownListaction" runat="server" Height="16px" Width="151px">
                               <asp:ListItem>公开</asp:ListItem>
        <asp:ListItem>好友可见</asp:ListItem>
        <asp:ListItem>仅注册用户可见</asp:ListItem>
                          </asp:DropDownList></td></tr>
                      <tr><td colspan="2" style="padding-left:98px;">
                          <input type="button"  id="Buttonscreen" value="保存"/>
                          </td></tr>
                </table>
            </div>
        </div>

    </div>
     <div id="S-screen1" style="display:none" class="S-screenclass">
         <div class="S-sc0">
             系统会将您的各项动作反映到个人动态里，方便朋友了解您的动态。<br />
您可以控制是否在下列动作发生时，在个人动态里发布相关信息
         </div>
        <div class="S-sc1">
            <table>
                <tr><td>
                    <asp:CheckBox ID="CheckBoxjilu" runat="server" /></td><td>记录</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxzhuan" runat="server" /></td><td>撰写日志</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxcimag" runat="server" /></td><td>上传图片</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxaddshare" runat="server" /></td><td>添加分享</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxaddfri" runat="server" /></td><td>添加好友</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxcomment" runat="server" /></td><td>发表评论/留言</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxsank" runat="server" /></td><td>竞价排名</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxscorea" runat="server" /></td><td>积分消费</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxintro" runat="server" /></td><td>邀请好友</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxchieve" runat="server" /></td><td>完成任务</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxupda" runat="server" /></td><td>更新个人资料</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxlog" runat="server" /></td><td>对日志/图片表态</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxluntan" runat="server" /></td><td>论坛发帖</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxhuitie" runat="server" /></td><td>论坛回帖</td></tr>
                  <tr><td colspan="2" rowspan="8">
                          <asp:Button ID="Buttonscreen1" runat="server" Text="保存" style="background-color:rgb(153, 0, 0); color:white" Height="26px" Width="52px"/></td></tr>

            </table>
        </div>
     </div> 
  
     <div id="S-screen2" style="display:block" class="S-screenclass"> 
         <div class="foo0">             
<b style="font-size:13px; font-weight:600;">筛选规则一：屏蔽指定用户组的动态</b><br />
您可以决定屏蔽哪些用户组的动态，屏蔽用户组内的组员所发布的动态都将被屏蔽掉(仅限查看好友的动态时生效)
         </div>
         <div class="foo1">
             <table>
                <tr><td><asp:CheckBox ID="CheckBoxscreenother" runat="server" /></td><td>其他</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxscreeben" runat="server" /></td><td>通过本站认识</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxscreeactivity" runat="server" /></td><td>通过活动认识</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxscreefriend" runat="server" /></td><td>通过朋友认识</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxscreeactive" runat="server" /></td><td>亲人</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxscreetonghsi" runat="server" /></td><td>同事</td></tr>
                  <tr><td><asp:CheckBox ID="CheckBoxscreestudent" runat="server" /></td><td>同学</td></tr>
                   <tr><td><asp:CheckBox ID="CheckBoxscreenotshi" runat="server" /></td><td>不认识</td></tr>
                 <tr><td colspan="2" style="padding-top:12px;" >
                          <asp:Button ID="Button1" runat="server" Text="保存" style="background-color:rgb(153, 0, 0); color:white" Height="26px" Width="52px"/></td></tr>
             </table>
         </div>
         <div class="foo2">
             <span>
                 您可以在自己的<b><a href="#">好友列表中</a></b>，对好友进行分组，并可以对用户组进行改名
             </span>
         </div>

         <div class="foo3">
             
  <b style="font-size:13px;">筛选规则二：屏蔽指定好友指定类型的动态</b><br /><br />
点击一下首页好友动态列表后面的屏蔽标志，就可以屏蔽指定好友指定类型的动态了。<br />
下面列出的是您已经屏蔽的动态类型识别名和好友名，您可以选择是否取消屏蔽。<br /><br />
 	<span style="padding-left:120px">现在还没有屏蔽的动态类型</span>
         </div>
         <div class="foo4">
             
<b style="font-size:13px;">
筛选规则三：屏蔽指定好友指定类型的提醒</b><br /><br />
点击一下通知列表后面的屏蔽标志，就可以屏蔽指定好友指定类型的通知了。<br />
下面列出的是您已经屏蔽的通知类型和好友名，您可以选择是否取消屏蔽<br /><br />
 	<span style="padding-left:120px">现在还没有屏蔽的动态类型</span>
         </div>

     </div>
  
  
 </div>
</form>
</asp:Content>
