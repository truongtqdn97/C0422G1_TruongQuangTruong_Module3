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
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/my_style/my_style.css">

</head>
<body>


<%--header--%>
<%@ include file="./view/layout/header.jsp" %>


<%--nav bar--%>
<%@ include file="./view/layout/navbar.jsp" %>


<%--body--%>
<div class="row" style="background-image: url('https://media1.giphy.com/media/81ibCJOlpBtnO/giphy.gif?cid=ecf05e473h1jr2juawtfwyjxkexkfjcdukdmuubijypkxb3e&rid=giphy.gif&ct=s')">
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
        <video src="https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4"
               autoplay muted loop width="100%">

        </video>
    </div>
</div>


<%--footer--%>
<%@ include file="./view/layout/footer.jsp" %>
<!-- End of .container -->


<script src="../bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</body>
</html>
