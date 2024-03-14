<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set value="${sessionScope.customerAcc}" var="c"/>
<c:set value="${sessionScope.adminAcc}" var="adminAcc"/>
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

            <!-- Breadcrumb Start -->
            <div class="breadcrumb-wrap">
                <div class="container-fluid">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.jsp">Home</a></li>
                        <li class="breadcrumb-item"><a href="product-list.jsp">Products</a></li>
                        <li class="breadcrumb-item active">Product Detail</li>
                    </ul>
                </div>
            </div>
            <!-- Breadcrumb End -->

            <!-- Product Detail Start -->
        <c:set value="${requestScope.productDetail}" var="p"></c:set>
            <div class="product-detail">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="product-detail-top">
                                <div class="row align-items-center">
                                    <div class="col-md-5">
                                    <jsp:useBean class="dal.DAO" id="db"/>
                                    <div class="product-slider-single normal-slider">
                                        <c:forEach items="${db.getImageByProductId(p.productId)}" var="imgP">
                                            <img src="img2/${imgP.imagePath}" alt="Product Image">
                                        </c:forEach>
                                    </div>
                                    <!--                                    <div class="product-slider-single-nav normal-slider">
                                    
                                    <c:forEach items="${db.getImageByProductId(p.productId)}" var="imgP">
                                        <div class="slider-nav-img"><img src="./img2/${imgP.imagePath}" alt="Product Image"></div>
                                    </c:forEach>
                            </div>-->

                                </div>

                                <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

                                <div class="col-md-7">
                                    <div class="product-content">
                                        <div class="title"><h2>${p.name}</h2></div>
                                        <div class="ratting">
                                            <jsp:useBean class="dal.ProductDAO" id="db6"/>
                                            <c:set value="${db6.avarageStarOfProduct(p.productId)}" var="avgStar"></c:set>
                                            <c:if test="${avgStar != 0}">
                                                <c:forEach begin="1" end="${avgStar}">
                                                    <i class="fa fa-star"></i>
                                                </c:forEach>
                                            </c:if>
                                        </div>
                                        <div class="price">

                                            <p><fmt:formatNumber pattern="##,###,### Vnd" value="${p.price}"/></p>
                                        </div>
                                        <div class="p-size">

                                            <div class="btn-group btn-group-sm">
                                                <!--                                                <button type="button" class="btn">512GB</button>-->
                                                <button type="button" class="btn">${p.capacity}GB</button>
                                                <!--                                                <button type="button" class="btn">64GB</button>-->
                                            </div> 
                                        </div>

                                        <div class="action">
                                            <a class="btn" href="#" onclick="addToCart(${p.productId}); return false;"><i class="fa fa-shopping-cart"></i>Add to Cart</a>
                                            <a class="btn" href="#" onclick="buyNow(${p.productId}); return false;"><i class="fa fa-shopping-bag"></i>Buy Now</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row product-detail-bottom">
                            <div class="col-lg-12">
                                <ul class="nav nav-pills nav-justified">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="pill" href="#description">Description</a>
                                    </li>
                                    <!--                                    <li class="nav-item">
                                                                            <a class="nav-link" data-toggle="pill" href="#specification">Specification</a>
                                                                        </li>-->
                                    <jsp:useBean class="dal.CustomerDAO" id="db3"/>
                                    <c:set value="${db3.getReviewEachProduct(p.productId)}" var="rvDB"/> 
                                    <c:set value="${db3.checkingReviewCus(c.customerId, p.productId)}" var="checkRv"/>
                                    <li class="nav-item">
                                        <a class="nav-link"data-toggle="pill" href="#reviews">Reviews (${rvDB.size()})</a>
                                    </li>
                                </ul>

                                <div class="tab-content">
                                    <div id="description" class="container tab-pane active">
                                        <h4>Description</h4>
                                        <p>${p.description}</p>
                                    </div>

                                    <div id="reviews" class="container tab-pane fade">
                                        <div class="reviews-submitted">
                                            <jsp:useBean class="dal.CustomerDAO" id="db5"/>
                                            <c:forEach items="${rvDB}" var="orv">
                                                <c:set value="${db5.getCustomerById(orv.getCusId())}" var="nameCus"/>
                                                <div class="reviewer">${nameCus.fullName} - <span>${orv.time_rv}</span></div>
                                                <div class="ratting">
                                                    <c:forEach begin="1" end="${orv.star}">
                                                        <i class="fa fa-star"></i>
                                                    </c:forEach>
                                                </div>
                                                <p class="mr-2" style="display: inline-block">${orv.comment}</p>
                                                <c:if test="${orv.getCusId() == c.customerId}">
                                                    <i onclick="showUpdateForm()" class="far fa-edit"></i>
                                                </c:if>
                                                <c:if test="${not empty adminAcc}">
                                                    <a href="reviewservlet?action=deleteRv&reviewId=${orv.reviewId}&productId=${p.productId}"><i class="fas fa-trash"></i></a>
                                                    </c:if>    
                                                </c:forEach>
                                        </div>
                                        <c:set value="${db3.getReviewEachCus(p.productId, c.customerId)}" var="CusRv"/> 
                                        <c:if test="${checkRv eq 'Delivered'}">
                                            <div class="reviews-submit">
                                                <h4>Give your Review:</h4>
                                                <div class="ratting">
                                                    <i class="far fa-star" id="star1" onclick="rateProduct(1)"></i>
                                                    <i class="far fa-star" id="star2" onclick="rateProduct(2)"></i>
                                                    <i class="far fa-star" id="star3" onclick="rateProduct(3)"></i>
                                                    <i class="far fa-star" id="star4" onclick="rateProduct(4)"></i>
                                                    <i class="far fa-star" id="star5" onclick="rateProduct(5)"></i>
                                                </div>
                                                <form action="reviewservlet" id="review-form" onsubmit="return validateForm()">
                                                    <div class="row form">
                                                        <input type="hidden" name="action"  value="insert">
                                                        <input type="hidden" id="ratingStar_id" name="ratingStar"  value="">
                                                        <input type="hidden" name="customerID"  value="${c.customerId}">
                                                        <input type="hidden" name="productId"  value="${p.productId}">
                                                        <div class="col-sm-6">
                                                            <input style="color: black" type="text" placeholder="name"  value="${c.fullName}">
                                                        </div>
                                                        <div class="col-sm-12">
                                                            <textarea style="color: black" name="rv-comment" placeholder="Review"></textarea>
                                                        </div>
                                                        <div class="col-sm-12">
                                                            <button type="submit">Submit</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </c:if>  

                                        <div id="Form_update" class="reviews-submit" style="display: none">
                                            <h4>Give your Review Update:</h4>
                                            <div class="ratting">
                                                <i class="far fa-star" id="star1" onclick="rateProduct(1)"></i>
                                                <i class="far fa-star" id="star2" onclick="rateProduct(2)"></i>
                                                <i class="far fa-star" id="star3" onclick="rateProduct(3)"></i>
                                                <i class="far fa-star" id="star4" onclick="rateProduct(4)"></i>
                                                <i class="far fa-star" id="star5" onclick="rateProduct(5)"></i>
                                            </div>
                                            <form action="reviewservlet" id="review-form" onsubmit="return validateForm()">
                                                <div class="row form">
                                                    <input type="hidden" name="action"  value="updateRv">
                                                    <input type="hidden" id="ratingStar_id" name="ratingStar"  value="">
                                                    <input type="hidden" name="customerID"  value="${c.customerId}">
                                                    <input type="hidden" name="productId"  value="${p.productId}">
                                                    <div class="col-sm-6">
                                                        <input style="color: black" type="text" placeholder="name"  value="${c.fullName}">
                                                    </div>
                                                    <div class="col-sm-12">
                                                        <textarea style="color: black" name="rv-comment" placeholder="Review">${CusRv.comment}</textarea>
                                                    </div>
                                                    <div class="col-sm-12">
                                                        <button type="submit">Submit</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="product">
                            <div class="section-header">
                                <h1>Related Products</h1>
                            </div>
                            <div class="row align-items-center product-slider product-slider-3">
                                <jsp:useBean class="dal.ProductDAO" id="db2"/>
                                <c:forEach items="${db2.getProdctByCategoryId(p.categoryId)}" var="pr">
                                    <div class="col-lg-3">
                                        <div class="product-item">
                                            <div class="product-title">
                                                <a href="productdetail?id=${pr.productId}">${pr.name}</a>
                                                <div class="ratting">
                                                    <c:set value="${db6.avarageStarOfProduct(pr.productId)}" var="avgStarPr"></c:set>
                                                    <c:if test="${avgStarPr != 0}">
                                                        <c:forEach begin="1" end="${avgStarPr}">
                                                            <i class="fa fa-star"></i>
                                                        </c:forEach>
                                                    </c:if>
                                                    <c:if test="${avgStarPr == 0}">
                                                        <c:forEach begin="1" end="5">
                                                            <i class="far fa-star"></i>
                                                        </c:forEach>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div class="product-image">
                                                <a href="productdetail?id=${pr.productId}">
                                                    <img src="img2/${pr.image.imagePath}" alt="Product Image">
                                                </a>

                                            </div>
                                            <div class="product-price">
                                                <h3><fmt:formatNumber pattern="##,###,### Vnd" value="${pr.price}"/></h3>
                                                <a class="btn" href="#" onclick="buyNow(${p.productId}); return false;"><i class="fa fa-shopping-cart"></i>Buy Now</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <!-- Side Bar Start -->
                    <div class="col-lg-4 sidebar">
                        <div class="sidebar-widget category">
                            <h2 class="title">Category</h2>
                            <nav class="navbar bg-light">
                                <ul class="navbar-nav">
                                    <c:forEach items="${listC}" var ="o">
                                        <li class="nav-item">
                                            <%--<c:forEach items="${productListTop}" var="p">--%> 
                                            <a class="nav-link" href="search?action=filterAll&cateName=${o.categoryName}"><i class="fa fa-mobile-alt"></i>${o.categoryName}</a>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </div>
                        <jsp:useBean class="dal.ProductDAO" id="db1"/>
                        <div class="sidebar-widget widget-slider">
                            <div class="sidebar-slider normal-slider">
                                <c:forEach items="${db1.allProduct}" var="allP">
                                    <div class="product-item">
                                        <div class="product-title">
                                            <a href="productdetail?id=${allP.productId}">${allP.name}</a>
                                            <div class="ratting">
                                                    <c:set value="${db6.avarageStarOfProduct(allP.productId)}" var="avgStarallP"></c:set>
                                                    <c:if test="${avgStarallP != 0}">
                                                        <c:forEach begin="1" end="${avgStarallP}">
                                                            <i class="fa fa-star"></i>
                                                        </c:forEach>
                                                    </c:if>
                                                    <c:if test="${avgStarallP == 0}">
                                                        <c:forEach begin="1" end="5">
                                                            <i class="far fa-star"></i>
                                                        </c:forEach>
                                                    </c:if>
                                                </div>
                                        </div>
                                        <div class="product-image">
                                            <a href="productdetail?id=${allP.productId}">
                                                <img src="img2/${allP.image.imagePath}" alt="Product Image">
                                            </a>

                                        </div>
                                        <div class="product-price">
                                            <h3><fmt:formatNumber pattern="##,###,### Vnd" value="${allP.price}"/></h3>
                                            <a class="btn" href="#" onclick="buyNow(${p.productId}); return false;"><i class="fa fa-shopping-cart"></i>Buy Now</a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>

                        <div class="sidebar-widget brands">
                            <h2 class="title">Our Brands</h2>
                            <ul>
                                <li><a href="#">Nulla </a><span>(45)</span></li>
                                <li><a href="#">Curabitur </a><span>(34)</span></li>
                                <li><a href="#">Nunc </a><span>(67)</span></li>
                                <li><a href="#">Ullamcorper</a><span>(74)</span></li>
                                <li><a href="#">Fusce </a><span>(89)</span></li>
                                <li><a href="#">Sagittis</a><span>(28)</span></li>
                            </ul>
                        </div>

                        <div class="sidebar-widget tag">
                            <h2 class="title">Tags Cloud</h2>
                            <a href="#">Lorem ipsum</a>
                            <a href="#">Vivamus</a>
                            <a href="#">Phasellus</a>
                            <a href="#">pulvinar</a>
                            <a href="#">Curabitur</a>
                            <a href="#">Fusce</a>
                            <a href="#">Sem quis</a>
                            <a href="#">Mollis metus</a>
                            <a href="#">Sit amet</a>
                            <a href="#">Vel posuere</a>
                            <a href="#">orci luctus</a>
                            <a href="#">Nam lorem</a>
                        </div>
                    </div>
                    <!-- Side Bar End -->
                </div>
            </div>
        </div>
        <!-- Product Detail End -->

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
                                                function showUpdateForm() {
                                                    document.getElementById("Form_update").style.display = "block";
                                                }
                                                let selectedRating = 0;
                                                function rateProduct(rating) {
                                                    selectedRating = rating;
                                                    // Đặt tất cả các sao về trạng thái rỗng
                                                    $(".fa-star").removeClass("fas").addClass("far");

                                                    // Đặt các sao từ sao đầu tiên đến sao được click về trạng thái đã chọn
                                                    for (var i = 1; i <= rating; i++) {
                                                        $("#star" + i).removeClass("far").addClass("fas");
                                                    }
                                                    $("#ratingStar_id").val(rating);

                                                }

                                                function rateProduct1(rating) {
                                                    selectedRating = rating;
                                                    // Đặt tất cả các sao về trạng thái rỗng
                                                    $(".fa-star").removeClass("fas").addClass("far");

                                                    // Đặt các sao từ sao đầu tiên đến sao được click về trạng thái đã chọn
                                                    for (var i = 1; i <= rating; i++) {
                                                        $("#star" + i).removeClass("far").addClass("fas");
                                                    }
                                                    $("#ratingStar_id").val(rating);

                                                }

                                                function validateForm() {
                                                    if (selectedRating === 0) {
                                                        alert("Please select a rating before submitting your review.");
                                                        return false; // Ngăn form được gửi đi nếu chưa chọn xếp hạng
                                                    }
                                                    // Các kiểm tra khác nếu cần
                                                    return true; // Cho phép form được gửi đi
                                                }


                                                //-------------------------------------------------------------------------------------------------------------------------------            
                                                function addToCart(productId) {
                                                    $.ajax({
                                                        url: "/WebApplication3/add",
                                                        type: 'GET',
                                                        data: {
                                                            id: productId
                                                        },
                                                        success: function ()
                                                        {
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
    </body>
</html>
