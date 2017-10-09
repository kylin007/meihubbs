<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Setting/SettingSet.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<script runat="server">
   
</script>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderTtitle" runat="server">
    修改图像
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="subcontent" runat="server">
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
             $("#S-left tr").eq(0).removeClass("current");
             $("#S-left tr").eq(0).removeClass("current1").addClass("current");
         }
      </script>
     <div id="S-image">
          <Label ID="Labelcheckimg" style="display:none;"><%=ViewBag.falgimg %></Label>
    <div class="S-image0">
        <table><tr><td style="font-size:14px"><b>当前我的头像</b></td><td style="float:right"><a href="#">返回上一页</a></td></tr>
            <tr><td colspan="2">如果您还没有设置自己的头像，系统会显示为默认头像，您需要自己上传一张新照片来作为自己的个人头像</td></tr>
        </table>
    </div>
    <div class="S-image1">
         
           <img id="imagepoistion" src="../../image/userimage.png"/>

       
    </div>
    <div class="S-image2">
            
     <b style="font-size:14px">设置我的新头像</b>:<br />
    请选择一个新照片进行上传编辑: 
<br />
      头像保存后，您可能需要刷新一下本页面(按F5键)，才能查看最新的头像效果
    </div>
    <div class="S-image3">
         <table>
             <tr><td>
                 <div id="updateimages" style="width:170px;height:41px; position:absolute;margin-top:-1px;margin-left:0px;">
                <% using (Html.BeginForm("imgsd", RouteData.Values["Controller"].ToString(), FormMethod.Post, new { enctype = "multipart/form-data" }))
                    {                       
                        @Html.AntiForgeryToken();
                        %>
                         <input type="file"  id="doc"  name="file" onchange="setImagePreview()" style="width:170px;height:41px; opacity:0 " /> 
                         <input type="submit"  value="保存" style="position:absolute;margin-top:145px;margin-left:0px;width: 63px; height: 22px; background-color:rgb(224, 138, 138)" >
                      <%} %>
                 </div>
               <a href="#" onclick="fun()"><img  src="../../image/user_setting.png" /></a>
                 </td></tr>
                 
             <tr><td>
                <a href="#"> <img src="../../image/user_setting2.png" /></a></td></tr>
         </table>
    </div>
    </div>
 
</asp:Content>
