<%-- 
    Document   : stockReport
    Created on : 9 Apr 2022, 8:29:18 pm
    Author     : Ng Ming Zhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,Models.*,java.text.SimpleDateFormat"%>
<% List<Product> productsList = (List<Product>) session.getAttribute("stockProductList");%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/c6d3362a6b.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stock Report</title>
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
                <h5>Inventory Report</h5>
                <p class="text-muted">(Generate On ${sessionScope.stockReportOn})</p>
            </div>

            <div class="container">
                <div class="row">
                    <% if (productsList.size() == 0) {
                            out.print("<h4>No result<s> found!</h4>");
                        } else {
                    %>
                    <table class="table table-bordered table-striped table-hover">
                        <tr class="text-center">
                            <th>Product ID</th>
                            <th>Product Name</th>
                            <th class="px-4">Stock</th>
                            <th>Checked</td>
                            <th>Remark</th>
                        </tr>
                        <%
                            for (int i = 0; i < productsList.size(); i++) {
                                Product p = productsList.get(i);

                        %>
                        <tr>

                            <td class="text-center"><%= p.getProductId()%></td>
                            <td><%= p.getProductName()%></td>
                            <td class="text-end"><%= p.getQuantity()%></td>
                            <td class="text-center"><input type="checkbox"></td>
                            <td class="px-5"></td>
                        </tr>
                        <%}
                            }%>
                    </table>
                </div>
            </div>
        </div>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</html>
