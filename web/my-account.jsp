<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set value="${sessionScope.customerAcc}" var="c"/>
<c:set value="${sessionScope.adminAcc}" var="adminAcc"/>
<!DOCTYPE html>
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
        <jsp:useBean id="db1" class="dal.CustomerDAO"></jsp:useBean>
        <c:set value="${db1.getValueCustomer(c.customerId)}" var="cusDb"/> 
        <!-- Top bar Start -->
        <jsp:include page="header.jsp"></jsp:include>

            <!-- Bottom Bar End --> 

            <!-- Breadcrumb Start -->
            <div class="breadcrumb-wrap">
                <div class="container-fluid">
                    <ul class="breadcrumb">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Products</a></li>
                        <li class="breadcrumb-item active">My Account</li>
                    </ul>
                </div>
            </div>
            <!-- Breadcrumb End -->

            <!-- My Account Start -->
            <div class="my-account">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="nav flex-column nav-pills" role="tablist" aria-orientation="vertical">
                                <a class="nav-link" id="orders-nav" data-toggle="pill" href="#orders-tab" role="tab"><i class="fa fa-shopping-bag"></i>Orders</a>
                                <!--                                <a class="nav-link" id="payment-nav" data-toggle="pill" href="#payment-tab" role="tab"><i class="fa fa-credit-card"></i>Payment Method</a>-->
                                <!--                                <a class="nav-link" id="address-nav" data-toggle="pill" href="#address-tab" role="tab"><i class="fa fa-map-marker-alt"></i>address</a>-->
                                <a class="nav-link" id="account-nav" data-toggle="pill" href="#account-tab" role="tab"><i class="fa fa-user"></i>Account Details</a>
                                <a class="nav-link" href="logout"><i class="fa fa-sign-out-alt"></i>Logout</a>
                            </div>
                        </div>
                        <div class="col-md-9">
                            <div class="tab-content" style="color: #353535">
                                <div class="tab-pane fade show active" id="dashboard-tab" role="tabpanel" aria-labelledby="dashboard-nav">
                                    <h4 style="text-align: center; font-weight: bold;">Tài Khoản của bạn</h4>
                                    <!--                                <p>
                                                                        asd
                                                                    </p> -->
                                </div>
                                <div class="tab-pane fade" id="orders-tab" role="tabpanel" aria-labelledby="orders-nav">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" >
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th>No</th>
                                                    <!--                                                <th>Product</th>-->
                                                    <th>Date</th>
                                                    <th>Price</th>
                                                    <th>Status</th>
                                                    <th>Download</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                        <jsp:useBean id="db" class="dal.OrderDAO"></jsp:useBean>
                                        <c:set value="${db.getAllOrderByCid(c.customerId)}" var="listOrder"/> 

                                        <tbody>
                                            <c:set value="${0}" var="cnt"/>
                                            <c:forEach items="${listOrder}" var="od">
                                                <c:set value="${cnt + 1}" var="cnt"/>    
                                                <tr>
                                                    <td>${cnt}</td>
                                                    <td>
                                                        <c:set var="dateString" value="${od.createdOn}" />
                                                        <fmt:parseDate value="${dateString}" pattern="yyyy-MM-dd" var="parsedDate" />
                                                        <fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy" var="formattedDate" />
                                                        ${formattedDate}
                                                    </td>
                                                    <td><fmt:formatNumber pattern="##,###,### ₫" value="${od.totalPrice}"/></td>
                                                    <td style="color: ${od.status == 'Delivered'? 'Green': od.status == 'Cancel' ? 'red' : 'khaki'}; font-weight: bold">
                                                        ${od.status}
                                                    </td>
                                                    <td>
                                                        <a class="btn   " href="excel?oid_raw=${od.orderID}">Excel</a>
                                                        <a class="btn" href="pdfservlet?oid_raw=${od.orderID}">PDF</a>
                                                    </td>
                                                    <td><a href="deleteorderinmyacc?oid_raw=${od.orderID}"><i class="fas fa-trash"></i></a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="payment-tab" role="tabpanel" aria-labelledby="payment-nav">
                                <h4>Payment Method</h4>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. In condimentum quam ac mi viverra dictum. In efficitur ipsum diam, at dignissim lorem tempor in. Vivamus tempor hendrerit finibus. Nulla tristique viverra nisl, sit amet bibendum ante suscipit non. Praesent in faucibus tellus, sed gravida lacus. Vivamus eu diam eros. Aliquam et sapien eget arcu rhoncus scelerisque.
                                </p> 
                            </div>
                            <div class="tab-pane fade" id="address-tab" role="tabpanel" aria-labelledby="address-nav">
                                <h4>Address</h4>
                                <div class="row">
                                    <div class="col-md-6">
                                        <h5>Payment Address</h5>
                                        <p>123 Payment Street, Los Angeles, CA</p>
                                        <p>Mobile: 012-345-6789</p>
                                        <button class="btn">Edit Address</button>
                                    </div>
                                    <div class="col-md-6">
                                        <h5>Shipping Address</h5>
                                        <p>123 Shipping Street, Los Angeles, CA</p>
                                        <p>Mobile: 012-345-6789</p>
                                        <button class="btn">Edit Address</button>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="account-tab" role="tabpanel" aria-labelledby="account-nav">
                                <h4>Account Details</h4>
                                <form action="updatemyaccount" method="get">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <input style="color: black" class="form-control" name="name_raw" type="text" placeholder="Full Name" value="${not empty cusDb.fullName ? cusDb.fullName : adminAcc.firstname}">
                                        </div>
                                        <div class="col-md-6">
                                            <input style="color: black" class="form-control" name="phonenumber_raw" type="text" placeholder="Mobile" value="${not empty cusDb.phone ? cusDb.phone : "0983742321"}">
                                        </div>
                                        <div class="col-md-6">
                                            <input style="color: black" class="form-control" name="email_raw" type="text" placeholder="Email" value="${not empty cusDb.email ? cusDb.email : adminAcc.email}">
                                        </div>
                                        <div class="col-md-12">
                                            <input class="form-control" readonly type="text" placeholder="Address" value="${cusDb.address}">
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="city">Tỉnh / Thành Phố</label>
                                                <select name="city" id="city" class="form-control box-location"  onchange="updateDestinationAddress()" required>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="district">Quận/ Huyện</label>
                                                <select name="district" id="district" class="form-control box-location"  onchange="updateDestinationAddress()" required >
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="ward">Phường/Xã</label>
                                                <select name="ward" id="ward" class="form-control box-location"  onchange="updateDestinationAddress()" required>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <button class="btn">Update Account</button>
                                            <br><br>
                                        </div>
                                </form>
                            </div>
                            <form action="changepass" method="post">
                                <div class="row">
                                    <div class="col-md-12">
                                        <input class="form-control" name="cur_pass"type="password" placeholder="Current Password">
                                    </div>
                                    <div class="col-md-6">
                                        <input class="form-control" name="new_pass"type="password" placeholder="New Password">
                                    </div>
                                    <div class="col-md-6">
                                        <input class="form-control" name="conf_pass"type="password" placeholder="Confirm Password">
                                    </div>
                                    <div class="col-md-12">
                                        <button class="btn">Save Changes</button>
                                    </div>
                                    <c:if test="${errorPass != null}">
                                        <script style="color: red">
                                            alert("${requestScope.errorPass}");
                                        </script>
                                    </c:if>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- My Account End -->

<!-- Footer Start -->
<jsp:include page="footer.jsp"></jsp:include>

<!-- Footer Bottom End -->       

<!-- Back to Top -->
<a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>

<!-- JavaScript Libraries -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script src="lib/easing/easing.min.js"></script>
<script src="lib/slick/slick.min.js"></script>

<!-- Template Javascript -->
<script src="js/main.js"></script>
<script>
                                                    //API address
                                                    const host = "https://vietnamese-administration.vercel.app/city";
                                                    const hostDistricts = "https://vietnamese-administration.vercel.app/district?cityId=";
                                                    const hostWards = "https://vietnamese-administration.vercel.app/ward?districtId=";
                                                    var callAPIProvinces = (api) => {
                                                        fetch(api)
                                                                .then((response) => {
                                                                    return response.json();
                                                                })
                                                                .then((data) => {
                                                                    renderProvince(data, "city");
                                                                });
                                                    };
                                                    callAPIProvinces(host);

                                                    var callApiDistrict = (api) => {
                                                        return fetch(api)
                                                                .then((response) => {
                                                                    return response.json();
                                                                })
                                                                .then((data) => {
                                                                    renderDistrict(data, "district");
                                                                    console.log(data);
                                                                });
                                                    };

                                                    var callApiWard = (api) => {
                                                        return fetch(api)
                                                                .then((response) => {
                                                                    return response.json();
                                                                })
                                                                .then((data) => {
                                                                    renderWard(data, "ward");
                                                                    console.log(data);
                                                                });
                                                    };

                                                    var renderProvince = function (data, select) {
                                                        let options = '<option value="" selected>Chọn tỉnh thành</option>';
                                                        data.forEach(element => {
                                                            options += '<option value="' + element.name + '" data-id="' + element.cityId + '">' + element.name + '</option>';
                                                        });
                                                        document.querySelector("#" + select).innerHTML = options;
                                                    };

                                                    var renderDistrict = function (data, select) {
                                                        let options = '<option value="" selected>Chọn quận huyện</option>';
                                                        data.forEach(element => {
                                                            options += '<option value="' + element.name + '" data-id="' + element.districtId + '">' + element.name + '</option>';
                                                        });
                                                        document.querySelector("#" + select).innerHTML = options;
                                                    };

                                                    var renderWard = function (data, select) {
                                                        let options = '<option value="" selected>Chọn phường xã</option>';
                                                        data.forEach(element => {
                                                            options += '<option value="' + element.name + '" data-id="' + element.wardId + '">' + element.name + '</option>';
                                                        });
                                                        document.querySelector("#" + select).innerHTML = options;
                                                    };



                                                    $('#city').change(() => {
                                                        callApiDistrict(hostDistricts + $("#city").find(':selected').data('id'));
                                                    });

                                                    $('#district').change(() => {
                                                        callApiWard(hostWards + $("#district").find(':selected').data('id'));
                                                    });

</script>
</body>
</html>
