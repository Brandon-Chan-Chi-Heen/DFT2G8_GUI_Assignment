<%-- 
    Document   : index
    Created on : Apr 6, 2022, 11:47:20 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*, Models.*,java.text.SimpleDateFormat"%>
<% List<Orders> ordersList = (List<Orders>) session.getAttribute("ordersList");%>

<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dash Board</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="index.css" type="text/css" rel="stylesheet">
        <link href="<%= request.getContextPath()%>/backend/index.css" type="text/css" rel="stylesheet">
    </head>

    <body class="bg-dark">

        <%@ include file="../adminsidebar.jsp"%>
        <section class="text-white">
            <h1>Dash Board</h1>

            <div class="container my-3">
                <div class="row">
                    <form action="<%= request.getContextPath() %>/SearchOrders" method="post">
                        <label for="search-order-by">Search By:</label>
                        <select name="search-order-by" id="search-order-by">
                            <option value="orderId">Order ID</option>
                            <option value="orderDate">Order Date</option>
                            <option value="status">Status</option>
                        </select>
                        <label for="search-order-key">Keyword</label>
                        <input type="text" name="search-order-key" id="keyword">
                        <!--                    <input type="date" name="search-order-key" id="keyword">-->
                        <input type="submit" value="Search">
                        <input type="reset" value="Clear" id="reset">
                    </form>

                </div>
                <a href="./RetrieveOrders" class="btn btn-outline-dark">List All</a>
                <table class="table table-hover table-bordered">
                    <tr class="table-dark" style="text-align:center;">
                        <td>Order ID</td>
                        <td>Customer ID</td>
                        <td>Customer Name</td>
                        <td>Total Amount</td>
                        <td>Shipping Address</td>
                        <td>Order Date</td>
                        <td>Status</td>
                        <td>Edit Status</td>
                    </tr>

                    <%                        if (ordersList == null || ordersList.size() == 0) {
                    %>
                    <tr style="text-align:center;"><td colspan="8">No item(s) found!</td></tr>
                    <%
                    } else {
                        SimpleDateFormat ft = new SimpleDateFormat("dd-MM-yyyy");
                        for (int i = 0; i < ordersList.size(); i++) {
                            Orders order = ordersList.get(i);
                            Customers customer = order.getCustomerId();
                    %>
                    <tr>
                        <td><%= order.getOrderId()%></td>
                        <td><%= customer.getCustomerId()%></td>
                        <td><%= customer.getFullname()%></td>
                        <td><%= order.getTotalAmount()%></td>
                        <td><%= order.getShippingAddress()%></td>
                        <td><%= ft.format(order.getOrderDate())%></td>
                        <td><%= order.getStatus()%></td>
                        <td><button class="btn btn-outline-dark edit"><i class="fa-solid fa-pen-to-square"></i></button></td>
                    </tr>

                    <% }
                        }%>
                </table>
            </div>



            <div class="modal" tabindex="-1" id="edit-modal">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Edit Status</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <form action="./UpdateOrderStatus" method="post">
                            <div class="modal-body">

                                <div class="form-floating my-1">
                                    <input type="text" class="form-control" name="id" id="orderId" placeholder="Order ID" value="" readonly>
                                    <label>Order ID</label>

                                </div>
                                <label>Update Status:</label><br>
                                <div class="row row-cols-3 mt-2">
                                    <div class="col">
                                        <input type="radio" class="status" name="status" id="packaging" value="packaging">
                                        <label for="packaging">Packaging</label>
                                    </div>
                                    <div class="col">
                                        <input type="radio" class="status" name="status" id="shipping" value="shipping">
                                        <label for="shipping">Shipping</label>
                                    </div>
                                    <div class="col">
                                        <input type="radio" class="status" name="status" id="delivered" value="delivered">
                                        <label for="delivered">Delivered</label>
                                    </div>

                                </div>



                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save changes</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
    </body>
    <script>
        $(document).ready(function () {

            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }

            $('.edit').on('click', function () {
                $('#edit-modal').modal('show');
                $tr = $(this).closest('tr');
                var data = $tr.children('td').map(function () {
                    return $(this).text();
                }).get();

                console.log(data);
                $('#orderId').val(data[0]);
                $('#' + data[6]).attr('checked', true);
            });
            $("#search-order-by option[value='${sessionScope.searchOrder}']").attr('selected', true);

            var key = "${sessionScope.searchOrderKey}";
            $("#keyword").val(key);


        });

    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</section>
</body>

</html>