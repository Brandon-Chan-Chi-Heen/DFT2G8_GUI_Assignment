<%-- 
    Document   : Product
    Created on : Apr 8, 2022, 5:46:47 PM
    Author     : tankimwah
--%>

<%@page import="java.math.BigDecimal"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.*, java.util.*"%>
<% List<Comment> commentList = (List<Comment>) session.getAttribute("commentList");%>
<% List<Product> product = (List<Product>) session.getAttribute("product");%>
<% Customers customer = (Customers) session.getAttribute("customer");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Serif&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/89d2bef4b8.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link href="./CSS/Product.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/Navbar.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/Footer.css" rel="stylesheet" type="text/css"/>
        <script src="./JS/CustomerViewProduct.js" type="text/javascript" defer></script>
        <script src="./JS/Product.js" type="text/javascript" defer></script>
    </head>
    <body>
        <section class="slideShow-section">
            <jsp:include page="./Components/Navbar.jsp"/>  
        </section>
        <!-- Add To Cart -->
        <section class="addToCart-section">
            <div class="addToCart-container">   
                <div class="addToCart-contents">
                    <div class="addToCart-col2">
                        <div class="product-img-container">
                            <img src="./Images/<%= product.get(0).getImage() %>"/>
                        </div>
                    </div
                    <div class="addToCart-col2">
                        <div class="product-info-display">
                            <h1><%= product.get(0).getProductName() %></h1>
                            <div class="ratings-display">
                                <small><%= product.get(0).getAverageRating() %></small>
                                <% int totalRating = product.get(0).getAverageRating().intValue(); %>
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
                                <small>| <%= product.get(0).getSold() %> Ratings></small>
                            </div><br>
                            <small>RM<%= product.get(0).getPrice() %></small><br>
                            <% if(customer != null){ %>
                                <form action="../TempAddOrderedProduct">
                                <div class="quantity-container">
                                    <p>Quantity</p>
                                    <div class="quantity-set-container">
                                        <div class="subtract-container">
                                            <span id="subtract">-</span>
                                        </div>
                                        <div class="result-container">
                                            <input type="hidden" name="customerId" value="<%= customer.getCustomerId() %>">
                                            <input type="hidden" name="productOrderId" value="<%= product.get(0).getProductId() %>">
                                            <input type="hidden" name="productOrderQty" id="qty">
                                            <span id="result">1</span>
                                        </div>
                                        <div class="addition-container">
                                            <span id="addition">+</span>
                                        </div>
                                    </div>
                                </div><br>
                                <input type="submit" id="addToCart-btn" value="Add To Cart"/>
                            </form>
                            <% }else{ %>
                            <form action="login.jsp">
                                <div class="quantity-container">
                                    <p>Quantity</p>
                                    <div class="quantity-set-container">
                                        <div class="subtract-container">
                                            <span id="subtract">-</span>
                                        </div>
                                        <div class="result-container">
                                            <span id="result">1</span>
                                        </div>
                                        <div class="addition-container">
                                            <span id="addition">+</span>
                                        </div>
                                    </div>
                                </div><br>
                                <input type="submit" id="addToCart-btn" value="Add To Cart"/>
                            </form>
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Product Description -->
        <section class="productDescription-section">
            <div class="productDescription-container">
                <div class="productDescription-container-sec">
                    <div class="productDescription-title-box">
                        <h1>Product Description</h1>
                    </div>
                    <p class="productDescription">
                        <%= product.get(0).getDescription() %>
                    </p>
                </div>
            </div>
        </section>
        <style>
            .star-widget label{
                font-size: 15px;
                color: #444;
                padding: 10px;
                float: right;
                transition: all 0.2s ease;
            }
            input:not(:checked) ~ label:hover,
            input:not(:checked) ~ label:hover ~ label{
                color: #fd4;
            }
            input:checked ~ label{
                color: #fd4;
            }
            input#rate-5:checked ~ label{
                color: #fe7;
            }
            input:checked ~ form{
                display: block;
            }
             input.rating-stars{
                display: none;
            }
            label.rated{
                color: #fe7;
            }
        </style>
        <div class="container mt-5 mb-5">
            <div class="row height d-flex justify-content-center align-items-center">
                <div class="col-md-7">
                    <div class="card">
                        <div class="p-3 row">
                            <div class="col-2">
                                <h3 class="text-center font-weight-bold">
                                    <% Integer commentSize = 0;
                                    for (int x = 0; x < commentList.size(); x++) {   
                                        Comment commentNew = commentList.get(x);
                                        if(product.get(0).getProductId() == commentNew.getProductId().getProductId()) {
                                             commentSize+=1;
                                        }
                                    }
                                    %>
                                    <%= commentSize %>
                                </h3>
                                <h6 class="text-center">Comments</h6>
                            </div>
                        </div>
                        <hr style="border-top: 8px solid grey;" class="mx-3">
                        <form action="../CommentController" method="post">
                            <div class="mt-3 d-flex flex-row align-items-center p-3 form-color">
                                <div class="col-2">
                                    <img src="https://preview.redd.it/gd8mkyj08ip51.jpg?width=640&crop=smart&auto=webp&s=6fe6acb98a3474dd4d9ff8d75a2769fd92245fc1" width="100px" class="rounded-circle mr-2">
                                </div>
                                <div class="col-10 px-3">
                                    <div class="row">
                                        <div class="d-flex justify-content-between align-items-center">
                                            <div class="d-flex flex-row align-items-center"> 
                                                <span class="mr-2 font-weight-bold">${customers.fullname}</span>
                                                <div class="star-widget">
                                                    <input type="radio" name="rate" id="rate-5" class="rating-stars" value="5">
                                                    <label for="rate-5" class="fas fa-star"></label>
                                                    <input type="radio" name="rate" id="rate-4" class="rating-stars" value="4">
                                                    <label for="rate-4" class="fas fa-star"></label>
                                                    <input type="radio" name="rate" id="rate-3" class="rating-stars" value="3">
                                                    <label for="rate-3" class="fas fa-star"></label>
                                                    <input type="radio" name="rate" id="rate-2" class="rating-stars" value="2">
                                                    <label for="rate-2" class="fas fa-star"></label>
                                                    <input type="radio" name="rate" id="rate-1" class="rating-stars" value="1">
                                                    <label for="rate-1" class="fas fa-star"></label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <input type="text" class="form-control" name="comments" placeholder="Enter your comment..."> 
                                        <input type="hidden" name="customerID" value="<%= customer.getCustomerId() %>">
                                        <input type="hidden" name="productID" value="<%= product.get(0).getProductId() %>">
                                    </div>
                                    <div class="row py-3">
                                        <button type="submit" class="btn btn-light btn-lg btn-block">Submit</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <% if (commentList != null) { %>
                            <% for (int i = 0; i < commentList.size(); i++) {   
                                Comment comment = commentList.get(i);
                                if(product.get(0).getProductId() == comment.getProductId().getProductId()) {
                            %>
                            <div>
                                <div class=" d-flex flex-row align-items-center p-3 form-color">
                                    <div class="col-2">
                                        <img src="https://qph.fs.quoracdn.net/main-qimg-5df8f63d2379b189e8ef7de43b6a0ce2-c" width="100px" class="rounded-circle mr-2">
                                    </div>
                                    <div class="col-10 px-3">
                                        <div class="row">
                                            <div class="d-flex justify-content-between align-items-center">
                                                <div class="d-flex flex-row align-items-center"> 
                                                    <span class="mr-2 font-weight-bold"><%= comment.getCustomerId().getFullname()%></span> 
                                                    <div>
                                                        <%
                                                            switch(comment.getRating()) {
                                                               case 1:
                                                                   %><label class="fas fa-star rated"></label>
                                                                   <label for="rate-1" class="fas fa-star"></label>
                                                                   <label for="rate-1" class="fas fa-star"></label>
                                                                   <label for="rate-1" class="fas fa-star"></label>
                                                                   <label for="rate-1" class="fas fa-star"></label><%
                                                                  break;
                                                               case 2:
                                                                  %><label class="fas fa-star rated"></label>
                                                                  <label class="fas fa-star rated"></label>
                                                                  <label for="rate-1" class="fas fa-star"></label>
                                                                  <label for="rate-1" class="fas fa-star"></label>
                                                                  <label for="rate-1" class="fas fa-star"></label><%
                                                                  break;
                                                               case 3:
                                                                  %><label class="fas fa-star rated"></label>
                                                                  <label class="fas fa-star rated"></label>
                                                                  <label class="fas fa-star rated"></label>
                                                                  <label for="rate-1" class="fas fa-star"></label>
                                                                  <label for="rate-1" class="fas fa-star"></label>
                                                                  <%
                                                                  break;
                                                               case 4:
                                                                  %><label class="fas fa-star rated"></label>
                                                                  <label class="fas fa-star rated"></label>
                                                                  <label class="fas fa-star rated"></label>
                                                                  <label class="fas fa-star rated"></label>
                                                                  <label for="rate-1" class="fas fa-star"></label>
                                                                  <%
                                                                  break;
                                                               case 5:
                                                                  %><label class="fas fa-star rated"></label>
                                                                  <label class="fas fa-star rated"></label>
                                                                  <label class="fas fa-star rated"></label>
                                                                  <label class="fas fa-star rated"></label>
                                                                  <label class="fas fa-star rated"></label>
                                                                  <%
                                                                  break;
                                                            }
                                                         %>
                                                         <small> <%= comment.getRating()%> </small>
                                                    </div> 
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div><%= comment.getContent()%></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                                <% } %>
                            <% } %>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="./Components/Footer.jsp"/>  
    </body>
</html>