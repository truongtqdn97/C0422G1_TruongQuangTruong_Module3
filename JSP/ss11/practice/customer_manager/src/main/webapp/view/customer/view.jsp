<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 30/07/22
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Information</title>
</head>
<body>

<h1>Customer Detail</h1>
<p>
    <a href="/customers">Back to list</a>
</p>
<table>
    <tr>
        <td>Name</td>
        <td>: ${customer.name}</td>
    </tr>
    <tr>
        <td>Email</td>
        <td>: ${customer.email}</td>
    </tr>
    <tr>
        <td>Address</td>
        <td>: ${customer.address}</td>
    </tr>
</table>

</body>
</html>
