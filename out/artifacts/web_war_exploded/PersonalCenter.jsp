<%
    if (session.getAttribute("student_id")==null)
        response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html lang="zh-cmn-Hans">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Personal Center</title>
    <link rel="stylesheet" href="./css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin" style="border-bottom: 1px #eb7350 solid">
    <div class="layui-header" style="background-color: #BFD8D2">
        <!-- 头部区域（可配合layui已有的水平导航） -->
        <ul class="layui-nav layui-layout-left" style="background-color: #BFD8D2">
            <li class="layui-nav-item"><a href="homepage.jsp" target="_self">Home</a></li>
            <li class="layui-nav-item"><a href="AllItem.jsp" target="_self">All items</a></li>
            <li class="layui-nav-item"><a href="For_sale.jsp" target="_self">For sale</a></li>
            <li class="layui-nav-item">
                <a href="Favorites.jsp" target="_self">Favorite</a>
            </li>
        </ul>
        <ul class="layui-nav layui-layout-right" style="background-color: #BFD8D2">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="http://t.cn/RCzsdCq" class="layui-nav-img">
                    Me
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="Personal_Information.jsp" target="_self">Basic Information</a></dd>
                    <dd><a href="Favorites.jsp" target="_self">Favorite</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="" target="_self">Log out</a></li>
        </ul>
    </div>


    <div class="layui-side" style="background-color: #BFD8D2">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="Personal_Information.jsp" target="_self">Personal Information</a>
                </li>
                <li class="layui-nav-item">
                    <a href="Favorites.jsp" target="_self">Favorite</a>
                </li>
                <li class="layui-nav-item"><a href="For_sale.jsp" target="_self">For sale</a></li>
                <li class="layui-nav-item"><a href="Message.jsp" target="_self">Message</a></li>
                <li class="layui-nav-item"><a href="Feedback.jsp" target="_self">Feedback</a></li>
            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;">
        <!--logo-->
            <div class="Favorite">
                <ul class="site-doc-icon site-doc-anim">
                    <li>
                        <div class="layui-anim layui-anim-upbit" data-anim="layui-anim-upbit" style="margin-left: 40%">
                            <i class="layui-icon layui-icon-face-smile"style="font-size: 50px; color: #eb7350;">
                            </i>
                            <strong>Favorite</strong>
                        </div>
                    </li>
                    <hr class="layui-bg-orange">
                </ul>
            </div>
            <!---->
            <!-- Item-->
            <table class="like-item" style="width: 95%;margin: 20px auto">
                <tr class="row">
                    <td class="colum">
                        <a href="">
                            <div>
                                <img class="item-image" src="./images/bag.jpg">
                            </div>
                            <div class="item-text">
                                新加坡斜挎包小CK2-90680630 女包宽肩
                            </div>
                        </a>
                        <div class="price">
                            ¥180.00
                        </div>
                    </td >
                    <td class="colum">
                        <a href="">
                            <div>
                                <img class="item-image" src="./images/bag.jpg">
                            </div>
                            <div class="item-text">
                                新加坡斜挎包小CK2-90680630 女包宽肩
                            </div>
                        </a>
                        <div class="price">
                            ¥180.00
                        </div>
                    </td >
                    <td class="colum">
                        <a href="">
                            <div>
                                <img class="item-image" src="./images/bag.jpg">
                            </div>
                            <div class="item-text">
                                新加坡斜挎包小CK2-90680630 女包宽肩
                            </div>
                        </a>
                        <div class="price">
                            ¥180.00
                        </div>
                    </td >
                    <td class="colum">
                        <a href="">
                            <div>
                                <img class="item-image" src="./images/bag.jpg">
                            </div>
                            <div class="item-text">
                                新加坡斜挎包小CK2-90680630 女包宽肩
                            </div>
                        </a>
                        <div class="price">
                            ¥180.00
                        </div>
                    </td >
                </tr>
                <tr class="row">
                    <td class="colum">
                        <a href="">
                            <div>
                                <img class="item-image" src="./images/bag.jpg">
                            </div>
                            <div class="item-text">
                                新加坡斜挎包小CK2-90680630 女包宽肩
                            </div>
                        </a>
                        <div class="price">
                            ¥180.00
                        </div>
                    </td >
                    <td class="colum">
                        <a href="">
                            <div>
                                <img class="item-image" src="./images/bag.jpg">
                            </div>
                            <div class="item-text">
                                新加坡斜挎包小CK2-90680630 女包宽肩
                            </div>
                        </a>
                        <div class="price">
                            ¥180.00
                        </div>
                    </td >
                    <td class="colum">
                        <a href="">
                            <div>
                                <img class="item-image" src="./images/bag.jpg">
                            </div>
                            <div class="item-text">
                                新加坡斜挎包小CK2-90680630 女包宽肩
                            </div>
                        </a>
                        <div class="price">
                            ¥180.00
                        </div>
                    </td >
                    <td class="colum">
                        <a href="">
                            <div>
                                <img class="item-image" src="./images/bag.jpg">
                            </div>
                            <div class="item-text">
                                新加坡斜挎包小CK2-90680630 女包宽肩
                            </div>
                        </a>
                        <div class="price">
                            ¥180.00
                        </div>
                    </td >

                </tr>
                <tr class="row">
                    <td class="colum">
                        <a href="">
                            <div>
                                <img class="item-image" src="./images/bag.jpg">
                            </div>
                            <div class="item-text">
                                新加坡斜挎包小CK2-90680630 女包宽肩
                            </div>
                        </a>
                        <div class="price">
                            ¥180.00
                        </div>
                    </td >
                    <td class="colum">
                        <a href="">
                            <div>
                                <img class="item-image" src="./images/bag.jpg">
                            </div>
                            <div class="item-text">
                                新加坡斜挎包小CK2-90680630 女包宽肩
                            </div>
                        </a>
                        <div class="price">
                            ¥180.00
                        </div>
                    </td >
                    <td class="colum">
                        <a href="">
                            <div>
                                <img class="item-image" src="./images/bag.jpg">
                            </div>
                            <div class="item-text">
                                新加坡斜挎包小CK2-90680630 女包宽肩
                            </div>
                        </a>
                        <div class="price">
                            ¥180.00
                        </div>
                    </td >
                    <td class="colum">
                        <a href="">
                            <div>
                                <img class="item-image" src="./images/bag.jpg">
                            </div>
                            <div class="item-text">
                                新加坡斜挎包小CK2-90680630 女包宽肩
                            </div>
                        </a>
                        <div class="price">
                            ¥180.00
                        </div>
                    </td >

                </tr>
            </table>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        Copyright © 2018 idcs.vip All Rights Reserved.
    </div>
</div>
<script src="layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use('element', function(){
        var element = layui.element;

    });
</script>
</body>
</html>
