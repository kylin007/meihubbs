<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Setting/SettingSet.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<script runat="server">

    protected void TextBox1_Load(object sender, EventArgs e)
    {
        try
        {
            TextBox1.Text = "http://meihubbs.com/?fromuid=" + @ViewBag.extion;
            TextBox2.Text = "http://meihubbs.com/?fromuid=" + @ViewBag.extion + "&fromuser=%D2%B9%D3%EA%CF%C2%B5%C4%C4%E3";
        }
        catch { }
    }
</script>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderTtitle" runat="server">
访问推广
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="subcontent" runat="server">
        <form runat="server">
     <script>
       
             function copyToClipboard(elementId) {
                 // 创建元素用于复制
                 var aux = document.createElement("input");

                 // 获取复制内容
                 var content = document.getElementById(elementId).innerHTML || document.getElementById(elementId).value;

                 // 设置元素内容
                 aux.setAttribute("value", content);

                 // 将元素插入页面进行调用
                 document.body.appendChild(aux);

                 // 复制内容
                 aux.select();

                 // 将内容复制到剪贴板
                 document.execCommand("copy");

                 // 删除创建元素
                 document.body.removeChild(aux);
            
             alert("复制成功");
            }
        
      window.onload=function settingscore()
        {
          $("#S-left tr").eq(6).removeClass("current");
          $("#S-left tr").eq(6).removeClass("current1").addClass("current");
    
       }
       function scrolls() {
           var dom = $("#S-right").innerHeight() + 2;
           if (dom < 348) {
               dom = 348;
           }
           document.getElementById("S-center").style.height = dom + "px";
           document.getElementById("S-left").style.height = dom + "px";

       }
       window.setInterval("scrolls()", 50);
     </script>
    <div id="EX-tention">

        <div class="EX-top0">
            <p>如果您的朋友通过下面任意一个链接访问站点，您将获得积分奖励 <span style="color:red">金钱+1 </span></p>
             <p>如果您的朋友不但访问并且注册成为会员，您将再获得积分奖励 <span style="color:red">金钱+2 </span></p>
         
        </div>
        <div class="EX-center">
            <table>
                <tr><td colspan="3">
<b>方式一：</b></td></tr>
                <tr><td>推广链接1</td><td style="text-align:right;">
                    <asp:TextBox ID="TextBox1" runat="server" Width="360px" style="margin-left: 0px" OnLoad="TextBox1_Load" ReadOnly="True" onclick="copyToClipboard()"></asp:TextBox></td><td>
                                          <input  type="button"  id="Buttonlianjie1" value="复制"   onclick="copyToClipboard('MainContent_subcontent_TextBox1')"/>
                       </td></tr>
                <tr><td>推广链接2</td><td style="text-align:right;">
                    <asp:TextBox ID="TextBox2" runat="server" Width="360px" ReadOnly="True" onclick="copyToClipboard()"></asp:TextBox></td><td>
                          <input  type="button"  id="Buttonlianjie2" value="复制" onclick="copyToClipboard('MainContent_subcontent_TextBox2')" />
                      </td></tr>        
                <tr><td colspan="3"><b>方式二：</b></td></tr>
                <tr><td colspan="3">通过点击帖子标题旁的“复制链接”，推广成功后也可以获得积分奖励&nbsp;<a href="#"><b>去推广帖子»</b></a></td></tr>
            </table>
        </div>
    </div>
          </form>
</asp:Content>
