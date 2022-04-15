<%-- 
    Document   : edit_staff
    Created on : Apr 7, 2022, 3:23:01 PM
    Author     : lenovo
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="Models.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    Product product = (Product) request.getAttribute("product");
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
            <form class="g-3 needs-validation " action="<%= request.getContextPath()%>/EditProductController" method="POST"  novalidate>
                <input type="hidden" id="user_id" name="productId" value="${product.productId}">
               <div class="col-md-4 mb-3">
                    <label for="ProductNameInput" class="form-label">Product Name</label>
                    <%
                        List<String> productNameStatus = (List<String>) request.getAttribute("productNameStatus");
                        if (productNameStatus == null) {
                            productNameStatus = Arrays.asList(NO_CHANGE, "");
                        }
                        String displayProductNameInputStatus = "";
                        if (productNameStatus.get(0).equals(VALUE_CHANGED)) {
                            displayProductNameInputStatus = "is-valid";
                        } else if (productNameStatus.get(0).equals(INPUT_ERROR)) {
                            displayProductNameInputStatus = "is-invalid";
                        }
                    %>
                    <input name="productName" type="text" class="form-control <%= displayProductNameInputStatus%>" id="ProductNameInput" pattern="^[a-zA-Z\s]*$" placeholder="Alex" value="<%= product.getProductName()%>" required>
                    <div class="invalid-feedback">
                        Please Enter a valid Name
                    </div>
                    <div class="valid-feedback">
                        Ok!
                    </div>
                </div>

                <div class="col-md-4 mb-3">
                    <label for="descriptionInput" class="form-label">Description</label>
                    <%
                        List<String> descriptionStatus = (List<String>) request.getAttribute("descriptionStatus");
                        if (descriptionStatus == null) {
                            descriptionStatus = Arrays.asList(NO_CHANGE, "");
                        }
                        String displayDescriptionInputStatus = "";
                        if (descriptionStatus.get(0).equals(VALUE_CHANGED)) {
                            displayDescriptionInputStatus = "is-valid";
                        } else if (descriptionStatus.get(0).equals(INPUT_ERROR)) {
                            displayDescriptionInputStatus = "is-invalid";
                        }
                    %>
                    <input name="description" type="text" class="form-control <%= displayDescriptionInputStatus%>" id="descriptionInput" placeholder="Alex" value="<%= product.getDescription()%>" required>
                    <div class="invalid-feedback">
                        Please Enter a valid Description
                    </div>
                    <div class="valid-feedback">
                        Ok!
                    </div>
                </div>

                <div class="col-md-4 mb-3">
                    <label for="quantityInput" class="form-label">Quantity</label>
                    <%
                        List<String> quantityStatus = (List<String>) request.getAttribute("quantityStatus");
                        if (quantityStatus == null) {
                            quantityStatus = Arrays.asList(NO_CHANGE, "");
                        }
                        String displayQuantityInputStatus = "";
                        if (quantityStatus.get(0).equals(VALUE_CHANGED)) {
                            displayQuantityInputStatus = "is-valid";
                        } else if (quantityStatus.get(0).equals(INPUT_ERROR)) {
                            displayQuantityInputStatus = "is-invalid";
                        }
                    %>
                    <input name="quantity" type="number" min="0" class="form-control <%= displayQuantityInputStatus%>" id="quantityInput" placeholder="Alex" value="<%= product.getQuantity()%>" required>
                    <div class="invalid-feedback">
                        Please Enter a valid Quantity
                    </div>
                    <div class="valid-feedback">
                        Ok!
                    </div>
                </div>

                <div class="col-md-4 mb-3">
                    <label for="priceInput" class="form-label">Quantity</label>
                    <%
                        List<String> priceStatus = (List<String>) request.getAttribute("priceStatus");
                        if (priceStatus == null) {
                            priceStatus = Arrays.asList(NO_CHANGE, "");
                        }
                        String displayPriceInputStatus = "";
                        if (priceStatus.get(0).equals(VALUE_CHANGED)) {
                            displayPriceInputStatus = "is-valid";
                        } else if (priceStatus.get(0).equals(INPUT_ERROR)) {
                            displayPriceInputStatus = "is-invalid";
                        }
                    %>
                    <input name="price" type="number" min="0" step="0.01" class="form-control <%= displayPriceInputStatus%>" id="priceInput" placeholder="Alex" value="<%= product.getPrice()%>" required>
                    <div class="invalid-feedback">
                        Please Enter a valid Price
                    </div>
                    <div class="valid-feedback">
                        Ok!
                    </div>
                </div>

                <div class="col-12">
                    <button class="btn btn-primary" type="submit">Save</button>
                    <a class="btn btn-primary" href="<%= request.getContextPath()%>/ProductController">Return</a>
                </div>
            </form>

        </div>
    </section>
</body>

</html>