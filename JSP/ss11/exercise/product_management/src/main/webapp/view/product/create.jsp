<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 30/07/22
  Time: 7:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new product</title>
    <style>
        .message {
            color: greenyellow;
        }
    </style>
</head>
<body>

<h1>Create new product</h1>
<p>
    <c:if test="${message!=null}">
        <span class="message">${message}</span>
    </c:if>
</p>

<p>
    <a href="/products">Back to product list</a>
</p>
<%--Product(int id, String name, int price, String description, String manufacturer)--%>
<form method="post">
    <fieldset>
        <legend>Product Information</legend>
        <table>
            <tr>
                <td>Name</td>
                <td><input  required type="text" name="name" id="name"></td>
            </tr>
            <tr>
                <td>Price</td>
                <td><input required type="text" name="price" id="price"></td>
            </tr>
            <tr>
                <td>Description</td>
                <td><input required type="text" name="description" id="description"></td>
            </tr>
            <tr>
                <td>Manufacturer</td>
                <td><input required type="text" name="manufacturer" id="manufacturer"></td>
            </tr>
            <tr>
                <td></td>
                <td><input required type="submit" value="Create Product"></td>
            </tr>
        </table>
    </fieldset>
</form>


</body>
</html>
