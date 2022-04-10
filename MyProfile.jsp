<%-- 
    Document   : MyProfile
    Created on : Apr 10, 2022, 12:48:09 PM
    Author     : tankimwah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Model.*, java.util.*"%>
<% Customers customer = (Customers) session.getAttribute("customer");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Profile</title>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Serif&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/89d2bef4b8.js" crossorigin="anonymous"></script>
        <link href="./CSS/MyProfile.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/Navbar.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/Footer.css" rel="stylesheet" type="text/css"/>
        <script src="./JS/CustomerViewProduct.js" type="text/javascript" defer></script>
        <script src="./JS/Product.js" type="text/javascript" defer></script>
    </head>
    <body>
        <section class="slideShow-section">
            <jsp:include page="./Components/Navbar.jsp"/>  
        </section>
         <!-- My Profile -->
        <section class="myProfile-section">
            <div class="title-container">
                <h1>My Profile</h1>
            </div>
            <div class="myProfile-container">
                <div class="myProfile-img-box">
                    <img src="./Images/Icons/Icon_userDefault.png"/>
                </div>
                <div id="mrProfile-line-box">
                    <span id="myProfile-line"></span>
                </div>
                <div class="myProfile-info">
                    <form action="#">
                        <table border="0" cellpadding="15" cellspacing="10" class="myProfile-table">
                            <tr>
                                <td>
                                    <label>ID</label><br>
                                    <input type="text" name="myprofileID" value="<%= customer.getCustomerId() %>" class="myprofile-field" readonly/>
                                </td>
                                <td>
                                    <label>Username</label><br>
                                    <input type="text" name="myprofileUsername" value="<%= customer.getUsername() %>" class="myprofile-field" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Full Name</label><br>
                                    <input type="text" name="myprofileFullname" value="<%= customer.getFullname() %>" class="myprofile-field" readonly/>
                                </td>
                                <td>
                                    <label>Email</label><br>
                                    <input type="text" name="myprofileEmail" value="<%= customer.getEmail()  %>" class="myprofile-field" readonly/>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>Password</label><br>
                                    <input type="password" name="myprofilePassword" value="<%= customer.getPassword() %>" class="myprofile-field" readonly/>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </section>
        <jsp:include page="./Components/Footer.jsp"/>  
    </body>
</html>
