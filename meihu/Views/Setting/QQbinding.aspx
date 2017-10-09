<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Setting/SettingSet.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderTtitle" runat="server">
    QQ绑定
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
            $("#S-left tr").eq(7).removeClass("current");
            $("#S-left tr").eq(7).removeClass("current1").addClass("current");
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
         <span style="color:red;font-size:13px;"><b>使用QQ帐号绑定本站，您可以...</b></span><br /><br />
             <b> 用QQ帐号轻松登录</b><br />
  无需记住本站的帐号和密码，随时使用QQ帐号密码轻松登录<br /> <br />
<b>发表主题同时推送到QQ空间和腾讯微博</b><br />
               将您的论坛主题推送到QQ空间和腾讯微博，让好友全方面了解您<br />
               <br />
              <b> 把本站精彩内容分享到QQ空间、腾讯微博和腾讯朋友</b><br/>
   每一个精彩内容绝不放过，简单快捷的将论坛主题分享给好友和听众

               </div>
     </div>
   </div>
</form>
</asp:Content>
