<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Setting/SettingSet.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<script runat="server">
    public void gun(object sender, EventArgs e)
    {
        System.Data.DataTable ds = (System.Data.DataTable)@ViewData["User_province"];
        DropDownListbir.Items.Add(new ListItem("省","省"));
        DropDownListlive1.Items.Add(new ListItem("省", "省"));
        for (int i = 0; i < ds.Rows.Count; i++)
        {
            string strvas= ds.Rows[i]["Province"].ToString().Trim();
            //string strvas1= ds.Rows[i]["ID"].ToString().Trim();
            DropDownListbir.Items.Add(new ListItem(strvas,strvas));
            DropDownListlive1.Items.Add(new ListItem(strvas,strvas));
        }
        System.Data.DataTable ds1 = (System.Data.DataTable)@ViewData["User_city"];
        DropDownListbir2.Items.Add(new ListItem("市","市"));
        DropDownListlive2.Items.Add(new ListItem("市","市"));
        for (int i = 0; i < ds1.Rows.Count; i++)
        {
            string strvas = ds1.Rows[i]["City"].ToString().Trim();
            // string strvas1 = ds1.Rows[i]["Province_id"].ToString().Trim();
            DropDownListbir2.Items.Add(new ListItem(strvas,strvas));
            DropDownListlive2.Items.Add(new ListItem(strvas,strvas));
        }
        System.Data.DataTable ds2 = (System.Data.DataTable)@ViewData["User_country"];
        DropDownListbir3.Items.Add(new ListItem("县","县"));
        DropDownListlive3.Items.Add(new ListItem("县","县"));
        for (int i = 0; i < ds2.Rows.Count; i++)
        {
            string strvas = ds2.Rows[i]["Country"].ToString().Trim();
            //string strvas1 = ds2.Rows[i]["City_id"].ToString().Trim();
            DropDownListbir3.Items.Add(new ListItem(strvas, strvas));
            DropDownListlive3.Items.Add(new ListItem(strvas, strvas));
        }
        System.Data.DataTable ds3 = (System.Data.DataTable)@ViewData["User_town"];
        DropDownListbir4.Items.Add(new ListItem("乡","乡"));
        DropDownListlive4.Items.Add(new ListItem("乡","乡"));
        for (int i = 0; i < ds3.Rows.Count; i++)
        {
            string strvas = ds3.Rows[i]["town"].ToString().Trim();
            //string strvas1 = ds3.Rows[i]["Country_id"].ToString().Trim();
            DropDownListbir4.Items.Add(new ListItem(strvas,strvas));
            DropDownListlive4.Items.Add(new ListItem(strvas,strvas));
        }


    }
    public void Funyear(object sender, EventArgs e)
    {
        System.Data.DataTable Year=(System.Data.DataTable)@ViewData["Year"];
        DropDownListyear.Items.Add("年");
        for (int i = 0; i < Year.Rows.Count; i++)
        {
            string value = Year.Rows[i]["Year"].ToString();
            DropDownListyear.Items.Add(value);
        }

        System.Data.DataTable Month=(System.Data.DataTable)@ViewData["Month"];
        DropDownListMonth.Items.Add("月");
        for (int i = 0; i < Month.Rows.Count; i++)
        {
            string value = Month.Rows[i]["Month"].ToString();
            DropDownListMonth.Items.Add(value);
        }
        System.Data.DataTable Day = (System.Data.DataTable)@ViewData["Day"];
        DropDownListday.Items.Add("日");
        for (int i = 0; i < Day.Rows.Count; i++)
        {
            string value = Day.Rows[i]["Day"].ToString();
            DropDownListday.Items.Add(value);
        }

    }
    protected void TextBoxemotion_Load(object sender, EventArgs e)
    {
        System.Data.DataTable ds = (System.Data.DataTable)@ViewData["user_mess"];
        for (int j = 0; j < ds.Rows.Count; j++)
        {

            try
            {
                //联系方式
                #region
                if (string.Compare("真实姓名", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListbname3.Text = ds.Rows[j]["Is_show"].ToString();
                    TextBoxname3.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                else if (string.Compare("性别", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListsex0.Text = ds.Rows[j]["Is_show"].ToString();
                    DropDownListsex.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                else if (string.Compare("生日", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListbirthday.Text = ds.Rows[j]["Is_show"].ToString();
                    DropDownListyear.Text = ds.Rows[j]["Data_cont"].ToString().Split('年')[0];
                    DropDownListMonth.Text = ds.Rows[j]["Data_cont"].ToString().Split('年')[1].Split('月')[0];
                    DropDownListday.Text = ds.Rows[j]["Data_cont"].ToString().Split('月')[1].Split('日')[0];

                }
                else if (string.Compare("出生地", ds.Rows[j]["Data_name"].ToString()) == 0)
                {

                    DropDownListbir5.Text = ds.Rows[j]["Is_show"].ToString();
                    DropDownListbir.Text=ds.Rows[j]["Data_cont"].ToString().Split('省')[0];
                    DropDownListbir2.Text= ds.Rows[j]["Data_cont"].ToString().Split('省')[1].Split('市')[0];
                    DropDownListbir3.Text = ds.Rows[j]["Data_cont"].ToString().Split('市')[1].Split('县')[0];
                    DropDownListbir4.Text = ds.Rows[j]["Data_cont"].ToString().Split('县')[1];
                    Labelxianshiwenben.Text = DropDownListbir.Text + " "+DropDownListbir2.Text+" "+DropDownListbir3.Text+" "+DropDownListbir4.Text;
                }
                else if (string.Compare("居住地", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListlive5.Text = ds.Rows[j]["Is_show"].ToString();
                    DropDownListlive1.Text= ds.Rows[j]["Data_cont"].ToString().Split('省')[0];
                    DropDownListlive2.Text = ds.Rows[j]["Data_cont"].ToString().Split('省')[1].Split('市')[0];
                    DropDownListlive3.Text = ds.Rows[j]["Data_cont"].ToString().Split('市')[1].Split('县')[0];
                    DropDownListlive4.Text = ds.Rows[j]["Data_cont"].ToString().Split('县')[1];
                    Labelbirtext.Text= DropDownListlive1.Text + " "+ DropDownListlive2.Text+" "+ DropDownListlive3.Text+" "+ DropDownListlive4.Text;
                }
                else if (string.Compare("情感状态", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListemotion.Text = ds.Rows[j]["Is_show"].ToString();
                    TextBoxemotion.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                else if (string.Compare("交友目的", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListgoal.Text = ds.Rows[j]["Is_show"].ToString();
                    TextBoxgoal.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                else if (string.Compare("血型", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListBlood.Text = ds.Rows[j]["Is_show"].ToString();
                    DropDownListBlooda.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                else if (string.Compare("年级", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListgrade.Text = ds.Rows[j]["Is_show"].ToString();
                    TextBox1.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                #endregion
                //基本资料
                #region
                else if (string.Compare("证件类型", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListidentity1.Text = ds.Rows[j]["Is_show"].ToString();
                    DropDownListidentity.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                else if (string.Compare("证件号", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListnumber.Text = ds.Rows[j]["Is_show"].ToString();
                    TextBoxnumber.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                else if (string.Compare("邮寄地址", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListaddress.Text = ds.Rows[j]["Is_show"].ToString();
                    TextBoxaddress.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                else if (string.Compare("邮编", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListpost.Text = ds.Rows[j]["Is_show"].ToString();
                    TextBoxpost.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                else if (string.Compare("个人主页", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListindex.Text = ds.Rows[j]["Is_show"].ToString();
                    TextBoxindex.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                else if (string.Compare("自我介绍", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListintroduce.Text = ds.Rows[j]["Is_show"].ToString();
                    TextAreaintroduce.InnerText = ds.Rows[j]["Data_cont"].ToString();

                }
                else if (string.Compare("兴趣爱好", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListhoppy.Text = ds.Rows[j]["Is_show"].ToString();
                    TextAreahappy.InnerText = ds.Rows[j]["Data_cont"].ToString();

                }
                else if (string.Compare("个人签名", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    TextAreasign.InnerText = ds.Rows[j]["Data_cont"].ToString();
                }
                else if (string.Compare("时区", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListtime.Text =ds.Rows[j]["Data_cont"].ToString();
                }
                #endregion
                //教育情况
                #region

                else if (string.Compare("固定电话", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListphone.Text = ds.Rows[j]["Is_show"].ToString();
                    TextBoxphone.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                else if (string.Compare("手机", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListtelephone.Text = ds.Rows[j]["Is_show"].ToString();
                    TextBoxtelephone.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                if (string.Compare("阿里旺旺", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListaliwangwang.Text = ds.Rows[j]["Is_show"].ToString();
                    TextBoxaliwangwang.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                else if (string.Compare("QQ", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListQQ.Text = ds.Rows[j]["Is_show"].ToString();
                    TextBoxQQ.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                #endregion

                //个人信息
                #region
                else if (string.Compare("公司", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListcompany.Text = ds.Rows[j]["Is_show"].ToString();
                    TextBoxcompany.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                else if (string.Compare("职业", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListOccupation.Text = ds.Rows[j]["Is_show"].ToString();
                    TextBoxOccupation.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                if (string.Compare("职位", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListposition.Text = ds.Rows[j]["Is_show"].ToString();
                    TextBoxposition.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                else if (string.Compare("年收入", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListannual_income.Text = ds.Rows[j]["Is_show"].ToString();
                    TextBoxannual_income.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                #endregion
                //工作情况
                #region
                else if (string.Compare("毕业学校", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownLisuniverty.Text = ds.Rows[j]["Is_show"].ToString();
                    TextBoxuniversity.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                else if (string.Compare("学历", ds.Rows[j]["Data_name"].ToString()) == 0)
                {
                    DropDownListEducation.Text = ds.Rows[j]["Is_show"].ToString();
                    TextBoxEducation.Text = ds.Rows[j]["Data_cont"].ToString();

                }
                #endregion
            }
            catch {
                continue;
            }
        }
        //用户姓名 邮箱等

        System.Data.DataTable ds0= (System.Data.DataTable)@TempData["User_regist"];
        try
        {
            Labename.Text = ds0.Rows[0]["User_name"].ToString();
            Labelname2.Text = ds0.Rows[0]["User_name"].ToString();
            Labelname3.Text = ds0.Rows[0]["User_name"].ToString();
            Labelname4.Text = ds0.Rows[0]["User_name"].ToString();
            Labelname5.Text = ds0.Rows[0]["User_name"].ToString(); 
            LabelEmail.Text = ds0.Rows[0]["Email"].ToString();
           
        }
        catch{ }

    }
</script>

<asp:Content ContentPlaceHolderID="ContentPlaceHolderTtitle" runat="server">
  个人资料
</asp:Content>
    
<asp:Content ID="Content2" ContentPlaceHolderID="subcontent" runat="server">
    <form runat="server">
    <script>
        //基本资料
        $(document).ready(function () {
            $("#Buttonbase")[0].onclick = function () {
                $.ajax({
                    url: '/Setting/Index2',
                    //dataType: 'json',
                    async: false,//请求是否异步，默认异步;
                    data: {
                        "MainContent_subcontent_DropDownListidentity": $("#MainContent_subcontent_DropDownListidentity").val(),//证件类型1
                        "MainContent_subcontent_DropDownListidentity1": $("#MainContent_subcontent_DropDownListidentity1").val(), //是否公开2
                        "MainContent_subcontent_TextBoxnumber": $("#MainContent_subcontent_TextBoxnumber").val(),//证件号3
                        "MainContent_subcontent_DropDownListnumber": $("#MainContent_subcontent_DropDownListnumber").val(), //是否公开4
                        "MainContent_subcontent_TextBoxaddress": $("#MainContent_subcontent_TextBoxaddress").val(),//邮件地址5
                        "MainContent_subcontent_DropDownListaddress": $("#MainContent_subcontent_DropDownListaddress").val(), //是否公开6
                        "MainContent_subcontent_TextBoxpost ": $("#MainContent_subcontent_TextBoxpost").val(),//邮编7
                        "MainContent_subcontent_DropDownListpost": $("#MainContent_subcontent_DropDownListpost").val(), //是否公开8
                        "MainContent_subcontent_TextBoxindex": $("#MainContent_subcontent_TextBoxindex").val(),//个人主页9
                        "MainContent_subcontent_DropDownListindex": $("#MainContent_subcontent_DropDownListindex").val(), //是否公开10
                        "TextAreaintroduce": $("#MainContent_subcontent_TextAreaintroduce").val(),//自我介绍11
                        "MainContent_subcontent_DropDownListintroduce": $("#MainContent_subcontent_DropDownListintroduce").val(), //是否公开12
                        "TextAreahappy": $("#MainContent_subcontent_TextAreahappy").val(),//兴趣爱好13
                        "MainContent_subcontent_DropDownListhoppy": $("#MainContent_subcontent_DropDownListhoppy").val(), //是否公开14
                        "TextAreasign": $("#MainContent_subcontent_TextAreasign").val(),//个人签名15
                        "TextAreasigns": null,//个人签名15
                        "MainContent_subcontent_DropDownListtime": $("#MainContent_subcontent_DropDownListtime").val(), //时区16
                        "MainContent_subcontent_D": null,//时区16
                    },
                    type: "POST",
                    success: function (data) {
                        document.getElementById('Buttonbasediv0').style.display = 'block';

                    },
                    error: function () {
                        alert("数据没有更新成功！");
                    }
                });
            }
        })
        //联系方式
        $(document).ready(function () {
            $("#Buttonbasic")[0].onclick = function () {
                $.ajax({
                    url: '/Setting/contact',
                    dataType: 'text',
                    async: false,//请求是否异步，默认异步;
                    data: {
                        "MainContent_subcontent_TextBoxname3": $("#MainContent_subcontent_TextBoxname3").val(),//真实姓名
                        "MainContent_subcontent_DropDownListbname3": $("#MainContent_subcontent_DropDownListbname3").val(), //是否公开2
                        "MainContent_subcontent_DropDownListsex": $("#MainContent_subcontent_DropDownListsex").val(),//性别
                        "MainContent_subcontent_DropDownListsex0": $("#MainContent_subcontent_DropDownListsex0").val(), //是否公开4
                        "MainContent_subcontent_DropDownListyear": $("#MainContent_subcontent_DropDownListyear").val() + "年" + $("#MainContent_subcontent_DropDownListMonth").val() + "月" + $("#MainContent_subcontent_DropDownListday").val() + "日",//年月日
                        "MainContent_subcontent_DropDownListbirthday": $("#MainContent_subcontent_DropDownListbirthday").val(), //是否公开6
                        "MainContent_subcontent_DropDownListbir ": $("#MainContent_subcontent_DropDownListbir").val() + "省" + $("#MainContent_subcontent_DropDownListbir2").val() + "市" + $("#MainContent_subcontent_DropDownListbir3").val() + "县" + $("#MainContent_subcontent_DropDownListbir4").val(),//出生地
                        "MainContent_subcontent_DropDownListbir5": $("#MainContent_subcontent_DropDownListbir5").val(), //是否公开8
                        "MainContent_subcontent_DropDownListlive": $("#MainContent_subcontent_DropDownListlive1").val() + "省" + $("#MainContent_subcontent_DropDownListlive2").val() + "市" + $("#MainContent_subcontent_DropDownListlive3").val() + "县" + $("#MainContent_subcontent_DropDownListlive4").val(),//居住地
                        "MainContent_subcontent_DropDownListlive5": $("#MainContent_subcontent_DropDownListlive5").val(), //是否公开10
                        "MainContent_subcontent_TextBoxemotion": $("#MainContent_subcontent_TextBoxemotion").val(), //情感状态11
                        "MainContent_subcontent_DropDownListemotion": $("#MainContent_subcontent_DropDownListemotion").val(), //是否公开12
                        "MainContent_subcontent_TextBoxgoal": $("#MainContent_subcontent_TextBoxgoal").val(), //交友目的13
                        "MainContent_subcontent_DropDownListgoal": $("#MainContent_subcontent_DropDownListgoal").val(), //是否公开14
                        "MainContent_subcontent_DropDownListBlooda": $("#MainContent_subcontent_DropDownListBlooda").val(), //血型15
                        "MainContent_subcontent_DropDownListBlood": $("#MainContent_subcontent_DropDownListBlood").val(), //是否公开16
                        "MainContent_subcontent_TextBox1": $("#MainContent_subcontent_TextBox1").val(), //年级17
                        "MainContent_subcontent_DropDownListgrade": $("#MainContent_subcontent_DropDownListgrade").val(), //是否公开18
                    },
                    type: "POST",
                    success: function (data) {
                        document.getElementById('Buttonbasicdiv0').style.display = 'block';

                    },
                    error: function () {
                        alert("数据没有更新成功！");
                    }
                });
            }
        })
        //教育情况
        $(document).ready(function () {
            $("#Buttoncontact")[0].onclick = function () {
                $.ajax({
                    url: '/Setting/education',

                    async: false,//请求是否异步，默认异步;
                    data: {
                        "MainContent_subcontent_TextBoxphone": $("#MainContent_subcontent_TextBoxphone").val(),//固定电话
                        "MainContent_subcontent_DropDownListphone": $("#MainContent_subcontent_DropDownListphone").val(), //是否公开2
                        "MainContent_subcontent_TextBoxtelephone": $("#MainContent_subcontent_TextBoxtelephone").val(),//手机
                        "MainContent_subcontent_DropDownListtelephone": $("#MainContent_subcontent_DropDownListtelephone").val(), //是否公开4
                        "MainContent_subcontent_TextBoxQQ": $("#MainContent_subcontent_TextBoxQQ").val(),//QQ
                        "MainContent_subcontent_DropDownListQQ": $("#MainContent_subcontent_DropDownListQQ").val(), //是否公开6
                        "MainContent_subcontent_TextBoxaliwangwang ": $("#MainContent_subcontent_TextBoxaliwangwang").val(),//阿里旺旺
                        "MainContent_subcontent_DropDownListaliwangwang": $("#MainContent_subcontent_DropDownListaliwangwang").val(), //是否公开8

                    },
                    type: "POST",
                    success: function (data) {
                        document.getElementById('Buttoncontactdiv0').style.display = 'block';

                    },
                    error: function () {
                        alert("数据没有更新成功！"); //请求出错处理
                    }
                });
            }
        })

        //工作情况
        $(document).ready(function () {
            $("#ButtonEducation")[0].onclick = function () {
                $.ajax({
                    url: '/Setting/occup',

                    async: false,//请求是否异步，默认异步;
                    data: {
                        "MainContent_subcontent_TextBoxuniversity": $("#MainContent_subcontent_TextBoxuniversity").val(),//毕业院校
                        "MainContent_subcontent_DropDownLisuniverty": $("#MainContent_subcontent_DropDownLisuniverty").val(), //是否公开2
                        "MainContent_subcontent_TextBoxEducation": $("#MainContent_subcontent_TextBoxEducation").val(),//学历
                        "MainContent_subcontent_DropDownListEducation": $("#MainContent_subcontent_DropDownListEducation").val(), //是否公开4

                    },
                    type: "POST",
                    success: function (data) {
                        document.getElementById('ButtonEducationdiv0').style.display = 'block';
                    },
                    error: function () {
                        //请求出错处理
                        alert("数据没有更新成功！");
                    }
                });
            }
        })
        //个人信息
        $(document).ready(function () {
            $("#Buttonconditions")[0].onclick = function () {
                $.ajax({
                    url: '/Setting/persons',
                    async: false,//请求是否异步，默认异步;
                    data: {
                        "MainContent_subcontent_TextBoxcompany": $("#MainContent_subcontent_TextBoxcompany").val(),//公司
                        "MainContent_subcontent_DropDownListcompany": $("#MainContent_subcontent_DropDownListcompany").val(), //是否公开2
                        "MainContent_subcontent_TextBoxOccupation": $("#MainContent_subcontent_TextBoxOccupation").val(),//职业
                        "MainContent_subcontent_DropDownListOccupation": $("#MainContent_subcontent_DropDownListOccupation").val(), //是否公开4
                        "MainContent_subcontent_TextBoxposition": $("#MainContent_subcontent_TextBoxposition").val(),//职位
                        "MainContent_subcontent_DropDownListposition": $("#MainContent_subcontent_DropDownListposition").val(), //是否公开2
                        "MainContent_subcontent_TextBoxannual_income": $("#MainContent_subcontent_TextBoxannual_income").val(),//年收入
                        "MainContent_subcontent_DropDownListannual_income": $("#MainContent_subcontent_DropDownListannual_income").val(), //

                    },
                    type: "POST",
                    success: function (data) {
                        document.getElementById('Buttonconditionsdiv0').style.display = 'block';

                    },
                    error: function () {
                        alert("数据没有更新成功！"); //请求出错处理
                    }
                });
            }
        })
       function funsd(){
           $("#Buttonbasicdiv1")[0].onclick = function () {
               document.getElementById('Buttonbasicdiv0').style.display = 'none';
           }
           $("#Buttonbasediv1")[0].onclick = function () {
               document.getElementById('Buttonbasediv0').style.display = 'none';
           }
           $("#Buttoncontactdiv1")[0].onclick = function () {
               document.getElementById('Buttoncontactdiv0').style.display = 'none';
           }
           $("#ButtonEducationdiv1")[0].onclick = function () {
               document.getElementById('ButtonEducationdiv0').style.display = 'none';
           }
           $("#Buttonconditionsdiv1")[0].onclick = function () {
               document.getElementById('Buttonconditionsdiv0').style.display = 'none';
           }
        }
        function scrolls()
        {
            var dom = $("#S-right").innerHeight() + 2;
            if (dom < 348)
            {
                dom=348;
            }
            document.getElementById("S-center").style.height=dom + "px";
            document.getElementById("S-left").style.height = dom + "px";
            funsd();
            
        }
        window.setInterval("scrolls()",50);
        window.onload = function settingcontact() {
            $("#S-left tr").eq(1).removeClass("current");
            $("#S-left tr").eq(1).removeClass("current1").addClass("current");
            var doma = document.getElementById('S-contactclass');
            var td = doma.getElementsByTagName('td');
            var tdclass = document.getElementsByClassName("S-contactclass");
            for (var i = 0; i < td.length; i++) {

                td[i].index = i;
                td[i].onclick = function fun() {
                    $("#S-contactclass td").slice(0, 5).removeClass("tdcurrent")
                    $("#S-contactclass td").eq(this.index).addClass("tdcurrent");
                    for (var j = 0; j < tdclass.length; j++) {
                        tdclass.item(j).style.display = 'none';
                    }
                    tdclass.item(this.index).style.display = 'block';
                };
            }
        }
        //年月日判断
        function birthday() {
            var el = document.getElementById('MainContent_subcontent_DropDownListday');
            el.length = 0;
            el.add(new Option("日", ""));
            for (var i = 0; i < 28; i++) {
                el.add(new Option(i + 1, i + 1));
            }
            if ($('#MainContent_subcontent_DropDownListMonth').val() != 2 && $('#MainContent_subcontent_DropDownListMonth').val() != "月") {
                el.add(new Option(29, 29));
                el.add(new Option(30, 30));
                switch ($('#MainContent_subcontent_DropDownListMonth').val()) {
                    case "1":
                    case "3":
                    case "5":
                    case "7":
                    case "8":
                    case "10":
                    case "12":
                        el.add(new Option(31, 31));

                }
            }
            if ($('MainContent_subcontent_DropDownListyear').val() != "年") {
                var birthyear = $('birthyear').val();
                if (birthyear % 400 == 0 || (birthyear % 4 == 0 && birthyear % 100 != 0)) el.add(new Option(29, 29));
            }

        }
    
    </script>
 
    <div id="S-contact">
    <div class="Jtop" id="S-contactclass">
        <table>
            <tr>
                <td><a href="#">基本资料</a></td>
                 <td class="tdcurrent"><a href="#">联系方式</a></td>
                 <td><a href="#">教育情况</a></td>
                 <td><a href="#">工作情况</a></td>
                 <td><a href="#">个人信息</a></td>
            </tr>
        </table>
    </div>

  <div id="S-contact0" class="S-contactclass" style="display:none;"> 

    <div id="Jcen" >
           <table>
            <tr >
                <td class="jcen1">用户名</td>
                 <td colspan="2" >
                     <asp:Label ID="Labename" runat="server" Text="夜雨下的你"></asp:Label></td>
               
                
            </tr>
                <tr>
                <td class="jcen1">证件类型</td>
                 <td>
                     <asp:DropDownList ID="DropDownListidentity" runat="server">
                         <asp:ListItem>身份证</asp:ListItem>
                         <asp:ListItem>护照</asp:ListItem>
                         <asp:ListItem>驾驶证</asp:ListItem>
                     </asp:DropDownList></td>
                 <td class="jcen0">
                     <asp:DropDownList ID="DropDownListidentity1" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                <tr>
                <td class="jcen1">证件号</td>
                 <td>
                     <asp:TextBox ID="TextBoxnumber" runat="server" Width="324px"></asp:TextBox></td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListnumber" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                <tr>
                <td class="jcen1">邮寄地址</td>
                 <td>
                     <asp:TextBox ID="TextBoxaddress" runat="server" Width="324px"></asp:TextBox></td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListaddress" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                <tr>
                <td class="jcen1">邮编</td>
                 <td>
                     <asp:TextBox ID="TextBoxpost" runat="server" Width="323px"></asp:TextBox></td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListpost" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                <tr>
                <td class="jcen1">个人主页</td>
                 <td>
                     <asp:TextBox ID="TextBoxindex" runat="server" Width="323px"></asp:TextBox></td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListindex" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                <tr>
                <td class="jcen1" >自我介绍</td>
                 <td>
                     <textarea id="TextAreaintroduce" style="width: 324px; height: 60px" runat="server"></textarea>
                     </td>
                 <td style="padding-bottom:50px;" class="jcen0"><asp:DropDownList ID="DropDownListintroduce" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                <tr>
                <td class="jcen1" >兴趣爱好</td>
                 <td>
                 <textarea id="TextAreahappy" style="width: 327px; height: 58px" runat="server"></textarea> </td>
                 <td style="padding-bottom:50px;" class="jcen0"><asp:DropDownList ID="DropDownListhoppy" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                <tr>
                <td class="jcen1">个人签名</td>
                 <td colspan="2">
                     <textarea id="TextAreasign" style="width: 325px; height: 59px" runat="server"></textarea></td>              
            </tr>
                <tr>
                <td class="jcen1">时区</td>
                 <td colspan="2"> <asp:DropDownList ID="DropDownListtime" runat="server" Width="450px" Height="25px">
                      <asp:ListItem>默认设置</asp:ListItem>
                     <asp:ListItem>太平洋时间(美国和加拿大)</asp:ListItem>
                     <asp:ListItem>(GMT -07:00) 山区时间(美国和加拿大), 亚利桑那</asp:ListItem>
                      </asp:DropDownList></td>
                   
            </tr>
        </table>
      </div>
        <div class="J-foot">
            <table>
              <tr>
               <td>当前时间 : </td>  
            </tr>
                     <tr>
                <td>如果发现当前显示的时间与您本地时间相差几个小时，那么您需要更改自己的时区设置
</td>  
            </tr>
                     <tr>
                <td rowspan="4" >
                    <input type="button"  value="保存"  id="Buttonbase" />
               <div id="Buttonbasediv0" class="buttonbases"> 数据更新成功!<input  style="height:20px;width:40px;background-color:rgb(238, 155, 155)" type="button" id="Buttonbasediv1" value="关闭"/></div>

                   </td>  
            </tr>
            </table>
        </div>
            </div>
         
                                                                                                                                                                                                                                                                                                                                                                                                
        <div class="S-contactclass" style="display:block;" id="S-contact1">
            <table>
            <tr >
                <td class="jcen1">用户名</td>
                 <td colspan="2" >
                     <asp:Label ID="Labelname2" runat="server" Text="夜雨下的你"></asp:Label></td>     
            </tr>
                <tr>
                <td class="jcen1">真实姓名</td>
                 <td>
                   <asp:TextBox ID="TextBoxname3" runat="server" Width="324px"></asp:TextBox></td>
                 <td class="jcen0">
                     <asp:DropDownList ID="DropDownListbname3" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                <tr>
                <td class="jcen1">性别</td>
                 <td>
                     <asp:DropDownList ID="DropDownListsex" runat="server">
                         <asp:ListItem>男</asp:ListItem>
                         <asp:ListItem>女</asp:ListItem>
                     </asp:DropDownList>
                 </td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListsex0" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
               <tr>
                <td class="jcen1">生日</td>
                 <td>
                     <asp:DropDownList ID="DropDownListyear" runat="server" OnLoad="Funyear" Height="16px" Width="58px" onclick="birthday()">        
                     </asp:DropDownList>
                       <asp:DropDownList ID="DropDownListMonth" runat="server" Height="16px" Width="45px" onclick="birthday()">        
                     </asp:DropDownList>
                       <asp:DropDownList ID="DropDownListday" runat="server"  Height="16px" Width="45px"  >        
                     </asp:DropDownList>
                   </td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListbirthday" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                <tr>
                <td class="jcen1">出生地</td>
                 <td>      
                     <div id="updatebir" style="position:absolute;margin-left:0px;margin-top:-8px;"><asp:Label ID="Labelxianshiwenben" runat="server" Text="出生地"></asp:Label><a href="#" onclick="updatebir()">(修改)</a></div>
                      <asp:DropDownList ID="DropDownListbir" runat="server" OnLoad="gun" Height="16px" Width="65px" onclick="getgroup(this.value,0)"  class="district3">   
                     </asp:DropDownList>               
                       <asp:DropDownList ID="DropDownListbir2" runat="server" Height="17px" Width="65px" onclick="getgroup(this.value,1)" class="district0">        
                     </asp:DropDownList>
                       <asp:DropDownList ID="DropDownListbir3" runat="server" Height="16px" Width="65px"  onclick="getgroup(this.value,2)" class="district1">                                  
                     </asp:DropDownList>
                        <asp:DropDownList ID="DropDownListbir4" runat="server" Height="16px" Width="65px"  class="district2"> 
                                  
                     </asp:DropDownList>
                    </td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListbir5" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                <tr>
                <td class="jcen1">居住地</td>
                 <td>
                     <div id="updatebir0" style="position:absolute;margin-left:0px;margin-top:-8px;"><asp:Label ID="Labelbirtext" runat="server" Text="居住地"></asp:Label><a href="#" onclick="updatebir0()">(修改)</a></div>
                      <asp:DropDownList ID="DropDownListlive1" runat="server" Height="16px" Width="65px"  onclick="getgroup2(this.value,0)" class="district3">        
                     </asp:DropDownList>
                       <asp:DropDownList ID="DropDownListlive2" runat="server" Height="16px" Width="65px" style="display:none" onclick="getgroup2(this.value,1)" class="district0">        
                     </asp:DropDownList>
                       <asp:DropDownList ID="DropDownListlive3" runat="server" Height="16px" Width="65px" style="display:none" onclick="getgroup2(this.value,2)" class="district1"> 
                                  
                     </asp:DropDownList>
                        <asp:DropDownList ID="DropDownListlive4" runat="server" Height="16px" Width="65px" style="display:none" class="district2"> 
                                  
                     </asp:DropDownList></td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListlive5" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                <tr>
                <td class="jcen1">情感状态</td>
                 <td>
                     <asp:TextBox ID="TextBoxemotion" runat="server"  Width="324px" OnLoad="TextBoxemotion_Load"></asp:TextBox></td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListemotion" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                <tr>
                <td class="jcen1">交友目的</td>
                 <td>
                    <asp:TextBox ID="TextBoxgoal" runat="server" Width="324px"></asp:TextBox> </td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListgoal" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                <tr>
                <td class="jcen1">血型</td>
                 <td >

                     <asp:DropDownList ID="DropDownListBlooda" runat="server">
                         <asp:ListItem>A</asp:ListItem>
                         <asp:ListItem>B</asp:ListItem>
                         <asp:ListItem>AB</asp:ListItem>
                         <asp:ListItem>O</asp:ListItem>
                     </asp:DropDownList></td>     
                     <td class="jcen0"><asp:DropDownList ID="DropDownListBlood" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>         
            </tr>
                <tr>
                <td class="jcen1">年级</td>
                     <td> <span style="color:red">*</span><asp:TextBox ID="TextBox1" runat="server" Width="324px"></asp:TextBox> </td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListgrade" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td> 
                   
            </tr>
                   <tr>
                <td class="jcen1">专业</td>
                     <td> 
                       <span style="color:red">*</span><asp:Label ID="Labelprofession" runat="server" Text="未知"></asp:Label></td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListprofession" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td> 
                   
            </tr>
                <tr>  <td colspan="3"  class="Jceny">
                    <input  type="button" id="Buttonbasic" value="保存"/>
                    <div id="Buttonbasicdiv0" class="buttonbases"> 数据更新成功!<input  style="height:20px;width:40px;background-color:rgb(238, 155, 155)" type="button" id="Buttonbasicdiv1" value="关闭"/></div>
                    </td></tr>
              
        </table>
        </div>
        <div id="S-contact2" style="display:none;" class="S-contactclass">
            <table>
               <tr >
                <td class="jcen1">用户名</td>
                 <td colspan="2" >
                     <asp:Label ID="Labelname3" runat="server" Text="夜雨下的你"></asp:Label></td>     
            </tr>
                <tr>
                <td class="jcen1">固定电话</td>
                 <td>
                   <asp:TextBox ID="TextBoxphone" runat="server" Width="324px"></asp:TextBox></td>
                 <td class="jcen0">
                     <asp:DropDownList ID="DropDownListphone" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                <tr>
                <td class="jcen1">手机</td>
                 <td>
                  <asp:TextBox ID="TextBoxtelephone" runat="server" Width="324px"></asp:TextBox>
                  
                 </td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListtelephone" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                <tr>
                <td class="jcen1">QQ</td>
                 <td>
                    <asp:TextBox ID="TextBoxQQ" runat="server" Width="324px"></asp:TextBox>
                  
                   </td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListQQ" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                 <tr>
                <td class="jcen1">阿里旺旺</td>
                 <td>
                    <asp:TextBox ID="TextBoxaliwangwang" runat="server" Width="324px"></asp:TextBox>
                  
                   </td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListaliwangwang" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                 <tr>
                <td class="jcen1">Email</td>
                 <td>
                     <asp:Label ID="LabelEmail" runat="server" Text="267275@qq.com"></asp:Label><a href="#">(修改)</a>
                   </td>
                 
                 
            </tr>
                <tr> <td colspan="3"  class="Jceny">

                                  <input   type="button"  id="Buttoncontact" value="保存" />
                                   <div id="Buttoncontactdiv0" class="buttonbases"> 数据更新成功!<input  style="height:20px;width:40px;background-color:rgb(238, 155, 155)" type="button" id="Buttoncontactdiv1" value="关闭"/></div>

                     </td></tr>
            </table>
        </div>
        <div id="S-contact3" style="display:none;"  class="S-contactclass">

              <table>
               <tr >
                <td class="jcen1">用户名</td>
                 <td colspan="2" >
                     <asp:Label ID="Labelname4" runat="server" Text="夜雨下的你"></asp:Label></td>     
            </tr>
                <tr>
                <td class="jcen1">毕业学校</td>
                 <td>
                   <asp:TextBox ID="TextBoxuniversity" runat="server" Width="324px"></asp:TextBox></td>
                 <td class="jcen0">
                     <asp:DropDownList ID="DropDownLisuniverty" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                <tr>
                <td class="jcen1">学历</td>
                 <td>
                  <asp:TextBox ID="TextBoxEducation" runat="server" Width="324px"></asp:TextBox>
                  
                 </td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListEducation" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                   <tr>
                        <td colspan="3"  class="Jceny">

          <input  type="button"  id="ButtonEducation" value="保存" />
                                           <div id="ButtonEducationdiv0" class="buttonbases"> 数据更新成功!<input  style="height:20px;width:40px;background-color:rgb(238, 155, 155)" type="button" id="ButtonEducationdiv1" value="关闭"/></div>

     </td></tr>
                  </table>
        </div>
        <div  id="S-contact4" style="display:none;" class="S-contactclass">
             
 <table>
               <tr >
                <td class="jcen1">用户名</td>
                 <td colspan="2" >
                     <asp:Label ID="Labelname5" runat="server" Text="夜雨下的你"></asp:Label></td>     
            </tr>
                <tr>
                <td class="jcen1">公司</td>
                 <td>
                   <asp:TextBox ID="TextBoxcompany" runat="server" Width="324px"></asp:TextBox></td>
                 <td class="jcen0">
                     <asp:DropDownList ID="DropDownListcompany" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                <tr>
                <td class="jcen1">职业</td>
                 <td>
                  <asp:TextBox ID="TextBoxOccupation" runat="server" Width="324px"></asp:TextBox>
                  
                 </td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListOccupation" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
       <tr>
                <td class="jcen1">职位</td>
                 <td>
                  <asp:TextBox ID="TextBoxposition" runat="server" Width="324px"></asp:TextBox>
                  
                 </td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListposition" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
       <tr>
                <td class="jcen1">年收入</td>
                 <td>
                  <asp:TextBox ID="TextBoxannual_income" runat="server" Width="324px"></asp:TextBox>
                  
                 </td>
                 <td class="jcen0"><asp:DropDownList ID="DropDownListannual_income" runat="server">
                         <asp:ListItem>公开</asp:ListItem>
                         <asp:ListItem>好友可见</asp:ListItem>
                         <asp:ListItem>保密</asp:ListItem>
                     </asp:DropDownList></td>
                 
            </tr>
                   <tr>
                        <td colspan="3"  class="Jceny">

                           <input   type="button" id="Buttonconditions" value="保存" />
                 <div id="Buttonconditionsdiv0" class="buttonbases"> 数据更新成功!<input  style="height:20px;width:40px;background-color:rgb(238, 155, 155)" type="button" id="Buttonconditionsdiv1" value="关闭"/></div>

       </td></tr>
                  </table>
        </div>
     </div>

     </form>
</asp:Content>
