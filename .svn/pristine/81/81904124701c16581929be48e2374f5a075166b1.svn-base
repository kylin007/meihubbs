<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%@ Register Src="~/News.ascx" TagPrefix="uc1" TagName="News" %>






<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    首页
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    人数：<%%>
    <uc1:News runat="server" ID="News" />
    &nbsp;
    <link href="../../Css/I_index.css" rel="stylesheet" />
    <div class="block">
        <%    
            List<meihu.Models.I_indexModel> modellist = TempData["forum"] as List<meihu.Models.I_indexModel>;
            foreach (var item in modellist)
            {%>
        <%int i = 0; %>
        <% 
      if (item.First_forum == "新人发帖区")
      {%>
        <div class="version">
            <div class="version-name">
                <h2><a href="#">新人发帖区</a></h2>
                <span class="x">
                    <img class="eleven_img" src="image/collapsed_no.gif" onclick="slide('eleven')" /></span>
            </div>
            <div class="version-message" id="eleven" style="border-bottom: 1px solid #CDCDCD;">
                <ul class="new-man">
                    <li style="width: 41px; height: 49px; margin-top: 20px; margin-left: 10px;">
                        <a href="#">
                            <img src="../../image/bubble.gif" /></a>
                    </li>

                    <li style="width: 510px; height: 49px; margin-left: -10px;">
                        <h2><a href="#">新人发帖区</a></h2>
                    </li>
                    <li style="width: 50px; margin-left: 125px; padding-top: 10px;">
                        <span style="color: #000;"><%=item.listmodel[0].list[0] %></span>
                        <span style="color: #999 !important;">&nbsp;/&nbsp;<%=item.listmodel[0].list[1] %></span>
                    </li>
                    <li style="width: 160px;">
                        <a href="#"><%=item.listmodel[0].list[3] %></a><br />
                        <span style="margin-top: -8px; display: block;"><%=item.listmodel[0].list[2] %>&nbsp;<a href="#"><%=item.listmodel[0].list[4] %></a></span>
                    </li>
                </ul>

            </div>
        </div>
        <% }
     else
     {%>
        <div class="version">
            <div class="version-name">
                <h2><a href="#" target='_blank'><%=item.First_forum%></a></h2>
                <span class="x">
                    <img class="<%=item.First_forum%>_img" src="image/collapsed_no.gif" onclick="slide('<%=item.First_forum%>')" /></span>
            </div>
            <div class="version-message" id="<%=item.First_forum%>">
                <ul class="version1">
                    <%
         foreach (var itemj in item.listmodel)
         {%>
                    <%i++;
                      if (item.listmodel.Count > 3)
                      {%>
                    <%
                          if (i <= 3)
                          {%>
                    <li style="border-bottom: 1px dashed #CDCDCD;">
                        <a href="#" target='_blank'>
                            <img src="../../image/bubble.gif" /></a>
                        <ul class="version2">
                            <li class="subject"><a href="#" target='_blank'><%=itemj.childname%></a></li>
                            <li>主题:<%=itemj.list[0] %>,帖数:<%=itemj.list[1] %></li>
                            <%
                              if (itemj.list[2].IsEmpty())
                              {%>
                            <li>从未</li>
                            <% }
                                            else
                                            {%>
                            <li><a href="#" target='_blank'>最后发表:<%=itemj.list[2]%></a></li>
                            <%}
                            %>
                        </ul>
                    </li>
                    <% }
                          else
                          {%>
                    <li>
                        <a href="#" target='_blank'>
                            <img src="../../image/bubble.gif" /></a>
                        <ul class="version2">
                            <li class="subject"><a href="#" target='_blank'><%=itemj.childname%></a></li>
                            <li>主题:<%=itemj.list[0] %>,帖数:<%=itemj.list[1] %></li>
                            <%
                                            if (itemj.list[2].IsEmpty())
                                            {%>
                            <li>从未</li>
                            <% }
                                                else
                                                {%>
                            <li><a href="#" target='_blank'>最后发表:<%=itemj.list[2]%></a></li>
                            <%}
                            %>
                        </ul>
                    </li>
                    <%}
                    %>
                    <% }
                      else
                      {%>
                    <li>
                        <a href="#" target='_blank'>
                            <img src="../../image/bubble.gif" /></a>
                        <ul class="version2">
                            <li class="subject"><a href="#" target='_blank'><%=itemj.childname%></a></li>

                            <li>主题:<%=itemj.list[0] %>,帖数:<%=itemj.list[1] %></li>
                            <%
                          if (itemj.list[2].IsEmpty())
                          {%>
                            <li>从未</li>
                            <% }
                                        else
                                        {%>
                            <li><a href="#" target='_blank'>最后发表:<%=itemj.list[2]%></a></li>
                            <%}
                            %>
                        </ul>
                    </li>
                    <% }
                    %>
                    <% }
                    %>
                </ul>
            </div>
        </div>
        <% }
        %>
        <%  }
        %>
    </div>
</asp:Content>
