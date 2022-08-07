<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 05/08/22
  Time: 3:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Customer Manager</title>
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/my_style/my_style.css">
</head>
<body>
<%--header--%>
<%@ include file="../layout/header.jsp" %>


<%--nav bar--%>
<%@ include file="../layout/navbar.jsp" %>

<div class="container d-flex justify-content-md-center mb-5" style="margin-top: 20px">
    <div class="row">
        <div class="col-md-12 bg-light info">
            <form method="post">
                <fieldset>
                    <legend style="text-align: center">Customer Information</legend>
                    <table>
                        <tr>
                            <td>Name</td>
                            <td><input type="text" name="name" id="name" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Birthday</td>
                            <td><input type="date" name="birthday" id="area" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Gender</td>
                            <td>
                                <select name="gender" id="gender" class="form-select">
                                    <option value="1">Male</option>
                                    <option value="0">Female</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Identify Card</td>
                            <td><input type="text" name="idCard" class="form-control"></td>
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
                            <td>Address</td>
                            <td><input type="text" name="address" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Customer Type</td>
                            <td>
                                <select name="customerType" class="form-select">
                                    <option value="5">-Select Customer 's Type-</option>
                                    <option value="1">Diamond</option>
                                    <option value="2">Platinum</option>
                                    <option value="3">Gold</option>
                                    <option value="4">Silver</option>
                                    <option value="5">Member</option>
                                </select>
                            </td>
                        </tr>
<%--                        <tr>--%>
<%--                            <td>Rental Type</td>--%>
<%--                            <td>--%>
<%--                                <select name="rentalType" id="rentalType" class="form-select"--%>
<%--                                        onchange="selectRentalType(this.value)">--%>
<%--                                    <option value="">-Select Service-</option>--%>
<%--                                    <option value="1">Villa</option>--%>
<%--                                    <option value="2">House</option>--%>
<%--                                    <option value="3">Room</option>--%>
<%--                                </select>--%>
<%--                            </td>--%>
<%--                        </tr>--%>
<%--                        <tr id="contracId" style="display:none;">--%>
<%--                            <td>Contract ID</td>--%>
<%--                            <td><input type="text" name="contracId" class="form-control"></td>--%>
<%--                        </tr>--%>
<%--                        <tr id="startDate" style="display: none">--%>
<%--                            <td>Start Date</td>--%>
<%--                            <td><input type="date" name="startDate" class="form-control"></td>--%>
<%--                        </tr>--%>
<%--                        <tr id="endDate" style="display: none">--%>
<%--                            <td>End Date</td>--%>
<%--                            <td><input type="date" name="endDate" class="form-control"></td>--%>
<%--                        </tr>--%>
<%--                        <tr id="deposit" style="display: none">--%>
<%--                            <td>Deposit</td>--%>
<%--                            <td><input type="number" name="deposit" class="form-control"></td>--%>
<%--                        </tr>--%>
<%--                        <tr id="totalMoney" style="display: none">--%>
<%--                            <td>Total Money</td>--%>
<%--                            <td><input type="number" name="totalMoney" class="form-control"></td>--%>
<%--                        </tr>--%>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Create new Customer" class=" btn-success"></td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
    </div>
</div>


<%--<script>--%>
<%--    function selectRentalType(value) {--%>
<%--        switch (value) {--%>
<%--            case "1":--%>
<%--            case "2":--%>
<%--                document.getElementById("contracId").style.display = "table-row";--%>
<%--                document.getElementById("startDate").style.display = "table-row";--%>
<%--                document.getElementById("endDate").style.display = "table-row";--%>
<%--                document.getElementById("deposit").style.display = "table-row";--%>
<%--                document.getElementById("totalMoney").style.display = "table-row";--%>
<%--                break;--%>
<%--            default:--%>
<%--                document.getElementById("contracId").style.display = "none";--%>
<%--                document.getElementById("startDate").style.display = "none";--%>
<%--                document.getElementById("endDate").style.display = "none";--%>
<%--                document.getElementById("deposit").style.display = "none";--%>
<%--                document.getElementById("totalMoney").style.display = "none";--%>
<%--                break;--%>
<%--        }--%>
<%--    }--%>
<%--</script>--%>
<script src="/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</body>
</html>
