<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="./admin_template/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            /* Áp dụng kiểu cho phần tử chứa các liên kết phân trang */
            .paging {
                text-align: center;
                margin-top: 20px;
            }

            /* Áp dụng kiểu cho các liên kết trong phần tử chứa */
            .paging a {
                display: inline-block;
                padding: 5px 10px;
                margin: 0 5px;
                text-decoration: none;
                border: 1px solid #ccc;
                border-radius: 5px;
                color: #333;
                background-color: #fff;
            }

            /* Áp dụng kiểu khi di chuột qua liên kết */
            .paging a:hover {
                background-color: #f0f0f0;
            }
        </style>
    </head>

    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="home">Home</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!--             Navbar Search
                        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                            <div class="input-group">
                                <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..."
                                       aria-describedby="btnNavbarSearch" />
                                <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i
                                        class="fas fa-search"></i></button>
                            </div>
                        </form>-->
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                       aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <c:if test="${empty sessionScope.adminAcc}">
                            <c:if test="${empty sessionScope.adminAcc}">
                                <a href="login_2.jsp" class="dropdown-item">Login</a>
                            </c:if>
                        </c:if>
                        <c:if test="${not empty sessionScope.adminAcc}">
                            <li><a class="dropdown-item" href="#!">Settings</a></li>
                            <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                            <li><a class="dropdown-item" href="my-account.jsp">My Account</a></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li><a class="dropdown-item" href="logout">Logout</a></li>
                            </c:if>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="Dashboard">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <!--  -->
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="listp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                ManageProducts
                            </a>
                            <c:if test="${sessionScope.adminAcc.roleId == 1}">
                                <a class="nav-link" href="lista">
                                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                    ManageAdmin
                                </a>
                                <a class="nav-link" href="listuaccount">
                                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                    ManageCustomer
                                </a>
                            </c:if>                            
                            <a class="nav-link" href="listo">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                ManageOrders
                            </a>
                            <a class="nav-link" href="listnewsadmin?service=getAll">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                ManageNews
                            </a>
                            <a class="nav-link" href="discount-admin.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                ManageDiscount
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <img src="./admin_template/image/415810853_281859611198325_725167687048314184_n.png" alt="Logo">
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Discount</h1>
                        <c:if test="${not empty sessionScope.adminAcc}"></c:if>
                            <!-- Thêm nút ?? thêm s?n ph?m m?i -->
                            <div class="mb-4">
                                <a href="add-discount.jsp"><button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductModal">Add Discount</button></a>
                            </div>

                            <!-- Gi? ch? ?? thông báo ho?c c?nh báo -->
                            <div id="productNotifications"></div>
                        <c:if test="${empty sessionScope.adminAcc}">
                            <div class="card mb-4">
                                <div style="text-align: center" class="card-body">
                                    Chưa Login
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${not empty sessionScope.adminAcc}">


                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    Manage Discount
                                </div>
                                <!-- Navbar Search-->

                                <div class="table-responsive ">
                                    <h2 class="mb-4">Discount Management</h2>

                                    <table id="datatablesSimple">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Discount Code</th>
                                                <th>Name</th>
                                                <th>Percentage</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>                               
                                        <tbody>
                                            <jsp:useBean id="db" class="dal.DAO"></jsp:useBean>
                                            <c:set value="0" var="count"/>
                                            <c:forEach items="${db.allDiscount}" var="disList">
                                                <c:set value="${count + 1}" var="count"/>
                                                <tr>
                                                    <td>${count}</td>
                                                    <td>${disList.discountName}</td>  
                                                    <td>${disList.discountCode}</td> 
                                                    <td>${disList.discountPercentage}</td> 
                                                    <td>
                                                        <!--                                                        <a href=""><button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#addEditCustomerModal">Update</button></a>-->
                                                        <a href="discountServlet?disId=${disList.discountId}&action=delete"><button class="btn btn-danger btn-sm">Delete</button></a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </c:if>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script>
            function confirmDelete() {
                // Sử dụng hộp thoại confirm
                var result = confirm("Are you sure you want to delete?");

                // Nếu người dùng nhấn OK, chuyển hướng hoặc thực hiện hành động xóa
                if (result) {
                    // Thực hiện hành động xóa hoặc chuyển hướng đến trang xóa
                    // Ví dụ: window.location.href = "/delete";
                    // Hoặc gửi yêu cầu AJAX để xóa dữ liệu
                } else {
                    // Người dùng đã nhấn Cancel, không làm gì cả
                }
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
        <script src="admin_template/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
        <script src="admin_template/js/datatables-simple-demo.js"></script>
    </body>

</html>