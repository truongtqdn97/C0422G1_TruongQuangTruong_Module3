<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 01/08/22
  Time: 8:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>User Management Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body style="background-image: url('https://wallpapercave.com/wp/wp2757834.gif')">

<div style="text-align: center;">
    <h1>User Management</h1>
    <h2>
        <a href="/users?action=create" class="btn btn-success">Add New User</a>
    </h2>
</div>

<form style="text-align: center;" action="/users?action=search" method="post">
    <input type="text" name="country" placeholder="Name of country">
    <input type="submit" value="Search">
</form>


<div align="center">
    <table border="1" cellpadding="5">
        <h2>List of Users</h2>
        <tr>
            <th>ID</th>
            <th>
                Name

                <a href="/users?action=sort">
                    <img onclick="sortClick()" style="width: 15px; height: auto"
                         src="https://cdn.pixabay.com/photo/2012/04/11/11/17/sort-27489_1280.png">
                </a>
                <%--                <a href="/users?action=sort">--%>
                <%--                    <img style="width: 15px; height: auto"--%>
                <%--                         src="https://icons-for-free.com/download-icon-filter+sort+sorting+za+icon-1320195762119449596_512.icns">--%>
                <%--                </a>--%>


            </th>
            <th>Email</th>
            <th>Country</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="user" items="${listUser}">
            <tr>
                <td><c:out value="${user.id}"/></td>
                <td><c:out value="${user.name}"/></td>
                <td><c:out value="${user.email}"/></td>
                <td><c:out value="${user.country}"/></td>
                <td>
                    <a href="/users?action=edit&id=${user.id}">Edit</a>

                        <%--                    <a href="/users?action=delete&id=${user.id}">Delete</a>--%>
                    <!-- Button trigger modal -->
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                            data-bs-target="#exampleModal${user.id}">
                        Delete
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="exampleModal${user.id}" tabindex="-1"
                         aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Deleting...</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="d-flex align-items-center row">

                                        <img style="width: 100%; height: 300px;" src="https://media4.giphy.com/media/IfyjWLQMeF6kbG2r0z/giphy.gif?cid=ecf05e47kub5grtsebx9fslwrrrx4kinhm8tzqow55b2z6z8&rid=giphy.gif&ct=g">
                                    </div>
                                    Delete <b>${user.name}</b> from list?
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel
                                    </button>
                                    <a class="btn btn-danger" href="/users?action=delete&id=${user.id}"
                                       style="text-decoration: none">Delete</a>

                                </div>
                            </div>
                        </div>
                    </div>


                </td>
            </tr>
        </c:forEach>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
        integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
        integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
        crossorigin="anonymous"></script>
</body>
</html>
