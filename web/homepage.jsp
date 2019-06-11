
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%
    if (session.getAttribute("student_id")==null)
        response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Homepage</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        body,html{
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
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

        s      .user-card:hover .user-info{
            display: block;

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


        .user-info{
            display: none;
            width: 300px;
            height: 300px;
            border: 2px solid #dddddd;
            background-color: #fff;
            border-radius: 20px;
            /*float: right;*/
            /* border: 5px green solid;*/

        }

        .info-img {
            margin-top: 4px;
            margin-left: 8px;
            height: 80px;
            width: 80px;
            border-radius: 50px;
            border: 1px solid #EEEEEE;
            display: inline-block;
            margin-left: 40px;
            margin-top: 20px;
        }

        .user_name{
            display: inline-block;
            font-size: 1.3em;
            position: relative;
            left: 30px;
            top: -30px;
        }
        .grey{
            border: none;
            background-color: #A9A9A9;
            height: 1px;
            width: 280px;
            margin:5px auto;
        }
        .user_text a{
            text-decoration: none;
            color: #f5f5f5;
        }
        .user_text{
            color: black;
            background-color: #eb7350;
            width: 70px;
            height: 30px;
            border-radius: 20px;
            text-align: center;
            vertical-align: middle;
            margin-left: 200px;
            margin-top: 10px;
        }
        .first a{
            text-decoration: none;
            color: black;
        }
        .second a{
            text-decoration: none;
            color: black;
        }
        .for_sale:hover{
            background-color: #dddddd;
        }
        .for_sale{
            background-color: #efefef;
            height: 40px;
            width: 120px;
            border-radius: 5px;
        }
        .publish1{
            transition: All 0.4s ease-in-out;
            -webkit-transition: All 0.4s ease-in-out;
            -moz-transition: All 0.4s ease-in-out;
            -o-transition: All 0.4s ease-in-out;
        }

        .publish1:hover {
            transform: scale(1.1);
            -webkit-transform: scale(1.1);
            -moz-transform: scale(1.1);
            -o-transform: scale(1.1);
            -ms-transform: scale(1.1);
        }
        .like-logo {
            transition: All 0.4s ease-in-out;
            -webkit-transition: All 0.4s ease-in-out;
            -moz-transition: All 0.4s ease-in-out;
            -o-transition: All 0.4s ease-in-out;
        }

        .like-logo:hover {
            transform: translate(0, -10px);
            -webkit-transform: translate(0, -10px);
            -moz-transform: translate(0, -10px);
            -o-transform: translate(0, -10px);
            -ms-transform: translate(0, -10px);
        }

    </style>

    <style type="text/css">
        <!--
        label {display:block;}
        -->
    </style>

</head>
<body>
<!-- ******************************THIS PART IS THE HEADER THAT USERS HAVE LOG IN ***********************************-->
<!-- Header -->
<div class="header" >
    <div style="background-color:#CAEBF2; width: 337px; height:100px; float: left">
        <img src="images/a.png" height="70" width="337"/></div>
    <div style="float:right; margin-top: -3px;">
        <div  style="display: inline-block;position: relative;left: -250px">
            <!--Personal information-->
            <div id="nav">
                <div class="user-card">
                    <div class="user-card-item">
                        <div class="user-img">
                            <a href="#" ><img src="./images/person_info.png"></a>
                        </div>
                        <div class="user-info">
                            <img src="./images/person_info.png" class="info-img">
                            <div class="user_name"> <p> <%
                                out.print(session.getAttribute("student_id"));
                            %></p> <!--数据库需要读取--> </div>
                            <hr style="opacity: 0.2;" class="grey">
                            <div class="select_Button">
                                <div class="first" style="margin-top: 20px;margin-left: 25px">
                                    <!-- 1-->
                                    <a href="For_sale.jsp" target="_self" style="display: inline-block;margin-right: 5px">
                                        <div class="for_sale" >
                                            <img style="display: inline-block;width: 35px;height: 35px;margin-left: 5px" src="./images/On-Sale.png">
                                            <p style="display: inline-block;position: relative;top:-10px;font-weight: bold">For Sale</p>
                                        </div>
                                    </a>
                                    <!-- 2 -->
                                    <a href="Favorites.jsp" target="_self" style="display: inline-block">
                                        <div class="for_sale">
                                            <img style="display: inline-block;width: 35px;height: 35px;margin-left: 5px" src="./images/favorite.png">
                                            <p style="display: inline-block;position: relative;top:-10px;font-weight: bold">Favorite</p>
                                        </div>
                                    </a>
                                </div>
                                <div class="second" style="margin-top:5px;margin-left: 25px">
                                    <!-- 1-->
                                    <a href="Feedback.jsp" target="_self" style="display: inline-block;margin-right: 5px">
                                        <div class="for_sale">
                                            <img style="display: inline-block;width: 35px;height: 35px;margin-left: 5px" src="./images/feedback.png">
                                            <p style="display: inline-block;position: relative;top:-10px;font-weight: bold">Feedback</p>
                                        </div>
                                    </a>
                                    <!-- 2 -->
                                    <a href="Personal_Information.jsp" target="_self" style="display: inline-block">
                                        <div class="for_sale">
                                            <img style="display: inline-block;width: 35px;height: 35px;margin-left: 5px" src="./images/person.png">
                                            <p style="display: inline-block;position: relative;top:-10px;font-weight: bold">Personal</p>
                                        </div>
                                    </a>
                                </div>
                                <hr style="margin-top: 20px;opacity:0.2;" class="grey">
                                <div class="user_text">
                                    <a href="login.jsp" target="_self">Log out</a>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--Cart-->
        <div style="display: inline-block;position: relative;left: -50px" class="topics">
            <a class="link" href="mycart.jsp" target="_self">
                <img style="width: 35px;height: 35px;margin-top: 25px;margin-left: 35px" src="./images/cart.png">
            </a>
        </div>

    </div>
    <ul>
        <li class="topics" style="margin-left: 10px">
            <a class="link" href="homepage.jsp" target="_self">Homepage</a>
        </li>
        <li class="topics">
            <a class="link" href="AllItem.jsp" target="_self">All Items</a>
        </li>

        <!-- **************** Search ********************** -->
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
</div>
<!-- *****************************************************************-->

<!-- 导航+轮播屏 + 发布闲置 -->
<div class="Half" >
    <!-- 轮播屏-->
    <div id="container">

        <div class="banner">  <!-- 整个banner 菜单加轮播的区域 height: 476px, width: 800px-->

            <div class="box">  <!--菜单+轮播 height:444px width:768px 有阴影的边框-->

                <div class="menu-wrap">  <!--菜单的区域 height: 444px width: 290px -->

                    <div class="menuContent"> <!--菜单的区域 -->

                        <div class="item">   <!--菜单里面的一行一行的内容 height: 85px, width：280px -->

                            <a href="AllItem.jsp">
                                <span class="group">Used Books</span>
                            </a>

                        </div>

                        <div class="item">

                            <a href="AllItem.jsp">
                                <span class="group">Food</span>
                            </a>

                        </div>

                        <div class="item">

                            <a href="AllItem.jsp">
                                <span class="group">Clothes</span>
                            </a>

                        </div>

                        <div class="item">

                            <a href="AllItem.jsp">
                                <span class="group">Electronic devices</span>
                            </a>

                        </div>

                        <div class="item">

                            <a href="AllItem.jsp">
                                <span class="group">Cosmetic</span>
                            </a>

                        </div>

                    </div>

                </div>
                <div class="box-content"> <!-- 里面的内容，height:444px, width:468px position:relative -->

                    <!-- 图片区 -->
                    <div id="banner-img"> <!--banner image: width:468px, height: 444px-->
                        <a href=""><img src="./images/homepage_1.png" style="display: block;"></a>
                        <a href=""><img src="./images/homepage_2.png" style="display: none;"></a>
                        <a href=""><img src="./images/homepage_3.png" style="display: none;"></a>
                    </div>

                    <!-- 小点区 --> <!--right:30px, top: 275px-->
                    <div id="dots"> <!--position absolute; right: 30px; top 275px: -->
                        <span class="dot-active"></span>
                        <span class="dot-native"></span>
                        <span class="dot-native"></span>
                    </div>



                </div>

            </div>

        </div>

    </div>

    <!--发布闲置-->

    <div class="publish1">
        <a  href="Publish.jsp" target="_self">
            <i class="i-web1"></i>
            <p class="p2">Publish Items</p>
        </a>
    </div>
</div>
</div>

<!-- 猜你喜欢 -->
<div class="back">
    <div class="like">
        <div class="like-logo" style="margin-top: -40px">
            <img src="./images/like.png"/>
            <span class="text" >
        Guess / You / Would / Like
    </span>
        </div>

        <!-- 猜你喜欢的物品-->

        <table class="like-item" style="width: 95%;margin: 80px auto">
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Statement like_item_stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();

                //已测试过，sql可在MySQL 可运行： 随机从item表中选8个item
//                SELECT item_id, title, price
//                FROM peproject.item
//                ORDER BY  RAND() LIMIT 10

                String like_item_sql ="SELECT item_id, title,picture, price \n" +
                        "FROM peproject.item  \n" +
                        "ORDER BY  RAND() LIMIT 8";
                ResultSet like_item_rs = like_item_stm.executeQuery(like_item_sql);

                int count=0; //
                while(like_item_rs.next())
                {
                    //判断是否开始新的一行
                    if(count==0||count==4){
            %>
            <tr class="row">
                <%
                    }
                %>
                <td class="colum">
                    <a href="item_information.jsp?item_id=<%=like_item_rs.getString("item_id")%>">
                        <div>
                            <img class="item-image" src="images/<%=like_item_rs.getString("picture")%>.png">
                        </div>
                        <div class="item-text">
                            <%=like_item_rs.getString("title")%>

                        </div>
                    </a>
                    <div class="price">
                        $<%=like_item_rs.getString("price")%>
                    </div>
                </td >
                <%
                    count++;
                    //判断该行是否放满4个商品
                    if(count==4||count==8){
                %>
            </tr>
            <%
                }
            %>

            <%
                }
            %>

        </table>
    </div>
</div>
<!--footer -->
<div class="footer">
    <!-- 主页信息-->
    <div class="information_footer" >
        <!--图标加描述-->
        <div style="display: inline-block; border-right:3px #EEEEEE solid;padding-right: 70px" >
            <img src="./images/logo.png" style="width: 140px;height: 140px;margin-top: 20px;margin-bottom: 10px">
            <div style="font-size: 1.3em; color:black;font-family: Arial;margin-bottom: 20px">
                Xiamen University Malaysia Second Hand Exchange
            </div>
        </div>
        <!-- 联系信息 -->
        <div style="display: inline-block; font-family: Arial;margin-left: 60px">
            <div style="font-size: 1.6em;font-weight: bold;color: #4F4F4F">
                <img src="./images/shop.png"style="width: 50px;height: 50px;display: inline-block;position: relative;top: -20px">
                <p style="display: inline-block;position: relative;top: -35px;margin-left: 30px"> XMUM LIFE </p>
            </div>
            <div>
                <img src="./images/address.png" style="width: 30px;height: 30px;margin-left: 40px">
                Jalan Sunsuria, Bandar Sunsuria, 43900 Sepang, Selangor Darul Ehsan, Malaysia
            </div>
            <div>
                <img src="./images/telephone.png"style="width: 30px;height: 30px;margin-top: 10px">
                Contact Number : 017-6922751
            </div>
        </div>
    </div>
    <div class="footer_bottom">
        <a href="homepage.jsp">
            <div class="block1">
                Home page
            </div>
        </a>
        <a href="AllItem.jsp">
            <div class="block2">
                All Item
            </div>
        </a>
        <a href="Feedback.jsp">
            <div class="block3">
                Feedback
            </div>
        </a>

        <div style="color: #f8f8f8; margin-top: 50px; font-size: 0.8em;font-family: 'Arial'">
            Copy ©XMUM LIFE 2019 All Reserved
        </div>
    </div>
</div>

<script type="text/javascript" src="js.js"></script>
</body>
</html>
</body>
</html>

