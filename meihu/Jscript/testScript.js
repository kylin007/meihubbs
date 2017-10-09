$(document).ready(function fg() {

    var tdclassv = document.getElementsByClassName("tablesub");
    var tdv = document.getElementsByClassName("yeasubclasstop");
    var flag = new Array();


    for (var j = 0; j < tdv.length; j++) {
        flag[j] = new Array();
        flag[j][0] = 0;
    }
    for (var i = 0; i < tdv.length; i++) {
        tdv[i].index = i;
       
     
         
        tdv[i].onclick = function fun() {
            var m=this.index;
            if (flag[m][0] == 0) 
            {
                tdclassv[m].style.display = 'none';
                $(".yeasubclasstop")[m].innerHTML="展开";
                flag[m][0] = 1;
            }
           else if (flag[m][0] == 1) {
               tdclassv[m].style.display = 'block';
               $(".yeasubclasstop")[m].innerHTML="关闭";
                flag[m][0] = 0;
            }
            }
        

    }
});
//window.onload=setInterval("fg()",50);