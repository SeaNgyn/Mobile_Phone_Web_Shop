<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
            .action-buttons {
                display: flex;
                justify-content: space-between;
                width: 150px; /* Điều chỉnh chiều rộng của cột Action */
            }

            .action-buttons a {
                padding: 5px 10px;
                margin: 0 5px;
                text-decoration: none;
                color: #fff;
                border-radius: 4px;
            }

            .view-button {
                background-color: #4CAF50; /* Màu xanh lá cây */
            }

            .edit-button {
                background-color: #2196F3; /* Màu xanh dương */
            }

            .delete-button {
                background-color: #f44336; /* Màu đỏ */
            }
        </style>
    </head>

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
                        <img src="img/logo_1.png" alt="Logo">
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Orders</h1>
                        <div id="productNotifications"></div>

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable
                            </div>
                            <div class="container mt-5">
                                <h2>Order Management</h2>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>OrderID</th>
                                            <th>CutomerName</th>
                                            <th>TotalPrice</th>
                                            <th>Address</th>
                                            <th>CreatedOn</th>
                                            <th>Status</th>
                                            <th>ShipCost</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="content-order">
                                        <c:forEach items="${requestScope.data}" var="p">  
                                            <tr>
                                                <td>${p.orderID}</td>
                                                <td>${p.cutomerName}</td>
                                                <td><fmt:formatNumber pattern="##,###,### Vnđ" value="${p.totalPrice}"/></td>
                                                <td>${p.address}</td>
                                                <td>${p.createdOn}</td>
                                                <td style="color: ${p.status == 'Delivered'? 'Green': p.status == 'Cancel' ? 'red' : 'khaki'}; font-weight: bold">${p.status}</td>
                                                <td>${p.shipCost}</td>
                                                <td class="">
                                                    <a href="statusorder?action=accept&orderId=${p.orderID}" class="m-1 btn btn-primary edit-button">Mark as shipped</a>
                                                    <a href="statusorder?action=beingtransport&orderId=${p.orderID}" class="m-1 btn btn-warning">Being transported</a> 
                                                    <a href="statusorder?action=delete&orderId=${p.orderID}" onclick="return confirm('Bạn có chắc muốn hủy đơn hàng này?')" class="btn btn-danger">Cancel Order</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
        <script src="./admin_template/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
        <script src="./admin_template/js/datatables-simple-demo.js"></script>
        <!--  Javascript --> 


    </body>

</html>