<%-- 
    Document   : checkOut
    Created on : Apr 3, 2022, 4:22:44 PM
    Author     : Henry
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
        <link rel="stylesheet" href="<%=request.getContextPath()%>/Client/CSS/checkOutCSS.css">   
        <script src="https://kit.fontawesome.com/6dfd1ad61e.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>Checkout Page</title>
    </head>
    <body>

        <script>
            $(document).ready(function () {
                $('input:text').focus(
                        function () {
                            $(this).css({'background-color': '#f1ffd1'});
                        });

                $('input:text').blur(
                        function () {
                            $(this).css({'background-color': '#FFF'});
                        });

                $('textarea').focus(
                        function () {
                            $(this).css({'background-color': '#f1ffd1'});
                        });

                $('textarea').blur(
                        function () {
                            $(this).css({'background-color': '#FFF'});
                        });
            });




        </script>


        <section class="checkOut-section">   

            <form name="checkOut" action="<%=request.getContextPath()%>/PaymentServlet" method="post">
                <div class="container">
                    <div class="title">Checkout Form</div>
                    <hr>
                    <div style="color: red; padding: 5px">
                        ${addressErrorMsg}
                    </div>


                    <div class="user-details">  



                        <div class="input-box">
                            <span class="details" id="personal-details">&#10172; | Shipping Address</span>       
                            <textarea style="padding:10px;" id="address" name="shippingAddress"  rows="4" cols="50" maxlength="60" autofocus required>${order.shippingAddress}</textarea>
                        </div>
                    </div>

                    <div class="payment-cards">
                        <div class="input-box">
                            <span class="details"><h3>Payment</h3></span>
                            <span class="details">Credit / Debit Cards only</span>
                            <div class="input-box">
                                <span class="details">Accepted Cards :</span>
                                <div class="icon-container">
                                    <i class="fa fa-cc-visa" style="color:navy;"></i>
                                    <i class="fa fa-cc-amex" style="color:blue;"></i>
                                    <i class="fa fa-cc-mastercard" style="color:red;"></i>
                                    <i class="fa fa-cc-discover" style="color:orange;"></i>
                                </div>
                            </div>
                            <div style="color: red; padding: 0px 0px 10px 15px;">
                                ${errorMsg}
                            </div>
                        </div>
                    </div>
                    <hr>




                    <div class="payment-details">
                        <div class="input-box">
                            <span class="details" id="personal-payment">Name on Card</span>
                            <input type="text" name="cardName" value="" maxlength="" placeholder="Name" autofocus required/>

                        </div>

                        <div class="input-box">
                            <span class="details" id="personal-payment">Credit/Debit card number</span>
                            <input type="text" name="cardNumber" value="" maxlength="" placeholder="1111 1111 1111 1111" autofocus required/>

                        </div>

                        <div class="input-box">
                            <span class="details" id="personal-payment">Expiry Date (MM/YY)</span>
                            <input type="month" id="expDate" name="expDate" value="" min="2022-08" max="2040-12" required >
                        </div>

                        <div class="input-box">
                            <span class="details" id="personal-payment">CVV Number</span>
                            <input type="text" name="CVVNumber" value="" maxlength="4" placeholder="111" autofocus required/>
                        </div>
                    </div>


                    <div class="button">
                        <input type="submit" name="submit" value="Confirm Payment" class="btn" />
                        <input type="reset" value="Reset" class="btn" />                              
                    </div>              
                </div>
       

        
                <div class="container">
                    <div class="title">Shopping Cart</div>
                    <hr>          
                    <table class="cart-table" >
                        <thead>
                            <tr>
                                <td>Product</td>
                                <td>Quantity</td>
                                <td>Price</td>                          
                            </tr>
                        </thead>
                        <tbody>
                            <% List<Product> productAllOrdered = new ArrayList<Product>(); %>
                            <% List<Integer> productAllQty = new ArrayList<Integer>();%>
                            <% BigDecimal subtotal = new BigDecimal(0); %>
                            <% for (int i = 0; i < productOrderArr.size() - 1; i++) {%>
                            <tr>
                                <%
                                    productAllOrdered.add(productOrderArr.get(i));
                                    productAllQty.add(orderQty.get(i));
                                %>
                                <td><%= productOrderArr.get(i).getProductName()%></td>
                                <td><%= orderQty.get(i)%></td>
                                <% BigDecimal total = productOrderArr.get(i).getPrice().multiply(BigDecimal.valueOf(orderQty.get(i))); %>
                                <% subtotal = total.add(subtotal);%>
                                <td><%= total%></td>
                            </tr>
                            <% }%>    
                            <%
                                session.setAttribute("customer", customer);
                                session.setAttribute("productAllOrdered", productAllOrdered);
                                session.setAttribute("subtotal", subtotal);
                                session.setAttribute("productAllQty", productAllQty);
                            %>
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="2" align="right">Total:</td>
                                <td><%= subtotal%></td>
                            </tr>
                        </tfoot>
                    </table>      
                </div>
            </form>
        </section>
    </body>
</html>
