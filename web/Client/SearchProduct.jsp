<%-- 
    Document   : SearchProduct
    Created on : Apr 10, 2022, 7:06:21 PM
    Author     : tankimwah
--%>

<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.*, java.util.*"%>
<% List<Product> searchProductList = (List<Product>) session.getAttribute("searchProductList");%>
<% Customers customer = (Customers) session.getAttribute("customer");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Product</title>
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
        <!-- Search Product -->
        <section class="productsCategory-section">
            <div class="productsCategory-container">
                <% 
                    double productFindListRowCount= searchProductList.size()/3;
                    int x=0;
                    
                    if(productFindListRowCount > 0){
                    for(int i =0; i<productFindListRowCount;i++){ 
                %>
                    <div class="productsCategory">
                        <div class="productsCategory-col3">
                           <% for(int j=x; j < x+3; j++){ %>
                            <div class="products-col3">
                                <div class="productsCategory-img-container">
                                    <a href="../FindCertainProduct?CustomerId=<%= customer.getCustomerId() %>&ProductId=<%=searchProductList.get(j).getProductId()%>"><img src="./Images/<%= searchProductList.get(j).getImage() %>"/></a>
                                </div>
                                <div class="productsCategory-info">
                                    <p><%=searchProductList.get(j).getProductName() %></p>
                                    <small>RM<%= searchProductList.get(j).getPrice() %></small><br>
                                    <% int totalRating = searchProductList.get(j).getAverageRating().intValue(); %>
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
                                    <span class="rating-num">(<%= searchProductList.get(j).getSold() %>)</span>
                                </div>
                            </div>
                            <% } %> 
                        </div>
                    </div>
                    <%  x+=3;} %>
                <% }else if(productFindListRowCount < 1){ %> 
                    <div class="productsCategory">
                        <div class="productsCategory-col3">
                            <% for(int j=0; j < searchProductList.size(); j++){ %>
                                <div class="products-col3">
                                    <div class="productsCategory-img-container">
                                        <a href="../FindCertainProduct?CustomerId=<%= customer.getCustomerId() %>&ProductId=<%=searchProductList.get(j).getProductId()%>"><img src="./Images/<%= searchProductList.get(j).getImage() %>"/></a>
                                    </div>
                                    <div class="productsCategory-info">
                                        <p><%=searchProductList.get(j).getProductName() %></p>
                                        <small>RM<%= searchProductList.get(j).getPrice() %></small><br>
                                        <% int totalRating = searchProductList.get(j).getAverageRating().intValue(); %>
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
                                        <span class="rating-num">(<%= searchProductList.get(j).getSold() %>)</span>
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
