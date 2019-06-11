// 拿父控件
const banner = document.getElementById('banner-img');
// 通过父控件找下面的元素
const imgs = banner.getElementsByTagName('img');

console.log(imgs);

//全局变量，用于记录当前页面的值
var current = 0;

function changeImg(){

    console.log(current);

    // 将除了自己以外的全部设为none
    //此时current应该是none的
    for(let i=0;i<3;i++){
        if (i!=current) {
            imgs[i].style.display="none";
        }
    }
    
    //全部消除了之后再设置
    imgs[current].style.display="block"
}

//存放interval的id
var result ;

console.log('hello');

// 添加hover事件，取消轮播
banner.addEventListener('mouseover',()=>{
    console.log('mouseover');
    clearInterval(result);
},true);

banner.addEventListener('mouseout',()=>{

    //定时轮播
    result= setInterval(()=>{

        // 超过2之后要从头开始
        if (current==3) {
            current=0;
        }

        //console.log(current);

        changeImg();
        changeDot(current);

        current++;
    
    },1000);

},true);


var dots = document.getElementById('dots').getElementsByTagName('span');

function changeDot(index){

    // 先取消全部
        for(let j=0;j<3;j++){
            dots[j].className = 'dot-native';
        }

        dots[index].className = 'dot-active';
}

for(let i=0;i<3;i++){

    let temp = dots[i];

    // 每个按钮的操作
    temp.addEventListener('click',()=>{

        changeDot(i);
        //切换图片
        current=i;
        changeImg();
    });

}


//定时轮播
result= setInterval(()=>{

    // 超过2之后要从头开始
    if (current==3) {
        current=0;
    }

    //console.log(current);

    changeImg();
    changeDot(current);

    current++;
    
},1000);

// All_item
function tabPageControl(n)
{
    for (var i = 0; i < tabTitles.cells.length; i++)
    {
        tabTitles.cells[i].className = "tabTitleUnSelected";
    }
    tabTitles.cells[n].className = "tabTitleSelected";

    for (var i = 0; i < tabPagesContainer.tBodies.length; i++)
    {
        tabPagesContainer.tBodies[i].className = "tabPageUnSelected";
    }
    tabPagesContainer.tBodies[n].className = "tabPageSelected";
}

//var files = document.getElementById('pic').files;
var form = new FormData();//通过HTML表单创建FormData对象
var url = '127.0.0.1:8080/'
function selectFile(){
    var files = document.getElementById('pic').files;
    console.log(files[0]);
    if(files.length == 0){
        return;
    }
    var file = files[0];
    //把上传的图片显示出来
    var reader = new FileReader();
    // 将文件以Data URL形式进行读入页面
    console.log(reader);
    reader.readAsBinaryString(file);
    reader.onload = function(f){
        var result = document.getElementById("result");
        var src = "data:" + file.type + ";base64," + window.btoa(this.result);
        result.innerHTML = '<img src ="'+src+'"/>';
    }
    console.log('file',file);
    form.append('file',file);
    console.log(form.get('file'));
}


