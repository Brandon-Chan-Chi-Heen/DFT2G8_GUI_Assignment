<%-- 
    Document   : edit_staff
    Created on : Apr 7, 2022, 3:23:01 PM
    Author     : lenovo
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="Models.Staff"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--if ($_SERVER["REQUEST_METHOD"] == "GET" && isset($_GET['user_id'])) {
    $_SESSION["cur_edit_key"] = $_GET['user_id'];
} else if (empty($_SESSION['cur_edit_key'])) {
    echo <<<JAVASCRIPT
                <script>
                    alert(`No record selected, Please select first.
                         Enter To Continue`); 
                    window.location='list_user.php';
                </script>
JAVASCRIPT;
    die();
}

$db = new Database();
// if not empty get["sort"]


$result = $db->select(array('first_name', 'last_name', 'email', 'gender'), "user_id = {$_SESSION['cur_edit_key']}", 'user')[0];
[$firstName, $lastName, $email, $gender] = $result;


if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_FILES)) {
    $file = $_FILES['file'];
    $fileErr = '';

    if ($file['error'] > 0) {
        switch ($file['error']) {
            case UPLOAD_ERR_NO_FILE: // Code = 4.
                // ignore and don't update
                break;
            case UPLOAD_ERR_FORM_SIZE: // Code = 2.
                $fileErr = 'File uploaded is too large. Maximum 1MB allowed.';
                break;
            default: // Other codes.
                $fileErr = 'There was an error while uploading the file.';
                break;
        }
    } else if ($file['size'] > 1048576) {
        // Check the file size. Prevent hacks.
        // 1MB = 1024KB = 1048576B.
        $fileErr = 'File uploaded is too large. Maximum 1MB allowed.';
    } else {
        $ext = strtoupper(pathinfo($file['name'], PATHINFO_EXTENSION));

        if (
            $ext != 'JPG'  &&
            $ext != 'JPEG' &&
            $ext != 'GIF'  &&
            $ext != 'PNG'
        ) {
            $fileErr = 'Only JPG, GIF and PNG format are allowed.';
        } else {
            $save_as = $_SESSION['cur_edit_key'] . '.' . $ext;

            // delete any existing img with the same name but different ext

            $oldFile = @glob("$docRoot/resources/{$_SESSION["cur_edit_key"]}.*")[0];
            unlink($oldFile);
            move_uploaded_file($file['tmp_name'], "$docRoot/resources/" . $save_as);
        }
    }
}
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST)) {

        $whereStatement = "user_id = {$_SESSION['cur_edit_key']}";

        foreach ($changeArray as $col => $value) {
            if ($value["change_status"] && !empty($value["value"])) {
                $changeArray[$col]["updated_status"] = $db->update(array($col), array($value["value"]), $whereStatement, 'user');
            }
        }
        $result = $db->select(array('first_name', 'last_name', 'email', 'gender'), "user_id = {$_SESSION['cur_edit_key']}", 'user')[0];
        [$firstName, $lastName, $email, $gender] = $result;
        $db->disconnect();
    }
}
?>-->

<%
    Staff staff = (Staff) request.getAttribute("staff");
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
        <?php
        include_once "../sidebar.php";
        ?>
        <%@include file="../adminsidebar.jsp"%>

        <section class="text-white">

            <h1>Edit User</h1>
            <!--<img src="<?php echo "$sevRoot/utility/getImage.php?user_id={$_SESSION["cur_edit_key"]}" ?>" height="200" width="200" style="object-fit:cover;" alt="">-->

            <form class="g-3 needs-validation " action="<%= request.getContextPath()%>/EditStaffController" method="POST" <% //enctype="multipart/form-data" %> novalidate>
                <input type="hidden" id="user_id" name="staffId" value="${staff.staffId}">
                <div class="rounded-circle g-0 my-3" id="fileInputDiv">
                    <%
                        String fileErr = (String) request.getAttribute("fileErr");
                        String fileErrClass = fileErr != null && !fileErr.isEmpty() ? "is-invalid" : "";
                    %>
                    <input type="file" class="<%= fileErrClass%>" name="file" id="fileID" accept=".gif, .jpg, .jpeg, .png" />
                    <div class="invalid-feedback">
                        <%= fileErr%>
                    </div>
                </div>

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
                    <input name="username" type="text" class="form-control <%= displayUsernameInputStatus%>" id="firstNameInput" pattern="^[a-zA-Z\s]*$" placeholder="${staff.username}" required>
                    <div class="invalid-feedback">
                        Please Enter a valid Name
                    </div>
                    <div class="valid-feedback">
                        Changed!
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
                    <input name="email" type="email" class="form-control <%= displayEmailInputStatus%>" id="emailInput" pattern="^[a-zA-Z0-9.!#\/$%&'*+=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$" placeholder="${staff.email}" required>
                    <div class="invalid-feedback">
                        <%= emailStatus.get(1)%>
                    </div>
                    <div class="valid-feedback">
                        Changed!
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
                    <button class="btn btn-primary" type="submit">Save</button>
                    <a class="btn btn-primary" href="list_user.php">Return</a>
                </div>
            </form>

        </div>
    </section>
</body>

</html>