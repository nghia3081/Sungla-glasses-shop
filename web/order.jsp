<%-- 
    Document   : glasses
    Created on : Mar 15, 2022, 1:53:33 PM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
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
    <body class="main-layout position_head">
        <!-- loader  -->
        <div class="loader_bg">
            <div class="loader"><img src="images/loading.gif" alt="#" /></div>
        </div>
        <!-- end loader -->
        <!-- header -->
        <header>
            <!-- header inner -->
            <div class="header">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                            <div class="full">
                                <div class="center-desk">
                                    <div class="logo">
                                        <a href="home"><img src="images/logo.png" alt="#" /></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                            <nav class="navigation navbar navbar-expand-md navbar-dark ">
                                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                                    <span class="navbar-toggler-icon"></span>
                                </button>
                                <div class="collapse navbar-collapse" id="navbarsExample04">
                                    <ul class="navbar-nav mr-auto">
                                        <li class="nav-item ${mpage==1?"active":""}">
                                            <a class="nav-link" href="home">Home</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link ${mpage==2?"active":""}" href="shopping">Our Glasses</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link ${mpage==3?"active":""}" href="cart">Cart</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link ${mpage==4?"active":""}" href="order">Your Order</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link ${mpage==5?"active":""}" href="information">Your Information</a>
                                        </li>
                                        <c:if test='${sessionScope.user != null}'>
                                            <li class="nav-item d_none login_btn">
                                                <a class="nav-link">Hi ${user.uname}</a>
                                            </li>
                                            <li class="nav-item d_none login_btn">
                                                <a class="nav-link" href="logout">Logout</a>
                                            </li>
                                        </c:if>
                                        <c:if test='${sessionScope.user == null}'>
                                            <li class="nav-item d_none login_btn">
                                                <a class="nav-link" href="login">Login</a>
                                            </li>
                                            <li class="nav-item d_none">
                                                <a class="nav-link" href="register">Register</a>
                                            </li>
                                        </c:if>

                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- end header inner -->
        <!-- end header -->
        <!-- Our  Glasses section -->
        <script>



        </script>
        <div class="glasses">
            <div class="">
                <div class="row text-center d-flex justify-content-center" style="margin: 0 auto;" >
                    <div>
                        <div class="titlepage">
                            <h2>Your Cart</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid">
                <div class="row m-2 justify-content-center">

                    <table class="text-center">
                        <tr class="row" style="border-bottom:1px solid darkgray;">
                            <th class="col-2">
                                Order Time
                            </th>
                            <th class="col-2">

                            </th>
                            <th class="col-2">
                                Product Name
                            </th>
                            <th class="col-1">
                                Product Unit Price
                            </th>
                            <th class="col-1">
                                Quantity
                            </th>
                            <th class="col-1">
                                Total Per Product
                            </th>
                            <th class="col-3">
                                Order Status
                            </th>
                        </tr>


                        <c:forEach items="${listProductOrder}" var="p">

                            <tr class="row" style="border-bottom:1px solid darkgray; padding:10px;">
                                <td class="col-2">
                                    <p>${p.orderTime}</p>
                                </td>
                                <td class="col-2">
                                    <img src="images/${p.pdes}"
                                </td>
                                <td class="col-2">

                                    <p>${p.pname}</p>
                                </td>
                                <td class="col-1">
                                    <p>$${p.pprice}</p>
                                </td>
                                <td class="col-1">

                                    <p>${p.pquantity}</p>
                                </td>
                                <td class="col-1">
                                    <p>$${p.pprice * p.pquantity}</p>
                                </td>
                                <td class="col-3">
                                    <c:if test="${sessionScope.user.isAdmin eq true}">

                                        <form action="addStatus" method="get" id="addStatus${p.oid}">
                                            <input type="text" value="${p.oid}" name="oid" hidden>
                                            <input type="text" name="status" required class="form-control"/>
                                            <button class="btn btn-info bi bi-cloud-plus" type="submit" name="submit" form="addStatus${p.oid}"></button>
                                        </form>


                                    </c:if>
                                    <ul style='li:first-child{font-weight: bold;}'>
                                        <c:forEach items="${statusList}" var="stt">
                                            <c:if test='${stt.oid == p.oid}'>


                                                <li style='list-style-type: circle;'>${stt.status}-<span style="font-size: 10px">(${stt.updateTime})</span></li>
                                                </c:if>
                                            </c:forEach>
                                    </ul>

                                </td>
                            </tr>

                        </c:forEach>



                    </table>
                </div>
            </div>
        </div>
        <style>
            #orderForm input, #orderForm select{
                margin-top: 10px;
            }
        </style>
        <!-- end Our  Glasses section -->
        <!--  footer -->
        <footer>
            <div class="footer">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8 offset-md-2">
                            <ul class="location_icon">
                                <li><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i></a><br> Location</li>
                                <li><a href="#"><i class="fa fa-phone" aria-hidden="true"></i></a><br> +01 1234567890</li>
                                <li><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i></a><br> demo@gmail.com</li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>
        </footer>
        <!-- end footer -->
        <!-- Javascript files-->
        <script src="js/jquery.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/jquery-3.0.0.min.js"></script>
        <!-- sidebar -->
        <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
        <script src="js/custom.js"></script>
    </body>
</html>
