<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 28/07/22
  Time: 1:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>$Title$</title>
    <style>
        #submit {
            border: dashed 1px;
            color: aliceblue;
            background-color: brown;
            box-shadow: black;
            margin-top: 2px;
        }
    </style>
</head>
<body>
<form action="converter.jsp" method="post">
    <label>Rate: </label><br>
    <input type="text" name="rate" placeholder="rate-convert" value="22000"><br>
    <label>USD: </label><br>
    <input type="text" name="usd" placeholder="usd" value="0"><br>
    <input type="submit" id="submit" value="Converter">
</form>

</body>
</html>
