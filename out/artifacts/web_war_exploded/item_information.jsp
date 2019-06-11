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
    <title>Item Information</title>

    <link rel="stylesheet" type="text/css" href="style.css">

    <style type="text/css">
        .button {
            background-color: #f44336; /* Green */
            border: none;
            color: white;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 14px;
            margin: 4px 2px;
            cursor: pointer;
        }
        .button_save{background-color: #f4ea2a;}

        .user_box{
            width:50vw;
            height:50vh;
            margin:0 auto;
        }
        .user_box ul,li{
            list-style: none;
        }

        .user_box ul {
            position: relative;
            display: flex;
            width: 100%;
        }

        .user_box li{
            flex:1;
            height:50px;
        }

        .user_box .input1{
            display:none;
        }

        .user_box .input1+label{
            display:block;
            width:100%;
            height:100%;
            background:#ccc;
            font-size:18px;
            text-align: center;
            line-height: 50px;
            color:white;

        }
        /* 设置div内容的基础样式 隐藏内容div*/
        .user_box .input1+label+div{
            display:none;
            position: absolute;
            left:0;
            top:60px;
            width: 80%%;
            padding: 20px;20px;
        }
        /* input选中状态时候对应的label的样式 */
        .input1:Checked+label{
            background: #eb7350;
            color:#fff;
        }
        /* input选中时候显示对应的div */
        .input1:Checked+label+div{
            display:block;
            width: 80%;
            padding: 20px 20px;
        }
        .user_item_tab_content{
            border: 2px #EEEEEE solid;

        }

    </style>
</head>
<body>

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

<!--body-->
<!--商品介绍-->
<div style="margin-top: 50px">

    <div style="margin:10px auto;width:600px;">
        <%
            //sql语句select item 信息
            Class.forName("com.mysql.jdbc.Driver");
            Statement item_information_stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();

            //已测试过，sql可在MySQL 可运行：
//              select item_id, title, price, description, U.user_id, nickname
//                from peproject.item, peproject.user as U
//                where item.item_id=1 and item.user_id=U.user_id

            String iid=request.getParameter("item_id");
            String item_information_sql ="select item_id, title,picture, price, description, U.user_id, nickname\n" +
                    "from peproject.item, peproject.user as U\n" +
                    "where item_id= "+ iid+" and item.user_id=U.user_id";

            ResultSet item_information_rs = item_information_stm.executeQuery(item_information_sql);
            if(item_information_rs.next())
            {
                session.setAttribute("item_id", item_information_rs.getString("item_id"));

        %>
        <table width="600px" >
            <tr>
                <td>
                    <table>
                        <tr>
                            <div >
                                <img  height="270" width="270" src="images/<%=item_information_rs.getString("picture")%>.png" />
                            </div>
                        </tr>
                    </table>
                </td>
                <td>
                    <table style="font-family: Arial; font-weight: bold; font-size: 1.2em; margin-left: 20px;">
                        <tr>
                            <td height="40px" width="100px ">Title:</td>
                            <td  style="height:40px;width:1200px"><%=item_information_rs.getString("title")%></td>
                        </tr>
                        <tr>
                            <td width="150px" height="40px">Price:</td>

                            <td height="40px" width="100px "><%=item_information_rs.getString("price")%></td>
                        </tr>
                        <tr>
                            <td width="150px" height="40px">Seller:</td>
                            <td height="40px" width="100px "><%=item_information_rs.getString("nickname")%></td>
                        </tr>
                        <tr>
                            <td width="150px" height="40px" >
                                <table>
                                    <tr>
                                        <!-- <td width="150px" height="40px">Save the item </td> -->
                                        <form id="save_item" method="get" action="/AddFavorite">
                                        <td><input type="submit" class="button button_save" value="Save item" ></td>
                                        <td><img width="30px" src="./images/save.png" style="cursor: pointer;" /></td>
                                        </form>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <table>
                                    <tr>
                                        <td>
                                            <a href="mycart.jsp?item_id=<%=iid%>">
                                                <button  class="button ">Reserve</button>
                                            </a>
                                        </td>
                                        <td><img width="30px" style="cursor: pointer;" src="./images/cart.png" /></td>
                                    </tr>

                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>

    <!--商品介绍-->
    <div class="user_box" style="margin-top: 20px;margin-bottom: 500px">
        <ul>
            <li>
                <input class="input1" type="radio" name="Check" id="activee1" Checked><label for="activee1">Item Information</label>
                <div class="user_item_tab_content"style="width: 95%">
                    <!--LOGO + Introduction -->
                    <div>
                        <img style="display: inline-block" src="./images/goods.png" width="60px" height="60px">
                        <p style="font-size: 1.4em; font-family: Arial;font-weight: bold;display: inline-block;position: relative;top: -25px">Item introduction:</p>
                    </div>
                    <!-- content-->
                    <div style="width: 80%;height: 80%;margin-left: 40px;margin-top: 10px">
                        <%=item_information_rs.getString("description")%>
                    </div>
                </div>
                <%
                    }
                %>
            </li>



    <!-- ******************** Message *********************************-->
    <li>
        <input class="input1" type="radio" name="Check" id="activee2"><label for="activee2">Message</label>
        <div class="user_item_tab_content"style="width: 95%">
            <!--One of the message-->
            <div>
                <img style="display: inline-block" src="./images/user_message.png" width="60px" height="60px">
                <p style="font-size: 1.4em; font-family: Arial;font-weight: bold;display: inline-block;position: relative;top: -25px">Message</p>
            </div>
            <!-- User information -->
            <%
                Class.forName("com.mysql.jdbc.Driver");
                Statement item_comment_stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();

                //在MySQL中可运行的sql语句
//                select item_id, U.user_id, content, nickname
//                from peproject.comment, peproject.user as U
//                where item_id=1 and comment.user_id=U.user_id
                String iid1=request.getParameter("item_id");
                String item_comment_sql ="select item_id, U.user_id, content, time,nickname\n" +
                        "from peproject.comment, peproject.user as U\n" +
                        "where item_id= "+ iid1 +" and comment.user_id=U.user_id";

                ResultSet item_comment_rs = item_comment_stm.executeQuery(item_comment_sql);

                while (item_comment_rs.next())
                {

            %>
            <div class="user_message_content" style="margin-top: 20px;width: 800px" >
                <div class="img_user_name" style="display: inline-block">
                    <img src="./images/user.png" width="75px" height="75px">
                    <p style="text-align:center;color: #4A708B;font-family: Arial;font-size: 1.2em;font-weight: bold">
                        <%=item_comment_rs.getString("nickname")%>
                    </p>
                </div>
                <!-- The content of user message-->

                <p style="display: inline-block;margin-left: 40px; position: relative;top:-50px">
                    <%=item_comment_rs.getString("content")%>
                </p>
                <p style="background-color: #EEEEEE;border-radius: 15px;width: 100px;margin-left: 50%;display: inline-block;width: 150px";>
                    <%=item_comment_rs.getString("time")%>
            </p>
            </div>
            <%
                }
            %>




            <!--发表评论-->
            <form action="/AddComment" method="post">
                <table style="margin-top: 60px;"width="600px">
                    <tr >
                        <input type="hidden" name="item_id" value="<%=request.getParameter("item_id")%>" />
                        <td width="50px" style="vertical-align:top; text-align:center;">
                            <b>Comment</b>
                        </td>
                        <td style="text-align:center; margin-top: 50px">
                        <textarea id="content" name="content" style="width:500px; height:100px">

                        </textarea>
                            <div class="button1">
                                <input type="submit" name="item" value="Submit" style="width:60px; height: 30px; border-width: 0px; border-radius: 3px; background: #eb7350; cursor: pointer;outline: none; font-family: Microsoft YaHei; color:white; font-size: 17px;"/>
                            </div>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </li>




<li>
    <input class="input1" type="radio" name="Check" id="activee3"><label for="activee3">Contact seller</label>
    <div class="user_item_tab_content" style="width: 95%">
        <div>
            <img style="display: inline-block" src="./images/Contact_us.png" width="60px" height="60px">
            <p style="font-size: 1.4em; font-family: Arial;font-weight: bold;display: inline-block;position: relative;top: -25px">Seller information:</p>
        </div>
        <!-- Wechat -->
        <div>

            <p style="display: inline-block;margin-left: 30px; margin-top: 10px">After reserving you can get the information of seller.</p>
        </div>


    </div>
</li>
        </ul>
    </div>

</div>

</div>



</body>

</html>