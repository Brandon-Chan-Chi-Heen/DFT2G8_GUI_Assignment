<%-- 
    Document   : report
    Created on : 10 Apr 2022, 9:16:10 am
    Author     : Ng Ming Zhe
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://kit.fontawesome.com/c6d3362a6b.js" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        
        <link href="<%= request.getContextPath()%>/backend/index.css" type="text/css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Generate Report</title>

        <style>
            .card{
                min-width: 300px;
                min-height: 350px;
                max-height: 350px;
                margin-bottom: 30px;
            }
        </style>
    </head>
    <body class="bg-dark">
        <%@ include file="../adminsidebar.jsp"%>
        <section class="">
            <h1 class="text-white">Report</h1>
            <div class="container mt-5">

                <div class="row row-cols-1 row-cols-lg-3">

                    <div class="col">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mt-2">Sales Report</h5>
                                <p>Generate a Sales Report of all products within a date range</p>
                            </div>
                            <div class="card-body">
                                <form action="<%= request.getContextPath()%>/ServerGenerateSalesReport" method="post" target="_blank">
                                    <div class="p-2">Start From:&nbsp;<input type="date" name="start_date"></div>
                                    <div class="p-2">To:&nbsp;<input type="date" name="end_date"></div>
                                    <div class="text-end mt-3">
                                        <input type="submit" value="Generate" class="btn btn-outline-primary">
                                        <input type="reset" value="Reset" class="btn btn-outline-danger">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mt-3">Inventory Report</h5>
                                <p class="mt-4">Generate an Inventory Report</p>
                            </div>
                            <div class="card-body">
                                <div class="row text-center">
                                    <a href="<%= request.getContextPath()%>/ServerGenerateInventoryReport" target="_blank" class="btn btn-lg btn-primary">Generate</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="card">
                            <div class="card-header">
                                <h5 class="mt-2">Product Sales Report</h5>
                                <p>Generate a Sales Report of a product within a date range</p>
                            </div>
                            <div class="card-body">
                                <form action="<%= request.getContextPath()%>/ServerGenerateProductSalesReport" method="post" target="_blank">
                                    <div class="p-2"> Product ID:&nbsp;<input type="text" name="productId"></div>
                                    <div class="p-2">Start From:&nbsp;<input type="date" name="product_start_date"></div>
                                    <div class="p-2"> To:&nbsp;<input type="date" name="product_end_date"></div>
                                    <div class="text-end mt-1">
                                        <input type="submit" value="Generate" class="btn btn-outline-primary">
                                        <input type="reset" value="Reset" class="btn btn-outline-danger">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</html>
