<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 28/07/22
  Time: 2:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Simple Dictionary</title>
    <style>
        *{
            margin: 10px;
        }
    </style>
</head>
<body>
<form action="dictionary.jsp" method="post">
    <input type="text" name="search" placeholder="Enter your word: ">
    <input type="submit" id="submit" value="Search">
</form>
</body>
</html>
