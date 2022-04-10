<%-- 
    Document   : login
    Created on : Mar 28, 2022, 2:40:50 PM
    Author     : Henry
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="customers" scope="session" class="Model.Customers"/>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="<%=request.getContextPath()%>/Client/CSS/loginCSS.css">   
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.0/dist/jquery.validate.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Login page</title>
    </head>
    <body>
        <div class="login-box">
            <h1>Customer Login Page</h1>
            <form action="<%=request.getContextPath()%>/LoginServlet" method="post" id="loginForm">
                <h3 style="color:blueviolet;">${errorMessage}</h3>
                <h3 style="color:green;">${successMessage}</h3>

                <label>User Name :</label> 
                <input type="text" name="username" placeholder="user name"/>

                <label>Password :</label> 
                <input type="password" name="password" placeholder="password"/>

                <button type="submit" name="submit" value="Login">Login</button>

                <p class="para-2">Don't have an account? <a href="<%=request.getContextPath()%>/Client/register.jsp">Register here</a></p>
            </form>    
        </div>


    </body>
    <script type="text/javascript">
 
    $(document).ready(function() {
        $("#loginForm").validate({
            rules: {
                username: {
                    required: true,
    
                },
         
                password: "required",
            },
             
            messages: {
                username: {
                    required: " Please enter username! ",
       
                },
                 
                password: " Please enter password! "
            }
        });
 
    });
</script>
</html>
