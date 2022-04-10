<%-- 
    Document   : register
    Created on : Mar 28, 2022, 2:52:38 PM
    Author     : Henry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/Client/CSS/registerCSS.css">       
        <title>Customer Registration Page</title>
    </head>
    <body>        
        <div class="register-box">
            <h1>Customer Registration Page</h1>
            <div style="color: red; padding: 2px;">
                ${errorMsg}
            </div>
            <form action="<%=request.getContextPath()%>/RegisterServlet" method="post">
                <label>User Name :</label> 
                <input type="text" name="username" value="${customer.username}" placeholder="user name"/>

                <label>Full Name :</label> 
                <input type="text" name="name" value="${customer.fullname}" placeholder="full name"/>

                <label>E-mail :</label> 
                <input type="email" name="e-mail" value="${customer.email}" placeholder="sample@gmail.com"/>

                <label>Password :</label> 
                <input type="password" name="password" value="${customer.password}" placeholder="aAbc@914"/>

                <label>Re-type Password :  </label> 
                <input type="password" name="password2" value="${cPassword}" placeholder="confirm password"/>

                <button type="submit" name="submit" value="">Register</button>

            </form>

        </div>   

        <p class="para-2">Already have an account? <a href="<%=request.getContextPath()%>/Client/login.jsp">Login here</a></p> 


    </body>
</html>
