<%-- 
    Document   : viewSalesRecord
    Created on : Apr 4, 2022, 4:07:21 PM
    Author     : Henry
--%>

<%@page import="java.util.List"%>
<%@page import="Models.OrderDetail"%>
<%@page import="Models.Orders"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% List<Orders> orderList = (List<Orders>) session.getAttribute("orderList");%>
<% List<OrderDetail> orderDetailList = (List<OrderDetail>) session.getAttribute("orderDetailList");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/Server/SalesRecord/salesRecordCSS.css">  
        <script src="https://kit.fontawesome.com/6dfd1ad61e.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>View Sales Records</title>
    </head>
    <body>
        <table class="table-sortable">
            <thead>
                <tr>
                    <th>Order ID <i class="fas fa-sort"></i></th>
                    <th>Customer name <i class="fas fa-sort"></i></th>
                    <th>Products <i class="fas fa-sort"></i></th>
                    <th>Quantity <i class="fas fa-sort"></i></th>
                    <th>Price <i class="fas fa-sort"></i></th>
                    <th>Shipping Address <i class="fas fa-sort"></i></th>
                    <th>Status <i class="fas fa-sort"></i></th>
                </tr>
            </thead>
            <tbody>
                <% for(OrderDetail orderDetail : orderDetailList) {%>
                <tr>
                    <td><%= orderDetail.getOrderDetailId() %></td>
                    <td><%= orderDetail.getOrderId().getCustomerId().getFullname()%></td>
                    <td><%= orderDetail.getProductId().getProductName()%></td>
                    <td><%= orderDetail.getProductId().getQuantity()%></td>
                    <td>RM <%= orderDetail.getOrderId().getTotalAmount()%></td>
                    <td><%= orderDetail.getOrderId().getShippingAddress()%></td>
                    <td><%= orderDetail.getOrderId().getStatus()%></td>
                </tr>
                <% }%>
            </tbody>

            <tfoot>
                <tr>

                </tr>
            </tfoot>
        </table>
        <script src="<%=request.getContextPath()%>/Server/SalesRecord/viewSalesRecordJS.js"></script>
    </body>
</html>
