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
<div class="header" style="width: 1579px">
    <div style="background-color:#CAEBF2; width: 337px; height:100px; float: left">
        <img src="images/a.png" height="70" width="337"/></div>
    <ul style="float:right; margin-top: -3px;">
        <li class="topics">
            <a class="link" href="mycart.jsp" target="_self">
                <img style="width: 35px;height: 35px;margin-top: 25px;margin-left: 35px" src="./images/cart2.png">
            </a>
        </li>
        <li class="topics">
            <a class="link" href="login.jsp" target="_self">Login</a>
        </li>
        <li class="topics">
            <a class="link" href="register.jsp" target="_self">Register</a>
        </li>

    </ul>
    <ul>
        <li class="topics" style="margin-left: 10px">
            <a class="link" href="homepage.jsp" target="_self">Homepage</a>
        </li>
        <li class="topics">
            <a class="link" href="AllItem.jsp" target="_self">All Items</a>
        </li>
        <form name="form1" action="" method="">
            <div class="form" style="float: left; margin-top: 20px;">
                <input type="text" name="search_content" id="search_content" placeholder="Search here..."  style="border-top-right-radius: 5px; border-bottom-right-radius: 5px;height: 38px">
                <input type="submit" onclick="window.open('search.jsp')"  style="background-color: #eb7350;color: white;width:70px;font-size: 0.8em;
border-bottom-right-radius: 5px;border-top-right-radius: 5px;height: 38px;margin-top: -2px;margin-left: -4px" id="search" name="Submit" value="SEARCH" >
                <span class="t"></span>
                </button>
            </div>
        </form>
    </ul>
</div>
<!--body-->
<!--商品介绍-->
<div class="back">
    <div style="margin:10px auto;width:600px;">
        <table width="600px" >
            <tr>
                <td>
                    <table>
                        <tr>
                            <div >
                                <img  height="270" width="270" src="./images/item.jpg" />
                            </div>
                        </tr>
                        <tr>
                            <td><img  height="50" width="50"src="./images/item.jpg" /></td>
                            <td><img  height="50" width="50" src="./images/item.jpg" /></td>
                            <td><img  height="50" width="50" src="./images/item.jpg" /></td>
                            <td><img  height="50" width="50" src="./images/item.jpg" /></td>
                            <td><img  height="50" width="50" src="./images/item.jpg" /></td>
                        </tr>
                    </table>
                </td>
                <td>
                    <table>
                        <tr>
                            <td height="40px" width="100px ">Title</td>
                            <td height="40px" width="500px ">这里放商品名称</td>
                        </tr>
                        <tr>
                            <td width="150px" height="40px">Price</td>

                            <td height="40px" width="500px ">这里放价格</td>
                        </tr>
                        <tr>
                            <td width="150px" height="40px">Seller</td>
                            <td height="40px" width="500px ">这里放卖家名字</td>
                        </tr>
                        <tr>
                            <td width="150px" height="40px" >
                                <table>
                                    <tr>
                                        <!-- <td width="150px" height="40px">Save the item </td> -->
                                        <td><button class="button button_save">Save item</button></td>
                                        <td><img width="30px" src="./images/save.png" style="cursor: pointer;" /></td>
                                    </tr>

                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <table>
                                    <tr>
                                        <td><button class="button ">Add to cart</button></td>
                                        <td><img width="30px" style="cursor: pointer;" src="./images/cart.png" /></td>
                                    </tr>

                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>

    <!--商品介绍-->
    <div class="user_box" style="margin-top: 20px;margin-bottom: 500px">
        <ul>
            <li>
                <input class="input1" type="radio" name="Check" id="activee1" Checked><label for="activee1">Item Information</label>
                <div class="user_item_tab_content">
                    <!--LOGO + Introduction -->
                    <div>
                        <img style="display: inline-block" src="./images/goods.png" width="60px" height="60px">
                        <p style="font-size: 1.4em; font-family: Arial;font-weight: bold;display: inline-block;position: relative;top: -25px">Item introduction:</p>
                    </div>
                    <!-- content-->
                    <div style="width: 80%;height: 80%;margin-left: 40px;margin-top: 10px">
                        I bought this shoes last week. It has the good quality, but unfortunately, the size of shoes is not suitable for me.
                        So I have to sell the shoes.
                    </div>
                </div>
            </li>
            <!-- ******************** Message *********************************-->
            <li>
                <input class="input1" type="radio" name="Check" id="activee2"><label for="activee2">Message</label>
                <div class="user_item_tab_content">
                    <!--One of the message-->
                    <div>
                        <img style="display: inline-block" src="./images/user_message.png" width="60px" height="60px">
                        <p style="font-size: 1.4em; font-family: Arial;font-weight: bold;display: inline-block;position: relative;top: -25px">Message</p>
                    </div>
                    <!-- User information -->
                    <div class="user_message_content" style="margin-top: 20px;width: 800px" >
                        <div class="img_user_name" style="display: inline-block">
                            <img src="./images/user.png" width="75px" height="75px">
                            <p style="color: #4A708B;font-family: Arial;font-size: 1.2em;font-weight: bold">user name</p>
                        </div>
                        <!-- The content of user message-->
                        <p style="display: inline-block;margin-left: 40px; position: relative;top:-50px">
                            I want to buy this shoes. Could I ask some information about the size?
                        </p>
                        <p style="background-color: #EEEEEE;border-radius: 15px;width: 100px;margin-left: 80%;display: inline-block;width: 150px">
                            2019-01-01 16:20:50
                        </p>

                    </div>
                    <div class="user_message_content" style="margin-top: 20px;width: 800px" >
                        <div class="img_user_name" style="display: inline-block">
                            <img src="./images/user.png" width="75px" height="75px">
                            <p style="color: #4A708B;font-family: Arial;font-size: 1.2em;font-weight: bold">user name</p>
                        </div>
                        <!-- The content of user message-->
                        <p style="display: inline-block;margin-left: 40px; position: relative;top:-50px">
                            I want to buy this shoes. Could I ask some information about the size?
                        </p>
                        <p style="background-color: #EEEEEE;border-radius: 15px;width: 100px;margin-left: 80%;display: inline-block;width: 150px">
                            2019-01-01 16:20:50
                        </p>

                    </div>
                    <div class="user_message_content" style="margin-top: 20px;width: 800px" >
                        <div class="img_user_name" style="display: inline-block">
                            <img src="./images/user.png" width="75px" height="75px">
                            <p style="color: #4A708B;font-family: Arial;font-size: 1.2em;font-weight: bold">user name</p>
                        </div>
                        <!-- The content of user message-->
                        <p style="display: inline-block;margin-left: 40px; position: relative;top:-50px">
                            I want to buy this shoes. Could I ask some information about the size?
                        </p>
                        <p style="background-color: #EEEEEE;border-radius: 15px;width: 100px;margin-left: 80%;display: inline-block;width: 150px">
                            2019-01-01 16:20:50
                        </p>

                    </div>
                    <!--发表评论-->
                    <form action="localhost/forum" method="get">
                        <table width="600px">
                            <tr>
                                <td width="50px" style="vertical-align:top; text-align:center">
                                    <b>Comment</b>
                                </td>
                                <td style="text-align:center">
                        <textarea style="width:500px; height:100px">

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
                        <img style="display: inline-block; margin-top: 30px" src="./images/wechat1.png" width="64px" height="64px;">
                        <p style="display: inline-block;font-family: Arial;font-weight: bold;font-size: 1.3em;margin-top: -10px">Wechat:</p>
                        <p style="display: inline-block;margin-left: 30px; margin-top: -10px">18859809519</p>
                    </div>
                    <!-- Contact Number -->
                    <div>
                        <img style="display: inline-block; margin-top: 30px" src="./images/telephone1.png" width="64px" height="64px;">
                        <p style="display: inline-block;font-family: Arial;font-weight: bold;font-size: 1.3em;margin-top: -10px">Contact Number</p>
                        <p style="display: inline-block;margin-left: 30px; margin-top: -10px">18859809519</p>
                    </div>
                </div>
            </li>
        </ul>
    </div>
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
            <div class="block2">
                All Item
            </div>
        </a>
        <a href="Feedback.jsp">
            <div class="block3">
                Feedback
            </div>
        </a>
        <a href="">
            <div class="block4">
                Search
            </div>
        </a>
        <div style="color: #f8f8f8; margin-top: 50px; font-size: 0.8em;font-family: 'Arial'">
            Copy © XMUM LIFE 2019 All Reserved
        </div>
    </div>
</div>

</body>

</html>