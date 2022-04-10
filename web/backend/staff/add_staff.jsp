<%-- 
    Document   : index
    Created on : Apr 6, 2022, 11:47:20 PM
    Author     : lenovo
--%>

<%@page import="Models.Staff"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String NO_CHANGE = "0", VALUE_CHANGED = "1", INPUT_ERROR = "2";
    Staff staff = (Staff) request.getAttribute("staff");
    if (staff == null) {
        staff = new Staff();
        staff.setEmail("");
        staff.setGender(' ');
        staff.setPassword("");
        staff.setUsername("");
        staff.setContactNo("");
    }
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dash Board</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="index.css" type="text/css" rel="stylesheet">
        <link href="<%= request.getContextPath()%>/backend/index.css" type="text/css" rel="stylesheet">
    </head>

    <body class="bg-dark">

        <%@ include file="../adminsidebar.jsp"%>
        <section class="text-white">
            <h1>Add User</h1>

            <form class="g-3 needs-validation" action="<%= request.getContextPath()%>/AddStaff" method="POST" novalidate>

                <div class="col-md-4 mb-3">
                    <label for="firstNameInput" class="form-label">Username </label>
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
                    <input name="username" type="text" class="form-control <%= displayUsernameInputStatus%>" id="firstNameInput" pattern="^[a-zA-Z\s]*$" placeholder="Alex" value="<%= staff.getUsername()%>" required>
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
                    <input name="email" type="email" class="form-control <%= displayEmailInputStatus%>" id="emailInput" pattern="^[a-zA-Z0-9.!#\/$%&'*+=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" placeholder="example@email.com" value="<%= staff.getEmail()%>" required>
                    <div class="invalid-feedback">
                        <%= emailStatus.get(1)%>
                    </div>
                    <div class="valid-feedback">
                        Ok!
                    </div>
                </div>

                <div class="col-md-4 mb-3">
                    <label for="contactNoInput" class="form-label">Contact Number</label>
                    <%
                        List<String> contactNoStatus = (List<String>) request.getAttribute("contactNoStatus");
                        if (contactNoStatus == null) {
                            contactNoStatus = Arrays.asList(NO_CHANGE, "");
                        }
                        String displayContactNoInputStatus = "";
                        if (contactNoStatus.get(0).equals(VALUE_CHANGED)) {
                            displayContactNoInputStatus = "is-valid";
                        } else if (contactNoStatus.get(0).equals(INPUT_ERROR)) {
                            displayContactNoInputStatus = "is-invalid";
                        }
                    %>
                    <input name="contactNo" type="tel" class="form-control <%= displayContactNoInputStatus%>"pattern="[0-9]{3}-[0-9]{7,8}" id="contactNoInput" pattern="[0-9]{2,3}-[0-9]{7,8}" placeholder="012-1231234"value="<%= staff.getContactNo()%>" required>
                    <div class="invalid-feedback">
                        Please Enter a valid phone number
                    </div>
                    <div class="valid-feedback">
                        Ok!
                    </div>
                </div>

                <div class="col-md-6 mb-3">
                    <label for="genderSelect" class="form-label">Gender</label>
                    <%
                        String noSelect = "";
                        String selectedMale = "";
                        String selectedFemale = "";

                        if (staff.getGender() == 'M') {
                            selectedMale = "selected";
                        } else if (staff.getGender() == 'F') {
                            selectedFemale = "selected";
                        } else {
                            noSelect = "selected";
                        }

                        List<String> genderStatus = (List<String>) request.getAttribute("genderStatus");
                        if (genderStatus == null) {
                            genderStatus = Arrays.asList(NO_CHANGE, "");
                        }
                        String displayGenderInputStatus = "";
                        if (genderStatus.get(0).equals(VALUE_CHANGED)) {
                            displayGenderInputStatus = "is-valid";
                        } else if (genderStatus.get(0).equals(INPUT_ERROR)) {
                            displayGenderInputStatus = "is-invalid";
                        }
                    %>
                    <select name="gender" id="genderSelect" class="form-select <%= displayGenderInputStatus%>" required>
                        <option value="" <%= noSelect%> disabled hidden>Select Gender</option>
                        <option value="M" <%= selectedMale%>>
                            Male
                        </option>
                        <option value="M" <%= selectedFemale%> >
                            Female
                        </option>
                    </select>
                    <div class="invalid-feedback">
                        Please select your gender
                    </div>
                    <div class="valid-feedback">
                        Changed!
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
                    <button class="btn btn-primary" type="submit">Add User</button>
                    <%
                        String registerSuccess = (String) request.getAttribute("registerSuccess");
                        if (registerSuccess != null) {
                    %>
                    <a class="btn btn-primary" href="<%= request.getContextPath()%>/StaffController">Return</a>
                    <% }%>
                </div>
            </form>
        </div>
        <br>
    </section>
</body>

</html>