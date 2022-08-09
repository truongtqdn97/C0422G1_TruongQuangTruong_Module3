<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>Edit Service</title>
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/my_style/my_style.css">

</head>
<body>
<%--header--%>
<%@ include file="../layout/header.jsp" %>


<%--nav bar--%>
<%@ include file="../layout/navbar.jsp" %>


<div class="container d-flex justify-content-md-center" style="margin-top: 20px">
    <div class="row">
        <div class="col-md-12 bg-light info">
            <form method="post">
                <fieldset>
                    <legend style="text-align: center">Edit Service Information</legend>
                    <table>

                        <tr>
                            <td>Name</td>
                            <td><input type="text" name="name"
                                       id="name" class="form-control"
                                       value="${facility.name}"></td>
                        </tr>
                        <tr>
                            <td>Area</td>
                            <td><input type="text" name="area"
                                       id="area" class="form-control"
                                       value="${facility.area}"></td>
                        </tr>
                        <tr>
                            <td>Cost</td>
                            <td><input type="number" name="cost"
                                       id="cost" class="form-control"
                                       value="${facility.cost}"></td>
                        </tr>
                        <tr>
                            <td>Max people</td>
                            <td><input type="number" name="maxPeople"
                                       class="form-control"
                                       value="${facility.maxPeople}"></td>
                        </tr>
                        <tr>
                            <td>Rental type</td>
                            <td>
                                <select name="rentType" id="rentType" class="form-select">
                                    <c:forEach items="${rentTypeList}" var="rentType">
                                        <c:choose>
                                            <c:when test="${rentType.rentTypeId==facility.rentTypeId}">
                                                <option value="${facility.rentTypeId}"
                                                        selected>${rentType.rentTypeName}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${rentType.rentTypeId}">${rentType.rentTypeName}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>


                        <tr>
                            <td>Service 's Type</td>
                            <td>
                                <select name="facilityType" id="serviceType" onchange="selectServiceType(this)"
                                        class="form-select">
                                    <c:forEach items="${facilityTypeList}" var="facilityType">
                                        <c:choose>
                                            <c:when test="${facilityType.facilityTypeId==facility.facilityTypeId}">
                                                <option value="${facilityType.facilityTypeId}"
                                                        selected>${facilityType.facilityTypeName}</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option value="${facilityType.facilityTypeId}">${facilityType.facilityTypeName}</option>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>


                        <tr id="standardRoom" style="display: none">
                            <td>Standard Room</td>
                            <td><input type="text" name="standardRoom"
                                       class="form-control"
                                       value="${facility.standardRoom}"></td>
                        </tr>
                        <tr id="descriptionOtherConvenience" style="display: none">
                            <td>Description Other Convenience</td>
                            <td><input type="text" name="descriptionOtherConvenience"
                                       class="form-control"
                                       value="${facility.descriptionOtherConvenience}"></td>
                        </tr>
                        <tr id="poolArea" style="display: none">
                            <td>Pool 's Area</td>
                            <td><input type="text" name="poolArea"
                                       class="form-control"
                                       value="${facility.poolArea}"></td>
                        </tr>
                        <tr id="numberOfFloors" style="display: none">
                            <td>Number of Floors</td>
                            <td><input type="text" name="numberOfFloors"
                                       class="form-control"
                                       value="${facility.numberOfFloors}"></td>
                        </tr>
                        <tr id="facilityFree" style="display: none">
                            <td>Facility Free</td>
                            <td><input type="text" name="facilityFree"
                                       class="form-control"
                                       value="${facility.facilityFree}"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Update Service" class="btn btn-success"></td>
                        </tr>
                    </table>
                </fieldset>
            </form>
        </div>
    </div>
</div>

<script>
    function selectServiceType(type) {
        let selectType = type.value;
        switch (selectType) {
            case "1":
                document.getElementById("standardRoom").style.display = "table-row";
                document.getElementById("descriptionOtherConvenience").style.display = "table-row";
                document.getElementById("poolArea").style.display = "table-row";
                document.getElementById("numberOfFloors").style.display = "table-row";
                document.getElementById("facilityFree").style.display = "none";
                break;
            case "2":
                document.getElementById("standardRoom").style.display = "table-row";
                document.getElementById("descriptionOtherConvenience").style.display = "table-row";
                document.getElementById("poolArea").style.display = "none";
                document.getElementById("numberOfFloors").style.display = "table-row";
                document.getElementById("facilityFree").style.display = "none";
                break;
            case "3":
                document.getElementById("standardRoom").style.display = "none";
                document.getElementById("descriptionOtherConvenience").style.display = "none";
                document.getElementById("poolArea").style.display = "none";
                document.getElementById("numberOfFloors").style.display = "none";
                document.getElementById("facilityFree").style.display = "table-row";
                break;
            default:
                document.getElementById("standardRoom").style.display = "none";
                document.getElementById("descriptionOtherConvenience").style.display = "none";
                document.getElementById("poolArea").style.display = "none";
                document.getElementById("numberOfFloors").style.display = "none";
                document.getElementById("facilityFree").style.display = "none";
        }
    }

    window.onload = function () {
        if (document.getElementById("serviceType").value == 1) {
            document.getElementById("standardRoom").style.display = "table-row";
            document.getElementById("descriptionOtherConvenience").style.display = "table-row";
            document.getElementById("poolArea").style.display = "table-row";
            document.getElementById("numberOfFloors").style.display = "table-row";
            document.getElementById("facilityFree").style.display = "none";
        }
        if (document.getElementById("serviceType").value == 2) {


            document.getElementById("standardRoom").style.display = "table-row";
            document.getElementById("descriptionOtherConvenience").style.display = "table-row";
            document.getElementById("poolArea").style.display = "none";
            document.getElementById("numberOfFloors").style.display = "table-row";
            document.getElementById("facilityFree").style.display = "none";
        }
        if (document.getElementById("serviceType").value == 3) {
            document.getElementById("standardRoom").style.display = "none";
            document.getElementById("descriptionOtherConvenience").style.display = "none";
            document.getElementById("poolArea").style.display = "none";
            document.getElementById("numberOfFloors").style.display = "none";
            document.getElementById("facilityFree").style.display = "table-row";
        }
    }
</script>
<script src="../bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</body>
</html>
