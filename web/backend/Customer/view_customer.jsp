<%@page import="java.util.List"%>
<%@page import="Models.Customers"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Hashtable"%>
<%@page import="java.lang.String"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.PersistenceContext"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    List<Customers> customerList = (List<Customers>) session.getAttribute("customerList");
    int pageCount = (int) Math.ceil(customerList.size() / 10.0);
    int pageNo = 1;
    try {
        pageNo = (Integer) request.getAttribute("pageNo");
    } catch (Exception e) {
        pageNo = 1;
    }
//    try {
//        pageNo = Integer.parseInt((String) request.getAttribute("pageNo"));
//    } catch (Exception e) {
//        pageNo = 1;
//    }
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
        <title>List Customers</title>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <link href="<%= request.getContextPath()%>/backend/index.css" type="text/css" rel="stylesheet">        
        <link href="<%= request.getContextPath()%>/backend/Customer/customer.css" type="text/css" rel="stylesheet">

        <script>
            function toRedirect(userId, location) {
                window.location = `\${location}?edit_customer_id=\${userId}`;
            }

            function enableModal(arr) {
                var myModal = new bootstrap.Modal(document.getElementById('myModal'));
                let tdObj = [
                    document.querySelector("#td1"),
                    document.querySelector("#td2"),
                    document.querySelector("#td3"),
                ];

                for (let i = 0; i < tdObj.length; i++) {
                    tdObj[i].innerText = arr[i];
                }
                document.querySelector("#customerIdInput").value = arr[0];
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
                                <th style="width:15%;">Customer Id</th>
                                <th style="width:30%; text-align:left;">Username</th>
                                <th style="width:20%;">Full Name</th>
                                <th style="width:20%;">Email</th>

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
                        <form action="<%= request.getContextPath() + "/CustomerController"%>" method="POST">
                            <input id="customerIdInput" name="customerId" type="hidden" value="">
                            <button type="submit" class="btn btn-danger ">Delete</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <section class="text-white">
            <form class="mb-0 mx-3 row container mb-3" action="" method="GET">
                <div class="col-md-4">
                    <input name="search" type="text" class="form-control" value="${search}" placeholder="Search...">
                </div>
                <div class="col-md-2">
                    <select name="col_search" id="" class="form-select">
                        <%
                            Hashtable<String, String> colArray = new Hashtable<String, String>() {
                                {
                                    put("customerId", "Customer ID");
                                    put("username", "User name");
                                    put("email", "Email Name");
                                    put("fullname", "Fullname");
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
            <h1 class="mx-3">Customers</h1>
            <button class="btn btn-primary" onclick="window.location.href = '<%= request.getContextPath()%>/backend/Customer/add_customer.jsp'">
                Add New Customers
            </button>
            <%
                List<String> deleteStatus = (List<String>) request.getAttribute("deleteStatus");
                if (deleteStatus != null && !deleteStatus.get(0).equals("0")) {
            %>
            <h2 class="text-danger bg-light rounded-2 p-3 mx-3"><%= deleteStatus.get(1)%> </h2>
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
                            List<String> tableheaders = Arrays.asList("customerId", "username", "email", "fullname");
                            for (String colName : tableheaders) {
                                String localSortVar = "ASC";
                                // set sort hyperlink
                                if (col != null && col.equals(colName)) {
                                    localSortVar = sort.equals("ASC") ? "DESC" : "ASC";
                                }
                        %>

                        <th style="width:10%;">
                            <a href="<%= String.format("?pageNo=%s&col=%s&sort=%s" + searchParams, pageNo, colName, localSortVar)%>">
                                <%= colArray.get(colName)%>
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
                        for (int i = startIndex; i < startIndex + 10 && i < customerList.size(); i++) {%>
                    <tr class="text-center">
                        <td><%= customerList.get(i).getCustomerId()%></td>
                        <td  style="text-align:left;"><%= customerList.get(i).getUsername()%></td>
                        <td><%= customerList.get(i).getEmail()%></td>
                        <td><%= customerList.get(i).getFullname()%></td>
                        <td>
                            <button onclick="toRedirect(<%= customerList.get(i).getCustomerId()%>, '<%= request.getContextPath()%>/EditCustomerController')" class="btn btn-primary">Edit</button>
                            <button class="btn btn-danger" onclick="enableModal(['<%= customerList.get(i).getCustomerId()%>', '<%= customerList.get(i).getUsername()%>', '<%= customerList.get(i).getEmail()%>', '<%= customerList.get(i).getFullname()%>']);">Delete</button>
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
                <button type="button" onclick="window.location = '<%= request.getRequestURL()%>?pageNo=<%= previous%>'" class="btn btn-primary mx-3">
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
                <button type="button" onclick="window.location = '<%= request.getRequestURL()%>?pageNo=<%= next%>'" class="btn btn-primary mx-3">
                    Next
                </button>
                <%}
                %>
            </div>
        </section>
    </body>

</html>
