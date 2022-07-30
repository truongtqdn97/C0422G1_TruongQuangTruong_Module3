<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 30/07/22
  Time: 8:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Product</title>
</head>
<body>
<h1>Product Information</h1>
<p>
    <a href="/products">Back to Product list</a>
</p>
<table>
    <tr>
        <td>Name</td>
        <td>: ${product.name}</td>
    </tr>
    <tr>
        <td>Price</td>
        <td>: ${product.price}</td>
    </tr>
    <tr>
        <td>Description</td>
        <td>: ${product.description}</td>
    </tr>
    <tr>
        <td>Manufacturer</td>
        <td>: ${product.manufacturer}</td>
    </tr>
</table>



</body>
</html>
