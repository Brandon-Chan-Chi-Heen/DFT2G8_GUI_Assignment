<%@page import="java.util.List"%>
<%@page import="Models.Product"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.lang.String"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.PersistenceContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Product> productList = (List<Product>) session.getAttribute("productList");
    int pageCount = (int) Math.ceil(productList.size() / 10.0);
    int pageNo = 1;
    try {
        pageNo = (Integer) request.getAttribute("pageNo");
    } catch (Exception e){
        pageNo = 1;
    }
    String col = (String) session.getAttribute("col");
    String sort = (String) session.getAttribute("sort");
    String search = (String) session.getAttribute("search");
    String col_search = (String) session.getAttribute("col_search");
%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List users</title>

        <script src="https://kit.fontawesome.com/6dfd1ad61e.js" crossorigin="anonymous"></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="<%= request.getContextPath()%>/backend/index.css" type="text/css" rel="stylesheet">        
        <link href="<%= request.getContextPath()%>/backend/Product/product.css" type="text/css" rel="stylesheet">

        <script>
            function toRedirect(userId, location) {
                window.location = `\${location}?edit_product_id=\${userId}`;
            }

            function enableModal(arr) {
                var myModal = new bootstrap.Modal(document.getElementById('myModal'));
                let tdObj = [
                    document.querySelector("#td1"),
                    document.querySelector("#td2"),
                    document.querySelector("#td3"),
                    document.querySelector("#td4")
                ];

                for (let i = 0; i < tdObj.length; i++) {
                    tdObj[i].innerText = arr[i];
                }
                document.querySelector("#productIdInput").value = arr[0];
                myModal.show();
            }
        </script>
    </head>

    <body class="bg-dark">

        <%@ include file="../adminsidebar.jsp"%>

        <div class="modal" tabindex="-1" id="myModal">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title text-center text-danger ms-3">CONFIRM DELETE RECORD?</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <table class="event-list container" style="margin-top: 10px;">
                            <tr class="text-center">
                                <th style="width:15%;text-decoration: none; color: white;">Product Name<i class="fas fa-sort"></i></th>
                                <th style="width:30%; text-align:left;text-decoration: none; color: white;">Description <i class="fas fa-sort"></i></th>
                                <th style="width:20%;text-decoration: none; color: white;">Quantity<i class="fas fa-sort"></i></th>
                                <th style="width:20%;text-decoration: none; color: white;">Price <i class="fas fa-sort"></i></th>
                            </tr>
                            <tr class="text-center">
                                <td id="td1"></td>
                                <td id="td2" style="text-align:left;"></td>
                                <td id="td3"></td>
                                <td id="td4"></td>
                            </tr>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <form action="<%= request.getContextPath() + "/ProductController"%>" method="POST">
                            <input id="productIdInput" name="productId" type="hidden" value="">
                            <button type="submit" class="btn btn-danger ">Delete</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <section class="text-white">
            <!-- //Paste -->
            <form class="mb-0 mx-3 row container mb-3" action="" method="GET">
                <div class="col-md-4">
                    <input name="search" type="text" class="form-control" value="${search}" placeholder="Search...">
                </div>
                <div class="col-md-2">
                    <select name="col_search" id="" class="form-select">
                        <%
                            Hashtable<String, String> colArray = new Hashtable<String, String>() {
                                {
                                    put("productId", "Product ID");
                                    put("description", "Description");
                                    put("quantity", "Quantity");
                                    put("price", "Price");
                                }
                            };
                            Set<String> tableColSet = colArray.keySet();
                            for (String colName : tableColSet) {
                                String isSelected = colName.equals(col_search) ? "selected" : "";
                        %>
                        <option value='<%= colName%>' <%= isSelected%>><%= colArray.get(colName)%> </option>
                        <%  }
                        %>

                    </select>
                </div>
                <button type="submit" class="btn btn-secondary" style="width: 50px;">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                    </svg>
                </button>
            </form>
            <h1 class="mx-3">Products</h1>
            <button class="btn btn-primary" onclick="window.location.href = '<%= request.getContextPath()%>/backend/Product/add_product.jsp'">
                Add New Product
            </button>
            <%
                List<String> deleteStatus = (List<String>) request.getAttribute("deleteStatus");
                if (deleteStatus != null && !deleteStatus.get(0).equals("0")) {
            %>
            <h2 class='text-danger bg-light rounded-2 p-3 mx-3'><%= deleteStatus.get(1)%> </h2>
                <%
                    }
                %>

                <table class="table-sortable">
                    <thead>
                        <tr class="text-center">
                            <%                        // generate table header
                                String searchParams = "";
                                if ((String) session.getAttribute("search") != null) {
                                    searchParams = String.format("&search=%s&col_search=%s", (String) session.getAttribute("search"), (String) session.getAttribute("colSearch"));
                                }
                                List<String> tableheaders = Arrays.asList("productId", "description", "quantity", "price");
                                for (String colName : tableheaders) {
                                    String localSortVar = "ASC";
                                    // set sort hyperlink
                                    if (col != null && col.equals(colName)) {
                                        localSortVar = sort.equals("ASC") ? "DESC" : "ASC";
                                    }
                            %>

                            <th style="width:10%">
                                <a style="text-decoration: none;color: white;" href="<%= String.format(request.getContextPath() + "/ProductController?pageNo=%s&col=%s&sort=%s" + searchParams, pageNo, colName, localSortVar)%>">
                                    <%= colArray.get(colName)%> 
                                    <i class="fas fa-sort"></i>
                                </a>
                               
                            </th>
                            <%  }
                            %>
                            <th style="width:15%;">Actions</th>
                        </tr>
                    </thead>

                    <tbody>
                        <%
                            int startIndex = (pageNo - 1) * 10;
                            for (int i = startIndex;
                                    i < startIndex
                                    + 10 && i < productList.size();
                                    i++) {%>
                        <tr class="text-center">
                            <td><%= productList.get(i).getProductId()%></td>
                            <td  style="text-align:left;"><%= productList.get(i).getDescription()%></td>
                            <td><%= productList.get(i).getQuantity()%></td>
                            <td><%= productList.get(i).getPrice()%></td>
                            <td>
                                <button onclick="toRedirect(<%= productList.get(i).getProductId()%>, '<%= request.getContextPath()%>/EditProductController')" class="btn btn-primary">Edit</button>
                                <button class="btn btn-danger" onclick="enableModal(['<%= productList.get(i).getProductId()%>', `<%= productList.get(i).getDescription()%>`, '<%= productList.get(i).getQuantity()%>', '<%= productList.get(i).getPrice()%>']);">Delete</button>
                            </td>

                        </tr>
                        <% }%>
                    </tbody>
                    <tfoot>
                        <tr></tr>
                    </tfoot>
                </table>
                <%
                    int previous = pageNo - 1;
                    int next = pageNo + 1;
                %>
                <div class="d-flex flex-row justify-content-center px-auto container">
                    <%
                        if (previous
                                > 0) {
                    %>
                    <button type="button" onclick="window.location = '<%= request.getContextPath()%>/ProductController?pageNo=<%= previous%>'" class="btn btn-primary mx-3">
                        Previous
                    </button> 
                    <%
                        }
                    %>


                    <form action="<%= request.getRequestURL()%>" method="GET">
                        <input name="pageNo" value="<%= pageNo%>" id="pageNoInput" type="number" placeholder="1 ... {$pageCount}" min="1" max="<%= pageCount%>">
                    </form>
                    <%
                        // make sure 
                        if (next < pageCount
                                + 1) {
                    %>
                    <button type="button" onclick="window.location = '<%= request.getContextPath()%>/ProductController?pageNo=<%= next%>'" class="btn btn-primary mx-3">
                        Next
                    </button>
                    <%}
                    %>
                </div>
        </section>
    </body>

</html>
