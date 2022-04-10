<%-- 
    Document   : edit_staff
    Created on : Apr 7, 2022, 3:23:01 PM
    Author     : lenovo
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="Models.Customers"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Customers customer = (Customers) request.getAttribute("customer");
    final String NO_CHANGE = "0", VALUE_CHANGED = "1", INPUT_ERROR = "2";
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Modification</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="<%= request.getContextPath()%>/backend/index.css" type="text/css" rel="stylesheet">
    </head>

    <body class="bg-dark">
        <%@include file="../adminsidebar.jsp"%>

        <section class="text-white">

            <h1>Edit Customers</h1>

            <form class="g-3 needs-validation " action="<%= request.getContextPath()%>/EditCustomerController" method="POST" <% //enctype="multipart/form-data" %> novalidate>
                <input type="hidden" id="user_id" name="customerId" value="${customer.customerId}">
                <div class="col-md-4 mb-3">
                    <label for="usernameInput" class="form-label">Username</label>
                    <%
                        List<String> usernameStatus = (List<String>) request.getAttribute("usernameStatus");
                        if (usernameStatus == null) {
                            usernameStatus = Arrays.asList(NO_CHANGE, "");
                        }
                        String displayUsernameInputStatus = "";
                        if (usernameStatus.get(0).equals(VALUE_CHANGED)) {
                            displayUsernameInputStatus = "is-valid";
                        } else if (usernameStatus.get(0).equals(INPUT_ERROR)) {
                            displayUsernameInputStatus = "is-invalid";
                        }
                    %>
                    <input name="username" type="text" class="form-control <%= displayUsernameInputStatus%>" id="usernameInput" pattern="^[a-zA-Z\s]*$" placeholder="Alex" value="<%= customer.getUsername()%>" required>
                    <div class="invalid-feedback">
                        Please Enter a valid Name
                    </div>
                    <div class="valid-feedback">
                        Ok!
                    </div>
                </div>

                <div class="col-md-4 mb-3">
                    <label for="fullnameInput" class="form-label">Full name</label>
                    <%
                        List<String> fullnameStatus = (List<String>) request.getAttribute("fullnameStatus");
                        if (fullnameStatus == null) {
                            fullnameStatus = Arrays.asList(NO_CHANGE, "");
                        }
                        String displayFullnameInputStatus = "";
                        if (fullnameStatus.get(0).equals(VALUE_CHANGED)) {
                            displayFullnameInputStatus = "is-valid";
                        } else if (fullnameStatus.get(0).equals(INPUT_ERROR)) {
                            displayFullnameInputStatus = "is-invalid";
                        }
                    %>
                    <input name="fullname" type="text" class="form-control <%= displayFullnameInputStatus%>" id="fullnameInput" pattern="^[a-zA-Z\s]*$" placeholder="Alex" value="<%= customer.getUsername()%>" required>
                    <div class="invalid-feedback">
                        Please Enter a valid Name
                    </div>
                    <div class="valid-feedback">
                        Ok!
                    </div>
                </div>


                <div class="col-md-6 mb-3">
                    <label for="emailInput" class="form-label">Email address</label>
                    <%
                        List<String> emailStatus = (List<String>) request.getAttribute("emailStatus");
                        if (emailStatus == null) {
                            emailStatus = Arrays.asList(NO_CHANGE, "");
                        }
                        String displayEmailInputStatus = "";
                        if (emailStatus.get(0).equals(VALUE_CHANGED)) {
                            displayEmailInputStatus = "is-valid";
                        } else if (emailStatus.get(0).equals(INPUT_ERROR)) {
                            displayEmailInputStatus = "is-invalid";
                        }
                    %>
                    <input name="email" type="email" class="form-control <%= displayEmailInputStatus%>" id="emailInput" pattern="^[a-zA-Z0-9.!#\/$%&'*+=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" placeholder="example@email.com" value="<%= customer.getEmail()%>" required>
                    <div class="invalid-feedback">
                        <%= emailStatus.get(1)%>
                    </div>
                    <div class="valid-feedback">
                        Ok!
                    </div>
                </div>

                <div class="col-md-8 row g-0 mb-3 pt-3">
                    <%
                        List<String> passwordStatus = (List<String>) request.getAttribute("passwordStatus");
                        if (passwordStatus == null) {
                            passwordStatus = Arrays.asList(NO_CHANGE, "");
                        }
                        String displayPasswordInputStatus = "";
                        if (passwordStatus.get(0).equals(VALUE_CHANGED)) {
                            displayPasswordInputStatus = "is-valid";
                        } else if (passwordStatus.get(0).equals(INPUT_ERROR)) {
                            displayPasswordInputStatus = "is-invalid";
                        }
                    %>
                    <div class="col-md-6 mb-3 <%= displayPasswordInputStatus%>">
                        <label for="passwordInput">Password</label>
                        <input name="password" type="password" class="form-control m-0" id="passwordInput" placeholder="Password" required>
                    </div>
                    <div id="passwordErrorWrapper" class="col-md-6 mb-3 px-2">
                        <label for="confirmPasswordInput">Confirm Password</label>
                        <input name="confirmPassword" type="password" class="form-control" id="confirmPasswordInput" placeholder="Confirm Password" required>
                    </div>
                    <div class="invalid-feedback col-md-12 px-2 text-center">
                        Password Cannot Be Empty
                    </div>
                    <div class="valid-feedback col-md-12 px-2  text-center">
                        Changed!
                    </div>
                </div>

                <div class="col-12">
                    <button class="btn btn-primary" type="submit">Save</button>
                    <a class="btn btn-primary" href="<%= request.getContextPath()%>/CustomerController">Return</a>
                </div>
            </form>

        </div>
    </section>
</body>

</html>