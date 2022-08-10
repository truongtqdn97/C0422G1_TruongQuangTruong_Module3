<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 05/08/22
  Time: 3:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Management</title>
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="/datatables/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/my_style/my_style.css">
</head>
<body>

<%--header--%>
<%@ include file="../layout/header.jsp" %>


<%--nav bar--%>
<%@ include file="../layout/navbar.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-3">
            <a href="/customer?action=create" class="btn btn-success">Add new customer</a>
        </div>
        <div class="col-md-3">
            <%--            <form>--%>
            <%--                <input type="text" hidden id="mess" value="${message}">--%>
            <%--            </form>--%>
        </div>

        <div class="col-md-6 d-flex justify-content-end">
            <nav>
                <div class="container-fluid">
                    <form action="/customer?action=search" method="post" class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search"
                               name="searchName">
                        <button class="btn btn-outline-success btn-light" type="submit"><strong>Search</strong></button>
                    </form>
                </div>
            </nav>
        </div>
    </div>
</div>

<div class="container-fluid" style="margin-top: 20px">
    <div class="row">
        <div class="col-md-12">
            <table id="tableCustomer" class="table" style="width: 100%">
                <thead>
                <tr class="table-dark">
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Birthday</th>
                    <th scope="col">Gender</th>
                    <th scope="col">Identify Card</th>
                    <th scope="col">Phone Number</th>
                    <th scope="col">Email</th>
                    <th scope="col">Customer Type</th>
                    <th scope="col">Address</th>
                    <th scope="col" style="text-align: center">Edit</th>
                    <th scope="col" style="text-align: center">Delete</th>
                </tr>
                </thead>
                <tbody>
                <%--                Customer(int pId, String name, LocalDate birthday,
                                    int gender, String identifyCard, String phoneNumber,
                                    String email, int customerType, String address)--%>
                <c:forEach items="${customerList}" var="customer" varStatus="loop">
                    <tr class="table-light">
                        <td>${loop.count}</td>
                        <td>${customer.name}</td>
                        <td>${customer.birthday}</td>
                        <c:if test="${customer.gender==0}">
                            <td>Female</td>
                        </c:if>
                        <c:if test="${customer.gender==1}">
                            <td>Male</td>
                        </c:if>
                        <td>${customer.identifyCard}</td>
                        <td>${customer.phoneNumber}</td>
                        <td>${customer.email}</td>
                        <c:forEach items="${customerTypeList}" var="customerTypeVar">
                            <c:if test="${customer.customerType==customerTypeVar.customerTypeId}">
                                <td>${customerTypeVar.customerTypeName}</td>
                            </c:if>
                        </c:forEach>
                        <td>${customer.address}</td>
                        <td>
                            <!-- Button trigger modal -->
                            <button type="button"
                                    class="btn"
                                    data-bs-toggle="modal"
                                    data-bs-target="#editButton">
                                <a href="/customer?action=updateCustomer&pId=${customer.pId}">
                                    <img src="/img/edit-2.png"
                                         style="height: 25px;width: auto">
                                </a>

                            </button>
                        </td>
                        <td class="btn-delete">
                            <!-- Button trigger modal -->
                            <button type="button"
                                    class="btn"
                                    data-bs-toggle="modal"
                                    data-bs-target="#deleteButton"
                                    onclick="showModalDelete('${customer.pId}','${customer.name}')">
                                <img src="/img/delete.png"
                                     style="height: 25px;width: auto">
                            </button>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>
</div>






<!--modal delete-->
<div class="modal fade" id="deleteButton" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/customer?action=removeCustomer" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Deleting</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure about that? Delete <span id="removeCustomerName"></span>
                    <input type="hidden" id="removeCustomerId" name="removeCustomerId">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- Modal notice -->
<div class="modal fade" id="noticeMessage" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content rounded-3 shadow">
            <div class="modal-header">
                <h5 class="modal-title">Furama 's notice</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <input type="text"  hidden id="mess" value="${message}">
                <p id="showMessage"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-success" data-bs-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>






<script src="/jquery/jquery-3.5.1.min.js"></script>
<script src="/datatables/js/jquery.dataTables.min.js"></script>
<script src="/datatables/js/dataTables.bootstrap5.min.js"></script>
<script src="/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
<script>
    <%--    onclick="showModalDelete('${customer.pId}','${customer.name}')"--%>

    function showModalDelete(deleteCustomerId, deleteCustomerName) {
        document.getElementById("removeCustomerName").innerText = deleteCustomerName;
        document.getElementById("removeCustomerId").value = deleteCustomerId;
    }

    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });

    // window.onload = function () {
    //     let mess = document.getElementById("mess").value;
    //     if (mess != null && mess  !== "") {
    //         alert(mess);
    //     }
    // }

    window.onload = function () {
        let mess = document.getElementById("mess").value;
        document.getElementById("showMessage").innerText = mess;
        if (mess != null && mess !== "") {
            $(document).ready(function () {
                $("#noticeMessage").modal("show");
            });
        }
    }

</script>

</body>
</html>