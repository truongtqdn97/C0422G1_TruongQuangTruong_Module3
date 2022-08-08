<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 04/08/22
  Time: 5:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Service</title>
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
            <a href="/service?action=create" class="btn btn-success">Add new Service</a>
        </div>
        <div class="col-md-3">
            <form>
                <input type="text" hidden id="mess" value="${message}">
            </form>
        </div>

        <div class="col-md-6 d-flex justify-content-end">
            <nav>
                <div class="container-fluid">
                    <form action="/service?action=search" method="post" class="d-flex">
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
            <table class="table">
                <thead>
                <tr class="table-dark">
                    <th scope="col">#</th>
                    <th scope="col">Name</th>
                    <th scope="col">Area</th>
                    <th scope="col">Cost</th>
                    <th scope="col">Max people</th>
                    <th scope="col">Rental Type</th>
                    <th scope="col">Facility Type</th>
                    <th scope="col" style="text-align: right">Action</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${facilityList}" var="facility" varStatus="status">
                    <tr class="table-light">

                        <td>${status.count}</td>
                        <td>${facility.name}</td>
                        <td>${facility.area}</td>
                        <td>${facility.cost}</td>
                        <td>${facility.maxPeople}</td>
                        <td>
                            <c:forEach items="${rentTypeList}" var="rentType">
                                <c:if test="${facility.rentTypeId==rentType.rentTypeId}">
                                    ${rentType.rentTypeName}
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <c:forEach items="${facilityTypeList}" var="facilityType">
                                <c:if test="${facility.facilityTypeId==facilityType.facilityTypeId}">
                                    ${facilityType.facilityTypeName}
                                </c:if>
                            </c:forEach>
                        </td>
                        <td>
                            <!-- Button trigger modal -->
                            <button type="button"
                                    class="btn">
                                <a href="/service?action=update&fId=${facility.facilityId}">
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
                                    onclick="showModalDeleteService('${facility.facilityId}','${facility.name}')">
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
        <form action="/service?action=remove" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Deleting</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Delete <span id="removeServiceName"></span>
                    <input type="hidden" id="removeServiceId" name="removeServiceId">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-danger">Delete</button>
                </div>
            </div>
        </form>
    </div>
</div>


<script src="/jquery/jquery-3.5.1.min.js"></script>
<script src="/datatables/js/jquery.dataTables.min.js"></script>
<script src="/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
<script>
    <%--    onclick="showModalDelete('${customer.pId}','${customer.name}')"--%>

    function showModalDeleteService(deleteServiceId, deleteServiceName) {
        document.getElementById("removeServiceName").innerText = deleteServiceName;
        document.getElementById("removeServiceId").value = deleteServiceId;
    }

    $(document).ready(function () {
        $('#tableCustomer').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });


    window.onload = function () {
        let mess = document.getElementById("mess").value;
        if (mess != null && mess !== "") {
            alert(mess);
        }
    }

</script>
</body>
</html>
