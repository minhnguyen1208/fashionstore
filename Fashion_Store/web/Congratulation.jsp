<%-- 
    Document   : Congratulation
    Created on : Aug 22, 2023, 10:44:47 PM
    Author     : tinit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
    </head>
    <body style="height: 700px;">
        <jsp:include page="Menu.jsp"  />
        <div class="container" style="height: 100%; display: flex; flex-direction: column; align-items: center;" > 
            <image src="image/congratulation.png" width="300" height="300" />
            <h1>Congratulations! You have made a successful purchase</h1>
            <a href="home" class="btn btn-primary text-white mt-4"><h1>Continue to shopping</h1></a>
        </div>
        <jsp:include page="Footer.jsp" />
    </body>
</html>
