<%-- 
    Document   : Cart1
    Created on : Aug 22, 2023, 10:15:32 AM
    Author     : tinit
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Shopping</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="shopping-cart">
            <c:choose>
                <c:when test="${sessionScope.size == 0}">
                    <div class="container" style="display: flex; flex-direction: column; height: 100vh; justify-content: center; align-items: center;">
                        <image src="image/emptyCart.png" style="width: 500px; height: 300px;" />
                        <h1>Your cart is empty!</h1>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="px-4 px-lg-0">

                        <div class="pb-5">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5">

                                        <!-- Shopping cart table -->
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col" class="border-0 bg-light">
                                                            <div class="p-2 px-3 text-uppercase">Product</div>
                                                        </th>
                                                        <th scope="col" class="border-0 bg-light">
                                                            <div class="py-2 text-uppercase">Price</div>
                                                        </th>
                                                        <th scope="col" class="border-0 bg-light">
                                                            <div class="py-2 text-uppercase">Quantity</div>
                                                        </th>
                                                        <th scope="col" class="border-0 bg-light">
                                                            <div class="py-2 text-uppercase">Action</div>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:set var="o" value="${sessionScope.cart}" />
                                                    <c:forEach items="${o.items}" var="i">
                                                        <tr>
                                                            <th scope="row">
                                                                <div class="p-2">
                                                                    <img src="${i.product.img}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                                    <div class="ml-3 d-inline-block align-middle">
                                                                        <h5 class="mb-0"> <a href="productDetail?productId=${i.product.id}" class="text-dark d-inline-block">${i.product.productName}</a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                                    </div>
                                                                </div>
                                                            </th>
                                                            <td class="align-middle"><strong>${i.price * i.quantity}</strong></td>
                                                            <td class="align-middle">
                                                                <a href="addToCart?action=descrease&id=${i.product.id}&number=1"><button class="btnSub">-</button></a> 
                                                                <strong>${i.quantity}</strong>
                                                                <a href="addToCart?action=increase&id=${i.product.id}&number=+1"><button class="btnAdd">+</button></a>
                                                            </td>
                                                            <td class="align-middle"><a href="#" class="text-dark">
                                                                    <a href="addToCart?action=delete&id=${i.product.id}&number=0" class="btn btn-danger">Delete</a>
                                                                </a>
                                                            </td>
                                                        </tr> 
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                        <!-- End -->
                                    </div>
                                </div>

                                <div class="row py-5 p-4 bg-white rounded shadow-sm">
                                  
                                    <div class="col-lg-6">
                                        <div class="bg-light rounded-pill px-4 py-3 text-uppercase font-weight-bold">Bill</div>
                                        <div class="p-4">
                                            <ul class="list-unstyled mb-4">
                                                <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total amount</strong><strong>${sessionScope.totalPrice} VND</strong></li>
                                                <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Fee delivery</strong><strong>Free ship</strong></li>
                                                <li class="d-flex justify-content-between py-3 border-bottom"><strong class="text-muted">Total</strong>
                                                    <h5 class="font-weight-bold">${sessionScope.totalPrice} VND</h5>
                                                </li>
                                            </ul><a href="./prepareCheckout" class="btn btn-dark rounded-pill py-2 btn-block">Checkout</a>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
            <jsp:include page="Footer.jsp" />
        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>

</html>
</html>
