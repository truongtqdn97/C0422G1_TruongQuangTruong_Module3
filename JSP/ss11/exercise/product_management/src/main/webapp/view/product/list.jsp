<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 30/07/22
  Time: 5:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
          crossorigin="anonymous">
</head>

<body style="text-align: center">

<h1>Products</h1>
<p>
    <a href="/products?action=create">Create new product</a>
</p>
<form action="/products?action=search" method="post">
    <input type="text" name="name" placeholder="Name of product">
    <input type="submit" value="Search">
</form>

<div class="container">
    <table class="table table-bordered">
    <tr class="table-dark text-light fw-bold">
        <td>ID</td>
        <td>Name</td>
        <td>Price</td>
        <td>Description</td>
        <td>Manufacturer</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>

    <c:if test="${message!=null}">
        <tr class="table-secondary">
            <td colspan="7">
                <p>${message}</p>
            </td>
        </tr>
    </c:if>

    <c:forEach items="${products}" var="product" varStatus="count">
        <c:if test="${count.count%2==0}">
        <tr class="table-warning">
            <td>${product.id}</td>
            <td><a href="/products?action=view&id=${product.id}">${product.name}</a></td>
            <td>${product.price}</td>
            <td>${product.description}</td>
            <td>${product.manufacturer}</td>
            <td><a href="/products?action=edit&id=${product.id}">edit</a></td>

            <!-- Button trigger modal -->
            <td>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${product.id}">
                Delete
            </button>
            </td>
            <!-- Modal -->
            <div class="modal fade" id="exampleModal${product.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Deleting...</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">

                            Are you sure about that?
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">
                                <a href="/products?action=delete&id=${product.id}" class="text-light" style="text-decoration: none">
                                    Delete
                                </a>
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </tr>
        </c:if>
        <c:if test="${count.count%2!=0}">
            <tr class="table-success">
                <td>${product.id}</td>
                <td><a href="/products?action=view&id=${product.id}">${product.name}</a></td>
                <td>${product.price}</td>
                <td>${product.description}</td>
                <td>${product.manufacturer}</td>
                <td><a href="/products?action=edit&id=${product.id}">edit</a></td>

                <!-- Button trigger modal -->
                <td>
                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal${product.id}">
                        Delete
                    </button>
                </td>
                <!-- Modal -->
                <div class="modal fade" id="exampleModal${product.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Deleting...</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Are you sure about that?
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-primary">
                                    <a href="/products?action=delete&id=${product.id}" class="text-light" style="text-decoration: none">
                                        Delete
                                    </a>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </tr>
        </c:if>
    </c:forEach>
</table>
<c:if test="${flag==1}">
    <p>
        <a href="/products">Back to Product list</a>
    </p>
</c:if>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"
        integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"
        integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13"
        crossorigin="anonymous"></script>
</body>
</html>
