﻿
//林玲

$(document).ready(function () {
    //$(".Control").mousedown(function (e) {
    //    var xx = e.originalEvent.x || e.originalEvent.layerX || 0;
    //    var yy = e.originalEvent.y || e.originalEvent.layerY || 0;
    //    $('.Control').css({ top: yy+'px', left: xx +'px'});
    //});

    //window.onload = function () {
    //    var oCtl = document.getElementsByClassName('Control')[0];
    //    var disX = 0;
    //    var disY = 0;

    //    oCtl.onmousedown = function (ev) {
    //        var oEvent = ev || event;

    //        disX = oEvent.clientX - oCtl.offsetLeft;
    //        dixY = oEvent.clientY - oCtl.offsetTop;

    //        if (oCtl.setCapture) //IE
    //        {
    //            oCtl.onmousemove = mouseMove;

    //            oCtl.onmouseup = mouseUp;

    //            oCtl.setCapture();
    //        }
    //        else //chrome, FF
    //        {
    //            document.onmousemove = mouseMove;
    //            document.onmouseup = mouseUp;
    //        }
    //        function mouseMove(ev) {
    //            var oEvent = ev || event;
    //            var l = oEvent.clientX - disX;
    //            var t = oEvent.clientY - disY;

    //            oCtl.style.left = l + 'px';
    //            oCtl.style.top = t + 'px';
    //        }
    //        function mouseUp() {
    //            this.onmousemove = null;
    //            this.onmouseup = null;

    //            //if (oCtl.releaseCapture()) {
    //            //    oCtl.releaseCapture();
    //            //}
    //        }
    //        return false; //chrome, FF, IE9
    //    };
    //};
    $(".roof a").mouseover(function () {
        $(this).css("background-position", "0px -20px");
    });
    $(".roof a").mouseout(function () {
        $(this).css("background-position", "0px 0px");
    });
    $(".roof a").click(function () {
        $(".Control").css("display", "none");
        $(".title input").val("").focus();
        $(".Mix").val("").focus();
    });
});