<%-- 
    Document   : ProductDetail1
    Created on : Aug 22, 2023, 10:23:04 AM
    Author     : tinit
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${productDetail.getProductName()}</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">
                <jsp:include page="ContentLeft.jsp"></jsp:include>

                    <div class="col-sm-9">
                        <div class="container">
                            <div class="card" style="font-family: 'Roboto Mono', monospace; font-size: 16px; font-weight: bold;background: #f2b629;">
                                <div class="row">
                                    <aside class="col-sm-5 border-right">
                                        <article class="gallery-wrap"> 
                                            <div class="img-big-wrap">
                                                <div > <a href="#"><img  src="${productDetail.getImg()}"></a></div>
                                        </div> <!-- slider-product.// -->
                                        <div class="img-small-wrap">
                                        </div> <!-- slider-nav.// -->
                                    </article> <!-- gallery-wrap .end// -->
                                </aside>
                                <aside class="col-sm-7">
                                    <article class="card-body p-5">
                                        <h3 class="title mb-3" style="text-align: center; font-family: Impact Charcoal; font-style: italic; font-weight: bold">${productDetail.getProductName()}</h3>
                                        <p class="price-detail-wrap">

                                        <p class="num"><label style="font-weight: bold">Price: </label> ${productDetail.getPrice()} vnd</p>
                                        </p> <!-- price-detail-wrap .// -->
                                        <dl class="item-property">
                                            <dt>Description</dt>
                                            <dd><p>
                                                    ${productDetail.getDescription()}
                                                </p></dd>
                                        </dl>

                                        <hr>
                                        <div class="row">
                                            <div class="col-sm-5">
                                                <dl class="param param-inline">
                                                    <dt>Quantity: </dt>
                                                    <dd>
                                                        <input name="quantity" id="quantityInput" max="100" min="1" begin="1" value="1" type="number" style="width: 70px;"/>
                                                    </dd>
                                                </dl>  <!-- item-property .// -->
                                                <dl class="param param-inline">
                                                    <dt>Size: </dt>
                                                    <dd>
                                                        <select class="form-control form-control-sm" style="width:70px;">
                                                            <c:forEach items="${productDetail.getSize().split(',')}" var="size">
                                                                <option value="${size}">${size}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </dd>
                                                </dl>
                                            </div> <!-- col.// -->

                                        </div> <!-- row.// -->
                                        <hr>
                                        <a href id="button-buy" class="btn btn-lg btn-primary text-uppercase" data-product-id="${productDetail.getId()}"> Buy </a>
                                        <a href="#" id="button-add-to-cart" data-product-id="${productDetail.getId()}" class="btn btn-lg btn-outline-primary text-uppercase"> <i class="fas fa-shopping-cart"></i> Add to cart </a>
                                    </article> <!-- card-body.// -->
                                </aside> <!-- col.// -->
                            </div> <!-- row.// -->
                        </div> <!-- card.// -->
                    </div>
                </div>

            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>
    </body>

    <script>
        $(document).ready(function () {
            $('#button-add-to-cart').click(function () {
                var productId = $(this).data('product-id');
                var quantity = $('#quantityInput').val();
                var addToCartLink = "addToCart?action=increase&id=" + productId + "&number=" + quantity;
                $(this).attr('href', addToCartLink);
            });
        });
    </script>

    <script>
        $(document).ready(function () {
            $('#button-buy').click(function () {
                var productId = $(this).data('product-id');
                var quantity = $('#quantityInput').val();
                var addToCartLink = "addToCart?action=increase&id=" + productId + "&number=" + quantity;
                $(this).attr('href', addToCartLink);
            });
        });
    </script>


</html>
