<%-- 
    Document   : Order
    Created on : Apr 9, 2022, 11:57:35 PM
    Author     : tankimwah
--%>

<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.*, java.util.*"%>
<% List<Product> productOrderArr = (List<Product>) session.getAttribute("productOrderArr");%>
<% List<Integer> orderQty = (List<Integer>) session.getAttribute("orderQty");%>
<% Customers customer = (Customers) session.getAttribute("customer");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ordered Products</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Serif&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/89d2bef4b8.js" crossorigin="anonymous"></script>
        <link href="./CSS/Order.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/Navbar.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/Footer.css" rel="stylesheet" type="text/css"/>
        <script src="./JS/CustomerViewProduct.js" type="text/javascript" defer></script>
    </head>
    <body>
        <section class="slideShow-section">
            <jsp:include page="./Components/Navbar.jsp"/>  
        </section>
        <!-- Order (Waiting, Before Checkout) -->
        <% if(productOrderArr != null){%>
        <section class="order-section">
            <div class="order-container">
                <form action="../PaymentServlet" method="POST">
                <% BigDecimal subtotal = new BigDecimal(0); %>
                <% List<Product> productAllOrdered = new ArrayList<Product>(); %>
                <% List<Integer> productAllQty = new ArrayList<Integer>(); %>
                <% for(int i=0; i < productOrderArr.size();i++) { %>
                    <div class="order-row-box">
                        <div class="order-col-box">
                            <div class="order-img">
                                <img src="./Images/<%= productOrderArr.get(i).getImage() %>"/>
                            </div>
                        </div>
                        <div class="order-col-box">
                            <div class="order-content">
                                <%
                                    productAllOrdered.add(productOrderArr.get(i));
                                    productAllQty.add(orderQty.get(i));
                                %>
                                <a href="../RemoveOrderedProduct?productOrderId=<%= productOrderArr.get(i).getProductId()%>&productOrderQty=<%= orderQty.get(i)%>" class="remove-btn">&#128465;</a>
                                <input type="hidden" name="productOrderId" value="<%= productOrderArr.get(i).getProductId() %>">
                                <input type="hidden" name="productOrderQty" id="qty" value="<%= orderQty.get(i) %>">
                                <h1><%= productOrderArr.get(i).getProductName() %></h1>
                                <small class="price">RM<%= productOrderArr.get(i).getPrice() %> each</small><br/><br/>
                                <div class="qty-container">
                                    <span class="qty-display">Qty: <small class="qty-num"><%= orderQty.get(i) %></small></span>
                                </div><br/>
                                <% BigDecimal total = productOrderArr.get(i).getPrice().multiply(BigDecimal.valueOf(orderQty.get(i))); %>
                                <small class="total">RM<%= total %></small>
                            </div>
                        </div>
                    </div>
                            <% subtotal = total.add(subtotal);%>
                <% } %>
                <%
                    session.setAttribute("productAllOrdered", productAllOrdered);
                    session.setAttribute("productAllQty", productAllQty);
                %>
                <div class="subtotal-container">
                    <div class="line">
                        <span id="subtotal-num-read">Total (<%= productOrderArr.size() %> items): <span id="subtotal-num-display">RM<%= subtotal %></span></span>
                    </div>
                </div>
                <div class="checkout-container">
                        <input type="hidden" name="customerId" value="<%= customer.getCustomerId() %>">
                        <input type="submit" value="Check Out" id="checkout-btn"/>
                </div>
                </form>
            </div>
        </section>
        <% }else{ %>
        <section class="order-section">
            <div class="order-container">
                <div class="order-row-box">
                    <h1>No Product Order</h1>
                </div>
            </div>
        </section>
        <% } %>
        <jsp:include page="./Components/Footer.jsp"/>  
    </body>
</html>
