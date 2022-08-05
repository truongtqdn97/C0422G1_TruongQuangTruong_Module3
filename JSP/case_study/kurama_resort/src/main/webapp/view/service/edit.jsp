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
                                <select name="rentalType" id="rentalType" class="form-select">
                                    <option value="">-Select Rental Type-</option>
                                    <option value="year">Year</option>
                                    <option value="month">Month</option>
                                    <option value="day">Day</option>
                                    <option value="hour">Hour</option>
                                </select>
                            </td>
                        </tr>


                        <tr>
                            <td>Service 's Type</td>
                            <td>
                                <select name="serviceType" id="serviceType" onchange="selectServiceType(this)" class="form-control">
                                    <option value="">-Select Service 's Type-</option>
                                    <option value="villa">Villa</option>
                                    <option value="house">House</option>
                                    <option value="room">Room</option>
                                </select>
                            </td>
                        </tr>


                        <tr id="standardRoom" style="display: none">
                            <td>Standard Room</td>
                            <td><input type="text" name="standardRoom" class="form-control"></td>
                        </tr>
                        <tr id="descriptionOtherConvenience" style="display: none">
                            <td>Description Other Convenience</td>
                            <td><input type="text" name="description_other_convenience" class="form-control"></td>
                        </tr>
                        <tr id="poolArea" style="display: none">
                            <td>Pool 's Area</td>
                            <td><input type="text" name="pool_area" class="form-control"></td>
                        </tr>
                        <tr id="number_of_floors" style="display: none">
                            <td>Number of Floors</td>
                            <td><input type="text" name="number_of_floors" class="form-control"></td>
                        </tr>
                        <tr id="facility_free" style="display: none">
                            <td>Facility Free</td>
                            <td><input type="text" name="facility_free" class="form-control"></td>
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
            case "villa":
                document.getElementById("standardRoom").style.display = "table-row";
                document.getElementById("descriptionOtherConvenience").style.display = "table-row";
                document.getElementById("poolArea").style.display = "table-row";
                document.getElementById("number_of_floors").style.display = "table-row";
                document.getElementById("facility_free").style.display = "none";
                break;
            case "house":
                document.getElementById("standardRoom").style.display = "table-row";
                document.getElementById("descriptionOtherConvenience").style.display = "table-row";
                document.getElementById("poolArea").style.display = "none";
                document.getElementById("number_of_floors").style.display = "table-row";
                document.getElementById("facility_free").style.display = "none";
                break;
            case "room":
                document.getElementById("standardRoom").style.display = "none";
                document.getElementById("descriptionOtherConvenience").style.display = "none";
                document.getElementById("poolArea").style.display = "none";
                document.getElementById("number_of_floors").style.display = "none";
                document.getElementById("facility_free").style.display = "table-row";
                break;
            default:
                document.getElementById("standardRoom").style.display = "none";
                document.getElementById("descriptionOtherConvenience").style.display = "none";
                document.getElementById("poolArea").style.display = "none";
                document.getElementById("number_of_floors").style.display = "none";
                document.getElementById("facility_free").style.display = "none";
        }
    }
</script>
<script src="../bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</body>
</html>
