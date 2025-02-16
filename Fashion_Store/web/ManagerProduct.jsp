<%-- 
    Document   : ManagerProduct1
    Created on : Aug 22, 2023, 10:21:31 AM
    Author     : tinit
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Quản Lý Sản Phẩm</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    </head>    
    <body>
        <div class="container">
            <div class="table-wrapper">
                <div class="table-title" style="background: #f2b629">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manager <b>Product</b></h2>
                        </div>
                        <div class="col-sm-6">
                            <a href="#addEmployeeModal"  class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Product</span></a>
                            <a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                           
                            <th>Image</th>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Description</th>
                            <th>Size</th>
                            <th>Price</th>
                        </tr>
                    </thead>
                    <tbody>

                    <div id="deleteEmployeeModal" class="modal fade">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <div class="modal-header">						
                                    <h4 class="modal-title">Delete Product</h4>
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                </div>
                                <div class="modal-body">					
                                    <p>Are you sure you want to delete these Records?</p>
                                    <p class="text-warning"><small>This action cannot be undone.</small></p>
                                </div>
                                <div class="modal-footer">
                                    <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                    <input type="submit" class="btn btn-danger" value="Delete">
                                </div>

                            </div>
                        </div>
                    </div>                       
                    <c:forEach items="${listProduct}" var="product">
                        <tr>
                            <td>
                                <img style="width: 100px; height: 100px" src="${product.getImg()}">
                            </td>
                            <td>${product.getId()}</td>
                            <td>${product.getProductName()}</td>
                            <td>${product.getDescription()}</td>                               
                            <td>${product.getSize()}</td>                               
                            <td>${product.getPrice()}</td>
                            <td>
                                <a href="product?action=edit&id=${product.getId()}" class="edit"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                <button data-id="${product.getId()}" data-toggle="modal" data-target="#exampleModal" class="delete delete-button" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></button>
                            </td>
                        </tr>                          
                    </c:forEach>
                    <input type="hidden" id="checkValues" name="checkValues" value="">

                    </tbody>
                </table>
                <div style=" display: flex; justify-content: center; align-items: center;">                
                    <c:forEach begin="1" end="${endP}" var="i">
                        <a class="${tag==i?"active":""}" style="text-decoration: none;padding: 0.5rem 1rem;margin: 0.5rem;border: 1px solid #ccc;border-radius: 3px;" href="manager?index=${i}">${i}</a>
                    </c:forEach>
                </div>  
            </div>
            <a href="home"><button type="button" class="btn btn-primary">Back to Home</button></a>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="product?action=create" method="POST">
                        <div class="modal-header">						
                            <h4 class="modal-title">Create Item</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <label>Product Name</label>
                                <input name="productName" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input name="price" type="number" class="form-control" required>
                            </div> 
                            <div class="form-group">
                                <label>Size</label>
                                <input name="size" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Image</label>
                                <input name="img" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <select name="status" class="form-select" aria-label="Default select example">
                                    <option value="1">Stock</option>
                                    <option value="0">Out of stock</option>

                                </select>
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input name="quantity" type="number" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <select name="categoryId" class="form-select" aria-label="Default select example">
                                    <c:forEach items="${listCategory}" var="category">
                                        <option value="${category.getId()}">${category.getCategoryName()}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <!--         Edit Modal HTML 
                         Delete Modal HTML -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Delete Product</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        Do you really want to delete this product?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <a id="modalDeleteLink" class="btn btn-danger" style="color: white;">Delete</a>
                    </div>
                </div>
            </div>
        </div>
        <script>
            function getCheckValue() {
                const checkboxes = document.querySelectorAll('input[name="checkbox"]');

                var string = '';

                for (let i = 0; i < checkboxes.length; i++) {
                    if (checkboxes[i].checked) {
                        console.log(checkboxes[i].value);
                        string += checkboxes[i].value + '|';
                    }
                }
                checkValues.value = string;
            }
            ;
            const checkboxes = document.querySelectorAll('input[name="checkbox"]');
            for (let i = 0; i < checkboxes.length; i++) {
                checkboxes[i].addEventListener('click', getCheckValue);
            }
            console.log('Add L');
        </script>

        <script>
            $(document).ready(function () {
                $('.delete-button').click(function () {
                    var productId = $(this).data('id');
                    console.log("id", productId);
                    var deleteLink = "product?action=delete&id=" + productId;
                    $("#modalDeleteLink").attr('href', deleteLink);
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="js/manager.js" type="text/javascript">
        </script>

    </body>
</html>