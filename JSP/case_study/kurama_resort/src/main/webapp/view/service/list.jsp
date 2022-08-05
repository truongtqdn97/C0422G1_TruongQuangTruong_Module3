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
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/my_style/my_style.css">

</head>
<body style="background-size: 100%;
background-image: url('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b3be1dae-3caa-4d45-be6c-3de586ba95e2/dejj5ue-61a65792-72fb-409c-9eb7-2a8fe8f5685e.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2IzYmUxZGFlLTNjYWEtNGQ0NS1iZTZjLTNkZTU4NmJhOTVlMlwvZGVqajV1ZS02MWE2NTc5Mi03MmZiLTQwOWMtOWViNy0yYThmZThmNTY4NWUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.m_WTf7biDkbAUwKtsG_dFqvorFYK6HaPf14r0cFlPO0')">
<%--header--%>
<%@ include file="../layout/header.jsp" %>


<%--nav bar--%>
<%@ include file="../layout/navbar.jsp" %>


<div class="container" style="margin-top: 20px">
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
                    <th scope="col">Max people</th>
                    <th scope="col">Rental Type</th>
                    <th scope="col" colspan="2" style="text-align: center">Action</th>
                </tr>
                </thead>
                <tbody>
                <tr class="table-light">
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>
                        <!-- Button trigger modal -->
                        <button type="button"
                                class="btn"
                                data-bs-toggle="modal"
                                data-bs-target="#editButton">
                            <img src="/img/edit-2.png"
                                 style="height: 25px;width: auto">
                        </button>
                    </td>
                    <td class="btn-delete">
                        <!-- Button trigger modal -->
                        <button type="button"
                                class="btn"
                                data-bs-toggle="modal"
                                data-bs-target="#deleteButton">
                            <img src="/img/delete.png"
                                 style="height: 25px;width: auto">
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!--modal delete-->
<div class="modal fade" id="deleteButton" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Deleting</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Are you sure about that?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger">Delete</button>
            </div>
        </div>
    </div>
</div>




<script src="/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</body>
</html>
