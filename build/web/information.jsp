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
                            <h2>Your Infomation</h2>
                            <h2 style="color: green">${mess}</h2>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                function reg() {
                    let a = document.getElementById("pass");
                    let b = document.getElementById("repass");
                    let c = document.getElementById("regis");
                    if (a.value == b.value) {
                        c.disabled = false;
                        b.style.borderColor = "darkgray";

                    } else {
                        c.disabled = true;
                        b.style.borderColor = "red";
                    }
                }
            </script>
            <div class="container-fluid">
                <div class=" justify-content-center" style='margin: 0 auto;'>
                    <c:if test="${sessionScope.user.isAdmin eq true}">
                        <div class='row justify-content-center text-center' style='margin: 0 auto;'>
                            <table>
                                <tr>
                                    <th>
                                        Name
                                    </th>
                                    <th>
                                        Email
                                    </th>
                                    <th>
                                        Password
                                    </th>
                                    <th>    
                                        Address
                                    </th>
                                    <th>
                                        Is Admin ?
                                    </th>
                                    <th>
                                        
                                    </th>
                                    <th>
                                        
                                    </th>
                                </tr>
                                <c:forEach items="${listUser}" var="u">
                                    <form action="userUpdate" method="post" id="user${u.uid}">
                                        <tr>
                                            <td>
                                                <input class="form-control" type="text" name="uid" value="${u.uid}" hidden>
                                                <input class="form-control" type="text" name="uname" value="${u.uname}" required="">
                                            </td>
                                            <td>
                                                <input class="form-control" type="text" name="uemail" value="${u.uemail}" required>
                                            </td>
                                            <td>
                                                <input class="form-control" type="text" name="pass" value="${u.upass}" required>
                                            </td>
                                            <td>
                                                <input class="form-control" type="text" name="address" value="${u.address}" required>
                                            </td>
                                            <td>
                                                <input class="form-check-input" type="radio" name="isAdmin" value="true" ${u.isAdmin == true?"checked":""}>
                                                <label for="isAdmin" class="form-check-label">Yes</label><br>
                                                <input class="form-check-input" type="radio" name="isAdmin" value="false" ${u.isAdmin == true?"":"checked"}>
                                                <label class="form-check-label" for="isAdmin">No</label><br>
                                            </td>
                                            <td>
                                                <button type="submit" form="user${u.uid}" class="btn btn-info bi bi-cloud-arrow-up"></button>

                                            </td>
                                            <td>
                                                <a type="submit" form="user${u.uid}" class="btn btn-info bi bi-trash-fill" href="userDelete?uid=${u.uid}"></a>
                                            </td>
                                        </tr>
                                    </form>
                                </c:forEach>
                            </table>
                        </div>
                    </c:if>
                    <c:if test="${sessionScope.user.isAdmin ne true}">
                        <style>
                            input.form-control{

                                margin-top: 10px;
                                width:50vw;
                            }


                        </style>
                        <div class='text-center' style=' margin:20px auto 0 auto;'>
                            <a class=" ${page==1?"btn btn-info":"btn btn-outline-info"}" href="information?page=1">Profile</a> 
                            <a class=" ${page==2?"btn btn-info":"btn btn-outline-info"}" href="information?page=2">Security</a> 
                        </div>
                        <c:if test="${page==1}">
                            <div class='row justify-content-center text-center' style='margin: 0 auto;'>
                                <form action='information' method='post'>
                                    <input type='text' class='form-control' name='uname' placeholder="Name" value='${sessionScope.user.uname}' required>



                                    <input type='text' class='form-control' name='uemail' placeholder="Email" value='${sessionScope.user.uemail}' required>

                                    <input type='text' class='form-control' name='uaddress' placeholder="Address" value='${sessionScope.user.address}' required>

                                    <input type='password' class='form-control' id='pass' placeholder="Enter password to change" name='newpass' required>

                                    <input type='password' class='form-control' id='repass' placeholder="Retype password to confirm" name='renewpass' onfocusout='reg()' required>

                                    <input type='submit' id='regis' class='form-control btn btn-info' name='submit' value='Update Information'>
                                </form>
                            </div>
                        </c:if>
                        <c:if test="${page==2}" >
                            <div class='row justify-content-center text-center' style='margin: 0 auto;'>
                                <form action='information' method='post'>
                                    <input type='password' class='form-control' placeholder="Old Password" name='oldpass' required>

                                    <input type='password' class='form-control' id='pass' placeholder="New Password" name='newpass' required>

                                    <input type='password' class='form-control' id='repass' name='renewpass' placeholder="Retype New Password" onfocusout='reg()' required>

                                    <input type='submit' class='form-control btn btn-info' id='regis' name='submit' value='Change Password'>
                                </form>
                            </div>
                        </c:if>
                    </c:if>
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
