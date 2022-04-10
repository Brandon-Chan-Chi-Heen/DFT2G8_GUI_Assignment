

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="admin-sidebar" class="d-flex flex-column flex-shrink-0 p-3 text-white">
    <script>
        function displaySideBar(buttonObj) {
            if (buttonObj.classList.contains("onclick")) {
                buttonObj.classList.remove("onclick");
            } else {
                buttonObj.classList.add("onclick");
            }
        }
    </script>
    <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
        <h1>Coop Deals</h1>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">

        <li>
            <% String activeStatus = "";%>
            <button class="btn btn-primary <%= activeStatus%>" style="text-align:left; width:100%;" onclick="displaySideBar(this);">
                Dashboard
            </button>
            <button class="btn btn-primary <%= activeStatus%>" style="text-align:left; width:100%;" onclick="displaySideBar(this);">
                Staff Management
            </button>
            <ul class="nav nav-pills flex-column subSideBar" >
                <%
                    // bg-light text-dark
                    // 
                    String childActiveStatus = "";
                %>
                <li class="container">
                    <a href="<%= request.getContextPath()%>/StaffController" class="nav-link <%= childActiveStatus%>">List Staff</a>
                </li>
                <li class="container">
                    <a href="" class="nav-link <%= childActiveStatus%>">Edit Staff</a>
                </li>
            </ul>
            <button class="btn btn-primary <%= activeStatus%>" style="text-align:left; width:100%;" onclick="displaySideBar(this);">
                Report
            </button>
            <ul class="nav nav-pills flex-column subSideBar" >
                <%
                    // bg-light text-dark
                    // 
//                    String childActiveStatus = "";
                %>
                <li class="container">
                    <a href="<%= request.getContextPath()%>/backend/Report/generateReport.jsp" class="nav-link <%= childActiveStatus%>">Generate Report</a>
                </li>
                <li class="container">
                    <a href="" class="nav-link <%= childActiveStatus%>">Edit Reports</a>
                </li>
            </ul>
            <button class="btn btn-primary <%= activeStatus%>" style="text-align:left; width:100%;" onclick="displaySideBar(this);">
                Products
            </button>
            <ul class="nav nav-pills flex-column subSideBar" >
                <%
                    // bg-light text-dark
                    // 
//                    String childActiveStatus = "";
                %>
                <li class="container">
                    <a href="" class="nav-link <%= childActiveStatus%>">Add Products</a>
                </li>
                <li class="container">
                    <a href="" class="nav-link <%= childActiveStatus%>">Edit Products</a>
                </li>
            </ul>
            <button class="btn btn-primary <%= activeStatus%>" style="text-align:left; width:100%;" onclick="displaySideBar(this);">
                Order
            </button>
            <ul class="nav nav-pills flex-column subSideBar" >

                <li class="container">
                    <a href="<%= request.getContextPath()%>/ServerRetrieveOrders" class="nav-link <%= childActiveStatus%>">Orders</a>
                </li>

            </ul>
            <button class="btn btn-primary <%= activeStatus%>" style="text-align:left; width:100%;" onclick="displaySideBar(this);">
                Search
            </button>
            <ul class="nav nav-pills flex-column subSideBar" >

                <li class="container">
                    <a href="<%= request.getContextPath()%>/backend/search.jsp" class="nav-link <%= childActiveStatus%>">Search</a>
                </li>

            </ul>
        </li>
    </ul>

    <hr>
    <div class="dropdown">
        <a href="#" class="d-block text-white text-decoration-none dropdown-toggle dropdown-toggle-split" id="dropdownUser1" data-bs-toggle="dropdown">
            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle mx-2"> 
            <!--<img src="<?php echo "$sevRoot/resources/user_icon.png" ?> " alt="user" width="32" height="32" class="rounded-circle mx-2">-->
        </a>
        <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="<% /* link to edit admin*/%>">Edit Profile</a></li>
            <li>
                <hr class="dropdown-divider">
            </li>
            <li><a class="dropdown-item" href="<% /* link to logout */%>">Sign out</a></li>
        </ul>
    </div>
</div>
