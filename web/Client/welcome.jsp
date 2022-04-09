<%-- 
    Document   : welcome
    Created on : Mar 28, 2022, 10:19:09 PM
    Author     : Henry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customer" scope="session" class="Models.Customers"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body style="color: brown;">
        <h1>Hi ${customer.username}, This is your email : ${customer.email} and your ID: ${customer.customerId}.</h1>
        <a href="<%=request.getContextPath()%>/ClientLogout">Logout</a> <br/>
        <a href="<%=request.getContextPath()%>/Client/Order/checkOut.jsp">Click here to proceed payment.</a>  <br/>
        <a href="<%=request.getContextPath()%>/ServerSalesRecord">Click here to view sales records.</a>  
    </body>
</html>
