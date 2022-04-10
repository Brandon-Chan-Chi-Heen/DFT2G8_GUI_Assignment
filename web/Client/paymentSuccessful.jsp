<%-- 
    Document   : paymentSuccessful
    Created on : Apr 10, 2022, 1:57:32 PM
    Author     : Henry
--%>

<html>
    <head>
        <title>Payment Success!</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="./CSS/Navbar.css" rel="stylesheet" type="text/css"/>
        <link href="./CSS/Footer.css" rel="stylesheet" type="text/css"/>
    </head>
    <style>
        .success-page{
            max-width:300px;
            display:block;
            margin: 0 auto;
            text-align: center;
            position: relative;
            transform: perspective(1px) translateY(50%)
        }
        .success-page img{
            max-width:62px;
            display: block;
            margin: 0 auto;
        }

        .btn-view-orders{
            display: block;
            border:1px solid #47c7c5;
            width:100px;
            margin: 0 auto;
            margin-top: 45px;
            padding: 10px;
            color:#fff;
            background-color:#47c7c5;
            text-decoration: none;
            margin-bottom: 20px;
        }
        h2{
            color:#47c7c5;
            margin-top: 25px;

        }
        a{
            text-decoration: none;
        }
    </style>
    <body>
         <jsp:include page="./Components/Navbar.jsp"/>  
        <div class="success-page">
            <img  src="http://share.ashiknesin.com/green-checkmark.png" class="center" alt="" />
            <h2>Payment Successful !</h2>
            <p>Your payment has been received, and your order will be shipped to you soon!</p>
            <a href="<%=request.getContextPath()%>/Client/CustomerViewProduct.jsp" class="btn-view-orders">Proceed to Home page</a>
        </div>
    </body>
  
</html>
