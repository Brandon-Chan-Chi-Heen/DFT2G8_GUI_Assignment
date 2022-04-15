
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.*, java.util.*"%>
<% List<Orders> customersOrder = (List<Orders>) session.getAttribute("customersOrderHistory");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <title>Customer Order History</title>
        <link href="./CSS/CustomerViewProduct.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/Navbar.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/Footer.css" rel="stylesheet" type="text/css"/>
        <script src="./JS/CustomerViewProduct.js" type="text/javascript" defer></script>
    </head>
    <!--need to have customerID passed as parameter-->
    <body>
        <jsp:include page="./Components/Navbar.jsp"/>  
        <section class="h-100 gradient-custom">
            <div class="container py-5 h-100">
              <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-lg-10 col-xl-8">
                  <div class="card" style="border-radius: 10px;">
                    <div class="card-body p-4">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                          <p class="lead fw-normal mb-0" style="color: #a8729a;">Order History</p>
                        </div>
                        <div class="card shadow-0 border mb-4">
                          <div class="card-body">
                            <table class="table table-striped">
                                <tbody class="m-2">
                                    <% for(Orders o : customersOrder){ %>
                                    <tr>
                                      <th scope="col" class="text-center">
                                          Order ID</br> <span class="text-muted"><%= o.getOrderId() %></span>
                                      </th>
                                      </th>
                                      <th scope="col" class="text-center">
                                          Date Ordered</br> <span class="text-muted"><%= o.getOrderDate() %></span>
                                      </th>
                                      </th>
                                      <th scope="col" class="text-center">
                                          Delivered on</br> <span class="text-muted"><%= o.getDeliveryDate() %></span>
                                      </th>
                                      <th scope="col" class="text-center">
                                          Status</br> <span class="text-muted"><%= o.getStatus() %></span>
                                      </th>
                                      <th scope="col" class="text-center">
                                          Total </br> <span class="text-muted">RM<%= o.getTotalAmount() %></span>
                                      </th>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                          </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
        </section>
        <jsp:include page="./Components/Footer.jsp"/>  
    </body>
</html>