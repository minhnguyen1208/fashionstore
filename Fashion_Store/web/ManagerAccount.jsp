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
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager Account</title>
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
                            <h2>Manager <b>Account</b></h2>
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>

                            <th>ID</th>
                            <th>Username</th>
                            <th>Full Name</th>
                            <th>Phone Number</th>
                            <th>Address</th>
                            <th>Admin</th>
                            <th>User</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listAccount}" var="o">
                            <tr>

                                <td>${o.getId()}</td>
                                <td>${o.getUsername()}</td>
                                <td>${o.getFullName()}</td>                            
                                <td>${o.getPhoneNumber()}</td>
                                <td>${o.getAddress()}</td>
                                <td><c:choose><c:when test="${o.getRole() == 1}">Yes</c:when><c:otherwise>No</c:otherwise></c:choose></td>
                                <td><c:choose><c:when test="${o.getRole() == 0}">Yes</c:when><c:otherwise>No</c:otherwise></c:choose></td>
                                <td><c:choose><c:when test="${o.getStatus().equals(1)}">Active</c:when><c:otherwise>Inactive</c:otherwise></c:choose></td>
                                        <td>
                                    <c:choose>
                                        <c:when test="${o.getStatus() == 0}">
                                            <form action="account?action=updateStatus&id=${o.getId()}&status=1" method="POST">
                                                <input type="submit" class="btn btn-success" value="Update Status"/>
                                            </form>
                                        </c:when>
                                        <c:otherwise>
                                            <form action="account?action=updateStatus&id=${o.getId()}&status=0" method="POST">
                                                <input type="submit" class="btn btn-success" value="Update Status"/>
                                            </form>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:choose>
                                        <c:when test="${o.getRole() == 0}">
                                            <form action="account?action=updateRole&id=${o.getId()}&role=1" method="POST" style="margin-top: 5px;">
                                                <input type="submit" class="btn btn-success" value="Update Role"/>
                                            </form>
                                        </c:when>
                                        <c:otherwise>
                                            <form action="account?action=updateRole&id=${o.getId()}&role=0" method="POST" style="margin-top: 5px;">
                                                <input type="submit" class="btn btn-success" value="Update Role"/>
                                            </form>
                                        </c:otherwise>
                                    </c:choose>
                                    <button data-id="${o.getId()}" data-target="#exampleModalAccount" class="delete delete-button-account btn btn-danger mt-1" data-toggle="modal">Delete</button>
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

            <div class="modal fade" id="exampleModalAccount" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Delete User</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            Do you really want to delete this user?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <a id="modalDeleteLinkAccount" class="btn btn-danger" style="color: white;">Delete</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <script>
            $(document).ready(function () {
                $('.delete-button-account').click(function () {
                    var accountId = $(this).data('id');
                    var deleteLink = "account?action=delete&id=" + accountId;
                    $("#modalDeleteLinkAccount").attr('href', deleteLink);
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
    </body>
</html>
