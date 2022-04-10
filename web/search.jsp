<%-- 
    Document   : searching
    Created on : 6 Apr 2022, 10:24:58 pm
    Author     : Ng Ming Zhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*,models.*,java.text.SimpleDateFormat"%>
<% List<Product> productsList = (List<Product>) session.getAttribute("productsList");%>
<% List<Staff> staffsList = (List<Staff>) session.getAttribute("staffsList");%>
<% List<OrderDetail> orderDetailList = (List<OrderDetail>) session.getAttribute("salesRecordList");%>
<!DOCTYPE html>
<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/c6d3362a6b.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search</title>

        <style>

            td.date-css{
                white-space:nowrap;
            }
            #search-keyword{
                border:none;
                outline:none;
                border-bottom: 1px solid black;
                background: none;
                width:250px;
            }

        </style>
    </head>
    <body>
        <div class="container my-3">
            <div class="row">
                <form action="./ServerSearch" method="post">

                    <label for="search-from">Search Criteria:</label>
                    <select name="search-from" id="search-from" class="me-5">
                        <option value="product">Product</option>
                        <option value="staff">Staff</option>
                        <option value="orderDetail">Sales Record</option>
                    </select>

                    Keyword:&nbsp;
                    <input type="text" name="keyword" id="search-keyword" class="p-1" placeholder="Enter Product Name to search">
                    <button type="submit" class="btn btn-outline-primary"><i class="fa-solid fa-magnifying-glass"></i></button>
                    <input type="reset" id="reset" value="Clear Text" class="btn btn-outline-danger">



                </form>
            </div>
            <div class="row">
                <p class="text-muted">*Searching without keyword will show all records</p>
            </div>
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
            } else if (table.equals("orderDetail")) {
                if (orderDetailList.size() != 0) {
            %>
            <table class="table table-hover">
                <tr class="table-dark">
                    <td>#</td>
                    <td>Order ID</td>
                    <td>Order Date</td>
                    <td>Product Name</td>
                    <td>Quantity</td>
                    <td>Subtotal</td>
                </tr>
                <%
                    SimpleDateFormat ft = new SimpleDateFormat("dd-MM-yyyy");
                    for (int i = 0; i < orderDetailList.size(); i++) {
                        OrderDetail d = orderDetailList.get(i);
                        Orders o = d.getOrderId();
                        Product p = d.getProductId();
                %>
                <tr>
                    <td><%= d.getOrderDetailId()%></td>
                    <td><%= o.getOrderId()%></td>
                    <td class="date-css"><%= ft.format(o.getOrderDate())%></td>
                    <td><%= p.getProductName()%></td>
                    <td><%= d.getQuantity()%></td>
                    <td><%= d.getSubtotal()%></td>
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


            $("#search-from").change(function () {
                var temp = $(this).find(":selected").val();
                if (temp === "product") {
                    $('#search-keyword').attr('placeholder', 'Enter Product Name to search');
                } else if (temp === "staff") {
                    $('#search-keyword').attr('placeholder', 'Enter Staff ID to search');
                } else if (temp === "orderDetail") {
                    $('#search-keyword').attr('placeholder', 'Enter Order ID to search');
                }

            });



        });
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</html>
