<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<meihu.Models.HomeModel>" %>

<script runat="server">
</script>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    测试
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .yab {
            width:960px;
            height:auto;
            border:0.5px solid orange;
            border-top:0.5px solid orange;  
       
            }
         .yab table
        {
           width:960px;
           margin:0 auto;
           background-color:rgb(252, 247, 247);
        }
          .yab table td
        {
           width:315px;
           height:72px;
        }
          .yab table .trclass
        {
          border-bottom:0.5px dashed #CDCDCD;
        }
        .dlclass {
            width: 275px;
            height: 72px;
            float: right;
        }
        dl
        {
          padding-top:0px;
          margin-top:5px;
        }
        a {
            color:black;
           text-decoration:none;
        }
        a:hover{
           text-decoration:underline;
        }
        .imgclass {
            width:30px;
            height:73px;
           float:left;
           margin-top:5px;
        }
        .yeasubclass{      
  width:950px;
  background-color:rgb(255, 236, 236);
  height:30px;
  padding-left:10px; 
  padding-top:10px;
  border-top:0.5px solid orange;
  border-bottom:0.5px solid orange;
        }
         .yeasubclasstop{
     width:30px;
     height:20px;
      text-align:right;
      float:right;
      padding-right:10px;
      cursor:pointer;
         }
  
   </style>
    <script src="../../Jscript/testScript.js"></script>
    <form runat="server">

        <div class="yab" id="yeasubclass">
            <%
                int times = 2;
                int COUNT =0;
                int yue = 0;
                System.Data.DataTable doms = (System.Data.DataTable)@ViewData["firstfroum"];
                for(int j=0;j<doms.Rows.Count;j++)
                {

                  %> 
 <div class="yeasubclass"><b><a href="#" style="color:red"><%=doms.Rows[j]["First_forum"].ToString()%></a></b><div class="yeasubclasstop" >关闭</div>  </div>
                   <%

             %>
          <div class="tablesub">        
      <table >     
        
            <%
                if (j>0)
                {
                    times = 1;
                }
                for (int w = 0; w <times; w++)
                {

                          %>
           <tr>
      <%
          int i;
          System.Data.DataTable dt = (System.Data.DataTable)@ViewData["dtFROUM"];
          for ( i= yue; i < dt.Rows.Count; i++)
          {

              COUNT++;
              if (COUNT%4==0)
              {
                  break;
              }


              if (w==0&&j==0)
              {%>
              <td class="trclass">
                   <div class="imgclass">
                       <img src="../../image/bubble.gif" /></div>
                  <div class="dlclass">
                    <dl>

                       <dt><b><a href="#"><%=dt.Rows[i]["Second_forum"].ToString()%></a></b></dt>
                       <dt>主题： <%=dt.Rows[i]["countFORM"].ToString()%>,帖数：<%=dt.Rows[i]["countsub"].ToString()%></dt>
                       
                        <dt><a href="#">最后发表时间:<%=dt.Rows[i]["fatime"].ToString()%></a></dt>
                  </dl>
                 </div>
              </td> 
                 <% }

    else
    {%>
                <td>
                      <div class="imgclass">
                       <img src="../../image/bubble.gif" /></div>
                    <div class="dlclass">
                      <dl>
                      <dt><b><a href="#"><%=dt.Rows[i]["Second_forum"].ToString()%></a></b></dt>
                       <dt>主题： <%=dt.Rows[i]["countFORM"].ToString()%>,帖数：<%=dt.Rows[i]["countsub"].ToString()%></dt>
                       
                       <dt><a href="#">最后发表时间:<%=dt.Rows[i]["fatime"].ToString()%></a></dt>
                  </dl>
                        </div>
              </td> 
                 <% 
    }%>
                 
                 <% }
                         yue = i;
                     }
                     %>
         
          </tr>
      
      </table> 

            </div>
            <%

         }%>
         </div>       <br />

     <%--   <asp:Calendar ID="Calendar1" runat="server" OnSelectionChanged="Calendar1_SelectionChanged" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px">
            <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
            <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
            <OtherMonthDayStyle ForeColor="#CC9966" />
            <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
            <SelectorStyle BackColor="#FFCC66" />
            <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
            <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
        </asp:Calendar>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>--%>
    </form>
</asp:Content>
