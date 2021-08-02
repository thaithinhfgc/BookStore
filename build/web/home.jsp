<%--
    Document   : home
    Created on : Jun 29, 2021, 8:28:32 PM
    Author     : ACER
--%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>View Book Page</title>
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" href="bootstrap/css/headers.css" />


        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>

    </head>
    <body>

        <jsp:include page="include/nav.jspf"/>
        <section>
            <div class="container">
                <div class="row g-2">
                    <div class="col-4">
                        <div class="p-3 border bg-light">Custom column padding</div>
                    </div>
                    <div class="col-4">
                        <div class="p-3 border bg-light">Custom column padding</div>
                    </div>
                    <div class="col-4">
                        <div class="p-3 border bg-light">Custom column padding</div>
                    </div>
                    <div class="col-4">
                        <div class="p-3 border bg-light">Custom column padding</div>
                    </div>
                </div>
            </div>
        </section>

        <script src="bootstrap/js/bootstrap.js"></script>
    </body>
</html>
