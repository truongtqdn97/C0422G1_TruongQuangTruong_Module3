<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 30/07/22
  Time: 8:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Product</title>
</head>
<body>

<h1>Delete Product</h1>

<p>
    <a href="/products">Back to product list</a>
</p>

<form method="post">
    <h3 style="color: red">Are you sure about that?</h3>
    <fieldset>
        <legend>Product information</legend>
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
            <tr>
                <td><input type="submit" value="Delete Product"></td>
                <td><a href="/products">Back to product list</a></td>
            </tr>
        </table>
    </fieldset>
</form>


</body>
</html>
