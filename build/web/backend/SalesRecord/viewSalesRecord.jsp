<%-- 
    Document   : index
    Created on : Apr 6, 2022, 11:47:20 PM
    Author     : lenovo
--%>

<%@page import="java.util.List"%>
<%@page import="Models.OrderDetail"%>
<%@page import="Models.Orders"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% List<Orders> orderList = (List<Orders>) session.getAttribute("orderList");%>
<% List<OrderDetail> orderDetailList = (List<OrderDetail>) session.getAttribute("orderDetailList");%>
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
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/backend/SalesRecord/salesRecordCSS.css">  
        <script src="https://kit.fontawesome.com/6dfd1ad61e.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>View Sales Records</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="index.css" type="text/css" rel="stylesheet">
        <link href="<%= request.getContextPath() %>/backend/index.css" type="text/css" rel="stylesheet">
    </head>

    <body class="bg-dark">

        <%@ include file="../adminsidebar.jsp"%>
        <section class="text-white">
            <h1>Dash Board</h1>

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
            <script src="<%=request.getContextPath()%>/backend/SalesRecord/viewSalesRecordJS.js"></script>
        </section>
    </body>

</html>