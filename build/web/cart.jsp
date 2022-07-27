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
        <!-- Our  Glasses section -->
        <script>
            function showOrder() {
                if (document.getElementById("orderForm").style.display == 'none') {
                    document.getElementById("orderForm").style.display = 'block';
                }
            }



        </script>
        <div class="glasses">
            <div class="">
                <div class="row text-center d-flex justify-content-center" style="margin: 0 auto;" >
                    <div>
                        <div class="titlepage">
                            <h2>Your Cart</h2>
                            <h2 style="color: green">${mess}</h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row m-2 justify-content-center">
                    <form action="order" method="post" id="product${cart.pid}">
                        <table class="text-center">
                            <tr class="row" style="border-bottom:1px solid darkgray;">
                                <th class="col-1">

                                </th>
                                <th class="col-2">

                                </th>
                                <th class="col-2">
                                    Product Name
                                </th>
                                <th class="col-2">
                                    Product Unit Price
                                </th>
                                <th class="col-2">
                                    Quantity
                                </th>
                                <th class="col-2">
                                    Total Per Product
                                </th>
                                <th class="col-1">

                                </th>
                            </tr>


                            <c:forEach items="${listCart}" var="cart">

                                <tr class="row" style="border-bottom:1px solid darkgray; padding:10px;">
                                    <td class="col-1">

                                        <input type="checkbox" class="btn-check" id="btn-check-outlined${cart.pid}" checked name="pid" value="${cart.pid}" autocomplete="off">
                                        <label class="btn btn-outline-primary bi bi-cart" for="btn-check-outlined${cart.pid}"></label>
                                    </td>
                                    <td class="col-2">
                                        <img src="images/${cart.pimg}"
                                    </td>
                                    <td class="col-2">

                                        <p>${cart.pname}</p>
                                    </td>
                                    <td class="col-2">
                                        <p>$${cart.pprice}</p>
                                    </td>
                                    <td class="col-2">

                                        <input type="number" name="pquantity${cart.pid}" class="form-control" required value="${cart.pquantity}" min="1" onfocusout="=">
                                    </td>
                                    <td class="col-2">
                                        <p>$${cart.ptotal}</p>
                                    </td>
                                    <td class="col-1">
                                        <a class="btn btn-primary" href="deleteInCart?pid=${cart.pid}" ><span class="bi bi-trash-fill"></span></a>
                                    </td>
                                </tr>

                            </c:forEach>

                            <tr class="row">
                                <th class="col-1">

                                </th>
                                <th class="col-2">

                                </th>
                                <th class="col-2">

                                </th>
                                <th class="col-2">
                                    All:
                                </th>
                                <th class="col-2">
                                    <p id="sumQuantity">0</p>
                                </th>
                                <th class="col-2">
                                    <p id="sumPrice">1</p>
                                </th>
                                <th class="col-1">
                                    <p class="btn btn-primary" onclick="showOrder();" style="color:white">Check Out</p>
                                </th>
                            </tr>


                            <script>

                                let sumQuantity = 0;
                                let sumPrice = 0;
                                <c:forEach items="${listCart}" var="cart">
                                sumQuantity +=${cart.pquantity};
                                sumPrice +=${cart.ptotal};
                                </c:forEach>
                                document.getElementById("sumQuantity").innerText = sumQuantity;
                                document.getElementById("sumPrice").innerText = '$ ' + sumPrice;

                            </script>
                        </table>
                        <div class="" id="orderForm" style="display:none">
                            <input type="text" class="form-control" name="uname" placeholder="Receiver Name" required value="${sessionScope.user.uname}">
                            <input type="text" class="form-control" name="uaddress" placeholder="Shipping Address" required value="${sessionScope.user.address}">
                            <input type="text" class="form-control" name="uemail" placeholder="Email" value="${sessionScope.user.uemail}">
                            <input type="text" class="form-control" name="uphone" placeholder="Phone" required>
                            <select class="form-control form-select" name="opay">
                                <option value="Paypal">
                                    Paypal
                                </option>
                                <option value="Internet Banking">
                                    Internet Banking
                                </option>
                                <option value="Pay on received">
                                    Pay on received
                                </option>

                            </select>
                            <input type="submit" class="form-control btn btn-primary" name="submit" value="Order"/>
                        </div>
                    </form>
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
