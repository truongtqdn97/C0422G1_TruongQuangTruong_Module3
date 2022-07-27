<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 27/07/22
  Time: 4:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="/calculate" method="post">
    <label>Product Description: </label><br>
    <input type="text" name="productDescription" placeholder="ProductDescription"><br>
    <label>List Price: </label><br>
    <input type="text" name="listPrice" placeholder="listPrice"><br>
    <label>Discount Percent: </label><br>
    <input type="text" name="discountPercent" placeholder="0%" value="0"><br>
    <input type="submit" id="submit" value="Calculate Discount">
  </form>
  </body>
</html>
