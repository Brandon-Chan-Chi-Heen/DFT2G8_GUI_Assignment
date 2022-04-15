<%-- 
    Document   : CustomerViewProduct
    Created on : Apr 8, 2022, 5:46:47 PM
    Author     : tankimwah
--%>
<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.*, java.util.*"%>
<jsp:include page="../RetrieveProducts"/>  
<% List<Product> topProductList = (List<Product>) session.getAttribute("topProductList");%>
<% List<Product> latestProductList = (List<Product>) session.getAttribute("latestProductList");%>
<% Customers customer = (Customers) session.getAttribute("customer");%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer View Product</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Serif&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/89d2bef4b8.js" crossorigin="anonymous"></script>
        <link href="./CSS/CustomerViewProduct.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/Navbar.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/Footer.css" rel="stylesheet" type="text/css"/>
        <script src="./JS/CustomerViewProduct.js" type="text/javascript" defer></script>
    </head>
    <body>
        <% if(customer == null){ %>
            <jsp:forward page="login.jsp"/>
        <% } %>
        <section class="slideShow-section">
            <jsp:include page="./Components/Navbar.jsp"/>  
            <!-- Slideshow -->
            <div class="slideShow-box">
                <div class="slideShow-secBox">
                    <div class="slideShow-images">
                        <img src="./SlideShow/PS5.jpg" class="slideShow active"/>
                        <img src="./SlideShow/NintendoSwitch.jpg" class="slideShow"/>
                        <img src="./SlideShow/Ikai_PS5_PS4_Nintendo.jpg" class="slideShow"/>
                        <img src="./SlideShow/Kena_PS5_rename.jpg" class="slideShow"/>
                    </div>
                    <div class="pages-dot">
                        <span class="dot active"></span>
                        <span class="dot"></span>
                        <span class="dot"></span>
                        <span class="dot"></span>
                    </div>
                </div>
            </div>
        </section>

        <!-- Top Gaming Products -->
        <section class="topGamingProducts-section">
            <div class="topGamingProducts-container">
                <div class="topGamingProducts-title">
                    <h3>Top Gaming Products</h3>
                </div>
                <div class="nextTopProducts-btn-container">
                    <div class="nextTopProducts-btn">
                        <i class="fa fa-chevron-left prev"></i>
                        <i class="fa fa-chevron-right next"></i>
                   </div>
                </div>
                <div class="topGamingProducts">
                    <div class="topGamingProducts-col3">
                    <%
                        int index = 0;
                        for(int i=0;i<3;i++){
                    %>
                        <div class="product-col3 active">
                            <div class="top-badge">Top</div>
                            <div class="topGamingProduct-img-container">
                                <a href="../FindCertainProduct?CustomerId=<%= customer.getCustomerId() %>&ProductId=<%=topProductList.get(i).getProductId()%>"><img src="./Images/<%=topProductList.get(i).getImage()%>"/></a>
                            </div>
                            <div class="product-info">
                                <p><%= topProductList.get(i).getProductName() %></p>
                                <small>RM<%= topProductList.get(i).getPrice() %></small><br>
                                <% int totalRating = topProductList.get(i).getAverageRating().intValue(); %>
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
                                <span class="rating-num">(<%= topProductList.get(i).getSold() %>)</span>
                            </div>
                        </div>
                            <%
                                index+=1;
                                if(index == 3){
                                    break;
                                }
                            %>
                        <% } %>
                        <%
                        for(int i=index;i<topProductList.size();++i){
                        %>
                        <div class="product-col3">
                            <div class="top-badge">Top</div>
                            <div class="topGamingProduct-img-container">
                                <a href="../FindCertainProduct?CustomerId=<%= customer.getCustomerId() %>&ProductId=<%=topProductList.get(i).getProductId()%>"><img src="./Images/<%=topProductList.get(i).getImage()%>"/></a>
                            </div>
                            <div class="product-info">
                                <p><%= topProductList.get(i).getProductName() %></p>
                                <small>RM<%= topProductList.get(i).getPrice() %></small><br>
                                <% int totalRating = topProductList.get(i).getAverageRating().intValue(); %>
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
                                <span class="rating-num">(<%= topProductList.get(i).getSold() %>)</span>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </section>
        <!-- Latest Gaming Products -->
        <section class="latestGamingProducts-section">
            <div class="latestGamingProducts-container">
                <div class="latestGamingProducts-title">
                    <h3>Latest Gaming Products</h3>
                </div>
                <% 
                    double latestProductRowCount= latestProductList.size()/3;
                    int x=0;

                    for(int i =0; i<latestProductRowCount;i++){ 
                %>
                <div class="latestGamingProducts">
                    <div class="latestGamingProducts-col3">
                        <% for(int j=x; j < x+3; j++){ %>
                        <div class="latestProduct-col3">
                            <div class="latestGamingProduct-img-container">
                                <a href="../FindCertainProduct?CustomerId=<%= customer.getCustomerId() %>&ProductId=<%=latestProductList.get(j).getProductId()%>"><img src="./Images/<%=latestProductList.get(j).getImage()%>"/></a>
                            </div>
                            <div class="product-info">
                                <p><%= latestProductList.get(j).getProductName() %></p>
                                <small>RM<%= latestProductList.get(j).getPrice() %></small><br>
                                <% int totalRating = latestProductList.get(j).getAverageRating().intValue(); %>
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
                                <span class="rating-num">(<%= latestProductList.get(j).getSold() %>)</span>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
                <%  if(x==12){
                        break;
                    }
                
                    x+=3;} %> 
            </div>
        </section>
                <jsp:include page="./Components/Footer.jsp"/>  
    </body>
</html>