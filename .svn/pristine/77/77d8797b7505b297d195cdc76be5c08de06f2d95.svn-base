var oUl1 = document.getElementById('ul1');
var aLi1 = oUl1.getElementsByTagName('li');
var oDiv = document.getElementById('fdModel1');
var oDiv1 = document.getElementById('fdModel2');
var oDiv2 = document.getElementById('friendModel');
var aLi2 = oDiv.getElementsByTagName('li');
var aDiv = oDiv.getElementsByTagName('div');
var oH = document.getElementById('oh');

//全部好友列表
for (var i = 0; i < aLi1.length; i++) {
    aLi1[i].index = i;
    aLi1[i].onclick = function () {
        for (var i = 0; i < aLi1.length; i++) {
            oDiv1.children[i + 1].style.display = 'none';
            aLi1[i].style.background = '#FFECEC';
            aLi1[i].style.borderBottom = 'none';
        }
        this.style.background = 'none';
        this.style.borderBottom = '3px solid #FCF8F1';
        oDiv1.children[this.index + 1].style.display = 'block';
    }
}
//初始化
aLi1[0].style.background = 'none';
aLi1[0].style.borderBottom = '3px solid #FCF8F1';
oDiv1.children[1].style.display = 'block';

//好友列表
for (var i = 0; i < aLi2.length; i++) {
    aLi2[i].index = i;
    aLi2[i].onclick = function () {
        oH.style.borderBottom = '1px dashed #CCC';
        for (var i = 0; i < aLi2.length; i++) {
            oDiv2.children[i + 1].style.display = 'none';
            aLi2[i].style.background = 'none';
            aLi2[i].style.border = 'none';
            aDiv[i].style.borderBottom = '1px dashed #CCC';

        }
        this.style.background = '#FCF8F1';
        aDiv[this.index].style.border = 'none';
        if (this.index != 0) {
            aDiv[this.index - 1].style.border = 'none';
        }
        else {
            oH.style.borderBottom = 'none';
        }
        this.style.border = '1px solid #CDCDCD';
        this.style.borderRight = '3px solid #FCF8F1';
        oDiv2.children[this.index + 1].style.display = 'block';
    }
}
//初始化
aLi2[0].style.background = '#FCF8F1';
aDiv[0].style.border = 'none';
oH.style.borderBottom = 'none';
aLi2[0].style.border = '1px solid #CDCDCD';
aLi2[0].style.borderRight = '3px solid #FCF8F1';
oDiv2.children[1].style.display = 'block';
//查找好友
var oSDiv = document.getElementById('searchFriends');
//oSDiv子节点1-5对应五个界面
var aLi3 = oSDiv.getElementsByTagName('li');


for (var i = 0; i < aLi3.length; i++) {
    aLi3[i].index = i;
    aLi3[i].onclick = function () {
        for (var i = 0; i < aLi3.length; i++) {
            oSDiv.children[i + 1].style.display = 'none';
            aLi3[i].style.background = '#FFECEC';
            aLi3[i].style.borderBottom = 'none';
        }
        this.style.background = 'none';
        this.style.borderBottom = '3px solid #FCF8F1';
        oSDiv.children[this.index + 1].style.display = 'block';
    }
}
for (var i = 0; i < aLi3.length; i++) {
    oSDiv.children[i + 1].style.display = 'none';
    aLi3[i].style.background = '#FFECEC';
    aLi3[i].style.borderBottom = 'none';
}
aLi3[4].style.background = 'none';
aLi3[4].style.borderBottom = '3px solid #FCF8F1';
oSDiv.children[5].style.display = 'block';