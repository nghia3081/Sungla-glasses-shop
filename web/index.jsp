<%-- 
    Document   : index
    Created on : Mar 15, 2022, 1:48:02 PM
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
    <body class="main-layout">
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
                        <div class="col-xl-2 col-lg-2 col-md-2 col-sm-2 col logo_section">
                            <div class="full">
                                <div class="center-desk">
                                    <div class="logo">
                                        <a href="home"><img src="images/logo.png" alt="#" /></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-10 col-lg-10 col-md-10 col-sm-10">
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
                                            <a class="nav-link ${mpage==3?"active":""}" href="cart">Cart <i class=" bi bi-cart" style="color:white;background-color: #03cafc; padding:4px; border-radius:4px;">${sessionScope.cartQuantity}</i></a>


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
        <!-- banner -->
        <section class="banner_main">
            <div id="banner1" class="carousel slide" data-ride="carousel">
                <h1 class="text-center"> <span class="blu" style="font-weight: bold;">Welcome <br></span>To Our Sunglasses</h1>
                <ol class="carousel-indicators">
                    <li data-target="#banner1" data-slide-to="0" class="active"></li>
                    <li data-target="#banner1" data-slide-to="1"></li>
                    <li data-target="#banner1" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="container">
                            <div class="carousel-caption">
                                <div class="text-bg">

                                    <figure><img src="images/glass5.png" alt="#"/></figure>
                                    <a class="read_more" href="shopping">Shop Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="container">
                            <div class="carousel-caption">
                                <div class="text-bg">

                                    <figure><img src="images/glass2.png" alt="#"/></figure>
                                    <a class="read_more" href="shopping">Shop Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="container">
                            <div class="carousel-caption">
                                <div class="text-bg">

                                    <figure><img src="images/glass8.png" alt="#"/></figure>
                                    <a class="read_more" href="shopping">Shop Now</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <a class="carousel-control-prev" href="#banner1" role="button" data-slide="prev">
                    <i class="fa fa-arrow-left" aria-hidden="true"></i>
                </a>
                <a class="carousel-control-next" href="#banner1" role="button" data-slide="next">
                    <i class="fa fa-arrow-right" aria-hidden="true"></i>
                </a>
            </div>
        </section>
        <!-- end banner -->
        <!-- about section -->
        <div class="about">
            <div class="container">
                <div class="row d_flex">
                    <div class="col-md-5">
                        <div class="about_img">
                            <figure><img src="images/about_img.png" alt="#"/></figure>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <div class="titlepage">
                            <h2>About Our Shop</h2>
                            <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- about section -->
        <!-- Our  Glasses section -->
        <div class="glasses">
            <div class="container">
                <div class="row">
                    <div class="col-md-10 offset-md-1">
                        <div class="titlepage">
                            <h2>Our Glasses</h2>

                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <c:forEach items="${listP}" var="p" end="5">
                        <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6">
                            <div class="glasses_box">
                                <figure><img src="images/${p.img}" alt="#"/></figure>
                                <h3><span class="blu">$</span>${p.price}</h3>
                                <p>${p.name}</p>
                            </div>
                        </div>
                    </c:forEach>


                    <div class="col-md-12">
                        <a class="read_more" href="shopping">Show All</a>
                    </div>
                </div>
            </div>
        </div>
        <!-- end Our  Glasses section -->
        <!-- Our shop section -->
        <div id="about" class="shop">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-5">
                        <div  class="shop_img">
                            <figure><img src="images/${listP.get(0).img}" alt="#"/></figure>
                        </div>
                    </div>
                    <div class="col-md-7 padding_right0">
                        <div class="max_width">
                            <div class="titlepage">
                                <h2>Best SunGlasses At Our shop</h2>
                                <p>${listP.get(0).description}</p>
                                <a class="read_more" href="shopping">Shop Now</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- end Our shop section -->
        <!-- clients section -->


        <!-- end clients section -->
        <!-- contact section -->
        <!-- end contact section -->
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
        <!-- google map js -->

        <!-- end google map js --> 
    </body>
</html>

