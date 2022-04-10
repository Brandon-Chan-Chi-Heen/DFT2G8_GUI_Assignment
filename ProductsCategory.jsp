<%-- 
    Document   : ProductsCategory
    Created on : Apr 9, 2022, 2:51:27 AM
    Author     : tanki
--%>

<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.*, java.util.*"%>
<% List<Product> productFindList = (List<Product>) session.getAttribute("productFindList");%>
<% Customers customer = (Customers) session.getAttribute("customer");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category Products</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Serif&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/89d2bef4b8.js" crossorigin="anonymous"></script>
        <link href="./CSS/ProductsCategory.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/Navbar.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/Footer.css" rel="stylesheet" type="text/css"/>
        <script src="./JS/CustomerViewProduct.js" type="text/javascript" defer></script>
    </head>
    <body>
        <section class="slideShow-section">
            <jsp:include page="./Components/Navbar.jsp"/>  
        </section>
        <!-- Products Category -->
        <section class="productsCategory-section">
            <div class="productsCategory-container">
                <% 
                    double productFindListRowCount= productFindList.size()/3;
                    int x=0;
                    
                    if(productFindListRowCount > 0){
                    for(int i =0; i<productFindListRowCount;i++){ 
                %>
                    <div class="productsCategory">
                        <div class="productsCategory-col3">
                           <% for(int j=x; j < x+3; j++){ %>
                            <div class="products-col3">
                                <div class="productsCategory-img-container">
                                    <a href="../FindCertainProduct?CustomerId=<%= customer.getCustomerId() %>&ProductId=<%=productFindList.get(j).getProductId()%>"><img src="./Images/<%= productFindList.get(j).getImage() %>"/></a>
                                </div>
                                <div class="productsCategory-info">
                                    <p><%=productFindList.get(j).getProductName() %></p>
                                    <small>RM<%= productFindList.get(j).getPrice() %></small><br>
                                    <% int totalRating = productFindList.get(j).getAverageRating().intValue(); %>
                                    <% BigDecimal rating = new BigDecimal(1);%>
                                    <% if(totalRating == 0){%>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    <% }else if(totalRating == 1){ %>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    <% }else if(totalRating == 2){ %>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    <% }else if(totalRating == 3){%>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    <% }else if(totalRating == 4){%>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star-o"></i>
                                    <% }else if(totalRating == 5){%>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                        <i class="fa fa-star"></i>
                                    <% } %>
                                    <span class="rating-num">(<%= productFindList.get(j).getSold() %>)</span>
                                </div>
                            </div>
                            <% } %> 
                        </div>
                    </div>
                    <%  x+=3;} %>
                <% }else if(productFindListRowCount < 1){ %> 
                    <!-- Here  -->
                    <div class="productsCategory">
                        <div class="productsCategory-col3">
                            <% for(int j=0; j < productFindList.size(); j++){ %>
                                <div class="products-col3">
                                    <div class="productsCategory-img-container">
                                        <a href="../FindCertainProduct?CustomerId=<%= customer.getCustomerId() %>&ProductId=<%=productFindList.get(j).getProductId()%>"><img src="./Images/<%= productFindList.get(j).getImage() %>"/></a>
                                    </div>
                                    <div class="productsCategory-info">
                                        <p><%=productFindList.get(j).getProductName() %></p>
                                        <small>RM<%= productFindList.get(j).getPrice() %></small><br>
                                         <% int totalRating = productFindList.get(j).getAverageRating().intValue(); %>
                                        <% BigDecimal rating = new BigDecimal(1);%>
                                        <% if(totalRating == 0){%>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        <% }else if(totalRating == 1){ %>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        <% }else if(totalRating == 2){ %>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        <% }else if(totalRating == 3){%>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                            <i class="fa fa-star-o"></i>
                                        <% }else if(totalRating == 4){%>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star-o"></i>
                                        <% }else if(totalRating == 5){%>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        <% } %>
                                        <span class="rating-num">(<%= productFindList.get(j).getSold() %>)</span>
                                    </div>
                                </div>
                            <% } %>
                        </div>
                    </div>
                <% } %> 
            </div>
        </section>
        <jsp:include page="./Components/Footer.jsp"/>  
    </body>
</html>
