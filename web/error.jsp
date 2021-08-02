<%--
    Document   : error
    Created on : Jun 29, 2021, 8:18:45 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error Message Page</title>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css" />

    </head>
    <body  class="d-flex h-100 text-center text-white bg-dark">
        <h1>ERROR:</h1>

        <main class="px-3" style="padding-top: 15px">

            <p class="lead">
                ${sessionScope.ERROR_MESSAGE}
            </p>
        </main>
        <script src="bootstrap/js/bootstrap.js"></script>
    </body>
</html>
