<!DOCTYPE html>
<html>

<head>
	<title>Register</title>
	<style>
		.login a{
			text-decoration: none;
			color: black;
		}
	</style>
	<link rel="stylesheet" href="style.css">

</head>


<body style="height: 100%;
	          background:#f5f5f5 ;">

<div style="max-width: 1000px;margin: 0px auto;height: 60px;">
	<a style="display: inline-block" href="homepage.jsp"><img src="./images/B02.png" style="height: 60px;" /></a>
	<p style="display: inline-block;font-family:Rockwell;font-size: 1.5em;color:#4A708B;margin-left: 200px;position: relative;top:-26px"> Xiamen University Malaysia Second Hand Exchange</p>
	<img src="./images/shop1.png" style="width: 30px;height: 30px;float: right;position: relative;left: 40px;top: -55px">
</div>

<div style="width:100%;height:580px; background:#ADD8E6;width: 1579px">
	<div style="max-width:1000px;height:470px; margin:0px auto; position:relative;">
		<div style="float: left;margin-top: 55px"><img style="width: 830px;height: 466px;margin-top:2px;position: relative;left: -292px;border-radius: 10px" src="./images/login_register.png" /></div>
		<div style="width: 100%;max-width:360px;height: 430px;position: absolute;margin-top:65px;background-color:#f8f8f8;right:2%;padding:10px 20px;border-radius: 5px;box-shadow: 0px 6px 5px #eeeeee;margin-right: -200px" >
			<div style="font-size: 20px;text-align: center;color: #5599FF">Register</div>

			<div style="margin-top:50px;background:#fff ;width: 100%;" >
				<form id="Register" method="post" action="/AddAccount" style="background-color: #f8f8f8">
					<div style="width: 100%;position: relative;height: 42px;margin-bottom:5px;position: relative;top: -20px ">

						<input type="text" name="student_id" id="StudentID" placeholder="Please insert your StudentID" style="width: 100%;height: 40px;border-background: #5599FF;">
					</div>
					<div style="width: 100%;position: relative;height: 42px;margin-bottom:5px;position: relative;top: -10px">

						<input type="Password" name="password" id="Password" placeholder="Please insert your Password" style="width: 100%;height: 40px;border-background: #5599FF;">
					</div>
					<div style="width: 100%;position: relative;height: 42px;margin-bottom:5px;position: relative;top: 0px">

						<input type="text" name="nickname" id="Nickname" placeholder="Please insert your Nickname" style="width: 100%;height: 40px;border-background: #5599FF;">
					</div>
					<div style="width: 100%;position: relative;height: 42px;margin-bottom:5px;position: relative;top: 10px;">

						<input type="text" name="email" id="Email"placeholder="Please insert your Email" style="width: 100%;height: 40px;border-background: #5599FF;">
					</div>
					<div style="position: relative;top: 40px;">
						<input type="submit" name="register" value="Register" style="width:100%; height: 40px; border-width: 0px; border-radius: 3px; background: #1E90FF; cursor: pointer;outline: none; font-family: Microsoft YaHei; color: white; font-size: 17px; background: #5599FF;">
					</div>
				</form>
			</div>



		</div>
	</div>
</div>


<!--footer -->
<div class="footer" style="width: 1579px" >
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
</body>

</html>