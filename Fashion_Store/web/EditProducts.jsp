<%-- 
    Document   : EditProducts1
    Created on : Aug 22, 2023, 10:18:10 AM
    Author     : tinit
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Products</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            body {
                background-color: #fff; /* trắng */
                color: #333; /* đen */
            }

            .table-wrapper {
                border: 1px solid #ddd; /* xám nhạt */
                border-radius: 5px;
                padding: 20px;
                box-shadow: 0 0 10px 2px #ccc; /* bóng đổ */
            }

            .table-title {
                background-color: #f9f6f7; /* cam nhạt */
                padding: 15px;
                border-radius: 5px 5px 0 0;
                box-shadow: 0 0 5px 1px #ccc; /* bóng đổ */
            }

            h2 {
                font-family: Roboto Condensed Bold; /* font chữ đậm */
                color: #333;
                margin: 0;
            }

            .form-group {
                margin-bottom: 15px;
            }

            .form-control {
                border: 1px solid #ddd;
                border-radius: 3px;
                padding: 6px 12px;
                font-size: 16px;
            }

            .form-control:focus {
                border: 1px solid #f00; /* cam đậm */
            }

            .modal-content {
                box-shadow: 0 0 10px 2px #ccc; /* bóng đổ */
            }

            .modal-header {
                border-bottom: 1px solid #ddd;
                padding: 10px 20px;
                background-color: #f9f6f7; /* cam nhạt */
                box-shadow: 0 0 5px 1px #ccc; /* bóng đổ */
            }

            .modal-body {
                background-color: #fff; /* trắng */
                padding: 20px;
            }

            .btn-default {
                background-color: #fff;
                border: 1px solid #ddd;
                color: #333;
                font-size: 16px;
            }

            .btn-default:hover {
                background-color: #f9f6f7; /* cam nhạt */
                border: 1px solid #f00; /* cam đậm */
            }

            .btn-info {
                background-color: #f00; /* cam đậm */
                border: 1px solid #f00;
                color: #fff;
                font-size: 16px;
            }

            .btn-info:hover {
                background-color: #d95b43; /* cam tối */
            }

            img {
                width: 100%;
                border: 1px solid #ddd;
                border-radius: 3px;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Edit<b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                        </div>
                    </div>
                </div>
            </div>
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="product?action=update" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Product</h4>

                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label>
                                    <input value="${productEdit.getId()}" name="id" type="text" class="form-control" readonly required>
                                </div>
                                <div class="form-group">
                                    <label>Product Name</label>
                                    <input value="${productEdit.getProductName()}" name="productName" type="text" class="form-control" required>
                                </div>               
                                <div class="form-group">
                                    <label>Price</label>
                                    <input value="${productEdit.getPrice()}" name="price" type="number" class="form-control" required>
                                </div> 
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input value="${productEdit.getQuantity()}" name="quantity" type="number" class="form-control" required>
                                </div> 
                                <div class="form-group">
                                    <label>Size</label>
                                    <input value="${productEdit.getSize()}" name="size" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input value="${productEdit.getImg()}" name="img" type="text" class="form-control" required>
                                </div>                       
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" class="form-control" required>${productEdit.getDescription()}"</textarea>
                                </div>
                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="categoryId" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listCategory}" var="category">
                                            <option <c:if test="${productEdit.getCategoryId() == category.getId()}" >selected=""</c:if> value="${category.getId()}">${category.getCategoryName()}</option>
                                        </c:forEach>
                                    </select>
                                </div>				
                            </div>
                            <div class="modal-footer">
                                <input onclick="window.location.href = 'product'" type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                <input type="submit" class="btn btn-info" value="Save">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>
