<%-- 
    Document   : update-products
    Created on : Jan 13, 2024, 8:49:31 AM
    Author     : nobod
--%>

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
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    </head>

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
                        <!-- Thêm nút ?? thêm s?n ph?m m?i -->
                        <div class="mb-4">
                            <a href="add-products.jsp"><button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addProductModal">AddProduct</button></a>
                        </div>

                        <!-- Gi? ch? ?? thông báo ho?c c?nh báo -->
                        <div id="productNotifications"></div>

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Update Product
                            </div>
                            <div class="container mt-5">
                                <h2 class="mb-4">Update Product</h2>

                                <h3 style="color: red">${requestScope.error}</h3>
                                <c:set var="p" value="${requestScope.data}" />

                                <form id="myForm" action="updatep" method="post" enctype="multipart/form-data">

                                    <div class="mb-3">
                                        <label for="updateCategoryID" class="form-label">Product ID</label>
                                        <input type="text" class="form-control" id="updateCategoryID" name="productID" value="${p.productId}" readonly>
                                    </div>                     
                                    <div class="mb-3">
                                        <select type="text" name="categoryID" id="categoryID" class="form-control" required>
                                            <option value="0">Brand</option>
                                            <c:forEach items="${requestScope.ca}" var="c"> 
                                                <option value="${p.categoryId}" ${p.categoryId == c.categoryId ? 'selected' : ''}>${c.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                    <div class="mb-3">
                                        <label for="updateProductName" class="form-label">Name</label>
                                        <input type="text" class="form-control" id="updateProductName" name="productName" value="${p.name}" required>
                                    </div>
                                    <div class="mb-3">
                                        <label for="updateCapacity" class="form-label">Capacity</label>
                                        <input type="number" class="form-control" id="updateCapacity" name="capacity" value="${p.capacity}" required>
                                    </div>
                                   
                                    <div class="form-group col-md-12">
                                            <label class="control-label">Description</label>
                                            <div id="editor" style="height: 300px;">
                                                ${p.description}
                                            </div>
                                            <input type="hidden" id="editorContent" name="describe">
                                        </div>
                                    <div class="mb-3">
                                        <label for="updateQuantity" class="form-label">Quantity</label>
                                        <input type="number" class="form-control" id="updateQuantity" name="quantity" value="${p.quantity}" required>
                                    </div>
                                    <div class="mb-3">

                                        <label for="updatePrice" class="form-label">Price</label>
                                        <input type="text" class="form-control" id="updatePrice" name="price"  value="<fmt:formatNumber pattern="##,###,### ₫" value="${p.price}"/>" oninput="formatCurrency(this)"  >
                                    </div>
                                    <div class="mb-3">
                                        <label for="updatePrice" class="form-label">Createdby</label>
                                        <input type="number" class="form-control" id="createdby" name="createdBy" value="${p.createdby}" readonly>
                                    </div>
                                    <div class="mb-3">
                                        <label for="updatePrice" class="form-label">Createdon</label>
                                        <input type="string" class="form-control" id="createdon" name="createdOn" value="${p.createdOn}" readonly>
                                    </div>
                                    <div class="mb-3">
                                        <label for="updateImg" class="form-label">Image</label>
                                        <img width="40px" id="previewImage" src="img2/${p.image.imagePath}">
                                        <input type="file" class="form-control" id="image" name="image" onchange="previewFile()">
                                    </div>
                                    <!-- Add more fields for additional product information if needed -->

                                    <button type="submit" class="btn btn-primary">Update Product</button>
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

            
            // Function to get cleaned HTML content
                function getCleanedHTML() {
                    return quill.root.innerHTML;
                }

            function formatCurrency(input) {
                // Remove non-numeric characters
                let value = input.value.replace(/[^\d]/g, '');

                // Format the value as Vietnamese Dong
                value = new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(value);

                // Update the input value
                input.value = value;
            }

            function previewFile() {
                var input = document.getElementById('image');
                var preview = document.getElementById('previewImage');

                // Nếu người dùng chọn file mới
                if (input.files && input.files[0]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        // Hiển thị trước hình ảnh
                        preview.src = e.target.result;
                    };

                    reader.readAsDataURL(input.files[0]);
                } else {
                    // Nếu người dùng không chọn file mới, giữ lại đường dẫn cũ
                    preview.src = "img2/${p.image.imagePath}";
                }
            }

            const fileInput = document.querySelector('input[type="file"]');
            // Fetch default image and create a File object
            const defaultImagePath = 'img2/${p.image.imagePath}'; // Replace with your default image path
            fetch(defaultImagePath)
                    .then(response => response.blob())
                    .then(blob => {
                        const myFile = new File([blob], '${p.image.imagePath}', {type: 'image/png', lastModified: new Date()});
                        // Now let's create a DataTransfer to set the initial FileList
                        const dataTransfer = new DataTransfer();
                        dataTransfer.items.add(myFile);
                        fileInput.files = dataTransfer.files;
                        const imagePreview = document.getElementById('imagePreview');
                        imagePreview.src = URL.createObjectURL(myFile);
                    })
                    .catch(error => console.error('Error loading default image:', error));
        </script>    
        <script src="https://cdn.quilljs.com/1.3.6/quill.js"></script>
            <script>
                // Initialize Quill
                var quill = new Quill('#editor', {
                    theme: 'snow', // 'snow' is one of the themes available
                    modules: {
                        toolbar: {
                            container: [
                                [{'header': [1, 2, false]}],
                                ['bold', 'italic', 'underline', 'strike'],
                                [{'color': []}, {'background': []}],
                                [{'align': []}],
                                ['link', 'image'],
                                ['clean']
                            ],
                        },
                    },
                });

                document.getElementById('myForm').addEventListener('submit', function (event) {
                    // Get Quill's HTML content
                    var htmlContent = document.querySelector('.ql-editor').innerHTML;
                    // Set the content to the input field with name "content"
                    document.querySelector('input[name="describe"]').value = htmlContent;
                });
                function logHtmlContent() {
                    console.log(quill.root.innerHTML);
                }
            </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
        <script src="js/datatables-simple-demo.js"></script>
    </body>

</html>
