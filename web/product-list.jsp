<!DOCTYPE html>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="constant.*" %>
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
        <h3>${stringsql}</h3>
        <!-- Bottom Bar End -->  

        <!-- Breadcrumb Start -->
        <div class="breadcrumb-wrap">
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                    <li class="breadcrumb-item"><a href="search">Products</a></li>
                    <li class="breadcrumb-item active">Product List</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Product List Start -->
        <div class="product-view">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="product-view-top">
                                    <div class="row">
<!--                                        <div class="col-md-6">
                                            <div class="product-short">
                                                <div class="dropdown">
                                                    <div class="dropdown-toggle" data-toggle="dropdown">Product short by</div>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <ul>
                                                            <c:forEach var="c" items="${IConstant.FILTER_OPTION}">
                                                                <li class="dropdown-item typeItem ${c==filterType?'text-danger choosed':''}">${c}</li>
                                                                </c:forEach>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>-->
                                        <div class="col-md-12">
                                            <div class="product-price-range">
                                                <div class="dropdown">
                                                    <div class="dropdown-toggle" data-toggle="dropdown">Product price range</div>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <ul>
                                                            <c:forEach var="c" items="${IConstant.FILTER_PRICE}">
                                                                <li class="dropdown-item priceItem ${c==filterPrice?'text-danger choosed':''}">${c}</li>
                                                                </c:forEach>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <c:forEach items="${listSearch}" var="p">
                                <div class="col-md-4">

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
                                            <a href="product-detail.html">
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

                        <!-- Pagination Start -->
                        <div class="col-md-12">
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <c:if test="${tag>1}">
                                        <li class="page-item">
                                            <a class="page-link" href="search?indexPage=${tag-1}"
                                               onClick="getPaging('${tag-1}', event)">Previous</a>
                                        </li>
                                    </c:if>
                                    <c:forEach var = "page" begin="1" end="${endPage}">
                                        <li class="page-item ${tag==page?'active':''}">
                                            <a class="page-link" href="search?indexPage=${page}" onClick="getPaging('${page}', event)">${page}</a></li>
                                        </c:forEach>
                                        <c:if test="${tag<endPage}">
                                        <li class="page-item">
                                            <a class="page-link" href="search?indexPage=${tag+1}" onClick="getPaging('${tag+1}', event)">Next</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </nav>
                        </div>
                        <!-- Pagination Start -->
                    </div>           

                    <!-- Side Bar Start -->
                    <div class="col-lg-4 sidebar">
                        <div class="sidebar-widget category">
                            <h2 class="title">Category</h2>
                            <nav class="navbar bg-light">

                                <ul class="navbar-nav">
                                    <c:forEach items="${listC}" var ="o">
                                        <li class="nav-item">
                                            <a class="nav-link_cate ${o.categoryName.equals(cateName)?'text-danger choosed':''}" 
                                               href="search?action=filterAll&cateName=${o.categoryName}"><i class="fa fa-mobile-alt"></i>
                                                ${o.categoryName}
                                            </a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </div>

                        <div class="sidebar-widget widget-slider">
                            <div class="sidebar-slider normal-slider">
                                <c:forEach items="${db.allProduct}" var="p">
                                    <div class="product-item">
                                        <div class="product-title">
                                            <a href="#">${p.name}</a>
                                            <div class="ratting">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        </div>
                                        <div class="product-image">
                                            <a href="product-detail.html">
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
                                </c:forEach>  
                            </div>
                        </div>

                        
                    </div>
                    <!-- Side Bar End -->
                </div>
            </div>
        </div>
        <!-- Product List End -->  

        <!-- Brand Start -->
        <div class="brand">
            <div class="container-fluid">
                <div class="brand-slider">
                    <div class="brand-item"><img src="img/brand-1.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-2.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-3.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-4.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-5.png" alt=""></div>
                    <div class="brand-item"><img src="img/brand-6.png" alt=""></div>
                </div>
            </div>
        </div>
        <!-- Brand End -->

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

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <!--  Javascript -->
        <script>
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
//-------------------------------------------------------------------------------------------------------------------------------------------
//TOAN

                                                let url = "search?action=filterAll"
                                                const typeItem = document.querySelectorAll('.typeItem');
                                                const navLink = document.querySelectorAll('.nav-link_cate');

                                                function getPaging(tag, event) {
                                                    event.preventDefault();
                                                    let filterType = document.querySelector('.typeItem.choosed');
                                                    let filterPrice = document.querySelector('.priceItem.choosed');
                                                    let navLinkValue = document.querySelector('.nav-link_cate.choosed');
                                                    let searchValue = document.querySelector('#searchInput');
                                                    if (filterType != null) {
                                                        url += "&typeSort=" + filterType.innerText;
                                                    }
                                                    if (filterPrice != null) {
                                                        url += "&priceSort=" + filterPrice.innerText;
                                                    }
                                                    if (navLinkValue != null) {
                                                        url += "&cateName=" + (navLinkValue.innerText).trim();
                                                    }
                                                    if (searchValue.value != '') {
                                                        url += "&searchProduct=" + searchValue.value;
                                                    }
                                                    url += "&indexPage=" + tag;
                                                    window.location = url
                                                }
                                                typeItem.forEach(function (item) {
                                                    item.addEventListener('click', function () {
                                                        for (var i = 0; i < typeItem.length; i++) {
                                                            if (typeItem[i].classList.contains('choosed')) {
                                                                typeItem[i].classList.remove('choosed');
                                                            }
                                                        }
                                                        item.classList.add('choosed');
                                                        direct();
                                                    })
                                                })

                                                navLink.forEach(function (item) {
                                                    item.addEventListener('click', function (e) {
                                                        e.preventDefault()
                                                        for (var i = 0; i < navLink.length; i++) {
                                                            if (navLink[i].classList.contains('choosed')) {
                                                                navLink[i].classList.remove('choosed');
                                                            }
                                                        }
                                                        item.classList.add('choosed');
                                                        direct();
                                                    })
                                                })
                                                const priceItem = document.querySelectorAll('.priceItem');

                                                priceItem.forEach(function (item) {
                                                    item.addEventListener('click', function () {
                                                        for (var i = 0; i < priceItem.length; i++) {
                                                            if (priceItem[i].classList.contains('choosed')) {
                                                                priceItem[i].classList.remove('choosed');
                                                            }
                                                        }
                                                        item.classList.add('choosed');
                                                        direct();
                                                    })
                                                })
                                                const searchBtn = document.querySelector('#searchBtn');
                                                searchBtn.addEventListener('click', function () {
                                                    direct();
                                                })
                                                document.querySelector('#searchInput').addEventListener("keypress", function (event) {
                                                    if (event.key === "Enter") {
                                                        direct();
                                                    }
                                                });

                                                function direct() {
                                                    let filterType = document.querySelector('.typeItem.choosed');
                                                    let filterPrice = document.querySelector('.priceItem.choosed');
                                                    let navLinkValue = document.querySelector('.nav-link_cate.choosed');
                                                    let searchValue = document.querySelector('#searchInput');
                                                    if (filterType != null) {
                                                        url += "&typeSort=" + filterType.innerText;
                                                    }

                                                    if (filterPrice != null) {
                                                        url += "&priceSort=" + filterPrice.innerText;
                                                    }
                                                    if (navLinkValue != null) {
                                                        url += "&cateName=" + (navLinkValue.innerText).trim();
                                                    }
                                                    if (searchValue.value != '') {
                                                        url += "&searchProduct=" + searchValue.value;
                                                    }
                                                    window.location = url;
                                                }

        </script>
    </body>
</html>
