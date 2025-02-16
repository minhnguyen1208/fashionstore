<%-- 
  Document  : ContentLeft1
  Created on : Aug 22, 2023, 10:16:33 AM
  Author   : tinit
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
  <div class="card bg-light mb-3" >
    <div class="card-header text-white text-uppercase" style="background-color: #55bd2b; text-align: center"><i class="fa fa-list"></i>Categories</div>
    <ul class="list-group category_block">
      <c:forEach items="${listCategory}" var="o">
        <li class="list-group-item text-white ${choose == o.getId() ? "active" : ""}" style="text-align: center; font-family: Tahoma Geneva; font-weight: bold; font-size: 20px"><a href="category?categoryId=${o.getId()}">${o.getCategoryName()}</a></li>
      </c:forEach>
    </ul>
  </div>

</div>

<style>
  .category_block li:hover {
    background-color: #55bd2b !important;
  }
  
</style>
