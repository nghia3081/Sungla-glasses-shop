<%-- 
    Document   : login
    Created on : Mar 15, 2022, 10:03:25 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>sungla</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- bootstrap css -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <!-- style css -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- fevicon -->
        <link rel="icon" href="images/fevicon.png" type="image/gif" />
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
    </head>
    <!-- body -->
    <body>
        <div class="container text-center position-relative" style="height:100vh;">
            <div class="position-absolute" style="left:50%;top:50%;transform: translate(-50%,-50%) ">


                <div class="m-2" style="width:100%">
                    <a href="home"><img src="images/logo.png" alt="#" /></a>  
                </div>
                <h2>${mess}</h2>
                <div class="m-2" style="width:100%">
                    

                    <form action="login" method="post">
                        <input class="form-control m-2" name="uemail" type="text" placeholder="Email" required>
                        <input class="form-control m-2" name="upass" type="password" placeholder="Password" required>
                        <input class="btn btn-info" name="submit" type="submit" value="Login">
                    </form>
                </div>
                <div class="m-2" style="width:100%">
                    <a class="btn btn-info" href="register">Register</a> or <a class="btn btn-info" href="forget">Forgot Password</a>
                </div>
            </div>
        </div>


        <!-- end footer -->
        <!-- Javascript files-->
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.0.0.min.js"></script>
        <!-- sidebar -->
        <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="js/custom.js"></script>
        <!-- google map js -->

        <!-- end google map js --> 
    </body>
</html>
