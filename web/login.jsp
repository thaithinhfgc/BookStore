<%--
    Document   : login
    Created on : Jul 1, 2021, 11:54:00 PM
    Author     : ACER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="bootstrap/css/bootstrap.css" />
        <link rel="stylesheet" href="bootstrap/css/signin.css" />
        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
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
    <header></header>
    <body>

        <main class="form-signin">
            <form action="MainController" method="POST">
                <svg xmlns="http://www.w3.org/2000/svg" width="72" height="57" fill="currentColor" class="bi bi-book" viewBox="0 0 16 16">
                <path d="M1 2.828c.885-.37 2.154-.769 3.388-.893 1.33-.134 2.458.063 3.112.752v9.746c-.935-.53-2.12-.603-3.213-.493-1.18.12-2.37.461-3.287.811V2.828zm7.5-.141c.654-.689 1.782-.886 3.112-.752 1.234.124 2.503.523 3.388.893v9.923c-.918-.35-2.107-.692-3.287-.81-1.094-.111-2.278-.039-3.213.492V2.687zM8 1.783C7.015.936 5.587.81 4.287.94c-1.514.153-3.042.672-3.994 1.105A.5.5 0 0 0 0 2.5v11a.5.5 0 0 0 .707.455c.882-.4 2.303-.881 3.68-1.02 1.409-.142 2.59.087 3.223.877a.5.5 0 0 0 .78 0c.633-.79 1.814-1.019 3.222-.877 1.378.139 2.8.62 3.681 1.02A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.293-.455c-.952-.433-2.48-.952-3.994-1.105C10.413.809 8.985.936 8 1.783z"/>
                </svg>
                <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="UserID" name="userID" />
                    <label for="floatingInput">User ID</label>
                </div>
                <div class="form-floating">
                    <input
                        type="password"
                        class="form-control"
                        id="floatingPassword"
                        placeholder="Password"
                        name="password"
                        />
                    <label for="floatingPassword">Password</label>
                </div>
                <p style="color: red">${sessionScope.ERROR_MESSAGE}</p>
                <button
                    style="margin-bottom: 10px"
                    class="w-100 btn btn-lg btn-primary"
                    type="submit"
                    name="action"
                    value="Login"
                    >
                    Log in
                </button>
                <br />

                <button
                    style="margin-bottom: 10px;
                    background-color: #ff3300;"
                    class="w-100 btn btn-lg "
                    >
                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email&redirect_uri=http://localhost:8084/BOOKSTORE/LoginGoogleHandler&response_type=code
                       &client_id=495690914730-31fup32bjurdqpuen49vbthgoqtog7n1.apps.googleusercontent.com&approval_prompt=force" class="btn btn-block btn-google" style="background-color: #ff3300; color: white"> <i class="fab fa-google"></i>   Login via Google</a>
                </button>

                <p class="text-center">Don't have an account? <a href="createUser.jsp">Create here</a> </p>
            </form>
        </main>


        <script src="bootstrap/js/bootstrap.js"></script>
    </body>
</html>
