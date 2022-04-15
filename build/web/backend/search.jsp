<%-- 
    Document   : index
    Created on : Apr 6, 2022, 11:47:20 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<%@page import="java.util.*, Models.*,java.text.SimpleDateFormat"%>
<% List<Product> productsList = (List<Product>) session.getAttribute("productsList");%>
<% List<Staff> staffsList = (List<Staff>) session.getAttribute("staffsList");%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dash Board</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="index.css" type="text/css" rel="stylesheet">
        <link href="<%= request.getContextPath()%>/backend/index.css" type="text/css" rel="stylesheet">
    </head>

    <body >
        <%@ include file="adminsidebar.jsp"%>
        <section class="text-white">
            <h1>Dash Board</h1>

            <div class="container my-3">
                <form action="<%= request.getContextPath()%>/Search" method="post">
                    <select name="search-from" id="search-from">
                        <option value="product">Product</option>
                        <option value="staff">Staff</option>
                    </select>

                    <input type="text" name="keyword" id="search-keyword">
                    <input type="submit" value="Search">
                    <input type="reset" id="reset" value="Clear Text">


                </form>
            </div>
            <div class="container" id="result">
                <% String table = String.valueOf(session.getAttribute("table"));

                    int found = 1;
                    if (table.equals("product")) {
                        if (productsList.size() != 0) {

                %>
                <table class="table table-hover table-striped mt-3">
                    <tr class="table-dark">
                        <td>ID</td>
                        <td>Product Name</td>
                        <td>Description</td>
                        <td>Main Category</td>
                        <td>Subcategory</td>
                        <td>Quantity</td>
                        <td>Price</td>
                        <td>Image</td>
                        <td>Sold</td>
                        <td>Average Rating</td>
                    </tr>

                    <% for (int i = 0; i < productsList.size(); i++) {
                            Product p = productsList.get(i);
                            Category c = p.getCategoryId();
                            Subcategory s = p.getSubcategoryId();
                    %>
                    <tr>
                        <td><%= p.getProductId()%></td>
                        <td><%= p.getProductName()%></td>
                        <td><%= p.getDescription()%></td>
                        <td><%= c.getCategoryName()%></td>
                        <td><%= s.getSubcategoryName()%></td>
                        <td><%= p.getQuantity()%></td>
                        <td><%= p.getPrice()%></td>
                        <td><%= p.getImage()%></td>
                        <td><%= p.getSold()%></td>
                        <td><%= p.getAverageRating()%></td>
                    </tr>
                    <%}%>

                </table>
                <%} else {
                        found = 0;
                    }

                } else if (table.equals("staff")) {
                    if (staffsList.size() != 0) {
                %>
                <table class="table table-hover">
                    <tr class="table-dark">
                        <td>Staff ID</td>
                        <td>Username</td>
                        <td>Email</td>
                        <td>Gender</td>
                        <td>Contact No</td>
                    </tr>
                    <%
                        for (int i = 0; i < staffsList.size(); i++) {
                            Staff s = staffsList.get(i);
                    %>
                    <tr>
                        <td><%= s.getStaffId()%></td>
                        <td><%= s.getUsername()%></td>
                        <td><%= s.getEmail()%></td>
                        <td>
                            <% if (s.getGender().equals('M')) {
                                    out.print("Male");
                                } else if (s.getGender().equals('F')) {
                                    out.print("Female");
                                }%>
                        </td>
                        <td><%= s.getContactNo()%></td>
                    </tr>
                    <%}%>
                </table>
                <%} else {
                            found = 0;
                        }
                    }
                %>




                <%  if (found == 0 && table != null) { %>
                <div class="row">
                    <div class="col">
                        <h5>No item(s) found!</h5>
                    </div>
                </div>
                <%}%>

            </div>

    </body>
    <script>
        $(document).ready(function () {
            if (window.history.replaceState) {
                window.history.replaceState(null, null, window.location.href);
            }


            $("#search-from option[value='${sessionScope.table}']").attr('selected', true);

            var key = "${sessionScope.keyword}";
            $("#search-keyword").val(key);


        });
    </script>

</section>
</body>

</html>