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
	<title>My Cart</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<style type="text/css">
		form{
			max-width:1104px;
			margin:-80px auto;
			box-shadow: 0 0px 8px rgba(7, 17, 27, 0.2);
		}
		form *{
			box-sizing: border-box;
		}
		.banner>div{
			width: 1104px;
			height: 120px;
			margin:0 auto;
			font-size: 32px;
			line-height: 115px;
			font-weight: 600;
			color: #07111b;
		}
		.banner{
			width:100%;
			height: 160px;
			/*background-color: #FFFFFF;*/
		}
		.cart-panel{
			margin-top: 20px;
			border: 1px solid #d9d9d9;
		}
		.cart-panel .hd {
			margin: 0;
			padding: 0 20px;
			list-style: none;
			background-color: #ebebeb;
			overflow: hidden;
		}
		.cart-panel .order-title li {
			font-weight: bold;
			display: inline-block;
			float: left;
			padding: 20px 0;
		}
		.cart-panel .check{
			margin:30px 30px 0 0;
		}
		.cart-panel .order-title li.product {
			width: 360px;
			padding-left:30px;
		}


		.cart-panel .order-title li.unit-price ,
		.cart-panel .order-title li.number{
			width: 130px;
			text-align: center;
		}
		.cart-panel .order-title li.operate {
			float: right;
			width: 130px;
			text-align: center;
		}
		.cart-panel .order-list:first-child {
			border-top: none;
		}
		.cart-panel .order-list {
			font-size: 12px;
			margin: 0;
			padding: 15px 20px;
			list-style: none;
			border-top: 1px solid #d9d9d9;
			overflow: hidden;
		}
		.cart-panel .order-list li {
			line-height: 30px;
			display: inline-block;
			float: left;
		}
		.cart-panel .order-list li.check{
			width:80px;
			padding-top:25px;
		}
		.cart-panel .order-list li.img-box {
			width: 160px;
			height:150px;
		}
		.cart-panel .order-list li.img-box img {
			width:100%;
			height: 100%
		}
		.cart-panel .order-list li.product {
			width: 210px;
			padding: 8px;
			font-size:20px;
		}

		.cart-panel .order-list li.unit-price {
			width: 130px;
			padding: 18px 0;
			text-align: center;
			font-size:20px;
		}
		.cart-panel .order-list li.number {
			width: 130px;
			margin: 16px 0;
			text-align: center;
			padding-left:20px;
		}
		.input-num {
			width: 100px;
			margin: 0 auto;
		}
		.input-num>.num {
			display: inline-block;
			width: 60px;
			height: 24px;
			border:1px solid #d9d9d9;
			padding:6px;
			box-shadow: none;
		}
		.input-num>a{
			display: inline-block;
			width: 11px;
			height: 11px;
			cursor: pointer;
			text-align: center;
			vertical-align: middle;
			line-height: 11px;
			border: 1px solid #d9d9d9;
		}
		.cart-panel .order-list li.operate {
			float: right;
			width: 130px;
			padding: 15px 0 8px 50px;
		}
		.pay-bar{
			margin-top: 20px;
		}
		.pay-info{
			font-size: 12px;
			line-height: 52px;
			float: left;
			width: 984px;
			height: 52px;
			padding: 0 20px;
			border: 1px solid #d9d9d9;
			border-right: 0;
		}
		.pay-bar>button{
			font-weight: bold;
			float: right;
			width: 120px;
			height: 52px;
			background: #f01404;
			border:1px solid #f01404;
			color:#fff;
			font-size:18px;
		}
		.pay-bar>button:hover{
			cursor:pointer;
		}
		.pay-info>span,.pay-info>.checkoutprice{
			float:right;
		}
		.pay-info>.checkoutprice{
			font-size:22px;
			color:#f01414;
			font-weight:bold;
		}
		.product a{
			text-decoration: none;
			color: #4F4F4F;
			cursor: pointer;
		}
		.product{
			vert-align: middle;
		}
	</style>
</head>
<!-- 弹出确认付款窗口--->
<!-- 若点击确认，重新跳转到刷新的购物车--->
<!-- 若点击取消，弹出警告框--->

<%
	String iid=request.getParameter("item_id");
%>
<script>
    function myFunction(){
        var x;
        var r=confirm("confirm reserve");
        if (r==true){

            window.open("Purchase_success.jsp?item_id=<%=iid %>");

        }
        else{
            alert("You cancel the payment!")
        }

    }

</script>
<body>
<!-- header区域 -->
<!-- Header -->
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
							<div class="user_name"> <p> User Name </p> <!--数据库需要读取--> </div>
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
									<a href="Message.jsp" target="_self" style="display: inline-block">
										<div class="for_sale">
											<img style="display: inline-block;width: 35px;height: 35px;margin-left: 5px" src="./images/message.png">
											<p style="display: inline-block;position: relative;top:-10px;font-weight: bold">Message</p>
										</div>
									</a>
								</div>
								<hr style="margin-top: 20px;opacity:0.2;" class="grey">
								<div class="user_text">
									<a href="" target="_self">Log out</a>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Cart-->
		<div style="display: inline-block;position: relative;left: -50px" class="topics">
			<a class="link" href="" target="_self">
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

<!--Whole area-->
<div  style="position: relative;top: -70px" >
	<!-- banner区域 -->
	<div class="banner">
		<img src="./images/cart.png" style="display: inline-block;width: 70px;height: 70px; margin-left: 30px;margin-top: 40px" >
		<div style="display: inline-block;margin-left: 10px;position: relative;top:-20px">Reservation</div>
	</div>
	<!-- goods区域 -->
	<form action="" id="cartBody" >
		<div class="cart-panel" >
			<div class="hd">
				<ul class="order-title">
					<!--  <li><input type="checkbox" class="check-all"><span>全选</span></li> -->
					<li class="product">Title</li>
					<!-- <li class="total-price">Total Price</li> -->
					<li class="unit-price">Price</li>
					<%--<li class="number">Quantity</li>--%>
					<%--<li class="operate">Operation</li>--%>
				</ul>
			</div>


			<div class="bd" >
				<%
					//sql语句select item 信息
					Class.forName("com.mysql.jdbc.Driver");
					Statement booking_stm = DriverManager.getConnection("jdbc:mysql://localhost:3306/peproject", "root", "admin").createStatement();
					//已测试过，sql可在MySQL 可运行：
//              select item_id, title, price, description, U.user_id, nickname
//                from peproject.item, peproject.user as U
//                where item.item_id=1 and item.user_id=U.user_id

					String booking_sql ="select T.item_id,T.price,picture,T.title\n" +
							"from peproject.item as T\n" +
							"where T.item_id='"+iid+"'";

					ResultSet booking_rs = booking_stm.executeQuery(booking_sql);
					while(booking_rs.next())
					{
				%>
				<!-- 商品列表 -->
				<ul class="order-list">
					<li><input type="checkbox" class="check" checked></li>
					<li class="img-box">

							<img src="images/<%=booking_rs.getString("picture")%>.png"/> >

					</li>
					<li class="product" style="margin-top: 30px">
						<a href="">
							<span><%=booking_rs.getString("title")%></span>
						</a>
					</li>

					<li class="unit-price">
						<span class="price-sign">$</span>
						<span class="price-num"> <%=booking_rs.getString("price")%></span>
					</li>
				</ul>

			</div>
		</div>

		<!-- 结算栏 -->
		<div class="pay-bar" >
			<div class="pay-info">
				<div class="checkoutprice">
					<span class="price-sign">$<%=booking_rs.getString("price")%></span>

					<span class="price-num pay-money"></span>
				</div>
				<span>Subtotal: </span>
			</div>

			<button onclick="myFunction()">Reserve</button>
			<%
				}
			%>
		</div>

	</form>
</div>
</body>
</html>