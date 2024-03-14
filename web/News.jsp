<%-- 
    Document   : News
    Created on : Mar 1, 2024, 8:16:12 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
        <link rel="stylesheet" href="css/styleNew.css">
        <link href="./css/style.css" rel="stylesheet">
        <style>
            .news-menu {
                list-style: none;
                display: flex;
                padding: 0;
            }

            .news-menu__item {
                margin-right: 10px; /* Khoảng cách giữa các phần tử */
            }

            .news-menu__link {
                text-decoration: none;
                color: #333; /* Màu chữ */
                padding: 10px; /* Kích thước ô chữ */
                border: 1px solid #ccc; /* Viền */
                border-radius: 5px; /* Góc bo tròn */
                display: block;
            }

            /* Hover effect */
            .news-menu__link:hover {
                background-color: #f0f0f0; /* Màu nền khi hover */
            }
            .pagination-container {
                display: flex;
                justify-content: center;
                margin-top: 20px; /* Khoảng cách giữa danh sách tin tức và phân trang */
            }

            .pagination {
                list-style: none;
                display: flex;
                gap: 5px; /* Khoảng cách giữa các nút phân trang */
            }

            .page-item {
                background-color: #fff;
                border: 1px solid #ddd;
                border-radius: 5px;
            }

            .page-link {
                display: block;
                padding: 10px;
                text-decoration: none;
                color: #333;
            }

            .page-item.active {
                background-color: #007bff;
                color: #fff;
                border: 1px solid #007bff;
            }


        </style>
    </head>
    <body>
        
        <div class="top-bar">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6">
                        <i class="fa fa-envelope"></i>
                        support@email.com
                    </div>
                    <div class="col-sm-6">
                        <i class="fa fa-phone-alt"></i>
                        +012-345-6789
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
                        <form action="listallnews?service=searchNews" method="post">
                        <div class="search">
                            <input id = "searchInput" value ="${requestScope.searchFind}" type="text" name="searchNews" placeholder="Search news">
                            <button id="searchBtn" type="submit" ><i class="fa fa-search"  ></i></button>
                        </div>
                        </form>
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
    
            <div class="container">
                <div class="section">
                    <p class="fs-1 font-monospace fw-bold"><a style="text-decoration: none; color: #007bff" href="News.jsp">News</a></p>
                </div>
                <ul class="news-menu margin-bottom-20"> 
                    <li class="news-menu__item">
                        <a class="news-menu__link" href="listallnews?service=news" >Tất cả</a>
                    </li> 
                <c:forEach  items="${requestScope.newsgroup}" var="g">
                    <li class="news-menu__item">
                        <a class="news-menu__link" href="listallnews?service=getById&grId=${g.newsGroupId}">${g.newsGroupName}</a>
                    </li>
                </c:forEach>
            </ul>    


            <div class="section">
                <div class="row">
                    <div class="col-md-12 mb-4">
                        <div class="news-card row">
                            <c:forEach  items="${requestScope.listNew}" var="n">
                                <div class="col-md-3">
                                    <a href="#">
                                        <img class="img-fluid rounded"
                                             src="img2/${n.image}"
                                             alt="">
                                    </a>

                                </div>

                                <div class="mt-3 col-md-9">
                                    <a class="news-title fs-4 fw-bold" href="listallnews?service=detail&newsId=${n.newsId}">${n.title}</a>
                                    <p class="lh-base">${n.heading}</p>
                                    <div class="news-time-category">
                                        <i class="far fa-clock"></i> <span>14:34</span>
                                        <span>${n.createdOn}</span>
                                        <span class="ms-3">${n.newGroupname}</span>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>                
                </div>
            </div>
        </div>
        <div class="pagination-container">
            <ul class="pagination">
           <c:set var="ser" value="${service}" />
           <c:set var="gr" value="${grId}" />
                <c:forEach begin="1" end="${end}" var="i">
                    <li class="page-item">
                        <a class="page-link" href="listallnews?index=${i}&service=${ser != null ? ser : 'Checkagain'}&grId=${gr}&searchNews=${textSearch}">
                            ${i}
                        </a>
                    </li>
                </c:forEach>
            </ul>
        </div>

        <jsp:include page="footer.jsp"></jsp:include>
    </body>
    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>       

</html>
