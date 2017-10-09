<%----------------------------张宏乾--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Views/shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <link href="../../CSS/Mypost.css" rel="stylesheet" />
    <script src="../../Jscript/My_post.js"></script>
     <div style="height:33px;"></div>
     <div class="Mytop">
         <p class="chart z">
            <span class="pipe">|</span>帖子:
             <em id="post_num"></em>
            <span class="pipe">|</span>会员:
             <em id="user_num"></em>
             <span class="pipe">|</span>欢迎新会员：
             <em><a class="a" id="user_name" ></a></em>
         </p>
         <div class="y" id="part">
            <div id="login"style="display:inline"> <a href="/Home/My_post?1" class="a" title="我的帖子">我的帖子</a>
             <span class="pipe">|</span></div>
             <a href="/Home/My_post?2" class="a" title="查看新帖">查看新帖</a>
         </div>
     </div>
</asp:Content>
