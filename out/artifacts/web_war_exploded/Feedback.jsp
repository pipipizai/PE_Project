<!DOCTYPE html>
<%
    if (session.getAttribute("student_id")==null)
        response.sendRedirect("login.jsp");
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feedback</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
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
        .feedback_logo{
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

        <form name="form1" action="/SearchItem" method="post">
            <div class="form" style="float: left; margin-top: 20px;">
                <input type="text" name="search_content" id="search_content" placeholder="Search here..."  style="border-top-right-radius: 5px; border-bottom-right-radius: 5px;height: 38px">
                <input type="submit" style="background-color: #eb7350;color: white;width:70px;font-size: 0.8em;
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
        <li class="item_left"><a href="Feedback.jsp" target="_self">Feedback</a></li>
    </ul>
</div>
<div class="left_body">
    <!-- 内容主体区域-->
    <div style="padding: 15px">
        <!--logo-->
        <div>
            <div class="feedback_logo" style="margin-left: 40%;">
                <img src="images/feedback.png" height="100" width="100"/>
                <div style=" font-size: 1.4em;margin-left: 0.8%">
                    <strong>Feedback</strong>
                </div>
            </div>
            <!--下划线-->
            <hr class="orange">
        </div>
        <!--主体部分-->
        <form id="feedback" method="post" action="/AddFeedback">
            <div class="back">
                <label  style="width: 200px;font-family: 'Microsoft YaHei UI';font-size: 1.3em; margin-top:70px;margin-left: 5%">
                    Please leave your opinion:
                </label>
                <select name="selectAge" class="select1" >
                    <option value="">Please select the type of suggestion</option>
                    <option value="Production problem">Production problem</option>
                    <option value="Promotion problem">Promotion problem</option>
                    <option value="Payment problem">Payment problem</option>
                    <option value="Refund issue">Refund issue</option>
                    <option value="Delivery problem">Delivery problem</option>
                    <option value="After sales problem">After sales problem</option>
                    <option value="Others">Others</option>
                </select>

                <label  class="label1" style="position: relative;left: -700px;" >
                    The description of the problems:
                </label>
                <div>
                    <textarea class="textarea1" name="description"></textarea>
                </div>
                <!--button-->
                <div class="button1">
                    <input type="submit" name="Feedback" value="Feedback" style="width:100px; height: 20px; border-width: 0px; border-radius: 3px; background: #1E90FF; cursor: pointer;outline: none; font-family: Microsoft YaHei; color: white; font-size: 17px; background: #eb7350;" >
                </div>
            </div>
        </form>
    </div>
    <div style="margin-left: 20px">
        <!-- 底部固定区域-->
        Copy © XMUM LIFE 2019 All Reserved
    </div>
</div>
</body>
</html>