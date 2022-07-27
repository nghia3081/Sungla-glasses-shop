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
        <div class="glasses">
            <div class="">
                <div class="row text-center d-flex justify-content-center" style="margin: 0 auto;" >
                    <div>
                        <div class="titlepage">
                            <h2>Our Glasses</h2>
                            <div class="row" style="margin: 0 auto;">

                                <form action="shopping" method="get">

                                    <input type="text" name="cateId" value="${cateId}" hidden>
                                    <input type="text" name="search" placeholder="Find something" class="form-control">
                                    <input type="submit" class="btn btn-info d-inline" value="Find">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script>
                function updateForm(a) {
                    if (document.getElementById("updateCate" + a).style.display === 'none') {
                        document.getElementById("li" + a).style.display = 'none';
                        document.getElementById("updateCate" + a).style.display = 'block';
                        document.getElementById("updateCate").style.display = 'none';
                    } else {
                        document.getElementById("li" + a).style.display = 'block';
                        document.getElementById("updateCate" + a).style.display = 'none';
                        document.getElementById("updateCate").style.display = 'inline';
                    }
                }
                function updateForm2(a) {
                    if (document.getElementById("updateCate" + a).style.display === 'none') {
                        document.getElementById("li" + a).style.display = 'none';
                        document.getElementById("updateCate" + a).style.display = 'block';
                        document.getElementById("updateCate").style.display = 'none';
                    } else {
                        document.getElementById("li" + a).style.display = 'block';
                        document.getElementById("updateCate" + a).style.display = 'none';
                        document.getElementById("updateCate").style.display = 'block';
                    }
                }
            </script>
            <div class="container">
                <c:if test="${sessionScope.user.isAdmin eq true}">
                    <div class="row" style="margin: 0 auto;">
                        <ul class="nav nav-pills" style="margin: 0 auto;">
                            <style>
                                .nav-pills li{
                                    margin-left:10px;
                                    border: 1px solid gray;
                                }
                                #updateCate{
                                    margin-left: 10px;
                                }
                            </style>

                            <li class="nav-item">
                                <a class="nav-link ${cateId==0?"active" :""}" href="shopping?cateId=0">
                                    All products
                                </a>
                            </li>
                            <c:forEach items="${listCate}" var="c">
                                <li class="nav-item" id="li${c.cid}">

                                    <a class="nav-link  ${cateId==c.cid?"active" :""}" href="shopping?cateId=${c.cid}">
                                        ${c.cname} 
                                    </a>
                                    <a class="btn btn-danger bi bi-trash-fill text-center" href="cateDelete?cid=${c.cid}"></a>
                                    <p class="btn btn-warning bi bi-pen-fill" onclick="updateForm(${c.cid})" style="display:inline"></p>
                                </li>
                                <form class="text-center" action="cateUpdate" method="get" id="updateCate${c.cid}" style="display: none">
                                    <input type="text" name="cid" value="${c.cid}" hidden>
                                    <input type="text" name="cname" placeholder="Category Name" class="form-control" value="${c.cname}">
                                    <button type="submit" form="updateCate${c.cid}"  class="btn btn-danger bi bi-cloud-plus"></button>
                                    <p class="btn btn-danger bi bi-dash text-center" style="display:inline" onclick="updateForm2(${c.cid})"></p>
                                </form>
                            </c:forEach>
                            <form action="cateAdd" method="get" id="updateCate">
                                <input type="text" name="cname" placeholder="Category Name" class="form-control">
                                <button type="submit" form="updateCate" class="btn btn-danger bi bi-cloud-plus"></button>
                            </form>
                        </ul>
                    </div>
                </c:if>
                <c:if test="${sessionScope.user.isAdmin ne true}">
                    <div class="row" style="margin: 0 auto;">
                        <ul class="nav nav-pills" style="margin: 0 auto;">
                            <li class="nav-item">
                                <a class="nav-link ${cateId==0?"active" :""}" href="shopping?cateId=0" >
                                    All products
                                </a>
                            </li>
                            <c:forEach items="${listCate}" var="c">
                                <li class="nav-item">
                                    <a class="nav-link ${cateId==c.cid?"active" :""}" href="shopping?cateId=${c.cid}">
                                        ${c.cname} 
                                    </a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </c:if>
                <div class="row m-2">
                    <c:if test="${sessionScope.user.isAdmin eq true}">
                        <c:if test="${page==1}">


                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6" style="margin-bottom:30px;">
                                <form action="shopadd" method="get" id="update${p.id}">
                                    <div class="card card-body position-relative">
                                        <input type="text" value="${cateId}" name="cateId" hidden>
                                        <c:if test="${cateId==0}">

                                            <select class="position-absolute form-select" name="cid" style="left:5px;top:5px;">

                                                <c:forEach items="${listCate}" var="c" >
                                                    <option value="${c.cid}" ${c.cid == p.cateID?"selected":""}>
                                                        ${c.cname}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </c:if>
                                        <img class="card-img-top" src="images/glass1.png" alt="#"/>
                                        <div class="card-title">
                                            <span>Image Link</span>
                                            <input type="text" class="form-control" name="pimg" required>
                                            <h3 class=""><span class="blu">$</span><input type="number" class="form-control" min="0" step="0.1" name="pprice"required></h3>
                                            <span>Name</span><p class=""><input type="text" class="form-control" name="pname" required></p>
                                            <span>Description</span><input type="text" class="form-control" name="pdes">
                                            <button class="btn btn-danger bi bi-cloud-plus" type="submit" style="margin: 10px auto 0 auto" form="update${p.id}"></button>

                                        </div>



                                    </div>
                                </form>
                            </div>
                        </c:if>
                        <c:forEach items="${listP}" var="p" begin="${page==1?prodStart:prodStart-1}" end="${page==1?prodStart+prodPerPage-2:prodStart+prodPerPage-1}">

                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6" style="margin-bottom:30px;">


                                <div class="card card-body position-relative">
                                    <form action="shopedit" method="get" id="update${p.id}">
                                        <input type="text" name="pid" value="${p.id}" hidden>
                                        <select class="form-select" name="cid" style="left:5px;top:5px;">

                                            <c:forEach items="${listCate}" var="c" >
                                                <c:if test="${c.cid==p.cateID}">
                                                    <option value="${c.cid}" selected>
                                                        ${c.cname}
                                                    </option>
                                                </c:if>
                                                <c:if test="${c.cid!=p.cateID}">
                                                    <option value="${c.cid}">
                                                        ${c.cname}
                                                    </option>
                                                </c:if>
                                            </c:forEach>

                                        </select>

                                        <img class="card-img-top" src="images/${p.img}" alt="#"/>
                                        <div class="card-title">
                                            <span>Image Link</span>
                                            <input type="text" class="form-control" name="pimg" value="${p.img}" required>
                                            <h3 class=""><span class="blu">$</span><input type="number" class="form-control" min="0" step="0.1" name="pprice" value="${p.price}" required></h3>
                                            <span>Name</span><p class=""><input type="text" class="form-control" name="pname" value="${p.name}" required></p>
                                            <span>Description</span><input type="text" class="form-control" name="pdes" value="${p.description}">
                                            <button class="btn btn-info bi bi-cloud-arrow-up" type="submit" style="margin: 10px auto 0 auto" form="update${p.id}"></button>
                                            <a class="btn btn-info bi bi-trash-fill" style="margin: 10px auto 0 auto" href="shopdelete?pid=${p.id}"></a>

                                        </div>



                                    </form>
                                </div>

                            </div>

                        </c:forEach>
                    </c:if>                    
                    <c:if test="${sessionScope.user.isAdmin ne true}">
                        <c:forEach items="${listP}" var="p" begin="${prodStart}" end="${prodStart+prodPerPage-1}">
                            <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6" style="margin-bottom:30px;">
                                <div class="card card-body position-relative">
                                    <c:forEach items="${listCate}" var="c">
                                        <c:if test="${c.cid == p.cateID && cateId == 0}">
                                            <a class="position-absolute btn btn-danger" href="shopping?cateId=${c.cid}" style="left:5px;top:5px;">
                                                ${c.cname}
                                            </a>
                                        </c:if>
                                    </c:forEach>
                                    <img class="card-img-top" src="images/${p.img}" alt="#"/>
                                    <h3 class="card-title"><span class="blu">$</span>${p.price}</h3>
                                    <p class="">${p.name}</p>
                                    <a class="btn btn-info bi bi-cart-plus" href="addCart?pid=${p.id}&pname=${p.name}&pimg=${p.img}&pprice=${p.price}&pquantity=1"></a>

                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <div class="col-md-12 text-center">

                        <a class="btn btn-info" href="shopping?cateId=${cateId}&search=${search}&page=1">First Page</a>
                        <c:if test="${page>1}">
                            <a class="btn btn-info" href="shopping?cateId=${cateId}&search=${search}&page=${page-1}"><<</a>
                        </c:if>

                        <c:forEach var="i" begin="1" end="${numberOfPage}">
                            <a class="btn btn-info ${i==page?"active":""}" href="shopping?cateId=${cateId}&search=${search}&page=${i}">${i}</a>
                        </c:forEach>
                        <c:if test="${page<numberOfPage}">
                            <a class="btn btn-info" href="shopping?cateId=${cateId}&search=${search}&page=${page+1}">>></a>
                        </c:if>

                        <a class="btn btn-info" href="shopping?cateId=${cateId}&search=${search}&page=${numberOfPage}">End Page</a>
                    </div>
                </div>
            </div>
        </div>
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
