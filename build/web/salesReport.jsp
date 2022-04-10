<%-- 
    Document   : report1
    Created on : 8 Apr 2022, 9:36:07 pm
    Author     : Ng Ming Zhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,models.*,java.text.SimpleDateFormat"%>
<% List<OrderDetail> orderDetailList = (List<OrderDetail>) session.getAttribute("orderDetailList");%>
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
            Date startDate = df.parse(String.valueOf(session.getAttribute("startDate")));
            Date endDate = df.parse(String.valueOf(session.getAttribute("endDate")));

        %>
        <title>Sales Report (<%= rf.format(startDate)%>-<%= rf.format(endDate)%>)</title>
        <style>
            @page {
                width: 21cm;
                height: 29.7cm;
            }
            @media print {
                #printPageButton {
                    display: none;
                }
            }
            td.date-css{
                white-space:nowrap;
            }

        </style>
    </head>
    <body>

        <div class="container mt-5">
            <button class="btn btn-outline-primary" id="printPageButton" onclick="window.print()"><i class="fa-solid fa-print"></i></button>
            <div class="row text-center">
                <h3>Coop Deals</h3>
                <h5>Sales Report</h5>

                <p>From <b><%= rf.format(startDate)%></b> To <b><%= rf.format(endDate)%></b></p>
                <p class="text-muted">(Generate On ${sessionScope.salesReportOn})</p>
            </div>
            <hr>
            <div class="container">
                <div class="row">
                    <% String found = String.valueOf(session.getAttribute("found"));
                        if (found.isEmpty() == false && found.equals("null") == false) {
                            out.print(found);
                        } else {
                    %>
                    <table class="table table-hover table-striped table-bordered">
                        <tr class="text-center fw-bold">
                            <td>No</td>
                            <td>Date</td>
                            <td>Customer Name</td>
                            <td>Product</td>
                            <td>Price (RM)</td>
                            <td>Quantity</td>
                            <td>Subtotal (RM)</td>
                        </tr>
                        <% SimpleDateFormat ft = new SimpleDateFormat("dd-MM-yyyy");
                            for (int i = 0; i < orderDetailList.size(); i++) {
                                OrderDetail d = orderDetailList.get(i);
                                Orders o = d.getOrderId();
                                Customers c = o.getCustomerId();
                                Product p = d.getProductId();
                        %>
                        <tr>
                            <td><%= i + 1%></td>
                            <td class="date-css"><%= ft.format(o.getOrderDate())%></td>
                            <td><%= c.getFullname()%></td>
                            <td><%= p.getProductName()%></td>
                            <td class="text-end"><%= p.getPrice()%></td>
                            <td class="text-end"><%= d.getQuantity()%></td>
                            <td class="text-end"><%= d.getSubtotal()%></td>
                        </tr>

                        <%}%>
                        <tr class="fw-bold">
                            <td colspan="6" class="text-end">Total: (RM)</td>
                            <td class="text-end"><%= String.format("%.2f", session.getAttribute("total"))%></td>
                        </tr>
                    </table>
                    <%}%>
                </div>
            </div>



        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</html>
