<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 05/08/22
  Time: 12:30 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Employee</title>
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/my_style/my_style.css">

</head>
<body>
<%--header--%>
<%@ include file = "../layout/header.jsp" %>


<%--nav bar--%>
<%@ include file = "../layout/navbar.jsp" %>


<div class="container d-flex justify-content-md-center mb-5" style="margin-top: 20px">
    <div class="row">
        <div class="col-md-12 bg-light info">
            <form method="post">
                <fieldset>
                    <legend style="text-align: center">Employee Information</legend>
                    <table>
                        <tr>
                            <td>Name</td>
                            <td><input type="text" name="name" id="name" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Date Of Birth</td>
                            <td><input type="date" name="dateOfBirth" id="area" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Identify Card</td>
                            <td><input type="text" name="idCard" id="cost" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Phone Number</td>
                            <td><input type="text" name="phoneNumber" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Email</td>
                            <td><input type="text" name="email" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Education Degree</td>
                            <td><input type="text" name="educationDegreeId" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Position</td>
                            <td><input type="text" name="position" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Salary</td>
                            <td><input type="text" name="salary" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Division</td>
                            <td><input type="text" name="division" class="form-control"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Create new Employee" class=" btn-success"></td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
    </div>
</div>




<script src="../bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</body>
</html>
