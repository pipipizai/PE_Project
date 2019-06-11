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
    <title>Personal Information</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script type="text/javascript"  src="js.js"></script>
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
        .personal_information{
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
            <div class="personal_information" style="margin-left: 40%;">
                <img src="images/person.png" height="80" width="80"/>
                <div style=" font-size: 1.4em;margin-left: -60px">
                    <strong>Personal Information</strong>
                </div>
            </div>
            <!--下划线-->
            <hr class="orange">
        </div>
        <!--content-->
        <%

            String id=session.getAttribute("student_id").toString();
            Class.forName("com.mysql.jdbc.Driver");
            Statement stm= DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject","root","admin").createStatement();
            String sql ="(select student_id,nickname,password,nickname,email,wechat,whatsapp,qq\n" +
                    "from user\n" +
                    "where student_id='" + id +"')";
            ResultSet rs=stm.executeQuery(sql);
            if(rs.next())
            {
        %>
        <form action="/UpdatePersonal" id="UpdatePersonal" method="get">
            <!--background-->
            <div class="back">

                <!-- select file-->
                <div>
                    <%--<div class="input_file" style="display: inline-block">--%>
                        <%--<div id = "result"></div>--%>
                        <%--<input id="pic" type="file" name = 'pic' accept = "image/*" onchange = "selectFile()"/>--%>
                    <%--</div>--%>
                        <div style="display: inline-block; width:40%;">
                            <img src="./images/logo.png" style="padding-right: 200px; width: 190px; height: 190px; position: relative; left: 90px" class="input_file">
                        </div>
                    <div class="Information" style="=left: 200px; position: relative;top: -40px">
                        <img src="./images/Name-Tag.png" width="50px" height="50px" style="display: inline-block; margin-right: 20px">
                        <p style="display: inline-block;  color: #eb7350;font-family: Arial;font-weight: bold">Username:</p>
                          <p style="display: inline-block;font-family: Arial;">  <%=rs.getString("nickname")%></p>
                        <div>
                        <img src="./images/idea.png" width="50px" height="50px" style="display: inline-block; margin-right: 20px">
                        <p style="display: inline-block; color: #eb7350;font-family: Arial;font-weight: bold">User_id:</p>
                        <p style="display: inline-block;font-family: Arial;"> <%out.print(session.getAttribute("user_id"));%></p>
                        </div>

                    </div>
                </div>
                <hr class="orange" style="margin-top: 60px">
                <!--下面的个人信息填写-->
                <!-- 1. StudentID-->
                <div class="Person_Text">
                    <label >Student ID:</label>
                    <div>
                        <input class="Person_input" readonly="readonly" type="text" name="student_id" autocomplete="off" placeholder="<%=rs.getString("student_id")%>" >
                    </div>
                </div>
                <!-- 2. Password -->
                <div class="Person_Text">
                    <label >Password:</label>
                    <div>
                        <input class="Person_input" type="password" name="password" autocomplete="off" placeholder="<%=rs.getString("password")%>" >
                    </div>
                </div>
                <!-- 3. Nickname -->
                <div class="Person_Text">
                    <label >Nickname:</label>
                    <div>
                        <input class="Person_input" type="text" name="nickname" autocomplete="off" placeholder="<%=rs.getString("nickname")%>" >
                    </div>
                </div>

                <!-- 4. Email address -->
                <div class="Person_Text">
                    <label >Email Address:</label>
                    <div>
                        <input class="Person_input" type="text" name="email" autocomplete="off" placeholder="<%=rs.getString("email")%>" >
                    </div>
                </div>
                <!-- 5. Wechat -->
                <div class="Person_Text">
                    <label >Wechat:</label>
                    <div>
                        <input class="Person_input" type="text" name="wechat" autocomplete="off" placeholder="<%=rs.getString("wechat")%>" >
                    </div>
                </div>

                <!-- 6. Whatsapp -->
                <div class="Person_Text">
                    <label >Whatsapp:</label>
                    <div>
                        <input class="Person_input" type="text" name="whatsapp" autocomplete="off" placeholder="<%=rs.getString("whatsapp")%>" >
                    </div>
                </div>

                <!-- 7. QQ -->
                <div class="Person_Text">
                    <label >QQ:</label>
                    <div>
                        <input class="Person_input" type="text" name="qq" autocomplete="off" placeholder="<%=rs.getString("qq")%>" >
                    </div>
                </div>



                <!--button-->
                <div class="button1">
                    <input type="submit" name="item" value="Save" style="width:60px; height: 30px; border-width: 0px; border-radius: 3px; background: #1E90FF; cursor: pointer;outline: none; font-family: Microsoft YaHei; color: white; font-size: 17px; background: #eb7350;">
                </div>
            </div>
        </form>
        <%
            }
        %>
    </div>
    <div style="margin-left: 20px">
        <!-- 底部固定区域-->
        Copy © XMUM LIFE 2019 All Reserved
    </div>
</div>
</body>
</html>





