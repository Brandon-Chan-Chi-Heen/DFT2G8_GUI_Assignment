<%-- 
    Document   : productSalesReport
    Created on : 10 Apr 2022, 12:05:24 am
    Author     : Ng Ming Zhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,Models.*,java.text.SimpleDateFormat"%>
<% List<OrderDetail> orderDetailList = (List<OrderDetail>) session.getAttribute("productSales");%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/c6d3362a6b.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <% SimpleDateFormat rf = new SimpleDateFormat("dd MMM yyyy");
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = df.parse(String.valueOf(session.getAttribute("salesStartDate")));
            Date endDate = df.parse(String.valueOf(session.getAttribute("salesEndDate")));
            String productName = String.valueOf(session.getAttribute("productName"));
            String productId = String.valueOf(session.getAttribute("productId"));
        %>
        <title><%= productName%> Sales Report (<%= rf.format(startDate)%>-<%= rf.format(endDate)%>)</title>
        <style>
            @media print {
                #printPageButton {
                    display: none;
                }
            }
        </style>
    </head>
    <body>
        <div class="container mt-5">
            <button class="btn btn-outline-primary" id="printPageButton" onclick="window.print()"><i class="fa-solid fa-print"></i></button>
            <div class="row text-center">
                <h3>Coop Deals</h3>
                <h5><%= productName%></h5>
                <h5>(Product ID: <%= productId%>)</h5>
                <h5>Sales Report</h5>
                <p>From <b><%= rf.format(startDate)%></b> To <b><%= rf.format(endDate)%></b></p>
                <p class="text-muted">(Generate On ${sessionScope.salesReportOn})</p>
            </div>
            <hr>
            <div class="row">
                <% if (orderDetailList.size() != 0) {%>
                <table class="table table-bordered table-hover table-striped">
                    <tr class="text-center fw-bold">
                        <td>No</td>
                        <td>Order ID</td>
                        <td>Date</td>
                        <td>[Customer ID] Customer Name</td>
                        <td>Quantity</td>
                        <td>Subtotal (RM)</td>
                    </tr>

                    <%SimpleDateFormat ft = new SimpleDateFormat("dd-MM-yyyy");
                        for (int i = 0; i < orderDetailList.size(); i++) {
                            OrderDetail d = orderDetailList.get(i);
                            Product p = d.getProductId();
                            Orders o = d.getOrderId();
                            Customers c = o.getCustomerId();
                    %>
                    <tr>
                        <td><%= i + 1%></td>
                        <td><%= o.getOrderId()%></td>
                        <td><%= ft.format(o.getOrderDate())%></td>
                        <td>[<%= c.getCustomerId()%>] <%= c.getFullname()%></td>
                        <td class="text-end"><%= d.getQuantity()%></td>
                        <td class="text-end"><%= d.getSubtotal()%></td>
                    </tr>

                    <%}%>
                    <tr class="fw-bold text-end">
                        <td colspan="5">Total (RM)</td>
                        <td>${sessionScope.productTotal}</td>
                    </tr>
                </table>
                <%
                    } else {
                        out.print("</h4>No result(s) found!</h4>");
                    }%>
            </div>
        </div>
    </body>
</html>
