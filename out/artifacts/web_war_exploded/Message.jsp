<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Message</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style type="text/css">
        <!--
        label {display:block;}
        -->
        @keyframes scaleDraw {  /*定义关键帧、scaleDrew是需要绑定到选择器的关键帧名称*/
            0%{
                transform: scale(1);  /*开始为原始大小*/
            }
            25%{
                transform: scale(1); /*放大1.1倍*/
            }
            50%{
                transform: scale(1.1);
            }
            75%{
                transform: scale(1);
            }
        }
        .message_logo{
            background-size: 150px 200px;
            -webkit-animation-name: scaleDraw; /*关键帧名称*/
            -webkit-animation-timing-function: ease-in-out; /*动画的速度曲线*/
            -webkit-animation-iteration-count: 1;  /*动画播放的次数*/
            -webkit-animation-duration: 4s; /*动画所花费的时间*/
        }
        .user-card{
            width: 83px;
            height: 100px;
            float: left;
            /* border: 1px solid gray;*/
            margin-left: 15px;
        }

        .user-card:hover .user-img{
            border: 2px solid #eb7350;
            width: 64px;
            height: 64px;
            margin-top: 10px;
        }

        .user-card:hover .user-img img{
            width: 64px;
            height: 64px;
        }

        .user-img{
            width: 64px;
            height: 64px;
            margin-left: 12px;
            margin-top: 14px;
            margin-bottom: 7px;
            border: 1px solid #dddddd;
            border-radius: 50%;
        }

        .user-img img{
            width: 62px;
            height: 62px;
            border-radius: 50%;
        }

        .user_text a{
            text-decoration: none;
            color: #f5f5f5;
        }

        .first a{
            text-decoration: none;
            color: black;
        }
        .second a{
            text-decoration: none;
            color: black;
        }
        .log_out a{
            text-decoration: none;
            color: white;
            font-family: "Microsoft YaHei";
            font-size: 1.2em;
        }
        .log_out :hover{
            cursor: pointer;
            color: #eb7350;
        }

    </style>
    <script type="text/javascript" language="javaScript">

        function del(url){

            if(confirm("Are you sure to detele it？")){

                window.location.href = "delselect.jsp?id="+url;

            }

            document.form1.action("delselect.jsp?id="+url);

        }

    </script>
</head>
<body>
<!-- Header-->
<div class="header_item1" style="width: 1520px;">
    <div style="float:right; margin-top: -3px;">
        <div  style="display: inline-block;position: relative;left: -250px">
            <!--Personal information-->
            <div id="nav">
                <div class="user-card">
                    <div class="user-card-item">
                        <div class="user-img">
                            <a href="Personal_Information.jsp" target="_self" ><img src="./images/person_info.png"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Cart-->
        <div style="display: inline-block;position: relative;left: -50px" class="topics">
            <a class="link" href="mycart.jsp" target="_self">
                <img style="width: 35px;height: 35px;margin-top: 25px;margin-left: 35px" src="./images/cart1.png">
            </a>
        </div>
        <!-- Log out -->
        <div class="log_out" style="display: inline-block;position: relative; top: -50px;left: -120px">
            <a  href="login.jsp" target="_self">
                Log out
            </a>
        </div>
        <!-- -->
    </div>
    <ul>
        <li class="topics_w" style="margin-left: 220px;">
            <a class="link1" href="homepage.jsp" target="_self">Homepage</a>
        </li>
        <li class="topics_w">
            <a class="link1" href="AllItem.jsp" target="_self">All Items</a>
        </li>

        <form name="form1" action="" method="">
            <div class="form" style="float: left; margin-top: 20px;">
                <input type="text" name="search_content" id="search_content" placeholder="Search here..."  style="border-top-right-radius: 5px; border-bottom-right-radius: 5px;height: 38px">
                <input type="submit" onclick="window.open('search.jsp')"  style="background-color: #eb7350;color: white;width:70px;font-size: 0.8em;
border-bottom-right-radius: 5px;border-top-right-radius: 5px;height: 38px;margin-top: -2px;margin-left: -4px" id="search" name="Submit" value="SEARCH" >
                <span class="t"></span>
                </button>
            </div>
        </form>
    </ul>
    <div style="clear: both"></div>
</div>

<!-- 左侧导航栏-->
<div class="scroller">

    <ul>
        <li class="item_left">
            <a class="" href="Personal_Information.jsp" target="_self">Personal Information</a>
        </li>
        <li class="item_left">
            <a href="Favorites.jsp" target="_self">Favorite</a>
        </li>
        <li class="item_left"><a href="For_sale.jsp" target="_self">For sale</a></li>
        <li class="item_left"><a href="Message.jsp" target="_self">Message</a></li>
        <li class="item_left"><a href="Feedback.jsp" target="_self">Feedback</a></li>
    </ul>
</div>
<div class="left_body">
    <!-- 内容主体区域-->
    <div style="padding: 15px;margin-bottom: 100px" >
        <!--logo-->
        <div>
            <div class="message_logo" style="margin-left: 40%;">
                <img src="images/message.png" height="80" width="80"/>
                <div style=" font-size: 1.4em;margin-left: 0.8%">
                    <strong>Message</strong>
                </div>
            </div>
            <!--下划线-->
            <hr class="orange">
        </div>
        <!--主体部分-->
        <div class="back">
            <!--Message-->
            <div class="item1_content">
                <div class="item1">
                    <a href="">新加坡斜挎包小CK2-90680630 女包宽肩</a>
                </div>
                <div class="bottom_content">
                    <div class="message_a">
                        <a href="">
                            <div class="Personal_avatar">
                                <img class="message_img" src="./images/person.png">
                            </div>
                            <div class="nickname">
                                用户名
                            </div>
                    </div>
                    <div class="message_info">
                        什么时候可以发货？
                    </div>
                    <input class="delete1" type="button" value="delete" onclick="del(1)"/>
                    <div class="time">
                        2019-01-01
                    </div>
                </div>
                </a>
            </div>
            <!--上面是其中一个例子-->
            <div class="item1_content">
                <div class="item1">
                    <a href="">新加坡斜挎包小CK2-90680630 女包宽肩</a>
                </div>
                <div class="bottom_content">
                    <div class="message_a">
                        <a href="">
                            <div class="Personal_avatar">
                                <img class="message_img" src="./images/person.png">
                            </div>
                            <div class="nickname">
                                用户名
                            </div>
                    </div>
                    <div class="message_info">
                        什么时候可以发货？
                    </div>
                    <input class="delete1" type="button" value="delete" onclick="del(1)"/>
                    <div class="time">
                        2019-01-01
                    </div>
                </div>
                </a>
            </div>
            <!-->
            <div class="item1_content">
                <div class="item1">
                    <a href="">新加坡斜挎包小CK2-90680630 女包宽肩</a>
                </div>
                <div class="bottom_content">
                    <div class="message_a">
                        <a href="">
                            <div class="Personal_avatar">
                                <img class="message_img" src="./images/person.png">
                            </div>
                            <div class="nickname">
                                用户名
                            </div>
                    </div>
                    <div class="message_info">
                        什么时候可以发货？
                    </div>
                    <input class="delete1" type="button" value="delete" onclick="del(1)"/>
                    <div class="time">
                        2019-01-01
                    </div>
                </div>
                </a>
            </div>
            <div style="margin-left: 20px;margin-top: 120px;">
                <!-- 底部固定区域-->
                Copy © XMUM LIFE 2019 All Reserved
            </div>
        </div>

</body>
</html>