 <%@ Page Title="" Language="C#" MasterPageFile="~/Views/shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>
<%--刘彩迪--%>
<%@ Register Src="~/News.ascx" TagPrefix="uc1" TagName="News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="../../Jscript/jquery-2.2.0.min.js"></script>
    <script src="../../Jscript/OneLevel.js"></script>
    <link href="../../Css/OneLevel.css" rel="stylesheet" />
       
    <link href="../../Css/I_index.css" rel="stylesheet" />
   <div class="fast">
       <a href="/I_index/Index" title="首页" class="Img"></a>
       <span></span>
       <a href="/I_index/Index" class="title">论坛</a>
       <span></span>
       <%List<meihu.Models.OneLevel> modellist0 = TempData["mlist0"] as List<meihu.Models.OneLevel>;
              %>   
       <a href="#" class="title"><%=modellist0[0].str %></a>
   </div>
    <div id="f0">   
    <uc1:News runat="server" ID="News" />
     </div>
    <div class="f1">
       <div class="bm">
           <span class="o"><img src="../../image/zoom.gif"/></span>
                                          
                      <h2 class="h2"><a href="#"><%=modellist0[0].str %></a></h2>          
       </div>
        <div class="category">                                                                                                                                                         
            <table class="table1"><tbody> 
                <%
               List<meihu.Models.OneLevel> modellist = TempData["mlist"] as List<meihu.Models.OneLevel>;
               for(int j=0; j< modellist.Count; j++)
               { %>                         
                <tr class="Otr">                                          
                    <td class="Otd"><a class="Second" href="/TwoLevel/T woLevel?name=<%=modellist[j].Second_forum%>"><img src="../../image/bubble.gif"/></a></td>
                    <td class="Otd_m"><h2><a href="/TwoLevel/TwoLevel?name=<%=modellist[j].Second_forum%>"><%=modellist[j].Second_forum %></a></h2> 
                           <%
                           List<meihu.Models.OneLevel> modellist1 = TempData["mlist1"] as List<meihu.Models.OneLevel>;
                   if(modellist1[j].Is_son=="1")
                   {%>  
                         <p>子版块： 
                        <%for(int i=0; i<modellist[j].secondlist.Count; i++){ %>                                                
                       <a href="/TwoLevel/TwoLevel?name=<%=modellist[j].secondlist[i]%>"><u><%=modellist[j].secondlist[i]%></u>&nbsp</a>                              
                                      
                    <%}%>
                         </p>  <% 
                               }%>
                       <%else{ %>
                        <p> 
                        <%for(int i=0; i<modellist[j].secondlist.Count; i++){ %>                                                
                       <a href="#"><%=modellist[j].secondlist[i]%></a>                              
                                      
                    <%}%>
                         </p>
                        <% }%>

                    </td>
                       <%
                           List<meihu.Models.OneLevel> modellist3 = TempData["mlist3"] as List<meihu.Models.OneLevel>;                                                                                                         
                           %>                                                  
                    <td class="Otd_i"><span class="xi"><%=modellist3[j].number %></span>
                        <%
                           List<meihu.Models.OneLevel> modellist5 = TempData["mlist5"] as List<meihu.Models.OneLevel>;                                                                                                         
                           %> 
                        <span class="gi">/<%=modellist5[j].addnum %></span></td>
                       <%
                           List<meihu.Models.OneLevel> modellist2 = TempData["mlist2"] as List<meihu.Models.OneLevel>;                                                                                                         
                           %> <td class="Otd_b"><div><a href="/postInfor/post?id=<%=modellist2[j].ID%>"><%=modellist2[j].Title %></a>
                        <cite><%=modellist2[j].Create_on_time %> <a href="#"><%=modellist2[j].User_name%></a> </cite> </div></td>                                      
                </tr>
                <% } %>      
                   </tbody></table>
        </div>
    </div>
    <div id="diy3">
        <div class="Otitle"><span class="Otitletext"><a href="#">郑州大学介绍</a></span></div>
        <div class="Oleft">
            <div class="module">
                <ul>
                    <li><a href="#">郑州大学校训、校风、学风、郑大精神</a></li>
                    <li><a href="#">郑州大学名人录</a></li>
                    <li><a href="#">郑州大学杰出校友榜</a></li>
                </ul>
            </div>
        </div>
        <div class="Oright">
            <div class="portal">
                <ul>
                    <li><a href="#">美丽的郑州大学照片</a></li>
                    <li><a href="#">郑州大学新区的绝版老照片</a></li>
                    <li><a href="#">郑州大学新区怀旧照片（02年03年）</a></li>
                </ul>
            </div>
        </div>
    </div>
</asp:Content>
