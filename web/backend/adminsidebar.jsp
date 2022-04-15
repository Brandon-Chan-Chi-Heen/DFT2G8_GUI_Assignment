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
    <a href="<%= request.getContextPath()%>/backend/index.jsp" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
        <h1>Coop Deals</h1>
    </a>
    <hr>
    <ul class="nav nav-pills flex-column mb-auto">

        <li>
            <% String activeStatus = "";%>
            <button class="btn btn-primary <%= activeStatus%>" style="text-align:left; width:100%;" onclick="displaySideBar(this);">
                Staff Management
            </button>
            <ul class="nav nav-pills flex-column subSideBar" >
                <li class="container">
                    <a href="<%= request.getContextPath()%>/StaffController" class="nav-link ">List Staff</a>
                </li>
                <li class="container">
                    <a href="<%= request.getContextPath()%>/backend/staff/add_staff.jsp" class="nav-link ">Add Staff</a>
                </li>
            </ul>
            <button class="btn btn-primary <%= activeStatus%>" style="text-align:left; width:100%;" onclick="displaySideBar(this);">
                Report
            </button>
            <ul class="nav nav-pills flex-column subSideBar" >
                <li class="container">
                    <a href="<%= request.getContextPath()%>/backend/Report/generateReport.jsp" class="nav-link ">Generate Report</a>
                </li>
            </ul>
            <button class="btn btn-primary <%= activeStatus%>" style="text-align:left; width:100%;" onclick="displaySideBar(this);">
                Products
            </button>
            <ul class="nav nav-pills flex-column subSideBar" >
                <li class="container">
                    <a href="<%= request.getContextPath()%>/ProductController" class="nav-link">List Products</a>
                </li>
                <li class="container">
                    <a href="<%= request.getContextPath()%>/backend/Product/add_product.jsp" class="nav-link">Add Products</a>
                </li>
            </ul>
            <button class="btn btn-primary <%= activeStatus%>" style="text-align:left; width:100%;" onclick="displaySideBar(this);">
                Customers
            </button>
            <ul class="nav nav-pills flex-column subSideBar" >
                <li class="container">
                    <a href="<%= request.getContextPath()%>/CustomerController" class="nav-link">List Customers</a>
                </li>
                <li class="container">
                    <a href="<%= request.getContextPath()%>/backend/Customer/add_customer.jsp" class="nav-link">Add Customers</a>
                </li>
            </ul>

            <button class="btn btn-primary <%= activeStatus%>" style="text-align:left; width:100%;" onclick="displaySideBar(this);">
                Records
            </button>
            <ul class="nav nav-pills flex-column subSideBar" >
                <li class="container">
                    <a href="" class="nav-link">Customer records</a>
                </li>
                <li class="container">
                    <a href="<%= request.getContextPath()%>/ServerSalesRecord" class="nav-link">Sales records</a>
                </li>
            </ul>
            <button class="btn btn-primary <%= activeStatus%>" style="text-align:left; width:100%;" onclick="displaySideBar(this);">
                Order Status
            </button>
            <ul class="nav nav-pills flex-column subSideBar" >
                <li class="container">
                    <a href="<%= request.getContextPath()%>/ServerRetrieveOrders" class="nav-link">Update Order Status</a>
                </li>
            </ul>
           
            <button class="btn btn-primary <%= activeStatus%>" style="text-align:left; width:100%;" onclick="displaySideBar(this);">
                Search
            </button>
            <ul class="nav nav-pills flex-column subSideBar" >

                <li class="container">
                    <a href="<%= request.getContextPath()%>/backend/search.jsp" class="nav-link">Search</a>
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
            <li><a class="dropdown-item" href="<%= request.getContextPath()%>/EditStaffController?edit_staff_id=<%= session.getAttribute("adminID")%>">Edit Profile</a></li>
            <li>
                <hr class="dropdown-divider">
            </li>
            <li><a class="dropdown-item" href="<%= request.getContextPath()%>/AdminLogout">Sign out</a></li>
        </ul>
    </div>
</div>
