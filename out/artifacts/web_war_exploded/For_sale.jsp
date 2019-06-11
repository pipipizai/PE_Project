<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%
    if (session.getAttribute("student_id")==null)
        response.sendRedirect("login.jsp");
%>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>For_sale</title>
    <link rel="stylesheet" href="style.css">
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
        .for_sale_logo{
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

        /*function del(){

            if(confirm("Are you sure to detele it?")){

                document.form2.action="DeleteItem";

            }

            document.form1.action("For_sale.jsp");

        }*/

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
            <div class="for_sale_logo" style="margin-left: 40%;">
                <img src="images/On-Sale.png" height="100" width="100"/>
                <div style=" font-size: 1.4em;margin-left: 1.5%">
                    <strong>For sale</strong>
                </div>
            </div>
            <!--下划线-->
            <hr class="orange">
        </div>
<%
//String tid= request.getParameter("tid");
Class.forName("com.mysql.jdbc.Driver");
Statement stm= DriverManager.getConnection("jdbc:mysql://localhost:3306/forum","root","admin").createStatement();
%>
<!--数据库的位置大概在这里，就是循环读取一下商品的信息，图片，描述，价格，一行是4个商品，我写了一个大概的TABLE， TR是行，然后
td部分是列 -->
        <!-- Item-->
        <div class="back">
            <table class="like-item" style="width: 95%;margin: 20px auto">
                <%
                    Class.forName("com.mysql.jdbc.Driver");
                    Statement selling_stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();

                    //已测试过，sql可在MySQL 可运行： 获取该用户所有favorite item
//                    select T.user_id, T.item_id, T.title, T.price
//                    from peproject.user as U, peproject.item as T
//                    where T.user_id = 1 and U.user_id = T.user_id

                    String selling_sql ="select T.user_id, T.item_id, T.title, T.price,picture\n" +
                            "from peproject.user as U, peproject.item as T\n" +
                            "where T.user_id = '"+session.getAttribute("user_id")+"' and U.user_id = T.user_id\n";
                    ResultSet selling_rs = selling_stm.executeQuery(selling_sql);

                    int count_selling=0;
                    while(selling_rs.next())
                    {
                        //判断是否开始新的一行
                        session.setAttribute("item_id", selling_rs.getString("item_id"));
                        if(count_selling%4==0){
                %>
                <tr class="row">
                    <%
                        }
                    %>
                    <td class="colum"  style="width: 250px;margin-left: 4px;">
                        <a href="item_information.jsp?item_id=<%=selling_rs.getString("T.item_id")%>">
                            <div>
                                <img class="item-image" src="images/<%=selling_rs.getString("picture")%>.png" style="width: 250px">
                            </div>
                            <div class="item-text" style="width: 250px;h">
                                <%=selling_rs.getString("title")%>
                                <%--<form name="form2" method="">--%>
                                    <%--<input style="display: inline-block;margin-top: -20px" class="delete" type="button" value="delete" onclick="del()"/>--%>
                                <%--</form>--%>
                            </div>
                        </a>
                        <div class="price" style="display: inline-block">
                            $<%=selling_rs.getString("price")%>
                        </div>
                        <form name="form2" action="/DeleteItem" method="post" style="display: inline-block;position: relative; top: 200px;left: 70px">
                            <input class="delete" type="submit" value="delete" <%--onclick="del()"--%>/>
                        </form>
                    </td >
                    <%
                        count_selling++;
                        //判断该行是否放满4个商品
                        if(count_selling%4==0 && count_selling!=0){
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
        <div style="margin-left: 20px">
            <!-- 底部固定区域-->
            Copy © XMUM LIFE 2019 All Reserved
        </div>
    </div>
</div>
</body>
</html>










