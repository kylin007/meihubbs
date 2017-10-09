<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<dynamic>" %>
<style>
    .friend {
        width:298px;
        height:100px;
        margin:0 auto;
    }
        .friend .tableclass {
           width:298px;
           height:100px;
           text-align:left;
        }
</style>
<div class="friend">
    <table class="tableclass">
       
          <%  List<meihu.Models.Goodfriend> model = ViewBag.userfriend as List<meihu.Models.Goodfriend>; 
        
            foreach(var list in model)
            {%>
               <tr> <td><%=list.goodname%></td></tr>
            <%}
            %>
     </table>
</div>

