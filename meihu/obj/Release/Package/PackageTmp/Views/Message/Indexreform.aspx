<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Message/Message.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content2" ContentPlaceHolderID="CTtitle" runat="server">
    提醒
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="subcontent1" runat="server">

    <script>

        $(document).ready(function settingscore() {
       
        })
        window.onload = function settingscore() {
          
            $("#S-mesleft1ID tr").eq(1).removeClass("current");
            $("#S-mesleft1ID tr").eq(1).removeClass("current1").addClass("current");
                var doms = document.getElementById('SR-reform');
                var tds = doms.getElementsByTagName('td');
                var tdclassrefrom= document.getElementsByClassName("reformclass");
                for (var i = 0; i < tds.length; i++) {
                    tds[i].index = i;
                    tds[i].onclick = function fun() {
                        $("#SR-reform td").slice(0, 3).removeClass("tdcurrent")
                        $("#SR-reform td").eq(this.index).addClass("tdcurrent");

                        for (var j = 0; j < tdclassrefrom.length; j++) {
                            tdclassrefrom.item(j).style.display = 'none';
                        }
                        tdclassrefrom.item(this.index).style.display = 'block';
                    };
                }
            var dom = document.getElementById('subreform_sub');
            var td = dom.getElementsByTagName('a');
            var tdclass = document.getElementsByClassName("sub0");
            for (var i = 0; i < td.length; i++) {
                td[i].index = i;
                td[i].onclick = function fun() {
                    $("#subreform_sub td").slice(0, 2).removeClass("tdcurrent")
                    $("#subreform_sub td").eq(this.index).addClass("tdcurrent");
                    for (var j = 0; j < tdclass.length; j++) {
                        tdclass.item(j).style.display = 'none';
                    }
                    tdclass.item(this.index).style.display = 'block';
                };
            }
        }

    </script>
    <div id="R-reform">
     <div class="Rtop" id="SR-reform">
        <table>
            <tr>
                <td class="tdcurrent"><a href="#" >提醒</a></td>
                 <td><a href="#">应用消息</a></td>
                  <td style="padding-left:590px;" ><a href="#">筛选设置</a></td>
            </tr>
        </table>
    </div>
        <div id="reform0" class="reformclass">

            <div id="subreform">
               <div class="subreform_sub" id="subreform_sub"> <span><b><a href="#">未读提醒</a></b>| <a href="#">已读提醒</a></span><span style="padding-left:355px;">当您感觉有些通知对您造成骚扰时，请点击右侧小图标进行屏蔽</span> </div>
                <div class="sub0" id="sub0" style="display:none;">
                    <div class="text-sub"><a href="#">暂时没有新提醒</a>，<b><a href="#">点此查看已读提醒</a></b></div>
                </div>
               <div class="sub0" id="sub1"style="display:none;">
                   <table>
                       <tr><td rowspan="2">
                           <img src="../../image/use_model_img.png" /> </td><td>
                           <asp:Label ID="Label_usernametime" runat="server" Text="2016-7-7 08:55"></asp:Label></td></tr>
                       <tr ><td >您的用户组升级为 初入江湖   看看我能做什么 ›</td></tr>
                      </table>
                   <hr style="border:0.5px dashed #CDCDCD; width:800px;"/>
                   <table>
                       <tr><td rowspan="2">
                           <img src="../../image/use_model_img.png" /> </td><td>
                           <asp:Label ID="Label_username1" runat="server" Text="2016-7-7 08:55"></asp:Label></td></tr>
                       <tr><td >您发表的主题 新人的郁闷 已审核通过！   查看 ›</td></tr>
                   </table>
                    <hr style="border:0.5px dashed #CDCDCD;width:800px;"/>
               </div>
              
            </div>
        </div>
        <div id="reform1" class="reformclass">
           
            <div class="rereformsub" id="rereformsub2" >
                 <% 
                     List<meihu.Models.Goodfriend> item= (List<meihu.Models.Goodfriend>)ViewBag.introduce;
                     for(var i=0;i<item.Count;i++)
                     {%>
                 <table>
                   <tr><td><label class="getfriname"><%=item[i].friendname %></label>&nbsp;请求 &nbsp;您 &nbsp;加为好友</td> <td style="text-align:left;width:300px;">&nbsp;发送信息:<label><%=item[i].freiendmessage %></label></td></tr>               
                   <tr><td colspan="2"><input class="friclass1get"  type="button" value="同意" style="width:45px;height:20px;" "/>&nbsp;&nbsp;<input class="friclasspost" type="button" value="忽略" style="width:45px;height:20px;" /></td></tr>
               </table>
                <hr style="border:0.5px dotted #CDCDCD ;width:700px;margin:0 auto;" />
                     <%}
                 %>
              
            </div>
            <div class="rereformsub" style="display:none;" id="rereformsub1">没有新的应用请求或邀请</div>
        </div>
        </div>
</asp:Content>
