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
<%@ include file="../layout/header.jsp" %>

<%--nav bar--%>
<%@ include file="../layout/navbar.jsp" %>


<div class="container d-flex justify-content-md-center" style="margin-top: 20px">
    <div class="row">
        <div class="col-md-12 bg-light info">
            <form method="post">
                <fieldset>
                    <legend style="text-align: center">Contract Information</legend>
                    <table>
                        <tr>
                            <td>Start Date</td>
                            <td><input type="date" name="startDate" id="startDate" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>End Date</td>
                            <td><input type="date" name="endDate" id="endDate" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Deposit</td>
                            <td><input type="number" name="deposit" id="deposit" class="form-control"></td>
                        </tr>
                        <tr>
                            <td>Total Money</td>
                            <td><input readonly
                                       type="number"
                                       name="totalMoney"
                                       class="form-control" id="totalMoney"></td>
                        </tr>
                        <tr>
                            <td>Customer rent Service</td>
                            <td>
                                <select name="customer" id="customer" class="form-select">
                                    <option value="">-Select Rental Type-</option>
                                    <option value="customer.id">customer.name</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Service 's Type</td>
                            <td>
                                <select name="serviceType" id="serviceType"
                                        class="form-select">
                                    <option value="">-Select Service 's Type-</option>
                                    <option value="villa">Villa</option>
                                    <option value="house">House</option>
                                    <option value="room">Room</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Attached Service</td>
                            <td>
                                <button type="button"
                                        data-bs-toggle="modal" data-bs-target="#attachedService"
                                        class="btn btn-outline-secondary">
                                    <img src="/img/plus.png"
                                         style="width: auto; height: 25px">
                                </button>
                            </td>
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

<%--modal see attach service--%>
<form method="post">
    <div class="modal fade" id="attachedService" tabindex="-1" aria-labelledby="attachedServiceLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="attachedServiceLabel">Attached Service List</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <table class="table table-borderless">
                        <tr>
                            <td><input type="checkbox" name="karaoke" value="karaoke"> Karaoke</td>
                            <td><input type="checkbox" name="motorbike" value="motorbike"> Motorbike</td>
                            <td><input type="checkbox" name="bicycle" value="bicycle"> Bicycle</td>
                        </tr>
                        <tr>
                            <td><input type="checkbox" name="breakfast" value="breakfast"> Breakfast</td>
                            <td><input type="checkbox" name="lunch" value="lunch"> Lunch</td>
                            <td><input type="checkbox" name="dinner" value="dinner"> Dinner</td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">OK</button>
                </div>
            </div>
        </div>
    </div>
</form>

<script>

</script>
<script src="../bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</body>
</html>
