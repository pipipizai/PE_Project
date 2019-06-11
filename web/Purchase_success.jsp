<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Purchase_success</title>
    <style>
        .success_content{
            margin-left: 300px;
            margin-top: 100px;
        }
        .success_img{
            display: inline-block;
        }
        .success_text{
            display: inline-block;
            color: #eb7350;
            font-size: 2em;
            font-weight:bold;
            position: relative;
            top:-50px;
            left: 30px;

        }
        .success_text1{
            font-size: 1.4em;
            font-family: "Microsoft YaHei UI";
            margin-top: 50px;
            position: relative;
            left: -70px;
        }
        .purchase_information{
            font-family: Arial;
            font-size: 1.4em;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="success_content">
    <img class="success_img" src="./images/success.png">
    <p class="success_text">Congratulations, you have successfully paid </p>
    <div class="success_text1">
        Please contact the seller as soon as possible. If you do not get the goods within three days, please contact us.
    </div>
</div>
<!--User information introduction-->
<div style="font-family: Arial;font-weight: bold;font-size: 1.7em;position: relative;left: 45%;color: #eb7350;top: 30px">
    Seller Information
</div>
<!-- User Information-->
<div class="user_inform_purchase">

    <%
        //sql语句select item 信息
        Class.forName("com.mysql.jdbc.Driver");
        Statement contact_stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();
        //已测试过，sql可在MySQL 可运行：
//              select item_id, title, price, description, U.user_id, nickname
//                from peproject.item, peproject.user as U
//                where item.item_id=1 and item.user_id=U.user_id
        String iid=request.getParameter("item_id");
        String contact_sql ="select T.item_id, T.user_id, U.email, U.wechat, U.whatsapp ,U.qq\n" +
                "from peproject.item as T, peproject.user as U\n" +
                "where T.item_id="+ iid +" and T.user_id=U.user_id";

        ResultSet contact_rs = contact_stm.executeQuery(contact_sql);
        if(contact_rs.next())
        {

    %>
    <div class="user_email" style="position: relative;left: 39%; top: 40px">
        <img style="display: inline-block; " src="./images/email.png" width="40px" height="40px">
        <p style="display: inline-block;margin-left: 10px" class="purchase_information">E-mail: </p>
        <p style="display: inline-block; font-size: 1.1em;"><%=contact_rs.getString("email")%></p>
    </div>
    <div class="user_email" style="position: relative;left: 39%; top: 40px">
        <img style="display: inline-block; " src="./images/wechat.png" width="40px" height="40px">
        <p style="display: inline-block;margin-left: 10px" class="purchase_information">Wechat: </p>
        <p style="display: inline-block; font-size: 1.1em;"><%=contact_rs.getString("wechat")%></p>
    </div>
    <div class="user_email" style="position: relative;left: 39%; top: 40px">
        <img style="display: inline-block; " src="./images/whatsapp.png" width="40px" height="40px">
        <p style="display: inline-block;margin-left: 10px" class="purchase_information">Whatsapp: </p>
        <p style="display: inline-block; font-size: 1.1em;"><%=contact_rs.getString("whatsapp")%></p>
    </div>
    <div class="user_email" style="position: relative;left: 39%; top: 40px">
        <img style="display: inline-block; " src="./images/QQ.png" width="40px" height="40px">
        <p style="display: inline-block;margin-left: 10px" class="purchase_information">QQ: </p>
        <p style="display: inline-block; font-size: 1.1em;"><%=contact_rs.getString("qq")%></p>
    </div>
    <%
        }
    %>



</div>
<!-- Goback Logo-->
<div class="button_404">
    <a href="homepage.jsp">
        <button type="button" style="background-color: #eb7350;color: #FFFFFF;height: 70px;width: 150px;font-size: 1.3em; position: relative; left: 47%;top: 200px;margin-bottom: 100px">
            Go back</button>
    </a>
</div>

</body>
</html>