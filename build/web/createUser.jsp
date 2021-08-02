<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Create User</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">

    </head>
    <body>
        <div class="card bg-light">
            <article class="card-body mx-auto" style="max-width: 400px;">
                <h4 class="card-title mt-3 text-center">Create Account</h4>
                <p class="text-center">Get started with your free account</p>

                <form action="MainController?action=CreateUser" method="POST" id="form">

                    <p style="color: red">${requestScope.USER_ERROR.getUserIDError()}</p>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-user"></i> </span>
                        </div>
                        <input name="userID" class="form-control" placeholder="User ID" required="" type="text">

                    </div>

                    <p style="color: red">${requestScope.USER_ERROR.getFullNameError()}</p>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-address-card"></i> </span>
                        </div>
                        <input name="fullName" class="form-control"  required="" placeholder="Full Name" type="text">

                    </div> <!-- form-group// -->

                    <p style="color: red">${requestScope.USER_ERROR.getEmailError()}</p>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
                        </div>
                        <input name="email" class="form-control" required="" placeholder="Email" type="email">

                    </div> <!-- form-group// -->
                    <p style="color: red">${requestScope.USER_ERROR.getAddressError()}</p>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-map"></i> </span>
                        </div>
                        <input name="address" class="form-control" required="" placeholder="Address" type="text">

                    </div> <!-- form-group// -->

                    <p style="color: red">${requestScope.USER_ERROR.getRoleIDError()}</p>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-users"></i> </span>
                        </div>

                        <select class="form-control" required="" name="roleID">
                            <option selected=""> Your role</option>
                            <option value="US">USER</option>
                            <option value="AD">ADMIN</option>
                        </select>
                    </div> <!-- form-group end.// -->
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                        </div>
                        <input class="form-control"  required="" name="password" placeholder="Create password" type="password">
                    </div> <!-- form-group// -->
                    <p style="color: red">${requestScope.USER_ERROR.getConfirmPasswordError()}</p>
                    <div class="form-group input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                        </div>
                        <input class="form-control" name="confirm" required=""  placeholder="Confirm Password" type="password">

                    </div> <!-- form-group// -->
                    <div class="g-recaptcha" data-sitekey="6LdN8IQbAAAAAKhHGm4SoyZFTWK89ir66FLntr80"></div>
                    <div class="text-danger" id="error"></div>
                    <div class="form-group">
                        <button type="submit" name="action" value="CreateUser" class="btn btn-primary btn-block"> Create Account  </button>
                    </div> <!-- form-group// -->
                    <p class="text-center">Have an account? <a href="login.jsp">Log In</a> </p>
                </form>
            </article>
        </div> <!-- card.// -->

    </div>
    <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    <script>
        window.onload = function () {

            const form = document.getElementById("form");
                    const error = document.getElementById("error");
                    form.addEventListener("submit", function (event) {
                        event.preventDefault();
                                const response = grecaptcha.getResponse();
                                if (response) {
                            form.submit();
                        } else {
                            error.innerHTML = "Please check not a robot";
                        }
                    });
        }
    </script>
</body>
</html>
