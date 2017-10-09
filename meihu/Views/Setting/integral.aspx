﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Setting/SettingSet.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderTtitle" runat="server">
   积分
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="subcontent" runat="server">
    <form runat="server">
        <script src="../../Jscript/laydate/laydate.js"></script>
    <script>
        function fimsetting() {
            var domv = document.getElementById('I-scoresub0adc');
            var tdv = domv.getElementsByTagName('a');
            var tdclassv = document.getElementsByClassName("I-scoresubProfitclass");
            for (var i = 0; i < tdv.length; i++) {
                tdv[i].index = i;
                tdv[i].onclick = function fun() {
                    $("#I-scoresub0adc a").slice(0,2 ).removeClass("td2current");
                    $("#I-scoresub0adc a").eq(this.index).addClass("td2current");
                    for (var j = 0; j < tdclassv.length; j++) {
                        tdclassv.item(j).style.display = 'none';
                    }
                    tdclassv.item(this.index).style.display = 'block';
                };
            }
        };
        function scrolls() {
            var dom = $("#S-right").innerHeight() + 2;
            if (dom < 348) {
                dom = 348;
            }
            document.getElementById("S-center").style.height = dom + "px";
            document.getElementById("S-left").style.height = dom + "px";

        }
        window.setInterval("scrolls()", 50);
        $(document).ready(function settingscore()
        {
         
        })
        window.onload = function settingscore() {
            fimsetting();
            $("#S-left tr").eq(2).removeClass("current");
            $("#S-left tr").eq(2).removeClass("current1").addClass("current");
            var dom = document.getElementById('I-score0');
            var td = dom.getElementsByTagName('td');
            var tdclass = document.getElementsByClassName("I-scoreclass");
            for (var i = 0; i < td.length; i++) {
                td[i].index = i;
                td[i].onclick = function fun() {
                    $("#I-score0 td").slice(0, 4).removeClass("td2current");
                    $("#I-score0 td").eq(this.index).addClass("td2current");
                    for (var j = 0; j < tdclass.length; j++) {
                        tdclass.item(j).style.display = 'none';
                    }
                    tdclass.item(this.index).style.display = 'block';
                };
            } 
        }
    </script>
<div id="I-scores">
    <div id="I-score0">
          <table>
            <tr>
                 <td class="td2current"><a href="#">我的积分</a></td>
                 <td><a href="#">充值</a></td>
                 <td><a href="#">积分记录</a></td>
                 <td><a href="#">积分规则</a></td>
            </tr>
        </table>
    </div>
     <div id="I-score1" class="I-scoreclass" style="display:block;">
        <ul>
        
            <li><span>金钱: 56 郑大币</span>&nbsp;<a href="#">立即充值»</a></li>
            <li><b>积分: 7 </b>( 总积分= 主题数 + 发帖数 + 精华帖数 X 10 )</li>
        </ul>
        <div class="I-sca">
            <table>
                <tr>
                <td class="I-sc0">积分记录</td>
                <td class="I-sc1"><a href="#">查看更多»</a></td>
                </tr>
            </table>
        
        
        
        </div>
           <div class="I-sta0">
            <table>
                <tr>
                <td>操作</td>
                <td>积分变更</td>
                <td>详情</td>
                <td colspan="10" class="I-stb">变更时间</td>
                </tr>
            </table>
               <div class="I-stb0">
                    目前没有积分交易记录
               </div>
        </div>
    </div>
    <div  id="I-score2" class="I-scoreclass" style="display:none;">
        <div class="I-scor0">
            金钱: 56 郑大币
        </div>
        <div class="I-scor1">
            <table>
                <tr>
                    <td style="padding-left:20px">
支付方式</td>
                    <td style="text-align:right">
<input type="radio"  id="zhifubao"/></td>
                     <td colspan="2"><img src="../../image/zhifubao.png" /></td>
                 
                </tr>
              </table>
            </div>
         <div class="I-scor2">
           <table>
                 <tr>
                     
                    <td style="padding-bottom:55px;padding-left:20px">
充值</td>
                     <td colspan="5" style="padding-bottom:55px;padding-left: 50px;"><input type="text" value="0" id="montytext" style="width: 40px"/> &nbsp;金钱  所需 人民币<asp:Label ID="labelmontytext" runat="server" Text="0"></asp:Label> 元</td>
                    <td	 colspan="2">人民币现金 1 元 = 1 郑大币金钱<br />
单次最低充值 10 郑大币金钱<br />
单次最高充值 10000 郑大币金钱<br />
最近 30 天最高充值 50000 郑大币金钱</td>
                </tr>
                  <tr>
                    <td colspan="8"style="padding-left:162px">
                     <input  type="button"  id="ButtonRecharge" value="充值"/>
                      </td>
                </tr>
            </table>
        </div>
    </div>
    <div id="I-score3" class="I-scoreclass" style="display:none;">
        <div class="I-scoresub0">
           <ul id="I-scoresub0adc">
               <li><a href="#"><b>积分收益</b></a></li>
              <li>|</li>
                <li><a href="#">系统奖励</a></li>
           </ul>
        </div>
        <div id="I-scoresubProfit"  style="display:none" class="I-scoresubProfitclass">
        <div class="I-scoresub1">
            <table>
                <tr><td>积分:&nbsp;<asp:DropDownList ID="DropDownListscore" runat="server" Height="22px" Width="188px">
                    <asp:ListItem>不限</asp:ListItem>
                    <asp:ListItem>金钱</asp:ListItem>
                    </asp:DropDownList></td><td style="padding-left:100px">时间范围:<input id="TextBoxtime0"  type="text" style="width:100px" runat="server" class="laydate-icon" onclick="laydate()"> 至<input id="TextBoxtime1"  type="text"  runat="server" style="width:100px" class="laydate-icon" onclick="laydate()">
                                            </td></tr>
                 <tr><td>收支:&nbsp;<asp:DropDownList ID="DropDownListincome" runat="server" Height="18px" Width="188px">
                     <asp:ListItem>不限</asp:ListItem>
                     <asp:ListItem>支出</asp:ListItem>
                     <asp:ListItem>收入</asp:ListItem>
                     </asp:DropDownList></td><td style="padding-left:100px">操作:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:DropDownList ID="DropDownListoperation" runat="server" Height="20px" Width="227px"></asp:DropDownList></td></tr>
                <tr><td colspan="2" style="padding-left:62px">
                    <input  type="button" id="Buttoncheckscore" value="查询" style="font-weight:600;Height:25px ;Width:48px "/>
                   </td></tr>
            </table>
        </div>
        <div class="I-scoresub2"> 
              <table>
                <tr>
                <td>操作</td>
                <td>积分变更</td>
                <td>详情</td>
                <td colspan="10" class="I-stb">变更时间</td>
                </tr>
            </table>
        </div>
            </div>
        <div id="I-scoresubreward" style="display:block;" class="I-scoresubProfitclass">
             <table >
                <tr>
                <td>动作名称</td>
                <td>总次数</td>
                <td>周期次数</td>
                <td>金钱</td>
                <td colspan="10" class="I-stb" style="padding-right:70px;">最后奖励时间</td>
                </tr>
                  <tr>
                <td>每天登陆</td>
                 <td><asp:Label ID="Labellogintimes" runat="server" Text="14"></asp:Label></td>
                <td><asp:Label ID="Labellogincycle" runat="server" Text="1"></asp:Label></td>
                <td><asp:Label ID="Labelloginmoney" runat="server" Text="2"></asp:Label></td>
                <td colspan="10" class="I-stb"><asp:Label ID="Labellogingtime" runat="server" Text="2016-07-21 08:58"></asp:Label></td>
                </tr>
                  <tr>
                <td>发表主题</td>
                <td><asp:Label ID="Labeltitletimes" runat="server" Text="14"></asp:Label></td>
                <td><asp:Label ID="Labeltitlecycle" runat="server" Text="1"></asp:Label></td>
                <td><asp:Label ID="Labeltitlemoney" runat="server" Text="2"></asp:Label></td>
                <td colspan="10" class="I-stb"><asp:Label ID="Labeltitlegtime" runat="server" Text="2016-07-11 22:39"></asp:Label></td>
                </tr>
                  <tr>
                <td>发表回复</td>
                 <td><asp:Label ID="Labelreplytime" runat="server" Text="14"></asp:Label></td>
                <td><asp:Label ID="Labelreplycycle" runat="server" Text="1"></asp:Label></td>
                <td><asp:Label ID="Labelreplymoney" runat="server" Text="2"></asp:Label></td>
                <td colspan="10" class="I-stb"><asp:Label ID="Labelreplygtime" runat="server" Text="2016-07-07 15:51
"></asp:Label></td>
                </tr>
            </table>
        </div>
    </div>
        </div>
  </form>
</asp:Content>