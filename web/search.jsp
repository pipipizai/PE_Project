<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("student_id")==null)
        response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<!--*************************************** Header [Log in] **************************************************-->
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
<!-- **********************************************************************************************************************-->

<!-- ***************************************** CONTENT *******************************************************************-->
<!-- 有几条搜索结果 -->

<div>
    <img style="width: 50px;height: 50px;margin-left: 40px;margin-top: 40px" src="./images/1search.png"/>
   <p class="key_word" style="display: inline-block">Keyword: <%
       out.print(session.getAttribute("search_content"));
   %></p>  <!-- 可以用搜索的关键词替换-->
</div>

<!-- 搜索结果是怎么样的-->
<!-- one eaxmple of search content-->
<%--

<%
Connection conn=null;
PreparedStatement ps=null;
ResultSet rs=null;
//注册驱动
Class.forName("com.mysql.jdbc.Driver");

//获取数据库连接
String url="jdbc:mysql://localhost:3306/peproject";
String user="root";
String password="admin";
conn=DriverManager.getConnection(url,user,password);

//创建sql框架
String sql="SELECT title,description FROM item WHERE `title` like ?";

//sql预编译
ps=conn.prepareStatement(sql);

//sql赋值
String st1=session.getAttribute("search").toString();
ps.setString(1, "%st1%");

//执行sql
rs=ps.executeQuery();

//处理查询结果集
while(rs.next())
{

%>
--%>
<%
    Class.forName("com.mysql.jdbc.Driver");
    Statement stm= DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject","root","admin").createStatement();
    String st1=session.getAttribute("search_content").toString();
    String sql ="SELECT title,description,picture ,item_id FROM item WHERE `title` like '%"+st1+"%';";
    ResultSet rs=stm.executeQuery(sql);
    while(rs.next())
    {
%>
<div class="search_content" >
    <a href="item_information.jsp?item_id=<%=rs.getString("item_id")%>">
        <div class="search_picture" style="display: inline-block">
            <img class="img_item" src="images/<%=rs.getString("picture")%>.png">
        </div>
        <div class="search_text" style="display: inline-block">
            <div class="search_title">
                <u> <%=rs.getString("title")%> </u>
            </div>
            <div class="search_description">
                <%=rs.getString("description")%>
            </div>
        </div>
    </a>
</div>
<%
    }
%>

<!-- ********************************* Footer ****************************************************************************-->
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
                <p style="display: inline-block;position: relative;top: -35px;margin-left: 30px"> 【XMUM LIFE】 </p>
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
            Copy © XMUM LIFE 2019 All Reserved
        </div>
    </div>
</div>

<!-- **********************************************************************************************************************-->

</body>
</html>