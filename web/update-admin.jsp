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
        <script type="text/javascript">
            // JavaScript để hiển thị thông báo
            function showUnauthorizedMessage() {
                alert("Bạn không có quyền truy cập vào trang này.");
            }
        </script>
    </head>
    <c:if test="${sessionScope.adminAcc.roleId != 1}">
        <!-- Hiển thị thông báo khi không có quyền -->
        <script type="text/javascript">
            showUnauthorizedMessage();
        </script>

    </c:if>
    <c:if test="${sessionScope.adminAcc.roleId == 1}">
        <body class="sb-nav-fixed">
            <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
                <!-- Navbar Brand-->
                <a class="navbar-brand ps-3" href="../index.jsp">Home</a>
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
                                <a class="nav-link" href="./admin_template/index.jsp">
                                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                    Dashboard
                                </a>
                                <div class="sb-sidenav-menu-heading">Interface</div>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                   data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                    Layouts
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                                     data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="layout-static.jsp">Static Navigation</a>
                                        <a class="nav-link" href="layout-sidenav-light.jsp">Light Sidenav</a>
                                    </nav>
                                </div>


                                <div class="sb-sidenav-menu-heading">Addons</div>
                                <a class="nav-link" href="listp">
                                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                    ManageProducts
                                </a>

                                <a class="nav-link" href="lista">
                                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                    ManageAdmin
                                </a>
                                <a class="nav-link" href="listuaccount">
                                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                    ManageCustomer
                                </a>

                                <a class="nav-link" href="listo">
                                    <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                    ManageOrders
                                </a>
                                <a class="nav-link" href="charts.jsp">
                                    <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                    Charts
                                </a>

                            </div>
                        </div>
                        <div class="sb-sidenav-footer">
                            <img src="./image/415810853_281859611198325_725167687048314184_n.png" alt="Logo">
                        </div>
                    </nav>
                </div>
                <div id="layoutSidenav_content">
                    <main>
                        <div class="container-fluid px-4">
                            <h1 class="mt-4">Admin</h1>
                            <ol class="breadcrumb mb-4">
                                <li class="breadcrumb-item"><a href="index.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active">Admin</li>
                            </ol>

                            <!-- Thêm nút ?? thêm s?n ph?m m?i -->
                            <div class="mb-4">
                                <a href="add-products.jsp"><button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductModal">AddProduct</button></a>
                            </div>

                            <!-- Gi? ch? ?? thông báo ho?c c?nh báo -->
                            <div id="productNotifications"></div>

                            <div class="card mb-4">
                                <div class="card-body">
                                    DataTables is a third party plugin that is used to generate the demo table below. For more
                                    information about DataTables, please visit the
                                    <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                    .
                                </div>
                            </div>
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-table me-1"></i>
                                    DataTable Example
                                </div>
                                <div class="container mt-5">
                                    <h2 class="mb-4">Update Admin</h2>


                                    <c:set var="p" value="${requestScope.data}" />
                                    <form action="updatea" method="post">
                                        <div class="mb-3">
                                            <label for="categoryID" class="form-label">firstname</label>
                                            <input type="text" class="form-control" id="firstname" name="firstName" value="${p.firstname}" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="productName" class="form-label">lastname</label>
                                            <input type="text" class="form-control" id="lastname" name="lastname"  value="${p.lastname}" >
                                        </div>
                                        <div class="mb-3">
                                            <label for="capacity" class="form-label">username</label>
                                            <input type="text" class="form-control" id="username" name="username"  value="${p.username}" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="description" class="form-label">password</label>
                                            <input type="text" class="form-control" id="password" name="password"  value="${p.password}" required>
                                        </div>                                       
                                        <div class="mb-3">
                                        <select type="text" name="roleId" id="roleId" class="form-control" required>
                                            <option value="0">Role</option>
                                            <c:forEach items="${requestScope.role}" var="r"> 
                                                <option value="${r.roleId}" ${p.roleId == r.roleId ? 'selected' : ''}>${r.roleName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                        <div class="mb-3">
                                            <label for="price" class="form-label">email</label>
                                            <input type="text" class="form-control" id="email" name="email"  value="${p.email}" >
                                        </div>
                                        <div class="mb-3">
<!--                                            <label for="price" class="form-label">createdOn</label>-->
                                            <input type="hidden" class="form-control" id="createdOn" name="createdOn"  value="${p.createdOn}" readonly>
                                        </div>
                                        <!-- Add more fields for additional product information if needed -->
                                        <input type="hidden" name="adminID" value="${p.adminId}"/>
                                        <button type="submit" class="btn btn-primary">Save changes</button>
                                    </form>
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
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
            <script src="js/scripts.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
            crossorigin="anonymous"></script>
            <script src="js/datatables-simple-demo.js"></script>
        </body>
    </c:if>
</html>