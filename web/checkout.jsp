<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <!-- Top bar Start -->
        <jsp:include page="header.jsp"></jsp:include>
        <c:set value="${sessionScope.customerAcc}" var="c"/>
        <c:set value="${sessionScope.adminAcc}" var="adminAcc"/>
        <c:set value="${requestScope.user}" var="cusAcc"/>
        <c:set value="${requestScope.pass}" var="cusPass"/>
        <c:set value="${requestScope.email}" var="cusEmail"/>
        <c:set value="${requestScope.addN}" var="cusAddress"/>
        <c:set value="${requestScope.phoneN}" var="cusPhone"/>
        <c:set value="${requestScope.nameN}" var="cusName"/>
        <c:set value="${requestScope.radio_box}" var="radioBox"/>
        <c:set value="${requestScope.accNotExist}" var="cusNot"/>
        <c:set value="${requestScope.shipCost}" var="shipCost"/>
        <c:set value="${requestScope.discountCost}" var="discountCost"/>
        <c:set value="${sessionScope.codeId}" var="codeId"/>
        <jsp:useBean id="db" class="dal.CustomerDAO"></jsp:useBean>
        <c:set value="${db.getValueCustomer(c.customerId)}" var="cusDb"/> 
        <jsp:useBean id="db5" class="dal.DAO"></jsp:useBean>
        <c:set value="${db5.allDiscount}" var="ListDiscount"/> 
        <!-- Bottom Bar End --> 
        <!-- Breadcrumb Start -->
        <div class="breadcrumb-wrap">
            <div class="container-fluid">
                <ul class="breadcrumb">
                    <li class="breadcrumb-item"><a href="home">Home</a></li>
                    <li class="breadcrumb-item"><a href="search">Products</a></li>
                    <li class="breadcrumb-item active">Checkout</li>
                </ul>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Checkout Start -->
        <div class="checkout">
            <div class="container-fluid"> 
                <form action="checkout" method="post"> 
                    <div class="row">
                        <div class="col-lg-8">
                            <div class="checkout-inner">
                                <div class="billing-address">
                                    <h2>Billing Address</h2>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Full Name</label>
                                            <input required style="color: black" name="name_raw" class="form-control" type="text" placeholder="First Name" value="${cusDb.fullName}">
                                        </div>
                                        <div class="col-md-6">
                                            <label>E-mail</label>
                                            <input style="color: black" name="email_raw" class="form-control" type="email" placeholder="E-mail" value="${cusDb.email}">
                                        </div>
                                        <div class="col-md-12">
                                            <label>Phone Number</label>
                                            <input required style="color: black" name="phonenumber_raw" class="form-control" type="number" placeholder="Mobile No" value="${cusDb.phone}">
                                        </div>
                                        <!--                                        <div class="col-md-12">
                                                                                    <label>Address</label>
                                                                                    <input required style="color: black" name="address" class="form-control" type="text" placeholder="Address" value="${cusDb.address}">
                                                                                </div>-->

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="city">Tỉnh / Thành Phố</label>
                                                <select name="city" id="city" class="form-control box-location"  onchange="funtioncToProcess()" required>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="district">Quận/ Huyện</label>
                                                <select name="district" id="district" class="form-control box-location"  onchange="funtioncToProcess()" required >
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="form-group">
                                                <label for="ward">Phường/Xã</label>
                                                <select name="ward" id="ward" class="form-control box-location"  onchange="funtioncToProcess()" required>
                                                </select>
                                            </div>
                                        </div>

                                        <!--                                        <div class="col-md-6">
                                                                                    <label>Country</label>
                                                                                    <select class="custom-select">
                                                                                        <option selected>United States</option>
                                                                                        <option>Afghanistan</option>
                                                                                        <option>Albania</option>
                                                                                        <option>Algeria</option>
                                                                                    </select>
                                                                                </div>-->





                                    </div>
                                </div>
                            </div>
                        </div>
                        <c:set value="${sessionScope.cart}" var="o"/>                        
                        <div class="col-lg-4">
                            <div class="checkout-inner">
                                <div class="coupon-container" style="display: none" id="couponInput_display">
                                    <div class="coupon">
                                        <input class="coupon-input" id="couponInput" type="text" placeholder="Mã giảm giá">
                                    </div>
                                </div>

                                <div class="checkout-summary">
                                    <h1>Cart Total</h1>
                                    <p class="sub-total">Sub Total<span id="sub-total-format"><fmt:formatNumber pattern="##,###,### ₫" value="${o.getTotalMoney()}"/></span></p>
                                    <p class="#">Shipping Cost<span id="shippingFeeResult">0 ₫</span></p>
                                    <h2>Grand Total<span id="allFeeResult"><fmt:formatNumber pattern="##,###,### ₫" value="${o.getTotalMoney()}"/></span></h2>
                                    <input type="hidden" name="grandTotal" id="totalMoneyInput" value="${o.getTotalMoney()}">
                                    <input type="hidden" name="shipCost" id="shipCost" value="">
                                    <input type="hidden" name="discountCost" id="discountCost" value="">
                                </div>

                                <div class="checkout-payment">
                                    <div class="payment-methods" id="payment-methods-id" style="display: none">
                                        <h1>Payment Methods</h1>
                                        <div class="payment-method">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" class="custom-control-input" required value="cod" id="payment-3" name="payment-radio">
                                                <label class="custom-control-label" for="payment-3">Thanh toán khi nhận hàng (COD)</label>
                                            </div>
                                            <div class="payment-content" id="payment-3-show">
                                            </div>
                                        </div>
                                        <div class="payment-method">
                                            <div class="custom-control custom-radio">
                                                <input type="radio" value="vnpay" class="custom-control-input" id="payment-4" name="payment-radio">
                                                <label class="custom-control-label" for="payment-4">VNPAY</label>
                                            </div>
                                            <div class="payment-content" id="payment-4-show">
                                                <!--                                                <p>
                                                                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras tincidunt orci ac eros volutpat maximus lacinia quis diam.
                                                                                                </p>-->
                                            </div>
                                        </div>
                                    </div>

                                    <div class="checkout-btn" id="place-order" style="display: none">
                                        <button type="submit" onclick="submit_order()">Đặt hàng</button>
                                    </div>
                                    <div class="checkout-btn" id="shopping-continue" style="display: none">
                                        <a href="search" style="font-weight: bold">Click to shopping</a>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <form id="checkoutForm" action="checkout" method="post">
            <input type="hidden" name="name_raw" value="${cusName}">
            <input type="hidden" name="email_raw" value="${cusEmail}">
            <input type="hidden" name="phonenumber_raw" value="${cusPhone}">
            <input type="hidden" name="address" value="${cusAddress}">
            <input type="hidden" name="payment-radio" value="${radio_box}">
            <input type="hidden" name="shipCost" id="shipCost" value="${shipCost}">
            <input type="hidden" name="discountCost" id="discountCost" value="${discountCost}">
        </form>
        <!-- Checkout End -->

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
                                            // Lấy tham chiếu đến ô input
                                            var couponInput = document.getElementById('couponInput');

//---------------------------------------------------------------------------------------------------------------------------------------------                
                                            var originAddress = 'Thạch Hoà, Thạch Thất, Hà Nội, Việt Nam';

                                            function funtioncToProcess() {
                                                var city = document.getElementById('city').value;
                                                var district = document.getElementById('district').value;
                                                var ward = document.getElementById('ward').value;
                                                var destinationAddress = ward + ', ' + district + ', ' + city;
                                                if (city !== "" && district !== "" && ward !== "") {
                                                    document.getElementById("couponInput_display").style.display = 'block';
                                                } else {
                                                    couponInput.addEventListener('change', function () {
                                                        var code = this.value;
                                                        for (var i = 0; i < ${ListDiscount.size()}; i++) {
                                                            var codeDis = '${ListDiscount.get(i).discountCode}';
                                                            if (code === codeDis) {
                                                                calculateDistanceBetweenAddresses(originAddress, destinationAddress, ${ListDiscount.get(i).discountPercentage});
                                                                break;
                                                            }
                                                        }
                                                    });
                                                    calculateDistanceBetweenAddresses(originAddress, destinationAddress, 1, 0);
                                                }

                                            }

                                            function geocodeAddress(address, callback) {
                                                // Make a request to the Nominatim API for geocoding
                                                $.ajax({
                                                    url: '<c:url value="https://nominatim.openstreetmap.org/search?format=json&q="/>' + encodeURIComponent(address),
                                                    type: 'GET',
                                                    dataType: 'json',
                                                    success: function (data) {
                                                        if (data.length > 0) {
                                                            const coordinates = {
                                                                lat: parseFloat(data[0].lat),
                                                                lon: parseFloat(data[0].lon)
                                                            };
                                                            callback(coordinates);
                                                        } else {
                                                            console.error('Geocoding failed. No coordinates found for the address:', address);
                                                        }
                                                    },
                                                    error: function (error) {
                                                        console.error('Error during geocoding request:', error);
                                                    }
                                                });
                                            }

                                            function calculateHaversineDistance(lat1, lon1, lat2, lon2) {
                                                const earthRadius = 6563; // Radius of the Earth in kilometers

                                                // Convert latitude and longitude from degrees to radians
                                                const radLat1 = toRadians(lat1);
                                                const radLon1 = toRadians(lon1);
                                                const radLat2 = toRadians(lat2);
                                                const radLon2 = toRadians(lon2);

                                                // Calculate the differences
                                                const deltaLat = radLat2 - radLat1;
                                                const deltaLon = radLon2 - radLon1;

                                                // Haversine formula
                                                const a = Math.sin(deltaLat / 2) * Math.sin(deltaLat / 2) +
                                                        Math.cos(radLat1) * Math.cos(radLat2) *
                                                        Math.sin(deltaLon / 2) * Math.sin(deltaLon / 2);

                                                const c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

                                                // Calculate the distance
                                                const distance = earthRadius * c;

                                                return distance;
                                            }

                                            function toRadians(degrees) {
                                                return degrees * (Math.PI / 180);
                                            }

                                            function calculateShippingFee(distance) {
                                                if (distance < 5) {
                                                    return 0;
                                                } else if (distance >= 5 && distance < 10) {
                                                    return 30000;
                                                } else if (distance >= 30 && distance < 100) {
                                                    return 50000;
                                                } else
                                                {
                                                    return distance.toFixed(2) * 2000;
                                                }
                                            }

                                            function calculateDistanceBetweenAddresses(address1, address2, discount) {
                                                geocodeAddress(address1, function (coordinates1) {
                                                    geocodeAddress(address2, function (coordinates2) {
                                                        const distance = calculateHaversineDistance(
                                                                coordinates1.lat, coordinates1.lon,
                                                                coordinates2.lat, coordinates2.lon
                                                                );

                                                        console.log('Distance:', distance.toFixed(2), 'km');

                                                        // Calculate shipping fee
                                                        const shippingFee = calculateShippingFee(distance); //277940
                                                        const total = ${o.getTotalMoney()}; //2390000
                                                        let allFee = total + shippingFee;
                                                        let allFeeBefore = allFee;
                                                        let discountMoney = 0;
                                                        if (discount !== 1) {
                                                            allFee = allFeeBefore - (allFeeBefore * discount);
                                                            discountMoney = allFeeBefore * discount;
                                                        }
                                                        console.log('Shipping Cost:', shippingFee.toFixed(2));
                                                        console.log('Shipping Cost:', allFee);
                                                        console.log('Shipping Cost:', discount);
                                                        console.log('discount Cost:', discountMoney);
                                                        // Update the HTML elements displaying the results
                                                        $("#shippingFeeResult").text(shippingFee.toLocaleString('vi-VN', {style: 'currency', currency: 'Vnd'}));
                                                        $("#allFeeResult").text(allFee.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'}));
                                                        document.getElementById('shipCost').value = shippingFee;
                                                        document.getElementById('discountCost').value = discountMoney;
                                                        
                                                    });
                                                });
                                            }
//API address--------------------------------------------------------------------------------------------------------------------------------
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



//-----------------------------------------------------------------------------------------------------------------------------
                                            if (${o.getTotalMoney() == 0.0 || empty o.getTotalMoney() || adminAcc != null}) {
                                                document.getElementById("shopping-continue").style.display = 'block';
                                            } else {
                                                document.getElementById("place-order").style.display = 'block';
                                                document.getElementById("payment-methods-id").style.display = 'block';
                                            }
                                            if ('${cusAcc}' !== '' && '${cusPass}' !== '') {
                                                Swal.fire({
                                                    title: "Bạn chưa đăng nhập để đặt hàng",
                                                    text: "Có tồn tại tài khoản với Email: ${cusEmail} bạn muốn dùng để đăng nhập đặt hàng không?",
                                                    icon: "warning",
                                                    showCancelButton: true,
                                                    confirmButtonColor: "#3085d6",
                                                    cancelButtonColor: "#d33",
                                                    confirmButtonText: "Có"
                                                }).then((result) => {
                                                    if (result.isConfirmed) {
                                                        $.ajax({
                                                            url: "/WebApplication3/sendmail",
                                                            type: 'POST',
                                                            data: {
                                                                code: '${codeId}',
                                                                cusEmail: '${cusEmail}',
                                                                cusAcc: '${cusAcc}',
                                                                cusPass: '${cusPass}',
                                                                shipcost: '${shipCost}',
                                                                radio_box: '${radio_box}',
                                                                discountCost: '${discountCost}'
                                                            }
                                                        });
                                                        Swal.fire({
                                                            title: "Gửi yêu cầu xác thực thành công",
                                                            text: "Vui lòng kiểm tra Email để xác thực",
                                                            icon: "success",
                                                            input: 'text',
                                                            inputPlaceholder: 'Nhập mã xác thực',
                                                            showCancelButton: true,
                                                            confirmButtonText: 'Xác thực',
                                                            cancelButtonText: 'Hủy'
                                                        }).then((result) => {
                                                            if (result.isConfirmed) {
                                                                var userEmail = result.value;
                                                                //console.log(userEmail);
                                                                console.log('${codeId}');
                                                                if ('${codeId}' === userEmail) {
                                                                    console.log("xac thuc thanh cong");
                                                                    console.log('${cusAcc}');
                                                                    console.log('${cusPass}');
                                                                    $.ajax({
                                                                        url: "/WebApplication3/login",
                                                                        type: 'GET',
                                                                        data: {
                                                                            username: '${cusAcc}',
                                                                            password: '${cusPass}'
                                                                        },
                                                                        success: function ()
                                                                        {
                                                                            console.log('passsss');
                                                                            console.log('${radio_box}');
                                                                            console.log('${shipCost}');
                                                                            console.log('${cusAddress}');
                                                                            document.getElementById("checkoutForm").submit();
                                                                        }
                                                                    });

                                                                } else {
                                                                    Swal.fire({
                                                                        icon: "error",
                                                                        title: "Xác thực không thành công",
                                                                        text: ""
                                                                    });
                                                                }
                                                            } else {

                                                            }
                                                        });
                                                    }
                                                });
                                            } else if ('${cusNot}' !== '') {
                                                Swal.fire({
                                                    icon: 'warning',
                                                    title: 'Chưa đăng nhập để đặt hàng',
                                                    text: 'Bạn muốn dùng Email: ${cusEmail} để đăng kí tài khoản để đặt hàng không?',
                                                    confirmButtonText: 'Có',
                                                    showCancelButton: true,
                                                    cancelButtonText: 'Không'
                                                }).then((result) => {
                                                    if (result.isConfirmed) {
                                                        $.ajax({
                                                            url: "/WebApplication3/sendmail",
                                                            type: 'POST',
                                                            data: {
                                                                code: '${codeId}',
                                                                cusEmail: '${cusEmail}'
                                                            }
                                                        });
                                                        Swal.fire({
                                                            title: "Gửi yêu cầu xác thực thành công",
                                                            text: "Vui lòng kiểm tra Email để xác thực",
                                                            icon: "success",
                                                            input: 'text',
                                                            inputPlaceholder: 'Nhập mã xác thực',
                                                            showCancelButton: true,
                                                            confirmButtonText: 'Xác thực',
                                                            cancelButtonText: 'Hủy'
                                                        }).then((result) => {
                                                            if (result.isConfirmed) {
                                                                var userEmail = result.value;
                                                                console.log(userEmail);
                                                                console.log('${codeId}');
                                                                if ('${codeId}' === userEmail) {
                                                                    console.log("xac thuc thanh cong");
                                                                    $.ajax({
                                                                        url: "/WebApplication3/register",
                                                                        type: 'post',
                                                                        data: {
                                                                            username1: '${cusEmail}',
                                                                            checkRegister: 'create-new'
                                                                        },
                                                                        success: function (data)
                                                                        {
                                                                            console.log(data);
                                                                            Swal.fire({
                                                                                position: "top-center",
                                                                                icon: "success",
                                                                                title: "Cảm ơn bạn đã đăng kí tài khoản, đơn hàng đã được đặt",
                                                                                text: "Tài khoản của bạn: " + data,
                                                                                confirmButtonText: "OK"
                                                                            }).then((result) => {
                                                                                /* Read more about isConfirmed, isDenied below */
                                                                                if (result.isConfirmed) {
                                                                                    $.ajax({
                                                                                        url: "/WebApplication3/sendmail",
                                                                                        type: 'POST',
                                                                                        data: {
                                                                                            registerSuccess: 'successRegister',
                                                                                            dataAccount: data,
                                                                                            cusEmail: '${cusEmail}'
                                                                                        }
                                                                                    });
                                                                                    $.ajax({
                                                                                        url: "/WebApplication3/login",
                                                                                        type: 'post',
                                                                                        data: {
                                                                                            dataMail: data
                                                                                        },
                                                                                        success: function ()
                                                                                        {
                                                                                            document.getElementById("checkoutForm").submit();
                                                                                        }
                                                                                    });
                                                                                }
                                                                            });
                                                                        }
                                                                    });
                                                                } else {
                                                                    Swal.fire({
                                                                        icon: "error",
                                                                        title: "Xác thực không thành công",
                                                                        text: ""
                                                                    });
                                                                }
                                                            }
                                                        });
                                                    }
                                                });
                                            }
        </script>
    </body>
</html>
