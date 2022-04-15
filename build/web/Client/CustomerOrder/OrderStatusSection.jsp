<%-- 
    Document   : OrderStatusSection
    Created on : Apr 9, 2022, 5:16:17 AM
    Author     : heeju
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Models.*, java.util.*"%>
<jsp:include page="../Navbar.html" />
<jsp:useBean id="orders" scope="session" class="Models.Orders"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" rel="stylesheet">
        <link href="../CSS/Navbar.css" rel="stylesheet" type="text/css"/>
        <link href="../CSS/Footer.css" rel="stylesheet" type="text/css"/>
        <script src="../JS/CustomerViewProduct.js" type="text/javascript" defer></script>
        <script src="../JS/Product.js" type="text/javascript" defer></script>
        <title>Customer Order Status Section</title>
    </head>
    <body>
        <!--need to have customerID and productID passed as parameter-->
        <style>
            .card {
                z-index: 0;
                background-color: #ECEFF1;
                padding-bottom: 20px;
                margin-top: 90px;
                margin-bottom: 90px;
                border-radius: 10px
            }

            .top {
                padding-top: 40px;
                padding-left: 13% !important;
                padding-right: 13% !important
            }

            #progressbar {
                margin-bottom: 30px;
                overflow: hidden;
                color: #455A64;
                padding-left: 0px;
                margin-top: 30px
            }

            #progressbar li {
                list-style-type: none;
                font-size: 13px;
                width: 33.33%;
                float: left;
                position: relative;
                font-weight: 400
            }

            #progressbar .step0:before {
                font-family: FontAwesome;
                content: "\f10c";
                color: #fff
            }

            #progressbar li:before {
                width: 40px;
                height: 40px;
                line-height: 45px;
                display: block;
                font-size: 20px;
                background: #C5CAE9;
                border-radius: 50%;
                margin: auto;
                padding: 0px
            }

            #progressbar li:after {
                content: '';
                width: 100%;
                height: 12px;
                background: #C5CAE9;
                position: absolute;
                left: 0;
                top: 16px;
                z-index: -1
            }

            #progressbar li:last-child:after {
                border-top-right-radius: 10px;
                border-bottom-right-radius: 10px;
                position: absolute;
                left: -50%
            }

            #progressbar li:nth-child(2):after,
            #progressbar li:nth-child(3):after {
                left: -50%
            }

            #progressbar li:first-child:after {
                border-top-left-radius: 10px;
                border-bottom-left-radius: 10px;
                position: absolute;
                left: 50%
            }

            #progressbar li:last-child:after {
                border-top-right-radius: 10px;
                border-bottom-right-radius: 10px
            }

            #progressbar li:first-child:after {
                border-top-left-radius: 10px;
                border-bottom-left-radius: 10px
            }

            #progressbar li.active:before,
            #progressbar li.active:after {
                background: #651FFF
            }

            #progressbar li.active:before {
                font-family: FontAwesome;
                content: "\f00c"
            }

            .icon {
                width: 60px;
                height: 60px;
                margin-right: 15px
            }

            .icon-content {
                padding-bottom: 20px
            }

            @media screen and (max-width: 992px) {
                .icon-content {
                    width: 50%
                }
            }
        </style>
        <div class="container px-1 px-md-4 py-5 mx-auto">
            <div class="card">
                <div class="card px-3">
                    <h2 class="col-12">Track Your Package</h2>
                    <div class="card-body row">
                        <table class="table table-striped">
                            <tbody class="m-2">
                              <tr>
                                <th scope="col" class="text-center">
                                    Estimated Delivery time </br> 
                                    <span class="text-muted">
                                        ${orders.deliveryDate}
                                    </span>
                                </th>
                                <th scope="col" class="text-center">
                                    Shipped To </br> <span class="text-muted">${orders.customerId.fullname},</br><i class="fa fa-envelope"></i><a href="${orders.customerId.email}" > ${orders.customerId.email}</a></span>
                                </th>
                                <th scope="col" class="text-center">
                                    Total Amount </br> <span class="text-muted">RM${orders.totalAmount}</span>
                                </th>
                                <th scope="col" class="text-center">
                                    Status </br> <span class="text-muted" style="text-transform: uppercase;">${orders.status}</span>
                                </th>
                              </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row d-flex justify-content-center">
                    <div class="col-12">
                        <ul id="progressbar" class="text-center">
                            <% if(orders.getStatus().equals("packaging")){ %>
                                <li class="active step0"></li>
                                <li class="step0"></li>
                                <li class="step0"></li>
                            <% } %>
                            <% if(orders.getStatus().equals("shipping")){ %>
                                <li class="active step0"></li>
                                <li class="active step0"></li>
                                <li class="step0"></li>
                            <% } %>
                            <% if(orders.getStatus().equals("delivered")){ %>
                                <li class="active step0"></li>
                                <li class="active step0"></li>
                                <li class="active step0"></li>
                            <% } %>
                        </ul>
                    </div>
                </div>
                <div class="row justify-content-between top">
                    <div class="row d-flex icon-content"> <img class="icon" src="https://i.imgur.com/9nnc9Et.png">
                        <div class="d-flex flex-column">
                            <p class="font-weight-bold">Order<br>Processed</p>
                        </div>
                    </div>
                    <div class="row d-flex icon-content"> <img class="icon" src="https://i.imgur.com/u1AzR7w.png">
                        <div class="d-flex flex-column">
                            <p class="font-weight-bold">Order<br>Shipped</p>
                        </div>
                    </div>
                    <div class="row d-flex icon-content"> <img class="icon" src="https://i.imgur.com/HdsziHP.png">
                        <div class="d-flex flex-column">
                            <p class="font-weight-bold">Order<br>Arrived</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
<jsp:include page="../Footer.html" />