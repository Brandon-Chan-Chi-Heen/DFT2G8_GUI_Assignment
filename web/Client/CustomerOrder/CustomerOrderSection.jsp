<%-- 
    Document   : CustomerOrderSection
    Created on : Apr 9, 2022, 5:16:35 AM
    Author     : heeju
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.*, java.util.*"%>
<jsp:useBean id="date" class="java.util.Date"/>
<jsp:useBean id="customers" scope="session" class="Models.Customers"/>
<% List<Orders> customersOrder = (List<Orders>) session.getAttribute("customersOrder");%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <title>Customer Order Section</title>
    </head>
    <body>
        <!--need to have customerID and productID passed as parameter-->
        <style>
            .gradient-custom {
                /* fallback for old browsers */
                background: #cd9cf2;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to top left, rgba(205, 156, 242, 1), rgba(246, 243, 255, 1));

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to top left, rgba(205, 156, 242, 1), rgba(246, 243, 255, 1))
            }
        </style>
        <section class="h-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-lg-10 col-xl-8">
                        <div class="card" style="border-radius: 10px;">
                            <div class="card-body p-4">
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <p class="lead fw-normal mb-0" style="color: #a8729a;">My Orders</p>
                                    <form action="../../OrderHistoryController" method="POST">
                                        <input type="hidden" name="customerID" value="${customers.customerId}"></h3>
                                        <input type="submit" name="submit" value="Order History" >
                                    </form>
                                </div>
                                <div class="card shadow-0 border mb-4">
                                    <div class="card-body">
                                        <div class="row">
                                            <% if (customersOrder.isEmpty()) { %>
                                            <h4 class="text-center"> There is no orders made that had not been delivered </h4>
                                            <% } %>
                                            <table class="table table-striped">
                                                <tbody class="m-2">
                                                    <% for (Orders o : customersOrder) {%>
                                                    <tr>
                                                        <th scope="col" class="text-center">
                                                            Order ID</br> <span class="text-muted"><%= o.getOrderId()%></span>
                                                        </th>
                                                        <th scope="col" class="text-center">
                                                            Quantity</br> <span class="text-muted"><%= o.getTotalAmount()%></span>
                                                        </th>
                                                        </th>
                                                        <th scope="col" class="text-center">
                                                            Status</br> <span class="text-muted"><%= o.getStatus()%></span>
                                                        </th>
                                                        <th scope="col" class="text-center">
                                                            Ordered Date</br> <span class="text-muted"><%= o.getOrderDate()%></span>
                                                        </th>
                                                        </th>
                                                        <th scope="col" class="text-center">
                                                            <form action="../../OrderStatusController" method="POST">
                                                                <input type="hidden" name="orderDetailId" value="<%= o.getOrderId()%>">
                                                                <input type="hidden" name="customerID" value="${customers.customerId}">
                                                                <input type="submit" name="submit" value="Track Order">
                                                            </form>
                                                        </th>
                                                    </tr>
                                                    <% }%>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
    </body>
</html>
