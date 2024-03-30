<%-- 
    Document   : header
    Created on : Jan 12, 2024, 3:13:12 PM
    Author     : Admin
--%>
<%--


<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>

--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="top-bar">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <i class="fa fa-envelope"></i>
                        phonestore@gmail.com
                    </div>
                    <div class="col-sm-6">
                        <i class="fa fa-phone-alt"></i>
                        (+84) 34 442 4350
                    </div>
                </div>
            </div>
        </div>
        <!-- Top bar End -->

        <!-- Nav Bar Start -->
        <div class="nav">
            <div class="container-fluid">
                <nav class="navbar navbar-expand-md bg-dark navbar-dark">
                    <a href="#" class="navbar-brand">MENU</a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto">
                            <a href="home" class="nav-item nav-link">Home</a>
                            <a href="search" class="nav-item nav-link">Products</a>
<!--                            <a href="product-detail.jsp" class="nav-item nav-link">Product Detail</a>-->
                            <a href="cart.jsp" class="nav-item nav-link">Cart</a>
                            <a href="checkout.jsp" class="nav-item nav-link">Checkout</a>
                            <a href="listallnews?service=news" class="nav-item nav-link">News</a>
                            <c:if test="${not empty sessionScope.adminAcc}">
                                <a style="font-weight: bold ;background: red" href="Dashboard" class="nav-item nav-link">ADMIN</a>
                            </c:if>

                            <!--                            <div class="nav-item dropdown">
                                                            <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">More Pages</a>
                                                            <div class="dropdown-menu">
                            
                                                                <a href="login.jsp" class="dropdown-item">....</a>
                                                                <a href="./admin_template/index.jsp" class="dropdown-item">ADMIN</a>
                                                            </div>
                                                        </div>-->
                        </div>
                        <div class="navbar-nav ml-auto">
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Account</a>
                                <div class="dropdown-menu">
                                    <c:if test="${empty sessionScope.customerAcc}">
                                        <c:if test="${empty sessionScope.adminAcc}">
                                            <a href="login_2.jsp" class="dropdown-item">Login</a>
                                        </c:if>
                                    </c:if>
                                    <c:if test="${not empty sessionScope.customerAcc || not empty sessionScope.adminAcc}">
                                        <a href="my-account.jsp" class="dropdown-item">My Account</a>
                                        <a href="logout" class="dropdown-item">Logout</a>
                                    </c:if>
                                    <!--<a href="#" class="dropdown-item">Register</a>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Nav Bar End -->      

        <!-- Bottom Bar Start -->
        <div class="bottom-bar">
            <div class="container-fluid">
                <div class="row align-items-center">
                    <div class="col-md-3">
                        <div class="logo">
                            <a href="home">
                                <img style="width: 70px; height: 70px; margin-left: 30%" src="img/logo_1.png" alt="Logo">
                            </a>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <!--                    <form action="search" method="post">-->
                        <div class="search">
                            <input id = "searchInput" value ="${requestScope.searchFind}" type="text" name="searchProduct" placeholder="Search">
                            <button id="searchBtn"><i class="fa fa-search"></i></button>
                        </div>
                    </div>

                    <c:set value="${sessionScope.size}" var="size"/>
                    <div class="col-md-3" id="content-cart">
                        <div class="user">
                            <a href="cart.jsp" class="btn cart">
                                <i class="fa fa-shopping-cart"></i>
                                <span>(${not empty size?size:0})</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
