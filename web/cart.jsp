<!DOCTYPE html>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                        <li class="breadcrumb-item"><a href="home">Home</a></li>
                        <li class="breadcrumb-item"><a href="search">Products</a></li>
                        <li class="breadcrumb-item active">Cart</li>
                    </ul>
                </div>
            </div>
            <!-- Breadcrumb End -->

            <!-- Cart Start -->
            <div class="cart-page">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="cart-page-inner">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>No.</th>
                                                <th>Product</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th>Total</th>
                                                <th>Delete</th>
                                            </tr>
                                        </thead>
                                    <c:set value="${sessionScope.cart}" var="o"/>
                                    <c:set value="0" var="t"/>
                                    <c:forEach items="${o.items}" var="i">    
                                        <c:set value="${t + 1}" var="t"/>
                                        <tbody class="align-middle">                                       
                                            <tr>
                                                <td>${t}</td>
                                                <td>
                                                    <div class="img">
                                                        <a href="productdetail?id=${i.product.productId}"><img src="img2/${i.product.image.imagePath}" alt="Image"></a>
                                                        <p>${i.product.name}</p>
                                                    </div>
                                                </td>
                                                <td><fmt:formatNumber pattern="##,###,###" value="${i.price}"/></td>
                                                <td>
                                                    <div class="qty">
                                                        <button><a href="process?num=-1&id=${i.product.productId}"><i class="fa fa-minus"></i></a></button>
                                                        <input type="text" readonly value="${i.quantity}">
                                                        <button><a href="process?num=1&id=${i.product.productId}"><i class="fa fa-plus"></i></a></button>

                                                    </div>
                                                </td>
                                                <td><fmt:formatNumber pattern="##,###,###" value="${i.quantity*i.price}"/></td>
                                                <td>                                                 
                                                    <form action="process" method="post"> 
                                                        <input type="hidden" name="id" value="${i.product.productId}"/>
                                                        <button type="submit"><i class="fa fa-trash"></i></button>
                                                    </form>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </c:forEach>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="cart-page-inner">
                            <div class="row">
<!--                                <div class="col-md-12">
                                    <div class="coupon">
                                        <input type="text" placeholder="Mã giảm giá">
                                        <button>Nhập</button>
                                    </div>
                                </div>-->
                                <div class="col-md-12">
                                    <div class="cart-summary">
                                        <div class="cart-content">
                                            <!--                                            <h1>Cart Summary</h1>-->
                                            <p>Sub Total<span><fmt:formatNumber pattern="##,###,### ₫" value="${o.getTotalMoney()}"/></span></p>
                                            <p>Shipping Cost<span>0 ₫</span></p>
                                            <h2>Grand Total<span><fmt:formatNumber pattern="##,###,### ₫" value="${o.getTotalMoney()}"/></span></h2>
                                        </div>
                                        <div class="cart-btn">
                                            <a href="checkout.jsp"><button>Checkout</button></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Cart End -->

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

            <!--  Javascript -->
            <script>
                function minus(productId) {
                    $.ajax({
                        url: "/WebApplication3/process",
                        type: 'GET',
                        data: {
                            id: productId,
                            num: -1
                        },
                        success: function ()
                        {
                            
                        }

                    });
                }


        </script>

    </body>
</html>
