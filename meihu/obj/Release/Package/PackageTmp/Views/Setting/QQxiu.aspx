<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Setting/SettingSet.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderTtitle" runat="server">
    QQ秀
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
        window.onload=function settingscore()
        {
            $("#S-left tr").eq(8).removeClass("current");
            $("#S-left tr").eq(8).removeClass("current1").addClass("current");
        }

    </script>
   <div id="QQxiu">
  <div class="QQleft">
      <div class="Qleft">
          <a href="#"><img src="../../image/qqlogo.gif" /></a><br />
          点击按钮，立刻绑定QQ帐号
      </div>
  </div>
     <div class="QQright">
           <div class="Qright">
         <span style="color:red;font-size:13px;"><b>在社区使用我的QQ秀</b></span><br />
               <br />
开启后,论坛帖子左侧和个人空间首页将展示您的QQ秀,并且社区内QQ秀<br />形象将随您的QQ秀形象更新而同步变化<br /> <br />
<b>您需要绑定QQ帐号才能在社区使用QQ秀形象</b>
               </div>
     </div>
   </div>

</form>
</asp:Content>

