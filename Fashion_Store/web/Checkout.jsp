<%-- 
    Document   : checkout
    Created on : Aug 22, 2023, 9:23:05 PM
    Author     : tinit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Checkout</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
        <div class="container">
            <div class="py-5 text-center">

                <h2>Checkout form</h2>

            </div>
            <c:set value="${sessionScope.account}" var="account" />
            <c:set value="${sessionScope.cart}" var="cart" />
            <div class="row">
                <div class="col-md-4 order-md-2 mb-4">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-muted">Your cart</span>
                        <span class="badge badge-secondary badge-pill">${sessionScope.size}</span>
                    </h4>
                    <ul class="list-group mb-3 sticky-top">
                        <c:forEach items="${cart.items}" var="c">
                            <li class="list-group-item d-flex justify-content-between lh-condensed">
                                <div>
                                    <h6 class="my-0 show_txt">${c.product.productName}</h6>
                                    <small class="text-muted">${c.product.description}</small>
                                </div>
                                <span class="text-muted">${c.quantity * c.price}</span>
                            </li>
                        </c:forEach>
                        <li class="list-group-item d-flex justify-content-between">
                            <span>Total (VND)</span>
                            <strong>${sessionScope.totalPrice}</strong>
                        </li>
                    </ul>

                </div>
                <div class="col-md-8 order-md-1">
                    <h4 class="mb-3">Billing address</h4>
                    <form class="needs-validation" novalidate="">
                        <div class="row">
                            <div class="col-md mb-3">
                                <label for="firstName">Full Name</label>
                                <input type="text" class="form-control" name="fullName" value="${account.fullName}" placeholder="" value="" required="">
                                <div class="invalid-feedback"> Valid first name is required. </div>
                            </div>

                        </div>
                        <div class="mb-3">
                            <label for="username">Username</label>
                            <input type="text" class="form-control" name="username" value="${account.username}" placeholder="Username" required="">
                            <div class="invalid-feedback" style="width: 100%;"> Your username is required. </div>
                        </div>
                        <div class="mb-3">
                            <label for="email">Email <span class="text-danger">(Require)</span></label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">@</span>
                                </div>
                                <input type="email" class="form-control" name="email" value="${account.email}" placeholder="you@example.com">
                                <div class="invalid-feedback"> Please enter a valid email address for shipping updates. </div>
                            </div>

                        </div>
                        <div class="mb-3">
                            <label >Phone Number <span class="text-danger">(Require)</span></label>
                            <input type="text" class="form-control" name="phoneNumber" value="${account.phoneNumber}" placeholder="you@example.com">
                            <div class="invalid-feedback"> Please enter a valid email address for shipping updates. </div>
                        </div>
                        <div class="mb-3">
                            <label for="address">Address <span class="text-danger">(Require)</span></label>
                            <input type="text" class="form-control" name="address" value="${account.address}" placeholder="1234 Main St" required="">
                            <div class="invalid-feedback"> Please enter your shipping address. </div>
                        </div>
                        <hr class="mb-4">
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="same-address">
                            <label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>
                        </div>
                        <div class="custom-control custom-checkbox">
                            <input type="checkbox" class="custom-control-input" id="save-info">
                            <label class="custom-control-label" for="save-info">Save this information for next time</label>
                        </div>
                        <hr class="mb-4">

                        <hr class="mb-4">
                        <a class="btn btn-primary btn-lg btn-block text-white" href="checkout">Continue to checkout</a>
                    </form>
                </div>
            </div>
            <footer class="my-5 pt-5 text-muted text-center text-small">
                <p class="mb-1">© 2017-2019 Company Name</p>
                <ul class="list-inline">
                    <li class="list-inline-item"><a href="#">Privacy</a></li>
                    <li class="list-inline-item"><a href="#">Terms</a></li>
                    <li class="list-inline-item"><a href="#">Support</a></li>
                </ul>
            </footer>
        </div>
    </body>
    <script>
        (function () {
            'use strict'

            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation')

                // Loop over them and prevent submission
                Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })
            }, false)
        }())
    </script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
</html>
