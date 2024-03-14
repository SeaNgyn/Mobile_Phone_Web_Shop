<%-- 
Document   : NewDetail
Created on : Mar 2, 2024, 12:00:37 AM
Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"/>
        <link rel="stylesheet" href="css/styleNew.css">
        <link href="./css/style.css" rel="stylesheet">
        <script src="js/script.js"></script>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Manrope:wght@200&display=swap');


            /*            body {
                            height: 100%
                        }
            
            */            body {
                display: grid;
                place-items: center;


            }

            .card {
                position: relative;
                display: flex;
                flex-direction: column;
                min-width: 0;
                padding: 20px;
                width: 800px;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border-radius: 6px;
                -moz-box-shadow: 0px 0px 5px 0px rgba(212, 182, 212, 1)

            }

            .comment-box{

                padding:5px;

            }



            .comment-area textarea{
                resize: none;
                border: 1px solid #ad9f9f;
            }


            .form-control:focus {
                color: #495057;
                background-color: #fff;
                border-color: #ffffff;
                outline: 0;
                box-shadow: 0 0 0 1px rgb(255, 0, 0) !important;
            }

            .send {
                color: #fff;
                background-color: #ff0000;
                border-color: #ff0000;

            }

            .send:hover {
                color: #fff;
                background-color: #f50202;
                border-color: #f50202;
            }


            .rating {
                display: flex;
                margin-top: -10px;
                flex-direction: row-reverse;
                margin-left: -4px;
                float: left;
            }

            .rating>input {
                display: none
            }

            .rating>label {
                position: relative;
                width: 19px;
                font-size: 25px;
                color: #ff0000;
                cursor: pointer;
            }

            .rating>label::before {
                content: "\2605";
                position: absolute;
                opacity: 0
            }

            .rating>label:hover:before,
            .rating>label:hover~label:before {
                opacity: 1 !important
            }

            .rating>input:checked~label:before {
                opacity: 1
            }

            .rating:hover>input:checked~label:before {
                opacity: 0.4
            }


            /* CSS for Comment Box */
            .comment-box {
                padding: 15px;
                border: 1px solid #ddd;
                border-radius: 8px;


            }

            .comment-area textarea {
                width: 100%;
                resize: none;
            }

            /* CSS for Comment Section */
            .comment-section li {
                margin-bottom: 20px;
                padding: 20px;
                border: 1px solid #eee;
                border-radius: 8px;
                overflow: hidden; /* Giữ cho phần tử không bị tràn ra ngoài */
            }

            .comment-section img {
                border-radius: 50%;
                margin-right: 15px;
                width: 50px; /* Kích thước hình ảnh */
                height: 50px;
            }

            .media-body {
                display: flex;
                flex-direction: column;
            }

            .media-body h5 {
                margin-bottom: 10px;
                font-size: 1.2rem;
                color: #333;
            }

            .media-body div {
                margin-bottom: 15px;
                color: #555;
            }

            .rating {
                display: flex;
                margin-bottom: 15px;
            }

            .rating i {
                font-size: 1.2rem;
                margin-right: 5px;
                color: gold;
            }

            .btn-warning {
                background-color: #ffc107;
                border-color: #ffc107;
                color: #333;
            }

            .btn-warning:hover {
                background-color: #e0a800;
                border-color: #e0a800;
                color: #fff;
            }
            .card-container {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-around;
                width: 18rem;
                margin-right: 10px; /* Khoảng cách giữa các thẻ */
            }



        </style>

    </head>
    <body>
            <div class="container">
                <div class="section">
                    <p class="fs-1 font-monospace fw-bold"><a style="text-decoration: none; color: #007bff" href="listallnews?service=news">News</a></p>
                </div>
            <c:forEach  items="${requestScope.newsgroup}" var="n">
                <a href="listallnews?service=getById&grId=${n.newsGroupId}" class="btn btn-primary mb-4">${n.newsGroupName}</a>
            </c:forEach>
            <c:set var="d" value="${requestScope.newsdetail}" />
            <h1 class="font-monospace fw-bold">${d.title}</h1>
            <div class="infor-author mb-3">
                <div>
                    <img src="https://fptshop.com.vn/tin-tuc/images/avataDefault.png"
                         alt="" style="width: 40px; height: 40px; border-radius: 50%;">
                </div>

                <div class="text-muted" style="font-size: 10px; padding: 5px 5px;">
                    <span style="display: block;">Tác giả: ${d.firstName}${d.lastName}</span>
                    <span>${d.createdOn}</span>
                </div>
            </div>

            <div class="content-inner">
                <div>
                    <Strong class="fs-4">${d.heading}</Strong>
                    <div>
                        <img src="img2/${d.image}"
                             alt="Huawei P70 có camera chất lượng">
                    </div>
                    ${d.description}
                    <p class="text-muted">Ngày đăng: ${d.createdOn}</p>
                </div>                      
            </div>
            <div class="height-100 container d-flex justify-content-center align-items-center">

                <div class="card p-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="rating">
                            <c:forEach var="i" begin="1" end="5">
                                <c:set var="counter" value="${6 - i}" />
                                <i class="fa fa-star" aria-hidden="true" style="color: ${rv >= counter ? 'gold' : 'gray'};"></i>
                            </c:forEach>
                        </div>
                        <h5 class="review-count">${count} Reviews</h5>
                    </div>
                </div>

            </div>

        </div>
        <div class="card">
            <div class="row">
                <div class="col-12">
                    <div class="comment-box ml-2">
                        <h8 style="color: red;">${error}</h8>
                        <h4>Add a comment</h4>
                        <form action="AddComment?newsId=${d.newsId}&service=detail" method="post">
                            <div class="rating"> 
                                <input type="radio" name="rating" value="5" id="5"><label for="5">☆</label>
                                <input type="radio" name="rating" value="4" id="4"><label for="4">☆</label> 
                                <input type="radio" name="rating" value="3" id="3"><label for="3">☆</label>
                                <input type="radio" name="rating" value="2" id="2"><label for="2">☆</label>
                                <input type="radio" name="rating" value="1" id="1"><label for="1">☆</label>
                            </div>
                            <div class="comment-area">
                                <textarea class="form-control" placeholder="what is your view?" name="comment" rows="4"></textarea>
                            </div>
                            <div class="comment-btns mt-2">
                                <div class="row">
                                    <div class="col-6">
                                        <div class="pull-left">
                                            <button class="btn btn-success btn-sm" type="reset">Clear</button>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="pull-right">
                                            <button class="btn btn-success send btn-sm" type="submit">Send <i class="fa fa-long-arrow-right ml-1"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>

                    <c:forEach items="${requestScope.cmt}" var="c">
                        <div class="edu-comment">
                            <div class="comment-content">
                                <div class="comment-top">
                                    <h6 class="title">${c.cusName}</h6>
                                    <div class="rating">
                                        <c:forEach var="i" begin="1" end="5">
                                            <c:set var="counter" value="${6 - i}" />
                                            <i class="fa fa-star" aria-hidden="true" style="color: ${c.star >= counter ? 'gold' : 'gray'};"></i>
                                        </c:forEach>
                                    </div>
                                </div>
                                <p>${c.content}</p>
                            </div>
                        </div>
                        <c:if test="${sessionScope.customerAcc.customerId == c.createdby}">
                            <!-- Add a section for editing beneath the comment -->
                            <i class="fas fa-edit" style="cursor: pointer;" onclick="toggleEditForm(${c.cmtId})"></i>
                            <div class="comment-edit" id="editForm_${c.cmtId}" style="display: none;">
                                <h6 class="title">Edit Your Comment:</h6>
                                <form action="UpdateCommentNews?newsId=${d.newsId}&service=detail" method="post">
                                    <input type="hidden" name="commentId" value="${c.cmtId}">

                                    <input type="radio" name="editedRating" value="5" id="editedRating5" <c:if test="${c.star eq 5}">checked</c:if>><label for="editedRating5">☆</label>
                                    <input type="radio" name="editedRating" value="4" id="editedRating4" <c:if test="${c.star eq 4}">checked</c:if>><label for="editedRating4">☆</label> 
                                    <input type="radio" name="editedRating" value="3" id="editedRating3" <c:if test="${c.star eq 3}">checked</c:if>><label for="editedRating3">☆</label>
                                    <input type="radio" name="editedRating" value="2" id="editedRating2" <c:if test="${c.star eq 2}">checked</c:if>><label for="editedRating2">☆</label>
                                    <input type="radio" name="editedRating" value="1" id="editedRating1" <c:if test="${c.star eq 1}">checked</c:if>><label for="editedRating1">☆</label>

                                        <textarea name="comment" class="form-control" placeholder="Edit your comment here">${c.content}</textarea>
                                    <button type="submit" class="btn btn-primary">Save Changes</button>
                                </form>
                            </div>
                            <a href="DeleteCommentNews?service=detail&newsId=${d.newsId}&cmtId=${c.cmtId}" onclick="confirmDelete()"><button class="btn btn-danger btn-sm">Delete</button></a>
                        </c:if>
                    </c:forEach>

                </div>                           
            </div>

            <div class="row"> 
                <c:forEach  items="${requestScope.recom}" var="re">
                    <div class="card" style="width: 18rem;">
                        <img class="card-img-top" src="img2/${re.image}" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title">${re.title}</h5>
        <!--                    <p class="card-text">${re.heading}</p>-->
                            <a href="listallnews?service=detail&newsId=${re.newsId}" class="btn btn-primary">Chi tiết</a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        </body>
        <script>
            function toggleEditForm(commentId) {
                var editForm = document.getElementById("editForm_" + commentId);

                if (editForm.style.display === "none" || editForm.style.display === "") {
                    editForm.style.display = "block";
                } else {
                    editForm.style.display = "none";
                }
            }
            function confirmDelete() {
                // Sử dụng hộp thoại confirm
                var result = confirm("bạn có muốn xóa comment này?");

                // Nếu người dùng nhấn OK, chuyển hướng hoặc thực hiện hành động xóa
                if (result) {
                    window.location.href = "DeleteCommentNews?service=detail&newsId=${d.newsId}&cmtId=${c.cmtId}";
                    return false;
                } else {
                    // Người dùng đã nhấn Cancel, không làm gì cả
                    return false;
                }
            }
    </script>
</html>
