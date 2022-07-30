<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 30/07/22
  Time: 8:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Product</title>
</head>
<body>

<h1>Product Information</h1>
<p>
  <a href="/products">Back to Product list</a>
</p>
<p>
  <c:if test="${message!=null}">
    <span>${message}</span>
  </c:if>
</p>

<c:if test="${message==null}">
  <table border="1">
    <tr>
      <td>ID</td>
      <td>Name</td>
      <td>Price</td>
      <td>Description</td>
      <td>Manufacturer</td>
      <td>Edit</td>
      <td>Delete</td>
    </tr>
    <c:forEach items="${products}" var="product">
      <tr>
        <td>${product.id}</td>
        <td><a href="/products?action=view&id=${product.id}">${product.name}</a></td>
        <td>${product.price}</td>
        <td>${product.description}</td>
        <td>${product.manufacturer}</td>
        <td><a href="/products?action=edit&id=${product.id}">edit</a></td>
        <td><a href="/products?action=delete&id=${product.id}">delete</a></td>
      </tr>
    </c:forEach>
  </table>
</c:if>


</body>
</html>