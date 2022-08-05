<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 05/08/22
  Time: 9:34 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/my_style/my_style.css">
</head>
<body>
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






<script src="../bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</body>
</html>
