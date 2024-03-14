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
        <script src="<c:url value='/ckeditor/ckeditor.js' />"></script>
        <style>
            .container label {
                font-weight: bold;
                color: #007BFF;
                /* Thêm các thuộc tính CSS khác nếu cần thiết */
            }
        </style>
        <script type="text/javascript">
            // JavaScript để hiển thị thông báo
            function showUnauthorizedMessage() {
                alert("Bạn không có quyền truy cập vào trang này.");
            }
        </script>

    </head>
    <c:if test="${sessionScope.adminAcc.roleId != 1&& sessionScope.adminAcc.roleId != 2 && sessionScope.adminAcc.roleId != 3}">
        <!-- Hiển thị thông báo khi không có quyền -->
        <script type="text/javascript">
            showUnauthorizedMessage();
        </script>

    </c:if>
    <c:if test="${sessionScope.adminAcc.roleId >= 1}">
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
                            <li><a class="dropdown-item" href="logout">Logout</a></li>
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
                                <li class="breadcrumb-item"><a href="./admin_template/index.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active">Products</li>
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
                                    <h2 class="mb-4">Add Product</h2>
                                    <h3 style="color: red">${requestScope.error}</h3>
                                    <c:set var="p" value="${requestScope.pnew}" />
                                    <form action="addproduct" method="post" enctype="multipart/form-data">
                                        <div class="mb-3">
                                            <label class="control-label">Hãng điện thoại</label>
                                            <select type="text" name="category" id="categoryID" value="${p.categoryId}" class="form-control" required>
                                                <option value="1">Iphone</option>
                                                <option value="2">Samsung</option>
                                                <option value="3">Oppo</option>
                                                <option value="4">Xiaomi</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="productName" class="form-label">Tên sản phẩm</label>
                                            <input type="text" class="form-control" id="productName" name="productName" value="${p.name}" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="capacity" class="form-label">Dung lượng</label>
                                            <input type="number" class="form-control" id="capacity" name="capacity" value="${p.capacity}" required>
                                        </div>
                                        <div class="form-group col-md-12">
                                            <label class="control-label">Mô tả sản phẩm</label>
                                            <textarea class="form-control" rows="20" cols="20" name="describe" id="describe"  >${p.description}</textarea>
                                        </div>
                                        <div class="mb-3">
                                            <label for="quantity" class="form-label">Số lượng</label>
                                            <input type="number" class="form-control" id="quantity" name="quantity" value="${p.quantity}" required>
                                        </div>
                                        <div class="mb-3">
                                            <label for="price" class="form-label">Giá tiền</label>
                                            <input type="text" class="form-control" id="price" name="price" value="${p.price}" oninput="formatCurrency(this)" required>
                                            <!--                                        <input class="form-control" name="product_price" type="text" placeholder="" oninput="formatCurrency(this)">-->
                                        </div>
                                        <div class="mb-3">
                                            <label for="updateImg" class="form-label">Hình ảnh</label>
                                            <input type="file" class="form-control" id="image" name="image" placeholder="Enter image">
                                        </div>


                                        <!-- Add more fields for additional product information if needed -->

                                        <button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
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
            <script>
                var describe = '';
                $(document).ready(function () {
                    // Adjust CKEDITOR configuration to disable auto paragraphs
                    describe = CKEDITOR.replace('describe', {
                        autoParagraph: false
                    });
                });

                // Function to get cleaned HTML content
                function getCleanedHTML() {
                    return describe.getData();
                }


                function formatCurrency(input) {
                    // Remove non-numeric characters
                    let value = input.value.replace(/[^\d]/g, '');

                    // Format the value as Vietnamese Dong
                    value = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(value);

                    // Update the input value
                    input.value = value;
                }

            </script>                     

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
            <!--        <script src="js/scripts.js"></script>-->
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
            crossorigin="anonymous"></script>
            <!--        <script src="js/datatables-simple-demo.js"></script>-->
        </body>
    </c:if>
</html>



