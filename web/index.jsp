<!DOCTYPE html>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set value="${requestScope.buy}" var="s"></c:set>
    <html lang="en">
        <head>
            <meta charset="utf-8">
            <title>E Store - eCommerce HTML Template</title>
            <meta content="width=device-width, initial-scale=1.0" name="viewport">
            <meta content="eCommerce HTML Template Free Download" name="keywords">
            <meta content="eCommerce HTML Template Free Download" name="description">

            <!-- Favicon -->
            <link href="img/favicon.ico" rel="icon">

            <!-- Google Fonts -->
            <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400|Source+Code+Pro:700,900&display=swap" rel="stylesheet">

            <!-- CSS Libraries -->
            <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
            <link href="lib/slick/slick.css" rel="stylesheet">
            <link href="lib/slick/slick-theme.css" rel="stylesheet">

            <!-- Template Stylesheet -->
            <link href="./css/style.css" rel="stylesheet">
        </head>

        <body>
            <!-- Top bar Start -->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- Bottom Bar End -->       

            <!-- Main Slider Start -->
            <div class="container-fluid">
                <div class="header">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-3">
                                <nav class="navbar bg-light">
                                    <ul class="navbar-nav">

                                        <!--                                        <li class="nav-item">
                                                                                    <a class="nav-link" href="#"><i class="fa fa-shopping-bag"></i>Best Selling</a>
                                                                                </li>-->
                                    <c:forEach items="${listC}" var ="o">
                                        <li class="nav-item">
                                            <%--<c:forEach items="${productListTop}" var="p">--%> 
                                            <a class="nav-link" href="search?action=filterAll&cateName=${o.categoryName}"><i class="fa fa-mobile-alt"></i>${o.categoryName}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </div>
                        <div class="col-md-6">
                            <jsp:include page="carousel.jsp"></jsp:include>
                            </div>
                            <div class="col-md-3">
                                <div class="header-img">
                                    <div class="img-item">
                                        <img src="img/brand2.png" />
                                        <a class="img-text" href="">
                                            <p>Some text goes here that describes the image</p>
                                        </a>
                                    </div>
                                    <div class="img-item">
                                        <img src="img/brand3.png" />
                                        <a class="img-text" href="">
                                            <p>Some text goes here that describes the image</p>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Main Slider End -->      

                <!-- Brand Start -->
                <div class="brand">
                    <div class="container-fluid">
                        <div class="brand-slider">
                            <div class="brand-item"><img src="img/brand1.png" alt=""></div>
                            <div class="brand-item"><img src="img/brand5.png" alt=""></div>
                            <div class="brand-item"><img src="img/brand6.png" alt=""></div>
                            <div class="brand-item"><img src="img/brand7.png" alt=""></div>
                            <div class="brand-item"><img src="img/brand8.png" alt=""></div>
                            <div class="brand-item"><img src="img/brand9.png" alt=""></div>
                        </div>
                    </div>
                </div>
                <!-- Brand End -->      

                <!-- Feature Start-->
                <div class="feature">
                    <div class="container-fluid">
                        <div class="row align-items-center">
                            <div class="col-lg-3 col-md-6 feature-col">
                                <div class="feature-content">
                                    <i class="fab fa-cc-mastercard"></i>
                                    <h2>Secure Payment</h2>

                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 feature-col">
                                <div class="feature-content">
                                    <i class="fa fa-truck"></i>
                                    <h2>Nationwide Delivery</h2>

                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 feature-col">
                                <div class="feature-content">
                                    <i class="fa fa-sync-alt"></i>
                                    <h2>7 Days Return</h2>

                                </div>
                            </div>
                            <div class="col-lg-3 col-md-6 feature-col">
                                <div class="feature-content">
                                    <i class="fa fa-comments"></i>
                                    <h2>24/7 Support</h2>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Feature End-->      

                <!-- Category Start-->
                <div class="category">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="category-item ch-400">
                                    <img src="img/category_ip.png" />
                                    <a class="category-name" href="">
                                        <p>Some text goes here that describes the image</p>
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="category-item ch-250">
                                    <img src="img/category_oppo.png" />
                                    <a class="category-name" href="">
                                        <p>Some text goes here that describes the image</p>
                                    </a>
                                </div>
                                <div class="category-item ch-150">
                                    <img src="img/category_realme.png" />
                                    <a class="category-name" href="">
                                        <p>Some text goes here that describes the image</p>
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-3">

                                <div class="category-item ch-400">
                                    <img src="img/category_samsung_2.png" />
                                    <a class="category-name" href="">
                                        <p>Some text goes here that describes the image</p>
                                    </a>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="category-item ch-400">
                                    <img src="img/category_xiaomi.png" />
                                    <a class="category-name" href="">
                                        <p>Some text goes here that describes the image</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Category End-->       

                <!-- Call to Action Start -->

                <!-- Call to Action End -->       

                <!-- Featured Product Start -->
                <div class="featured-product product">
                    <div class="container-fluid">
                        <div class="section-header">
                            <h1>Featured Product</h1>
                        </div>
                        <div class="row align-items-center product-slider product-slider-4">
                        <c:forEach items="${productListTop}" var="p"> 
                            <div class="col-lg-3">
                                <div class="product-item">
                                    <div class="product-title">
                                        <a href="productdetail?id=${p.productId}">${p.name}</a>
                                        <div class="ratting">
                                            <jsp:useBean class="dal.ProductDAO" id="db6"/>
                                            <c:set value="${db6.avarageStarOfProduct(p.productId)}" var="avgStar"></c:set>
                                            <c:if test="${avgStar != 0}">
                                                <c:forEach begin="1" end="${avgStar}">
                                                    <i class="fa fa-star"></i>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${avgStar == 0}">
                                                <c:forEach begin="1" end="5">
                                                    <i class="far fa-star"></i>
                                                </c:forEach>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="product-image">
                                        <a href="product-detail.jsp">
                                            <img src="img2/${p.image.imagePath}" alt="Product Image">
                                        </a>
                                        <div class="product-action">
                                            <a href="#" onclick="addToCart(${p.productId}); return false;"><i class="fa fa-cart-plus"></i></a>
                                        </div>
                                    </div>
                                    <div class="product-price">
                                        <h3><fmt:formatNumber pattern="##,###,### Vnd" value="${p.price}"/></h3>
                                        <a class="btn" href="#" onclick="buyNow(${p.productId}); return false;"><i class="fa fa-shopping-cart"></i>Buy Now</a>
                                    </div>
                                </div>
                            </div>    
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!-- Featured Product End -->       

            <!-- Newsletter Start -->

            <!-- Newsletter End -->        

            <!-- Recent Product Start -->

            <div class="recent-product product">
                <div class="container-fluid">
                    <div class="section-header">
                        <h1>Recent Product</h1>
                    </div>
                    <div class="row align-items-center product-slider product-slider-4">
                        <c:forEach items="${productListLast}" var="p">
                            <div class="col-lg-3">
                                <div class="product-item">
                                    <div class="product-title">
                                        <a href="productdetail?id=${p.productId}">${p.name}</a>
                                        <div class="ratting">
                                            <c:if test="${avgStar != 0}">
                                                <c:forEach begin="1" end="${avgStar}">
                                                    <i class="fa fa-star"></i>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${avgStar == 0}">
                                                <c:forEach begin="1" end="5">
                                                    <i class="far fa-star"></i>
                                                </c:forEach>
                                            </c:if>
                                        </div>
                                    </div>
                                    <div class="product-image">
                                        <a href="product-detail.jsp">
                                            <img src="img2/${p.image.imagePath}" alt="Product Image">
                                        </a>
                                        <div class="product-action">
                                            <a href="#" onclick="addToCart(${p.productId}); return false;"><i class="fa fa-cart-plus"></i></a>
                                        </div>
                                    </div>
                                    <div class="product-price">
                                        <h3><fmt:formatNumber pattern="##,###,### Vnd" value="${p.price}"/></h3>
                                        <a class="btn" href="#" onclick="buyNow(${p.productId}); return false;"><i class="fa fa-shopping-cart"></i>Buy Now</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>  
                    </div>
                </div>
            </div>
            <!-- Recent Product End -->

            <!-- Review Start -->
            <div class="review">
                <div class="container-fluid">
                    <div class="row align-items-center review-slider normal-slider">
                        <div class="col-md-6">
                            <div class="review-slider-item">
                                <div class="review-img">
                                    <img src="img/review-1.jpg" alt="Image">
                                </div>
                                <div class="review-text">
                                    <h2>Customer Name</h2>
                                    <h3>Profession</h3>
                                    <div class="ratting">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae nunc eget leo finibus luctus et vitae lorem
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="review-slider-item">
                                <div class="review-img">
                                    <img src="img/review-2.jpg" alt="Image">
                                </div>
                                <div class="review-text">
                                    <h2>Customer Name</h2>
                                    <h3>Profession</h3>
                                    <div class="ratting">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae nunc eget leo finibus luctus et vitae lorem
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="review-slider-item">
                                <div class="review-img">
                                    <img src="img/review-3.jpg" alt="Image">
                                </div>
                                <div class="review-text">
                                    <h2>Customer Name</h2>
                                    <h3>Profession</h3>
                                    <div class="ratting">
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    </div>
                                    <p>
                                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur vitae nunc eget leo finibus luctus et vitae lorem
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Review End -->        
        </div>
        <!-- Footer Start -->

        <jsp:include page="footer.jsp"></jsp:include>

            <!-- Footer Bottom End -->       

            <!-- Back to Top -->
            <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

            <!-- JavaScript Libraries -->
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
            <script src="lib/easing/easing.min.js"></script>
            <script src="lib/slick/slick.min.js"></script>
            <script src="https://www.gstatic.com/dialogflow-console/fast/messenger/bootstrap.js?v=1"></script>
            <df-messenger
            intent="WELCOME"
            chat-title="chat_ai_vi"
            agent-id="84f2aef0-1a7c-4be4-a57c-1bd1e3320644"
            language-code="vi"
            ></df-messenger>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <!--  Javascript -->
        <script>
                                            //THEANH
                                            if (${not empty s}) {
                                                Swal.fire({
                                                    title: 'Buy successfully',
                                                    icon: 'success'

                                                });
                                            }


                                            function addToCart(productId) {
                                                $.ajax({
                                                    url: "/WebApplication3/add",
                                                    type: 'GET',
                                                    data: {
                                                        id: productId
                                                    },
                                                    success: function ()
                                                    {
                                                        $.ajax({
                                                            url: "/WebApplication3/add",
                                                            type: 'GET',
                                                            data: {
                                                                cartShow: 'cartAjax'
                                                            },
                                                            success: function (dataCart)
                                                            {
                                                                console.log(dataCart);
                                                                var row = document.getElementById("content-cart");
                                                                row.innerHTML = dataCart;
                                                            }

                                                        });

                                                        Swal.fire({
                                                            title: 'Add to cart successfully',
                                                            icon: 'success',
                                                            showCancelButton: true,
                                                            confirmButtonText: 'Go to cart',
                                                            cancelButtonText: 'OK'
                                                        }).then((result) => {
                                                            if (result.isConfirmed) {
                                                                window.open("cart.jsp", "_self");
                                                            }
                                                        });
                                                    }
                                                });
                                            }

                                            function buyNow(productId) {
                                                $.ajax({
                                                    url: "/WebApplication3/add",
                                                    type: 'GET',
                                                    data: {
                                                        id: productId
                                                    },
                                                    success: function ()
                                                    {
                                                        window.open("checkout.jsp", "_self");
                                                    }

                                                });
                                            }


    </script>

    <script>
        const searchBtn = document.querySelector('#searchBtn');
        let searchValue = document.querySelector('#searchInput');
        searchBtn.addEventListener('click', function () {
            window.location = 'search?action=filterAll&searchProduct=' + searchValue.value;
        })
        document.querySelector('#searchInput').addEventListener("keypress", function (event) {
            if (event.key === "Enter") {
                window.location = 'search?action=filterAll&searchProduct=' + searchValue.value;
                ;
            }
        });
    </script>
</body>
</html>
