<%-- 
    Document   : adminlogin
    Created on : Apr 6, 2022, 3:36:17 PM
    Author     : lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Admin Panel</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <link href="<%= request.getContextPath() %>/backend/Login.css" rel="stylesheet">
</head>

<body class="bg-dark text-center">

    <div class="form-signin container bg-white">

        <form class="needs-validation" action="j_security_check" method="POST" novalidate>
            <h1 class="">Admin Panel</h1>

            <div class="form-floating">
                <%
                    boolean validAdminID = true;
                    try {
                        validAdminID = request.getAttribute("validAdminID") != Boolean.FALSE;
                    } catch (Exception e){
                        validAdminID = true;
                    }
                    String adminInputErrorClass = !validAdminID ? "is-invalid" : "";
                %>
                <input name="j_username" type="text" class="form-control <%= adminInputErrorClass%>" id="floatingAdminID" placeholder="1001001" value="${adminID}" required>
                <label for="floatingAdminID">Username</label>
            </div>
            <div class="form-floating">
                <input name="j_password" type="password" class="form-control ${ emptyPassword.toString().isEmpty() ? "is-invalid" : ""}" id="floatingPassword" placeholder="Password" required>
                <label for="floatingPassword">Password</label>
            </div>
               ${validCredentials != null && !validCredentials ? "<div class=\"mb-3 text-danger\">Wrong Email or Password</div>" : ""}
            <button class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
        </form>
    </div>
    <br>
</body>

</html>
