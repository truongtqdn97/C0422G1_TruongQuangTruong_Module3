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
    <style>
        body{
            font-family: "UTM Caviar";
            background-size: 100%;
            background-image: url('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b3be1dae-3caa-4d45-be6c-3de586ba95e2/dejj5ue-61a65792-72fb-409c-9eb7-2a8fe8f5685e.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2IzYmUxZGFlLTNjYWEtNGQ0NS1iZTZjLTNkZTU4NmJhOTVlMlwvZGVqajV1ZS02MWE2NTc5Mi03MmZiLTQwOWMtOWViNy0yYThmZThmNTY4NWUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.m_WTf7biDkbAUwKtsG_dFqvorFYK6HaPf14r0cFlPO0');
            /*background-image: url("/img/cool-background(1).png");*/
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
        table{
            border-radius: 1em;
            overflow: hidden;
        }
    </style>
</head>
<body style="background-size: 100%;
background-image: url('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b3be1dae-3caa-4d45-be6c-3de586ba95e2/dejj5ue-61a65792-72fb-409c-9eb7-2a8fe8f5685e.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2IzYmUxZGFlLTNjYWEtNGQ0NS1iZTZjLTNkZTU4NmJhOTVlMlwvZGVqajV1ZS02MWE2NTc5Mi03MmZiLTQwOWMtOWViNy0yYThmZThmNTY4NWUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.m_WTf7biDkbAUwKtsG_dFqvorFYK6HaPf14r0cFlPO0')">

<%--header--%>
<div class="container" style="margin-top: 20px">
    <div class="row">
        <div class="col-md-6">
            <img src="/img/icons8-traveler-100.png">
        </div>
        <div class="col-md-6 d-flex justify-content-md-end align-items-md-center">
            <p class="text-light">Tên người đăng nhập</p>
            <!--            chỉnh sửa sau-->
        </div>
    </div>
</div>

<%--nav bar--%>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <nav class="navbar navbar-expand-lg navbar-light">
                <div class="container-fluid">
                    <a class="navbar-brand text-light" href="#">Furama</a>
                    <button class="navbar-toggler border-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active text-light" aria-current="page" href="#">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-light" href="#">Employee</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link text-light" href="#">Customer</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdownService" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Service
                                </a>
                                <ul class="dropdown-menu bg-light" aria-labelledby="navbarDropdownService">
                                    <li><a class="dropdown-item " href="#">List Service</a></li>
                                    <li><a class="dropdown-item " href="#">Add Service</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdownContract" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Contract
                                </a>
                                <ul class="dropdown-menu bg-light"  aria-labelledby="navbarDropdownContract">
                                    <li><a class="dropdown-item " href="#">List Contract</a></li>
                                    <li><a class="dropdown-item " href="#">Add Contract</a></li>
                                </ul>
                            </li>
                        </ul>
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-light" type="submit">Search</button>
                        </form>
                    </div>
                </div>
            </nav>
        </div>
    </div>
</div>

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
                                data-bs-target="#exampleEdit">
<%--    data-bs-target="#exampleModal${service.id}">--%>
                            <img src="/img/edit-2.png"
                                 style="height: 25px;width: auto">
                        </button>
                    </td>
                    <td class="btn-delete">
                        <!-- Button trigger modal -->
                        <button type="button"
                                class="btn"
                                data-bs-toggle="modal"
                                data-bs-target="#exampleDelete">
<%--data-bs-target="#exampleModal${service.id}">--%>
                            <img src="/img/delete.png"
                                 style="height: 25px;width: auto">
                        </button>
                    </td>
                </tr>
                <tr class="table-light">
                    <th scope="row">2</th>
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
                                data-bs-target="#exampleModal${service.id}">
                            <img src="../img/edit-2.png"
                                 style="height: 25px;width: auto">
                        </button>
                    </td>
                    <td class="btn-delete">
                        <!-- Button trigger modal -->
                        <button type="button"
                                class="btn"
                                data-bs-toggle="modal"
                                data-bs-target="#exampleModal${service.id}">
                            <img src="../img/delete.png"
                                 style="height: 25px;width: auto">
                        </button>
                    </td>
                </tr>
                <tr class="table-light">
                    <th scope="row">3</th>
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
                                data-bs-target="#exampleModal${service.id}">
                            <img src="../img/edit-2.png"
                                 style="height: 25px;width: auto">
                        </button>
                    </td>
                    <td class="btn-delete">
                        <!-- Button trigger modal -->
                        <button type="button"
                                class="btn"
                                data-bs-toggle="modal"
                                data-bs-target="#exampleModal${service.id}">
                            <img src="../img/delete.png"
                                 style="height: 25px;width: auto">
                        </button>
                    </td>
                </tr>
                <tr class="table-light">
                    <th scope="row">4</th>
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
                                data-bs-target="#exampleModal${service.id}">
                            <img src="../img/edit-2.png"
                                 style="height: 25px;width: auto">
                        </button>
                    </td>
                    <td class="btn-delete">
                        <!-- Button trigger modal -->
                        <button type="button"
                                class="btn"
                                data-bs-toggle="modal"
                                data-bs-target="#exampleModal${service.id}">
                            <img src="../img/delete.png"
                                 style="height: 25px;width: auto">
                        </button>
                    </td>
                </tr>
                <tr class="table-light">
                    <th scope="row">5</th>
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
                                data-bs-target="#exampleModal${service.id}">
                            <img src="/img/edit-2.png"
                                 style="height: 25px;width: auto">
                        </button>
                    </td>
                    <td class="btn-delete">
                        <!-- Button trigger modal -->
                        <button type="button"
                                class="btn"
                                data-bs-toggle="modal"
                                data-bs-target="#exampleModal${service.id}">
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

<!-- Modal       id="exampleModal${service.id}"    -->
<!--Modal edit-->
<div class="modal fade" id="exampleEdit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
<%--                    <a href="/products?action=delete&id=${product.id}" class="text-light" style="text-decoration: none">--%>
<%--                        Delete--%>
<%--                    </a>--%>
                </button>
            </div>
        </div>
    </div>
</div>

<!--modal delete-->
<div class="modal fade"
     id="exampleDelete"
     tabindex="-1" aria-labelledby="exampleModalLabelDel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabelDel">Deleting...</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">

                Are you sure about that?
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary">
<%--                    <a href="/products?action=delete&id=${product.id}" class="text-light" style="text-decoration: none">--%>
<%--                        Delete--%>
<%--                    </a>--%>
                </button>
            </div>
        </div>
    </div>
</div>



<script src="../bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</body>
</html>
