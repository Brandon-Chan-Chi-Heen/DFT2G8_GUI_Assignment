<%-- 
    Document   : orders
    Created on : 29 Mar 2022, 9:59:16 pm
    Author     : Ng Ming Zhe
--%>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,models.*,java.text.SimpleDateFormat"%>
<% List<Orders> ordersList = (List<Orders>) session.getAttribute("ordersList");%>


<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/c6d3362a6b.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Orders</title>
        <style>
            #keyword{
                border:none;
                outline:none;
                border-bottom: 1px solid black;
                background: none;
            }
            .sort:hover{
                cursor: pointer;
            }
        </style>
    </head>
    <body>
        <div class="container my-3">
           
            <div class="row">
                <form action="./ServerSearchOrders" method="post">

                    <label for="search-order-by">Search By:</label>
                    <select name="search-order-by" id="search-order-by" class="me-5">
                        <option value="orderId">Order ID</option>
                        <option value="orderDate">Order Date</option>
                        <option value="status">Status</option>
                    </select>
                    <label for="search-order-key">Keyword:</label>
                    <input type="text" name="search-order-key" id="keyword" class="p-1">

                    <input type="submit" value="Search" class="btn btn-outline-primary">
                    <input type="reset" value="Clear" id="reset" class="btn btn-outline-danger">

                </form>

            </div>
            <a href="./ServerRetrieveOrders" class="btn btn-outline-dark my-2">List All</a>
            <table class="table table-hover table-bordered" id="mytable">
                <tr class="table-dark text-center">
                    <th class="sort">Order ID&nbsp;<i class="fa-solid fa-up-down"></i></i></th>
                    <th>Customer ID</th>
                    <th>Customer Name</th>
                    <th>Total Amount(RM)</th>
                    <th>Shipping Address</th>
                    <th>Order Date</th>
                    <th>Status</th>
                    <th>Edit Status</th>
                </tr>

                <%
                    if (ordersList == null || ordersList.size() == 0) {
                %>
                <tr style="text-align:center;"><td colspan="8">No item(s) found!</td></tr>
                <%
                } else {
                    SimpleDateFormat ft = new SimpleDateFormat("dd-MM-yyyy");%>
                <tbody id="table1">
                    <%
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
                </tbody>
            </table>
        </div>



        <div class="modal" tabindex="-1" id="edit-modal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Status</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="./ServerUpdateOrderStatus" method="post">
                        <input type="hidden" id="name_order" value="asc">
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

            var i = $('#search-order-by').find(":selected").text();
            if (i === "Order Date") {
                $('#keyword').attr('type', 'date');
            }


            $("#search-order-by").change(function () {
                var temp = $(this).find(":selected").val();
                if (temp === "orderId") {
                    $('#keyword').attr('placeholder', 'Enter Order ID to search');
                    $('#keyword').attr('type', 'text');
                } else if (temp === "orderDate") {
                    $('#keyword').attr('type', 'date');
                } else if (temp === "status") {
                    $('#keyword').attr('placeholder', 'Enter Status to search');
                    $('#keyword').attr('type', 'text');
                }

            });

            var key = "${sessionScope.searchOrderKey}";
            $("#keyword").val(key);

            $('.sort').click(function () {
                sort_name();
            });

            function sort_name() {

                var table = $('#mytable');
                var tbody = $('#table1');

                tbody.find('tr').sort(function (a, b)
                {
                    if ($('#name_order').val() == 'asc')
                    {
                        return $('td:first', a).text().localeCompare($('td:first', b).text());
                    } else
                    {
                        return $('td:first', b).text().localeCompare($('td:first', a).text());
                    }

                }).appendTo(tbody);
                var sort_order = $('#name_order').val();
                if (sort_order == "asc")
                {
                    document.getElementById("name_order").value = "desc";
                }
                if (sort_order == "desc")
                {
                    document.getElementById("name_order").value = "asc";
                }

            }




        });

    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</html>
