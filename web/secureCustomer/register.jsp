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
        <link rel="stylesheet" href="<%=request.getContextPath()%>/secureCustomer/registerCSS.css">       
        <title>Customer Registration Page</title>
    </head>
    <body>        
        <div class="register-box">
            <h1>Customer Registration Page</h1>
            <div style="color: red">
                ${errorMsg}
            </div>
            <form action="<%=request.getContextPath()%>/RegisterServlet" method="post">
                <label>UserName :</label> 
                <input type="text" name="username" value="${customer.username}"/>

                <label>Name :</label> 
                <input type="text" name="name" value="${customer.name}"/>

                <label>E-mail :</label> 
                <input type="text" name="e-mail" value="${customer.email}"/>

                <label>Password :</label> 
                <input type="password" name="password" value="${customer.password}"/>

                <label>Re-type Password :  </label> 
                <input type="password" name="password2" value="${cPassword}"/>

                 <button type="submit" name="submit" value="">Register</button>
              
            </form>
            <p>By clicking the Register button, you agree to our <br/>
            <a href="#">Terms and Condition</a> and <a href="#">Policiy and Private</a>
            </p>          
        </div>   
        <p class="para-2">Already have an account? <a href="login.jsp">Login here</a></p>
    </body>
</html>
