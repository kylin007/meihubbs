<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Setting/SettingSet.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<script runat="server">
    protected void DropDownListquestions_Load(object sender, EventArgs e)
    {
        try {  TextBoxemail0.Text =@ViewBag.User_regist3;
            string str = @ViewBag.User_regist4;
            DropDownListquestions.Items.Add(str);
        } catch { }


    }
</script>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderTtitle" runat="server">
    密码安全
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="subcontent" runat="server">
    <form runat="server">
     <script>
         //密码安全
         window.setInterval("pass()", 300);
         function pass() {
             $("#Buttonpass")[0].onclick = function () {
                 if ($("#MainContent_subcontent_TextBoxpass0").val() != $("#passwordprotect").html() || $("#MainContent_subcontent_TextBoxpass1").val() != $("#MainContent_subcontent_TextBoxpass2").val() || $("#MainContent_subcontent_TextBoxslove").val() != $("#passwordprotect2").html()) {
                     document.getElementById('Buttonpassdiv0').style.display = 'block';
                     document.getElementById("passwordcontent").innerHTML = "密码错误 !&nbsp&nbsp&nbsp";
                     $("#MainContent_subcontent_TextBoxpass0").focus();
                     return;
                 }
                 $.ajax({
                     url: '/Setting/passwords',
                     async: false,//请求是否异步，默认异步;
                     data: {
                         "MainContent_subcontent_TextBoxpass0": $("#MainContent_subcontent_TextBoxpass0").val(),//旧密码
                         "MainContent_subcontent_TextBoxpass1": $("#MainContent_subcontent_TextBoxpass1").val(), //新密码
                         "MainContent_subcontent_TextBoxpass2": $("#MainContent_subcontent_TextBoxpass2").val(),//确认密码
                         "MainContent_subcontent_TextBoxemail0": $("#MainContent_subcontent_TextBoxemail0").val(), //Email
                         "MainContent_subcontent_DropDownListquestions": $("#MainContent_subcontent_DropDownListquestions").val(),//安全提问
                         "MainContent_subcontent_TextBoxslove": $("#MainContent_subcontent_TextBoxslove").val(), //回答

                     },
                     type: "POST",
                     success: function (data) {
                         document.getElementById("passwordcontent").innerHTML = "密码更新成功";
                         document.getElementById('Buttonpassdiv0').style.display = 'block';

                     },
                     error: function () {
                         document.getElementById("passwordcontent").innerHTML = "密码更新失败";
                         document.getElementById('Buttonpassdiv0').style.display = 'block';
                     }
                 });
             }
         };
         function scrolls() {
             var dom = $("#S-right").innerHeight() + 2;
             if (dom < 348) {
                 dom = 348;
             }
             document.getElementById("S-center").style.height = dom + "px";
             document.getElementById("S-left").style.height = dom + "px";

             $("#Buttonpassdiv1")[0].onclick = function () {
                 document.getElementById('Buttonpassdiv0').style.display = 'none';
             }
         }
         window.setInterval("scrolls()", 50);
         window.onload = function settingscore() {
             $("#S-left tr").eq(5).removeClass("current");
             $("#S-left tr").eq(5).removeClass("current1").addClass("current");
         }
    </script>
    <div id="S-password">
           <Label ID="passwordprotect" style="display:none;"><%=TempData["User_regist2"] %></Label>
           <Label ID="passwordprotect2" style="display:none;"><%=TempData["User_regist5"] %></Label>
         <div class="S-pas0">
             您必须填写原密码才能修改下面的资料
         </div>
           <div class="S-pas1">
               <table>
                   <tr><td class="S-pas1text" style="padding-bottom:10px;">旧密码</td><td>
                       <span style="color:red">*</span><asp:TextBox ID="TextBoxpass0" runat="server" Height="16px" Width="340px" TextMode="Password"></asp:TextBox></td></tr>
                     <tr><td class="S-pas1text">新密码</td><td> <asp:TextBox ID="TextBoxpass1" runat="server" Width="347px" TextMode="Password"></asp:TextBox><br />如不需要更改密码，此处请留空</td></tr>
                     <tr><td class="S-pas1text">确认新密码</td><td><asp:TextBox ID="TextBoxpass2" runat="server" Width="346px" TextMode="Password"></asp:TextBox><br />	
如不需要更改密码，此处请留空</td></tr>
                     <tr><td class="S-pas1text" style="padding-bottom:75px;">Email</td><td><asp:TextBox ID="TextBoxemail0" runat="server" Width="346px"></asp:TextBox><br />	
                         <img style="width:15px; height:10px" src="../../image/User_setting_email.png" />&nbsp;新邮箱(<asp:Label ID="Labelemail1" runat="server" Text="3348949373@qq.com "></asp:Label>)等待验证中...<br />
系统已经向该邮箱发送了一封验证激活邮件，请查收邮件，进行验证激活。<br />
如果没有收到验证邮件，您可以更换一个邮箱，或者<a href="#"><b style="color:brown">重新接收验证邮件</b></a><br />
!如更改地址，系统将修改您的密码并重新验证其有效性，请慎用</td></tr>
                     <tr><td class="S-pas1text">安全提问</td><td>
                         <asp:DropDownList ID="DropDownListquestions" runat="server" Height="23px" Width="349px" style="margin-top: 0px" OnLoad="DropDownListquestions_Load"></asp:DropDownList><br />如果您启用安全提问，登录时需填入相应的项目才能登录</td></tr>
                     <tr><td class="S-pas1text">回答</td><td><asp:TextBox ID="TextBoxslove" runat="server" Height="17px" Width="349px"></asp:TextBox><br />如您设置新的安全提问，请在此输入答案</td></tr>
                     <tr><td colspan="2" style="padding-left:110px">
                           <input  type="button"  id="Buttonpass" value="保存" />
<div id="Buttonpassdiv0" class="buttonbases"> <span id="passwordcontent" style="width:76px">密码更改成功!</span><input  style="height:20px;width:40px;background-color:rgb(238, 155, 155)" type="button" id="Buttonpassdiv1" value="关闭"/></div>

                         </td></tr>
               </table>
    </div>
    </div>
   

</form>
</asp:Content>
