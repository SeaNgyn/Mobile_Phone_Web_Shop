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
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

        <style>
            .container label {
                font-weight: bold;
                color: #007BFF;
                /* Thêm các thuộc tính CSS khác nếu cần thiết */
            }
            /* Thêm đoạn CSS sau vào phần style của bạn */


            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;

            }

            header {
                text-align: center;
                background-color: #333;
                color: #fff;
                padding: 10px;
            }

            section {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-around;
                padding: 20px;
            }

            .product {
                width: 250px;
                margin: 20px;
                background-color: #fff;
                border: 1px solid #ddd;
                padding: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease-in-out;
            }

            .product:hover {
                transform: scale(1.05);
            }

            .product img {
                max-width: 100%;
                height: auto;
            }

            .product-info {
                text-align: center;
            }

            h3 {
                margin: 10px 0;
                color: #333;
            }

            p {
                margin: 5px 0;
                color: #666;
            }
            .table th, .table td {
                color: #333; /* Đổi màu chữ cho cột và ô trong bảng */
            }
            a {
                color: #007BFF; /* Đổi màu chữ cho các liên kết */
            }

            a:hover {
                color: #0056b3; /* Đổi màu chữ khi rê chuột qua liên kết */
            }


        </style>

    </style>


</head>
<c:if test="${sessionScope.adminAcc.roleId != 1&& sessionScope.adminAcc.roleId != 2 && sessionScope.adminAcc.roleId != 3}">
    <!-- Hiển thị thông báo khi không có quyền -->
    <script type="text/javascript">
        showUnauthorizedMessage();
    </script>

</c:if>


<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="home">Home</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="input-group">
                <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..."
                       aria-describedby="btnNavbarSearch" />
                <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i
                        class="fas fa-search"></i></button>
            </div>
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                   aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#!">Settings</a></li>
                    <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                    <li>
                        <hr class="dropdown-divider" />
                    </li>
                    <li><a class="dropdown-item" href="#!">Logout</a></li>
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
                    <h1 class="mt-4">Products</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                        <li class="breadcrumb-item active">Products</li>
                    </ol>


                    <c:set var="p" value="${requestScope.product}" />

                    <!-- Gi? ch? ?? thông báo ho?c c?nh báo -->

                    <header style="text-align: center;">
                        <h1 style="margin: 0;">Top 5 Sản phẩm bán chạy</h1>

                    </header>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>Tên sản phẩm</th>
                                <th>Dung lượng</th>
                                <th>Hình ảnh</th>
                                <th>Tổng số lượng bán được</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set value="0" var="count"></c:set>
                            <c:forEach items="${requestScope.productTop}" var="p">
                                <c:set value="${count + 1}" var="count"></c:set>
                                    <tr>
                                        <td>${count}</td>
                                    <td>${p.name}</td>
                                    <td>${p.capacity}</td>
                                    <td><img width="40px" src="img2/${p.image.imagePath}"></td>
                                    <td>${p.totalSales}</td>
                                </tr>
                            </c:forEach> 
                        </tbody>
                    </table>             

                </div>
            </main>

        </div>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
    <script src="admin_template/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
    crossorigin="anonymous"></script>
    <script src="admin_template/js/datatables-simple-demo.js"></script>
</body>

</html>



