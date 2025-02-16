
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Details</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>

    </head>

    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
        <c:choose>
            <c:when test="${sessionScope.account.role == 0}"> 
                <div class="shopping-cart">
                    <c:choose>
                        <c:when test="${listOrderDetails == null}">
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
                                            <h1>Order Detail</h1>
                                            <div class="col-lg-12 p-5 bg-white rounded shadow-sm mb-5" >

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
                                                                    <div class="py-2 text-uppercase">Phone Number</div>
                                                                </th>
                                                                <th scope="col" class="border-0 bg-light">
                                                                    <div class="py-2 text-uppercase">Address</div>
                                                                </th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>

                                                            <c:forEach items="${listOrderDetails}" var="i">
                                                                <tr>
                                                                    <th scope="row">
                                                                        <div class="p-2">
                                                                            <img src="${i.getImg()}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                                            <div class="ml-3 d-inline-block align-middle">
                                                                                <h5 class="mb-0"> <a href="productDetail?productId=${i.getProductID()}" class="text-dark d-inline-block">${i.getProductName()}</a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                                            </div>
                                                                        </div>
                                                                    </th>
                                                                    <td class="align-middle"><strong>${i.getPrice()}</strong></td>
                                                                    <td class="align-middle"><strong>${i.getQuantity()}</strong></td>
                                                                    <td class="align-middle"><strong>${i.getAddress()}</strong></td>
                                                                    <td class="align-middle"><strong>${i.getPhoneNumber()}</strong></td>
                                                                </tr> 
                                                            </c:forEach>
                                                        </tbody>
                                                    </table>


                                                </div>
                                                <!-- End -->
                                            </div>
                                        </div>



                                    </div>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>

                </div>
            </c:when>
            <c:otherwise>
                <div class="shopping-cart">
                    <div class="px-4 px-lg-0">
                        <div class="pb-5">
                            <div class="container" >

                                <div class="row" >
                                    <div class="col-lg-12" style="display: flex; justify-content: space-between;">
                                        <h1>Order Detail</h1>
                                        <c:if test="${statusOrder != 'Completed'}">
                                            <div class="col-6">
                                                <form method="POST" action="order?action=updateStatus">
                                                    <h3>Update status</h3>
                                                    <p>Status: ${statusOrder}<p>
                                                        <select name="status" class="p-1 mr-2">
                                                            <c:choose>
                                                                <c:when test="${statusOrder == 'Processing'}">
                                                                    <option value="Delivery">Delivery</option>
                                                                </c:when>
                                                                <c:when test="${statusOrder == 'Delivery'}">
                                                                    <option value="Completed">Completed</option>
                                                                </c:when>
                                                            </c:choose>
                                                        </select>
                                                        <input type="submit" value="Update" class="btn btn-primary" />
                                                </form>

                                            </div>
                                        </c:if>
                                    </div>
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
                                                            <div class="py-2 text-uppercase">Phone Number</div>
                                                        </th>
                                                        <th scope="col" class="border-0 bg-light">
                                                            <div class="py-2 text-uppercase">Address</div>
                                                        </th>
                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <c:forEach items="${listOrderDetails}" var="i">
                                                        <tr>
                                                            <th scope="row">
                                                                <div class="p-2">
                                                                    <img src="${i.getImg()}" alt="" width="70" class="img-fluid rounded shadow-sm">
                                                                    <div class="ml-3 d-inline-block align-middle">
                                                                        <h5 class="mb-0"> <a href="productDetail?productId=${i.getProductID()}" class="text-dark d-inline-block">${i.getProductName()}</a></h5><span class="text-muted font-weight-normal font-italic"></span>
                                                                    </div>
                                                                </div>
                                                            </th>
                                                            <td class="align-middle"><strong>${i.getPrice()}</strong></td>
                                                            <td class="align-middle"><strong>${i.getQuantity()}</strong></td>
                                                            <td class="align-middle"><strong>${i.getAddress()}</strong></td>
                                                            <td class="align-middle"><strong>${i.getPhoneNumber()}</strong></td>
                                                        </tr> 
                                                    </c:forEach>
                                                </tbody>
                                            </table>


                                        </div>
                                        <!-- End -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
        <jsp:include page="Footer.jsp" />
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>

</html>
</html>
