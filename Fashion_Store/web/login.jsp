<%-- 
    Document   : Login1
    Created on : Aug 22, 2023, 10:20:10 AM
    Author     : tinit
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <title>Đăng Nhập</title>
    </head>
    <body>
        <%
            String error = (String) session.getAttribute("error");
            if (error != null && !error.isEmpty()) {
        %>
        <h1>${error}</h1>
        <%
            }
        %>  
        <div id="logreg-forms">
            <form class="form-signin" action="auth?action=login" method="post">
                <h1 class="h3 mb-3 font-weight-normal" style="text-align: center">Fashion Store - Login</h1>
                <p class="text-danger">${error}</p>
                <p class="text-success">${success}</p>
                <input name="username" value="${username}" type="text" id="inputEmail" class="form-control mb-3" placeholder="Username" required="" autofocus="">
                <input name="password" value="${password}" type="password" id="inputPassword" class="form-control mb-3" placeholder="Password" required="">



                <button class="btn btn-success btn-block" type="submit"><i class="fas fa-sign-in-alt"></i>Login</button>

                <hr>
                <a class="btn btn-primary btn-block text-white" href="register.jsp"><i class="fas fa-user-plus"></i>Register</a>

            </form>

            <br>
        </div>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
