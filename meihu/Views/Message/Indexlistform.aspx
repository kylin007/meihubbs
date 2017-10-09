 <%@ Page Title="" Language="C#" MasterPageFile="~/Views/Message/Message.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<asp:Content ID="Content2" ContentPlaceHolderID="CTtitle" runat="server">
    发送消息
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="subcontent1" runat="server">
    <script src="../../Jscript/jquery-2.2.0.min.js"></script>
     <script>
         window.setInterval("settingscore()", 50);
         ////好友列表按钮的 关闭
         function S_fun() {
             $("#selectfriendsIDg a")[0].onclick = function gun() {
                 document.getElementById('selectfriendg').style.display = 'block';
             }
             $("#Buttonfriendgs")[0].onclick = function gun2() {
                 document.getElementById('selectfriendg').style.display = 'none';
             }

             $("#selectfriendsID a")[0].onclick = function () {
                 document.getElementById('selectfriends').style.display = 'block';
             }
             $("#Buttonselectfriends")[0].onclick = function () {
                 document.getElementById('selectfriends').style.display = 'none';
             }
         }
         //消息栏中分别显示 私人消息 ，群聊等（即隐藏其所有他的，只显示当前的）
         function settingscore() {
             S_fun();
             var dom = document.getElementById('M-message2');
             var td = dom.getElementsByTagName('td');
             var tdclass = document.getElementsByClassName("M-mg0class");
             for (var i = 0; i < td.length; i++) {
                 td[i].index = i;
                 td[i].onclick = function fun() {
                     $("#M-message2 td").slice(0, 3).removeClass("tdcurrent")
                     $("#M-message2 td").eq(this.index).addClass("tdcurrent");
                     for (var j = 0; j < tdclass.length; j++) {
                         tdclass.item(j).style.display = 'none';
                     }
                     tdclass.item(this.index).style.display = 'block';
                 };
             }
         }
    </script>
    <form runat="server">
    <div id="MS-mg">

       <div class="M-message2" id="M-message2">
        <table>
            <tr>
                 <td><a href="#">私人消息</a></td>
                 <td class="tdcurrent"><a href="#">群聊</a></td>
                
                  <td style="padding-left:600px;" ><a href="/Message/Indexmessage">返回列表</a></td>
            </tr>
        </table>
    </div>
        <div id="M-mg0" class="M-mg0class" style="display:none;">
            <div class="M-mg0sub0">
         <table>
              <tr><td style="padding-bottom:24px; width:140px;">收件人:</td>
               <td  style="width:400px;">   <asp:TextBox ID="TextBoxreive_user" runat="server" Width="400px" Height="21px" style="margin-top: 0px"></asp:TextBox><br />
                  多个用户使用逗号、分号或回车提示系统分开 </td>
                <td style="padding-bottom:24px; width:80px;"  id="selectfriendsIDg"><a href="#"><b >选择好友 &nbsp;<img style="padding-bottom:4px;" src="../../image/arrwd.gif" /></b></a></td></tr>
         </table>
              <div id="selectfriendg" style="display:none">
                         <div class="selectfriends1">
                             <asp:DropDownList ID="DropDownList1" runat="server" style="left:0px; top:-80px; position:relative;" onchange="Kfriend(this.value)">
                                 <asp:ListItem>全部好友</asp:ListItem>
                                  <asp:ListItem>其他</asp:ListItem>
                                  <asp:ListItem>通过本站认识</asp:ListItem>
                                  <asp:ListItem>通过活动认识</asp:ListItem>
                                  <asp:ListItem>通过朋友认识</asp:ListItem>
                                  <asp:ListItem>亲人</asp:ListItem>
                                  <asp:ListItem>同事</asp:ListItem>
                                   <asp:ListItem>同学</asp:ListItem>
                                  <asp:ListItem>不认识</asp:ListItem>
                             </asp:DropDownList>
                         </div>
                        <div class="selectfriends2" id="friendid">
                      <%-- <% @Ajax.ActionLink("点我你就会看到你的好友", "friends", new AjaxOptions { HttpMethod = "post", UpdateTargetId = "friendid", InsertionMode = InsertionMode.Replace }); %>--%>
                            <div id="friend" class="friendclass">
            <ul>
       
          <%  List<meihu.Models.Goodfriend> model = ViewBag.userfriend as List<meihu.Models.Goodfriend>;
        
              for(var i=0;i< model.Count;i++)
            {%>
               <li><a onclick="gettext(this)"><%= model[i].goodname%></a></li>
            <%}
            %>
     </ul>
</div>
                         </div>
                        <div class="selectfriends3">
                                <input type="button"  id="Buttonfriendgs"  style="height:20px;" value="关闭""/>                         
                       </div>
                   </div>
          </div>
            <div class="M-mg0sub1">
                 
                 <div>
                     <div class="subleft">
                         内容：
                     </div>
                       <div class="subright">
                          <div class="subright1">
                          <table>
                              <tr style="height:20px"><td><div class="sub0"></div></td><td><div class="sub1"></div></td><td style="width:20px;"><div class="sub2"></div></td><td style="width:20px;"><div class="sub3"></div></td><td><div class="sub4"></div></td><td><div class="sub5"></div></td><td><div class="sub6"></div></td></tr>
                            </table></div>
                         <div class="subright0">
                             <textarea id="TextAreatext" style="width: 393px; height: 151px"></textarea>
                         </div>
                     </div>
                 </div>
            </div>
           <div class="M-mg0sub2">
                     <input  type="button"  id="Buttonrecive"  value="发送" onclick="friendsend()"/>     
             </div>
            
        </div>
         <div id="M-mg1" class="M-mg0class" style="display:block;" >
                <div class="M-mg0sub4">
                    <table>
                        <tr><td>标题</td><td><asp:TextBox ID="TextBoxtitle" runat="server" Width="398px" Height="17px" style="margin-top: 0px; margin-left: 117px;"></asp:TextBox></td></tr>
                    </table>
                    </div>
               <div class="M-mg0sub01">
         <table>
              <tr><td style="padding-bottom:24px; width:140px;">参与人:</td>
               <td  style="width:400px;">   <asp:TextBox ID="TextBoxjoin" runat="server" Width="400px" Height="17px" style="margin-top: 0px; margin-left: 4px;"></asp:TextBox><br />
                  多个用户使用逗号、分号或回车提示系统分开 </td>
                <td style="padding-bottom:24px; width:80px;" id="selectfriendsID"><a href="#"><b >选择好友 &nbsp;<img style="padding-bottom:4px;" src="../../image/arrwd.gif" /></b></a></td></tr>
         </table>
                       <div id="selectfriends" style="display:none">
                         <div class="selectfriends1">
                             <asp:DropDownList ID="DropDownListfriend" runat="server" style="left:0px; top:-62px; position:relative;" onchange="Kfriends(this.value)">
                                 <asp:ListItem>全部好友</asp:ListItem>
                                  <asp:ListItem>其他</asp:ListItem>
                                  <asp:ListItem>通过本站认识</asp:ListItem>
                                  <asp:ListItem>通过活动认识</asp:ListItem>
                                  <asp:ListItem>通过朋友认识</asp:ListItem>
                                  <asp:ListItem>亲人</asp:ListItem>
                                  <asp:ListItem>同事</asp:ListItem>
                                   <asp:ListItem>同学</asp:ListItem>
                                  <asp:ListItem>不认识</asp:ListItem>
                             </asp:DropDownList>
                         </div>
                        <div class="selectfriends2">
             <div id="friends" class="friendclass">
            <ul>
       
          <%  List<meihu.Models.Goodfriend> models = ViewBag.userfriend as List<meihu.Models.Goodfriend>;
        
              for(var i=0;i< models.Count;i++)
            {%>
               <li ><a onclick="gettexts(this)"><%= models[i].goodname%></a></li>
            <%}
            %>
     </ul>  </div>
                         </div>
                        <div class="selectfriends3">
                              <input type="button" style="height:20px;"  id="Buttonselectfriends"  value="关闭""/>     
                       </div>
                   </div>
          </div>
            <div class="M-mg0sub1">
                 <div>
                     <div class="subleft">
                         内容：
                     </div>
                       <div class="subrights">
                          <div class="subright1">
                          <table>
                              <tr style="height:20px"><td><div class="sub0"></div></td><td><div class="sub1"></div></td><td style="width:20px;"><div class="sub2"></div></td><td style="width:20px;"><div class="sub3"></div></td><td><div class="sub4"></div></td><td><div class="sub5"></div></td><td><div class="sub6"></div></td></tr>
                            </table></div>
                         <div class="subright0">
                             <textarea id="TextAreatext0" style="width: 393px; height: 122px"></textarea>
                         </div>
                     </div>
                 </div>
            </div>
           <div class="M-mg0sub2">
               <input  type="button" id="Buttonfriendid"  value="发送" onclick="friendsends()"/>
           </div>
            
         </div>
  </div></form>
</asp:Content>

