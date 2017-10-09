$(document).ready(function () {

    $(".o img").click(function () {
        var num = $(".category .table1");
        if (num.is(":visible")) {   //if(num.css('display')=='block') 
            num.hide();
            $(this).attr('src', "/image/collapsed_yes.gif");
        }
        else {
            num.show();
            $(this).attr('src', "/image/collapsed_no.gif");
        }
    });
});