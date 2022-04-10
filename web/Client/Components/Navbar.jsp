<%-- 
    Document   : Navbar
    Created on : Apr 8, 2022, 9:37:07 AM
    Author     : tankimwah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.*, java.util.*"%>
<% Customers customer = (Customers) session.getAttribute("customer");%>
<% List<Product> productOrderArr = (List<Product>) session.getAttribute("productOrderArr");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="header-navBar">
                <!-- Header -->
            <div class="header">
                <div class="logo-container">
                    <a href="CustomerViewProduct.jsp" class="link-noLine-logo"><img src="./Images/Icons/Icon_logo.png" alt="logo" id="logo-icon"><span id="logo-text">Coop-Deals</span></a>
                </div>
                <div class="search-container">
                    <div class="search-secondContainer">
                        <form action="../SearchProduct">
                            <input type="text" name="searchProducts" class="searchField" autocomplete="off" placeholder="Search" size="80" required/>
                            <input type="submit" name="search-products-btn" id="search-btn" value="&#x1F50E;&#xFE0E;"/>
                        </form>
                    </div>
                </div>
                <div class="userIcon-container">
                    <span id="userIcon-secondContainer"><img src="./Images/Icons/Icon_userDefault.png" alt="default-user-icon" id="user-icon"/><i class="fa fa-sort-desc"></i></span>
                    <div class="user-navBar">
                        <% if(customer != null){%>
                        <ul class="user-menu">
                            <li><a href="../Client/MyProfile.jsp" class="link-noLine-left">My Profile</a></li>
                            <li>
                                <form action="../../CustomerOrderController" method="POST">
                                    <input type="hidden" name="customerID" value="<%= customer.getCustomerId() %>">
                                    <input type="submit" name="submit link-noLine-left" value="My Order">
                                </form>
                            </li>
                            <li><a href="../CustomerLogout" class="link-noLine-left">Log Out</a></li>
                        </ul>
                        <% }else{ %>
                            <ul class="user-menu">
                                <li><a href="../Client/login.jsp" class="link-noLine-left">Log In</a></li>
                            </ul>
                        <% } %>
                    </div>
                </div>
                <div class="cart-container">
                   <a href="Order.jsp"><img src="./Images/Icons/Icon_cart.png" alt="cart" id="cart-icon" title="Add to cart"/><span id="cart-number"><%= productOrderArr != null ? productOrderArr.size(): 0 %></span></a>
                </div>
            </div>
            <!-- Navigation Bar -->
            <div class="product-navbar">
                <ul class="product-menu">
                    <li><a href="CustomerViewProduct.jsp" class="menu1">All Gaming Products</a></li>
                    <li><span class="menu2">Games & Accessories<i class="fa fa-sort-desc"></i></span>
                        <div class="product-subNavbar">
                            <ul class="product-submenu">
                                <div class="product-submenu-col3 active">
                                    <li class="category-list">PlayStation 5</li>
                                    <ul>
                                        <li><a href="../FindProductsCategory?CustomerId=<%= customer.getCustomerId() %>&CategoryId=1&SubCategoryId=3" class="link-noLine-list">PS5 Accessories</a></li>
                                        <li><a href="../FindProductsCategory?CustomerId=<%= customer.getCustomerId() %>&CategoryId=1&SubCategoryId=1" class="link-noLine-list">PS5 Console</a></li>
                                        <li><a href="../FindProductsCategory?CustomerId=<%= customer.getCustomerId() %>&CategoryId=1&SubCategoryId=2" class="link-noLine-list">PS5 Games</a></li>
                                    </ul>
                                </div>
                                <div class="product-submenu-col3 active">
                                    <li class="category-list">PlayStation 4</li>
                                    <ul>
                                        <li><a href="../FindProductsCategory?CustomerId=<%= customer.getCustomerId() %>&CategoryId=2&SubCategoryId=6" class="link-noLine-list">PS4 Accessories</a></li>
                                        <li><a href="../FindProductsCategory?CustomerId=<%= customer.getCustomerId() %>&CategoryId=2&SubCategoryId=4" class="link-noLine-list">PS4 Console</a></li>
                                        <li><a href="../FindProductsCategory?CustomerId=<%= customer.getCustomerId() %>&CategoryId=2&SubCategoryId=5" class="link-noLine-list">PS4 Games</a></li>
                                    </ul>
                                </div>
                                <div class="product-submenu-col3 active">
                                    <li class="category-list">Nintendo Switch</li>
                                    <ul>
                                        <li><a href="../FindProductsCategory?CustomerId=<%= customer.getCustomerId() %>&CategoryId=3&SubCategoryId=9" class="link-noLine-list">NS Accessories</a></li>
                                        <li><a href="../FindProductsCategory?CustomerId=<%= customer.getCustomerId() %>&CategoryId=3&SubCategoryId=7" class="link-noLine-list">NS Console</a></li>
                                        <li><a href="../FindProductsCategory?CustomerId=<%= customer.getCustomerId() %>&CategoryId=3&SubCategoryId=8" class="link-noLine-list">NS Games</a></li>
                                    </ul>
                                </div>
                            </ul>
                        </div>
                    </li>
                    <li><span class="menu3">Gaming Peripherals<i class="fa fa-sort-desc"></i></span>
                        <div class="product-subNavbar3">
                            <ul class="product-submenu3">
                                <li class="submenu3-link"><a href="../FindProductsCategory?CustomerId=<%= customer.getCustomerId() %>&CategoryId=4&SubCategoryId=10" class="link-noLine-list"><span class="submenu3-text">Chairs</span></a></li>
                                <li class="submenu3-link"><a href="../FindProductsCategory?CustomerId=<%= customer.getCustomerId() %>&CategoryId=5&SubCategoryId=10" class="link-noLine-list"><span class="submenu3-text">Headsets</span></a></li>
                                <li class="submenu3-link"><a href="../FindProductsCategory?CustomerId=<%= customer.getCustomerId() %>&CategoryId=6&SubCategoryId=10" class="link-noLine-list"><span class="submenu3-text">Keyboards</span></a></li>
                                <li class="submenu3-link"><a href="../FindProductsCategory?CustomerId=<%= customer.getCustomerId() %>&CategoryId=7&SubCategoryId=10" class="link-noLine-list"><span class="submenu3-text">Monitor</span></a></li>
                                <li class="submenu3-link"><a href="../FindProductsCategory?CustomerId=<%= customer.getCustomerId() %>&CategoryId=8&SubCategoryId=10" class="link-noLine-list"><span class="submenu3-text">Mouse</span></a></li>
                                <li class="submenu3-link"><a href="../FindProductsCategory?CustomerId=<%= customer.getCustomerId() %>&CategoryId=9&SubCategoryId=10" class="link-noLine-list"><span class="submenu3-text">Mousepads</span></a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
            </div>
    </body>
</html>
