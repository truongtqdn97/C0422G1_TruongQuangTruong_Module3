<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 04/08/22
  Time: 5:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Service</title>
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/my_style/my_style.css">

</head>
<body>
<%--header--%>
<%@ include file="../layout/header.jsp" %>


<%--nav bar--%>
<%@ include file="../layout/navbar.jsp" %>


<div class="container" style="margin-top: 20px">
    <div class="row">
        <div class="col-md-12">
            <table class="table">
                <thead>
                <tr class="table-dark">
                    <th scope="col">#</th>
                    <th scope="col">Service</th>
                    <th scope="col">Customer</th>
                    <th scope="col">Start Date</th>
                    <th scope="col">End Date</th>
                    <th scope="col">Deposit</th>
                    <th scope="col">Total money</th>
                    <th scope="col" colspan="2" style="text-align: center">Attached Service</th>
                </tr>
                </thead>
                <tbody>
                <tr class="table-light">
                    <th scope="row">1</th>
                    <td>Mark</td>
                    <td>Otto</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>@mdo</td>
                    <td>
                        <!-- Button trigger modal -->
                        <button type="button"
                                class="btn btn-outline-secondary"
                                data-bs-toggle="modal"
                                data-bs-target="#addService">
                            <img src="/img/plus.png"
                                 style="height: 25px;width: auto">
                        </button>
                    </td>
                    <td>
                        <!-- Button trigger modal -->
                        <button type="button"
                                class="btn btn-outline-secondary"
                                data-bs-toggle="modal"
                                data-bs-target="#attachedService">
                            Attached Service List
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>


<!--modal add service-->
<form method="post">
    <div class="modal fade" id="addService" tabindex="-1" aria-labelledby="addServiceLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addServiceLabel">Add Attach Service</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <table class="table table-success table-striped table-hover">
                        <tr>
                            <th>Name</th>
                            <th>Unit</th>
                            <th>Cost</th>
                            <th>Quantity</th>
                        </tr>
                        <tr>
                            <td>Karaoke</td>
                            <td>Hour</td>
                            <td>10000</td>
                            <td><input class="form-control" type="text" name="karaokeQuantity"></td>
                        </tr>
                        <tr>
                            <td>Motorbike</td>
                            <td>pcs</td>
                            <td>10000</td>
                            <td><input class="form-control" type="text" name="motorbikeQuantity"></td>
                        </tr>
                        <tr>
                            <td>Bicycle</td>
                            <td>pcs</td>
                            <td>20000</td>
                            <td><input class="form-control" type="text" name="bicycleQuantity"></td>
                        </tr>
                        <tr>
                            <td>Breakfast</td>
                            <td>Meal</td>
                            <td>15000</td>
                            <td><input class="form-control" type="text" name="breakfastQuantity"></td>
                        </tr>
                        <tr>
                            <td>Lunch</td>
                            <td>Meal</td>
                            <td>9000</td>
                            <td><input class="form-control" type="text" name="lunchQuantity"></td>
                        </tr>
                        <tr>
                            <td>Dinner</td>
                            <td>pcs</td>
                            <td>16000</td>
                            <td><input class="form-control" type="text" name="dinnerQuantity"></td>
                        </tr>
                    </table>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary">Add</button>
                </div>
            </div>
        </div>
    </div>
</form>



<%--modal see attach service--%>
<div class="modal fade" id="attachedService" tabindex="-1" aria-labelledby="attachedServiceLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="attachedServiceLabel">Attached Service List</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table table-success table-striped table-hover">
                    <tr>
                        <th>Name</th>
                        <th>Unit</th>
                        <th>Cost</th>
                        <th>Quantity</th>
                    </tr>
                    <tr>
                        <td>Karaoke</td>
                        <td>Hour</td>
                        <td>10000</td>
                        <td>10</td>
                    </tr>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
            </div>
        </div>
    </div>
</div>


<script src="/bootstrap-5.1.3-dist/js/bootstrap.min.js"></script>
</body>
</html>
