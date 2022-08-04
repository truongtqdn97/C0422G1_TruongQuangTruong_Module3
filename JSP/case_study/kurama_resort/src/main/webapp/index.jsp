<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 04/08/22
  Time: 9:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Furama Resort Danang</title>
    <link rel="stylesheet" href="bootstrap-5.1.3-dist/css/bootstrap.css">
    <style>
        body{
            font-family: "UTM Caviar";
        }
    </style>
</head>
<body style="background-size: 100%;
background-image: url('https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b3be1dae-3caa-4d45-be6c-3de586ba95e2/dejj5ue-61a65792-72fb-409c-9eb7-2a8fe8f5685e.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2IzYmUxZGFlLTNjYWEtNGQ0NS1iZTZjLTNkZTU4NmJhOTVlMlwvZGVqajV1ZS02MWE2NTc5Mi03MmZiLTQwOWMtOWViNy0yYThmZThmNTY4NWUuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.m_WTf7biDkbAUwKtsG_dFqvorFYK6HaPf14r0cFlPO0')">
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
                                    Service
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


<%--body--%>
<div class="row">
    <div class="col-md-3">
        <div class="row">
            <div class="col-md-12">
                <a href="#">Item one</a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <a href="#">Item two</a>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <a href="#">Item three</a>
            </div>
        </div>
    </div>
    <div class="col-md-9 text-light d-flex justify-content-md-center align-items-md-center">
        <p>body...</p>
    </div>
</div>


<%--footer--%>
<div class="row">
    <div class="col-md-12 d-flex justify-content-md-center">
        <p class="text-light">Footer...</p>
    </div>
</div>

<script src="../bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</body>
</html>