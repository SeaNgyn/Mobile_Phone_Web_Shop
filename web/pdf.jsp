<%-- 
    Document   : receipt
    Created on : Feb 18, 2024, 10:11:14 PM
    Author     : acer
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set value="${requestScope.odID}" var="odID"/>
<c:set value="${sessionScope.customerAcc}" var="c"/>
<jsp:useBean id="db" class="dal.OrderDAO"></jsp:useBean>
<c:set value="${db.getProductDetailByOrderId(odID)}" var="odList"/> 
<jsp:useBean id="db2" class="dal.OrderDAO"></jsp:useBean>
<c:set value="${db2.getOrderByOid(odID)}" var="odDetail"/> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel='stylesheet' href='https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css'>
        <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js'></script>
        <style>
            body,
            * {
                color-adjust: exact !important;
                -webkit-print-color-adjust: exact !important;
                print-color-adjust: exact !important;
            }

            body{
                margin-top:20px;
                background-color:#eee;
            }

            .card {
                box-shadow: 0 20px 27px 0 rgb(0 0 0 / 5%);
            }
            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 0 solid rgba(0,0,0,.125);
                border-radius: 1rem;
            }

        </style>

    </head>
    <body>
        <a href="home">Back to home</a>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css" integrity="sha256-2XFplPlrFClt0bIdPgpz8H7ojnk10H69xRqd9+uTShA=" crossorigin="anonymous" />
        <div class="container" id="receipt-wrap">
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="invoice-title">
                                <h4 class="float-end font-size-15">Invoice #DS010${odDetail.orderID} <span class="badge bg-success font-size-12 ms-2">Paid</span></h4>
                                <div class="mb-4">
                                    <h2 class="mb-1 text-muted">PhoneStore</h2>
                                </div>
                                <div class="text-muted">
                                    <p class="mb-1">Hòa Lạc, Thạch Thất, Hà Nội</p>
                                    <p class="mb-1"><i class="uil uil-envelope-alt me-1"></i> Phonestore.com</p>
                                    <p><i class="uil uil-phone me-1"></i> (+84) 33 634 6789</p>
                                </div>
                            </div>

                            <hr class="my-4">

                            <div class="row">
                                <div class="col-sm-6">
                                    <div class="text-muted">
                                        <h5 class="font-size-16 mb-3">Billed To: ${c.fullName}</h5>
                                        <p class="mb-1">${c.address}</p>
                                        <p class="mb-1">${c.email}</p>
                                        <p>${c.phone}</p>
                                    </div>
                                </div>
                                <!-- end col -->
                                <div class="col-sm-6">
                                    <div class="text-muted text-sm-end">
                                        <div class="mt-4">
                                            <h5 class="font-size-15 mb-1">Invoice Date:</h5>
                                            <p><c:set var="dateString" value="${odDetail.createdOn}" />
                                                <fmt:parseDate value="${dateString}" pattern="yyyy-MM-dd" var="parsedDate" />
                                                <fmt:formatDate value="${parsedDate}" pattern="dd-MM-yyyy" var="formattedDate" />
                                                ${formattedDate}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <!-- end col -->
                            </div>
                            <!-- end row -->

                            <div class="py-2">
                                <h5 class="font-size-15">Order Summary</h5>

                                <div class="table-responsive">
                                    <table class="table align-middle table-nowrap table-centered mb-0">
                                        <thead>
                                            <tr>
                                                <th style="width: 70px;">No.</th>
                                                <th>Product</th>
                                                <th>Price</th>
                                                <th>Quantity</th>
                                                <th class="text-end" style="width: 120px;">Total</th>
                                            </tr>
                                        </thead><!-- end thead -->
                                        <tbody>
                                            <c:set value="0" var="t"/>
                                            <c:forEach items="${odList}" var="od">
                                                <c:set value="${t + 1}" var="t"/>
                                                <tr>
                                                    <th scope="row">${t}</th>
                                                    <td>
                                                        <div>
                                                            <h5 class="text-truncate font-size-14 mb-1">${od.name}</h5>
                                                            <p class="text-muted mb-0">${od.capacity}</p>
                                                        </div>
                                                    </td>
                                                    <td><fmt:formatNumber pattern="##,###,### ₫" value="${od.price}"/></td>
                                                    <td>${od.quantity}</td>
                                                    <td class="text-end"><fmt:formatNumber pattern="##,###,### ₫" value="${od.price * od.quantity}"/></td>
                                                </tr>
                                            </c:forEach>
                                            <!-- end tr -->
                                            <tr>
                                                <th scope="row" colspan="4" class="text-end">Sub Total</th>
                                                <td class="text-end"><fmt:formatNumber pattern="##,###,### ₫" value="${odDetail.totalPrice}"/></td>
                                            </tr>
                                            <tr>
                                                <th scope="row" colspan="4" class="border-0 text-end">
                                                    Shipping Charge :</th>
                                                <td class="border-0 text-end"><fmt:formatNumber pattern="##,###,### ₫" value="${odDetail.shipCost}"/></td>
                                            </tr>

                                            <tr>
                                                <th scope="row" colspan="4" class="border-0 text-end">
                                                    Discount :</th>
                                                <td class="border-0 text-end"> 
                                                    <c:if test="${odDetail.discountCost != 0}">
                                                        - <fmt:formatNumber pattern="##,###,### ₫" value="${odDetail.discountCost}"/>
                                                    </c:if>
                                                    <c:if test="${odDetail.discountCost == 0}">
                                                        - <fmt:formatNumber pattern="##,###,### ₫" value="${odDetail.discountCost}"/>
                                                    </c:if>
                                                </td>
                                            </tr>
                                            <!-- end tr -->
                                            <tr>
                                                <th scope="row" colspan="4" class="border-0 text-end">Total:</th>
                                                <td class="border-0 text-end"><h4 class="m-0 fw-semibold"><fmt:formatNumber pattern="##,###,### ₫" value="${odDetail.totalPrice - odDetail.discountCost}"/></h4></td>
                                            </tr>
                                            <!-- end tr -->
                                        </tbody><!-- end tbody -->
                                    </table><!-- end table -->
                                </div><!-- end table responsive -->

                            </div>
                        </div>
                    </div>
                </div><!-- end col -->

            </div>
            <div class="d-print-none mt-4">
                <div class="float-end">
                    <a href="javascript:window.print()" class="btn btn-success me-1"><i class="fa fa-print"></i></a>
                    <button id="btn-one" class="btn btn-success btn-lg">Download PDF (With Styles & Images / Same Page)</button>
                </div>
            </div>
        </div>


    </body>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>

    <script
        src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"
        integrity="sha512-BNaRQnYJYiPSqHHDb58B0yaPfCu+Wgds8Gp/gU33kqBtgNS4tSPHuGibyoeqMV/TJlSKda6FXzoEyYGjTe+vXA=="
        crossorigin="anonymous"
        referrerpolicy="no-referrer"
    ></script>
    <script>
        $(document).ready(function () {
            $('#btn-one').click(function () {
                html2canvas(document.querySelector('#receipt-wrap')).then((canvas) => {
                    let base64image = canvas.toDataURL('image/png');
                    // console.log(base64image);
                    let pdf = new jsPDF('p', 'px', [650, 536]);
                    pdf.addImage(base64image, 'PNG', 15, 15, 500, 500);
                    pdf.save('Invoice.pdf');
                });
            });
        });
    </script>
</html>