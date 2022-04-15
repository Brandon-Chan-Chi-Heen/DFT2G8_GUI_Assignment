<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.*, java.util.*"%>
<jsp:useBean id="product" scope="session" class="Models.Product"/>
<jsp:useBean id="customers" scope="session" class="Models.Customers"/>
<% List<Comment> commentList = (List<Comment>) session.getAttribute("commentList");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <title>Comment Section</title>
    </head>
    <body> 
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
                                        if(product.getProductId() == commentNew.getProductId().getProductId()) {
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
                        <form action="../../CommentController" method="post">
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
                                        <input type="hidden" name="customerID" value="<%= customers.getCustomerId() %>">
                                        <input type="hidden" name="productID" value="<%= product.getProductId() %>">
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
                                if(product.getProductId() == comment.getProductId().getProductId()) {
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
    </body>
</html>
