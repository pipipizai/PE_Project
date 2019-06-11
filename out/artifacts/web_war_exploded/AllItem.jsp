<!-- *************************************-->
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<!-- ****************************************-->
<!DOCTYPE html>
<%
    if (session.getAttribute("student_id")==null)
        response.sendRedirect("login.jsp");
%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All Items</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="style.css">
    <script type="text/javascript" src="js.js"></script>
    <style type="text/css">
        <!--
        label {display:block;}
        -->
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
<!--*************************************************************************-->
<%
//String tid= request.getParameter("tid");
Class.forName("com.mysql.jdbc.Driver");
Statement stm= DriverManager.getConnection("jdbc:mysql://localhost:3306/forum","root","admin").createStatement();
%>
<!--这里是放数据库的位置，然后下面会有不同分类的商品，有标在前面
每一类的商品的每一行是5个商品
1. 图片f
2. 商品的描述
3.价格
我拿了一行做例子，你之后循环加入就好了
-->
<!-- ********************************************************************-->
<!-- All items content-->
<div class="tab_content" style="margin-left: 50px;margin-top: 70px">
    <!-- Tab-->
    <table class="tabTitlesContainer">
        <tr id="tabTitles">
            <td class="tabTitleSelected" onclick="tabPageControl(0)">Used Book</td>
            <td class="tabTitleUnSelected" onclick="tabPageControl(1)">Food</td>
            <td class="tabTitleUnSelected" onclick="tabPageControl(2)">Clothes</td>
            <td class="tabTitleUnSelected" onclick="tabPageControl(3)">Electronic devices</td>
            <td class="tabTitleUnSelected" onclick="tabPageControl(4)">Cosmetics</td>
        </tr>
    </table>
    <!--这是Tab下面的内容部分-->
    <table id="tabPagesContainer">
        <!--这个是Used book的内容部分-->
        <tbody class="tabPageSelected">
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Statement book_stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();

            //已测试过，sql可在MySQL 可运行： 放book分类下的 item
            // category_id就让它写死吧：1为Book， 2 为Food， 3为Clothes， 4为Electronic devices， 5为Cosmetics
//            select item_id, title, price
//            from peproject.item
//            where item.catogory_id=1

            String book_sql ="select item_id, title,picture, price \n" +
                    "from peproject.item\n" +
                    "where item.catogory_id=1\n";
            ResultSet book_rs = book_stm.executeQuery(book_sql);

            int count_book=0; //
            while(book_rs.next())
            {
                //判断是否开始新的一行
                if(count_book%4==0){
        %>
        <tr class="tabPage">
        <tr class="row_tab" >
            <%
                }
            %>
            <td class
                        ="colum_tab">
                <a href="item_information.jsp?item_id=<%=book_rs.getString("item_id")%>">
                    <div>
                        <img class="item-image" src="images/<%=book_rs.getString("picture")%>.png">
                    </div>
                    <div class="item-text">
                        <%=book_rs.getString("title")%>

                    </div>
                </a>
                <div class="price">
                    $<%=book_rs.getString("price")%>
                </div>
            </td >
            <%
                count_book++;
                //判断该行是否放满4个商品
                if(count_book%4==0 && count_book!=0){
            %>
        </tr>
        </tr>
        <%
            }
        %>

        <%
            }
        %>
        </tbody>



        <!--这是Food的内容部分-->
        <tbody class="tabPageUnSelected">
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Statement food_stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();

            //已测试过，sql可在MySQL 可运行： 放food分类下的 item
            // category_id就让它写死吧：1为Book， 2 为Food， 3为Clothes， 4为Electronic devices， 5为Cosmetics
//            select item_id, title, price
//            from peproject.item
//            where item.catogory_id=2

            String food_sql ="select item_id, title, picture,price \n" +
                    "from peproject.item\n" +
                    "where item.catogory_id=2\n";
            ResultSet food_rs = food_stm.executeQuery(food_sql);

            int count_food=0; //
            while(food_rs.next())
            {
                //判断是否开始新的一行
                if(count_food%4==0){
        %>
        <tr class="tabPage">
        <tr class="row_tab" >
            <%
                }
            %>
            <td class="colum_tab">
                <a href="item_information.jsp?item_id=<%=food_rs.getString("item_id")%>">
                    <div>
                        <img class="item-image" src="images/<%=food_rs.getString("picture")%>.png">
                    </div>
                    <div class="item-text">
                        <%=food_rs.getString("title")%>

                    </div>
                </a>
                <div class="price">
                    $<%=food_rs.getString("price")%>
                </div>
            </td >
            <%
                count_food++;
                //判断该行是否放满4个商品
                if(count_food%4==0 && count_food!=0){
            %>

        </tr>
        </tr>
        <%
            }
        %>

        <%
            }
        %>
        </tbody>


        <!-- 这是clothes的内容部分-->
        <tbody class="tabPageUnSelected">
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Statement clothes_stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();

            //已测试过，sql可在MySQL 可运行： 放food分类下的 item
            // category_id就让它写死吧：1为Book， 2 为Food， 3为Clothes， 4为Electronic devices， 5为Cosmetics
//            select item_id, title, price
//            from peproject.item
//            where item.catogory_id=3

            String clothes_sql ="select item_id, title, picture,price \n" +
                    "from peproject.item\n" +
                    "where item.catogory_id=3\n";
            ResultSet clothes_rs = clothes_stm.executeQuery(clothes_sql);

            int count_clothes=0; //
            while(clothes_rs.next())
            {
                //判断是否开始新的一行
                if(count_clothes%4==0){
        %>
        <tr class="tabPage">
        <tr class="row_tab" >
            <%
                }
            %>
            <td class="colum_tab">
                <a href="item_information.jsp?item_id=<%=clothes_rs.getString("item_id")%>">
                    <div>
                        <img class="item-image" src="images/<%=clothes_rs.getString("picture")%>.png">
                    </div>
                    <div class="item-text">
                        <%=clothes_rs.getString("title")%>

                    </div>
                </a>
                <div class="price">
                    $<%=clothes_rs.getString("price")%>
                </div>
            </td >
            <%
                count_clothes++;
                //判断该行是否放满4个商品
                if(count_clothes%4==0 && count_clothes!=0){
            %>

        </tr>
        </tr>
        <%
            }
        %>

        <%
            }
        %>
        </tbody>

        <!--这是Eectronic devices的内容部分-->
        <tbody class="tabPageUnSelected">
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Statement device_stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();

            //已测试过，sql可在MySQL 可运行： 放food分类下的 item
            // category_id就让它写死吧：1为Book， 2 为Food， 3为Clothes， 4为Electronic devices， 5为Cosmetics
//            select item_id, title, price
//            from peproject.item
//            where item.catogory_id=4

            String device_sql ="select item_id, title, picture,price \n" +
                    "from peproject.item\n" +
                    "where item.catogory_id=4\n";
            ResultSet device_rs = device_stm.executeQuery(device_sql);

            int count_device=0; //
            while(device_rs.next())
            {
                //判断是否开始新的一行
                if(count_device%4==0){
        %>
        <tr class="tabPage">
        <tr class="row_tab" >
            <%
                }
            %>
            <td class="colum_tab">
                <a href="item_information.jsp?item_id=<%=device_rs.getString("item_id")%>">
                    <div>
                        <img class="item-image" src="images/<%=device_rs.getString("picture")%>.png">
                    </div>
                    <div class="item-text">
                        <%=device_rs.getString("title")%>

                    </div>
                </a>
                <div class="price">
                    $<%=device_rs.getString("price")%>
                </div>
            </td >
            <%
                count_device++;
                //判断该行是否放满4个商品
                if(count_device%4==0 && count_device!=0){
            %>

        </tr>
        </tr>
        <%
            }
        %>

        <%
            }
        %>
        </tbody>


        <!--这是cosmetics的内容部分-->

        <tbody class="tabPageUnSelected">
        <%
            Class.forName("com.mysql.jdbc.Driver");
            Statement cosmetics_stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();

            //已测试过，sql可在MySQL 可运行： 放cosmetics分类下的 item
            // category_id就让它写死吧：1为Book， 2 为Food， 3为Clothes， 4为Electronic devices， 5为Cosmetics
//            select item_id, title, price
//            from peproject.item
//            where item.catogory_id=5

            String cosmetics_sql ="select item_id, title, picture,price \n" +
                    "from peproject.item\n" +
                    "where item.catogory_id=5\n";
            ResultSet cosmetics_rs = cosmetics_stm.executeQuery(cosmetics_sql);

            int count_cosmetics=0; //
            while(cosmetics_rs.next())
            {
                //判断是否开始新的一行
                if(count_cosmetics%4==0){
        %>
        <tr class="tabPage">
        <tr class="row_tab" >
            <%
                }
            %>
            <td class="colum_tab">
                <a href="item_information.jsp?item_id=<%=cosmetics_rs.getString("item_id")%>">
                    <div>
                        <img class="item-image" src="images/<%=cosmetics_rs.getString("picture")%>.png">
                    </div>
                    <div class="item-text">
                        <%=cosmetics_rs.getString("title")%>

                    </div>
                </a>
                <div class="price">
                    $<%=cosmetics_rs.getString("price")%>
                </div>
            </td >
            <%
                count_cosmetics++;
                //判断该行是否放满4个商品
                if(count_cosmetics%4==0 && count_cosmetics!=0){
            %>

        </tr>
        </tr>
        <%
            }
        %>

        <%
            }
        %>
        </tbody>
    </table>
</div>
<!--footer -->
<div class="footer" style="width: 1579px">
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
            <div class="block2 use_this_page">
                All Item
            </div>
        </a>
        <a href="Feedback.jsp">
            <div class="block3">
                Feedback
            </div>
        </a>

        <div style="color: #f8f8f8; margin-top: 50px; font-size: 0.8em;font-family: 'Arial'">
            Copy © XMUM LIFE 2019 All Reserved
        </div>
    </div>
</div>

</body>
</html>