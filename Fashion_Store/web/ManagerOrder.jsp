<%-- 
    Document   : ManagerAccount1
    Created on : Aug 22, 2023, 10:20:51 AM
    Author     : tinit
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Orders</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
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
                            <h2>Manager <b>Orders</b></h2>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                           
                            <th>ID</th>
                            <th>Username</th>
                            <th>Date</th>
                            <th>Total Money</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listOrderAdmin}" var="o">
                            <tr>
                                
                                <td><a href="order?action=orderDetails&orderId=${o.getId()}">${o.getId()}</a></td>
                                <td>${o.getUsername()}</td>
                                <td>${o.getDate()}</td>                            
                                <td>${o.getTotalMoney()}</td>
                                <td>${o.getStatus()}</td>
                                <td>                                   
                                    <a href="order?action=orderDetails&orderId=${o.getId()}" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div style=" display: flex; justify-content: center; align-items: center;">                
                    <c:forEach begin="1" end="${endP}" var="i">
                        <a class="${tag==i?"active":""}" style="text-decoration: none;padding: 0.5rem 1rem;margin: 0.5rem;border: 1px solid #ccc;border-radius: 3px;" href="manageraccount?index=${i}">${i}</a>
                    </c:forEach>
                </div>    
            </div>
            <a href="home"><button type="button" class="btn btn-primary">Back to Home</button></a>
        </div>
        <script src="js/manager.js" type="text/javascript"></script>
    </body>

</html>
