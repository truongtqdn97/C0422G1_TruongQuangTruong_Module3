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
    <link rel="stylesheet" href="bootstrap-5.1.3-dist/my_style/my_style.css">

</head>
<body>


<%--header--%>
<%@ include file="./view/layout/header.jsp" %>

<%--nav bar--%>
<%@ include file="./view/layout/navbar.jsp" %>




<!-- home section starts  -->

<section class="home" id="home">

    <div class="carousel slide home-slider" id="carouselExampleControls"  data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="box " style="background: url('/img/home-bg-1.jpg') no-repeat;">
                    <div class="content">
                        <span>Never Stop</span>
                        <h3><strong>Exploring</strong></h3>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit unde ex molestias soluta consequatur saepe aliquam, excepturi delectus consequuntur minus!</p>
                        <a href="/service" class="btn2 text-light">Get Started</a>
                    </div>
                </div>
            </div>

            <div class="carousel-item">
                <div class="box d-flex justify-content-start" style="background: url('/img/home-bg-2.jpg') no-repeat;">
                    <div class="content">
                        <span>Make Tour</span>
                        <h3>Amazing</h3>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit unde ex molestias soluta consequatur saepe aliquam, excepturi delectus consequuntur minus!</p>
                        <a href="/service" class="btn2 text-light">Get Started</a>
                    </div>
                </div>
            </div>

            <div class="carousel-item">
                <div class="box" style="background: url('/img/home-bg-3.jpg') no-repeat;">
                    <div class="content">
                        <span>Explore The</span>
                        <h3>New World At Furama</h3>
                        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Impedit unde ex molestias soluta consequatur saepe aliquam, excepturi delectus consequuntur minus!</p>
                        <a href="/service" class="btn2">Get Started</a>
                    </div>
                </div>
            </div>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

</section>


<%--footer--%>
<%@ include file="./view/layout/footer.jsp" %>
<!-- End of .container -->

<script src="bootstrap-5.1.3-dist/js/script.js"></script>
<script src="bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</body>
</html>
