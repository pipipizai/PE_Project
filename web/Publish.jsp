<%
    if (session.getAttribute("student_id")==null)
        response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Publish</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <script type="text/javascript"  src="js.js"></script>
    <style>

        body,html{
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
        }

        .text-item1{
            position: relative;
            left: -160px;
            top:-40px;
        }
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
        .publish_item{
            background-size: 150px 200px;
            -webkit-animation-name: scaleDraw; /*关键帧名称*/
            -webkit-animation-timing-function: ease-in-out; /*动画的速度曲线*/
            -webkit-animation-iteration-count: 1;  /*动画播放的次数*/
            -webkit-animation-duration: 4s; /*动画所花费的时间*/
        }

    </style>
</head>
<body>

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
                                    <a href="Message.jsp" target="_self" style="display: inline-block">
                                        <div class="for_sale">
                                            <img style="display: inline-block;width: 35px;height: 35px;margin-left: 5px" src="./images/message.png">
                                            <p style="display: inline-block;position: relative;top:-10px;font-weight: bold">Message</p>
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
<!--content-->
<div class="back">
    <!--发布闲置-->
    <div class="publish_item">
        <div class="publish">
            <a  href="#">
                <div class="layui-inline">
                    <i class="i-web"></i>
                    <p class="p1">Publish Items</p>
                </div>
            </a>
        </div>
    </div>
    <!--表单-->
    <form id="item" method="post" action="/AddItem" enctype="multipart/form-data">
        <div class="table" style="margin-top: 40px; margin-left: 100px">
            <!--下面填写发布商品的信息-->
            <!-- 1. Title of item -->
            <div class="Person_Text">
                <label >Title:</label>
                <div>
                    <input class="Person_input" type="text" name="title" autocomplete="off" placeholder="Please enter the brand and name" >
                </div>
            </div>
            <!--2.Description of item -->
            <div class="Person_Text">
                <label >Description of item:</label>
                <div class="text-item1" >
                    <textarea   class="textarea1" placeholder="Please enter the description of idle item" name="description"></textarea>
                </div>
            </div>
            <!--3.Picture of item -->
            <div class="Person_Text">
                <label >Please select the image:</label>
                <div class="input_file" style="display: inline-block;border-right: none; margin-top: -40px;margin-left: 10px">
                    <div id = "result"></div>
                    <%--<input id="pic" type="file" name = "image" />--%>
                    <input type="file" name="image">
                </div>
            </div>

            <!--4.Description the price of item -->
            <div class="Person_Text">
                <label >Price:</label>
                <div>
                    <input class="Person_input" type="text" name="price" autocomplete="off" placeholder="Please enter the price of item" >
                </div>
            </div>
            <!--5. Type of item-->
            <div style="margin-top: 100px">
                <label  class="Person_Text">
                    Type:
                </label>
                <div>
                    <select name="selectAge" class="Person_input" style="margin-left: 300px" >
                        <option value="">Please select the type of product</option>
                        <option value="1">Used Books</option>
                        <option value="2">Food</option>
                        <option value="3">Clothes</option>
                        <option value="4">Electronic devices</option>
                        <option value="5">Cosmetic</option>
                    </select>
                </div>
            </div>
            <!--6. Contact Number-->
            <div class="Person_Text">
                <label >Contact Number:</label>
                <div>
                    <input class="Person_input" type="text" name="contact_information" autocomplete="off" placeholder="Please enter the contact number" >
                </div>
            </div>
        </div>
        <div class="button1">
            <input type="submit" name="item" value="Publish" style="width:60px; height: 30px; border-width: 0px; border-radius: 3px; background: #1E90FF; cursor: pointer;outline: none; font-family: Microsoft YaHei; color: white; font-size: 17px; background: #eb7350;">
        </div>
    </form>
</div>
</div>
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
            Copy © XMUM LIFE 2019 All Reserved
        </div>
    </div>
</div>

</body>
</html>
