<%-- 
    Document   : welcome
    Created on : Mar 28, 2022, 10:19:09 PM
    Author     : Henry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body style="color: brown;">
        <h1>Hi ${customer.username}, This is your email : ${customer.email} .</h1>
        <a href="<%=request.getContextPath()%>/CustomerLogout">Logout</a>     
    </body>
</html>
