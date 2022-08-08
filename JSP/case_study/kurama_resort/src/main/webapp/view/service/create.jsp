<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 04/08/22
  Time: 10:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Service</title>
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/my_style/my_style.css">

</head>
<body>

<%--header--%>
<%@ include file = "../layout/header.jsp" %>

<%--nav bar--%>
<%@ include file = "../layout/navbar.jsp" %>




<div class="container d-flex justify-content-md-center" style="margin-top: 20px">
    <div class="row">
        <div class="col-md-12 bg-light info">
            <form method="post">
                <fieldset>
                    <legend style="text-align: center">Service Information</legend>
                    <table>

                        <tr>
                            <td>Name</td>
                            <td><input type="text" name="name" id="name" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Area</td>
                            <td><input type="text" name="area" id="area" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Cost</td>
                            <td><input type="number" name="cost" id="cost" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Max people</td>
                            <td><input type="number" name="maxPeople" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Rental type</td>
                            <td>
                                <select name="rentType" id="rentType" class="form-select">
                                    <option value="">-Select Rental Type-</option>
                                    <option value="1">Year</option>
                                    <option value="2">Month</option>
                                    <option value="3">Day</option>
                                    <option value="4">Hour</option>
                                </select>
                            </td>
                        </tr>


                        <tr>
                            <td>Service 's Type</td>
                            <td>
                                <select name="facilityType" id="serviceType" onchange="selectServiceType(this)" class="form-select">
                                    <option value="">-Select Service 's Type-</option>
                                    <option value="1">Villa</option>
                                    <option value="2">House</option>
                                    <option value="3">Room</option>
                                </select>
                            </td>
                        </tr>


                        <tr id="standardRoom" style="display: none">
                            <td>Standard Room</td>
                            <td><input type="text" name="standardRoom" class="form-control"></td>
                        </tr>
                        <tr id="descriptionOtherConvenience" style="display: none">
                            <td>Description Other Convenience</td>
                            <td><input type="text" name="descriptionOtherConvenience" class="form-control"></td>
                        </tr>
                        <tr id="poolArea" style="display: none">
                            <td>Pool 's Area</td>
                            <td><input type="text" name="poolArea" class="form-control"></td>
                        </tr>
                        <tr id="numberOfFloors" style="display: none">
                            <td>Number of Floors</td>
                            <td><input type="text" name="numberOfFloors" class="form-control"></td>
                        </tr>
                        <tr id="facilityFree" style="display: none">
                            <td>Facility Free</td>
                            <td><input type="text" name="facilityFree" class="form-control"></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><input type="submit" value="Create new Service" class=" btn-success"></td>
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
</script>
<script src="../bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</body>
</html>
