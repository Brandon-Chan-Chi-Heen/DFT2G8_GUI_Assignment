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
        <link rel="stylesheet" href="<%=request.getContextPath()%>/Client/LoginRegistration/registerCSS.css">    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>Customer Registration Page</title>
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

                $('input:password').focus(
                        function () {
                            $(this).css({'background-color': '#f1ffd1'});
                        });

                $('input:password').blur(
                        function () {
                            $(this).css({'background-color': '#FFF'});
                        });
            });
        </script>

        <div class="register-box">
            <h1>Customer Registration Page</h1>
            <div style="color: red; padding: 2px;">
                ${errorMsg}
            </div>
            <form action="<%=request.getContextPath()%>/ClientRegister" method="post">
                <label>User Name :</label> 
                <input type="text" name="username" value="${customer.username}" maxlength="40" placeholder="user name"/>

                <label>Full Name :</label> 
                <input type="text" name="name" value="${customer.fullname}" maxlength="40" placeholder="full name"/>

                <label>E-mail :</label> 
                <input type="text" name="e-mail" value="${customer.email}" maxlength="40" placeholder="sample@gmail.com"/>

                <label>Password :</label> 
                <input type="password" name="password" value="${customer.password}" maxlength="40" placeholder="password"/>

                <label>Re-type Password :  </label> 
                <input type="password" name="password2" value="${cPassword}" maxlength="40" placeholder="confirm password"/>

                <button type="submit" name="submit" value="">Register</button>

            </form>

        </div>   

        <p class="para-2">Already have an account? <a href="<%=request.getContextPath()%>/Client/LoginRegistration/login.jsp">Login here</a></p> 


    </body>
</html>
