<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap-icons-1.11.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <title>Login</title>
</head>
<body>
<jsp:include page="navbar.jsp" />

<!-- Main Container -->
<div class="container d-flex justify-content-center align-items-center pt-5 mb-5 min-vh-95">
    <!-- Login Container -->
    <div class="row border rounded-5 bg-white shadow-lg box-area">
        <!-- Left Box -->
        <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box">
            <div class="featured-image mb-3">
                <img src="images/log.jpg" class="img-fluid" style="width: 450px; border-radius: 20px">
            </div>
        </div>

        <!-- Right Box -->
        <div class="col-md-6 right-box">
            <form th:action="@{/login}" method="post">
                <div class="row align-items-center">
                    <div class="header-text mb-4">
                        <h2>Hello, Again</h2>
                        <p>We are happy to have you back.</p>
                    </div>
                    <div class="input-group mb-3">
                        <input type="text" class="form-control form-control-lg bg-light fs-6"
                               placeholder="Email address" id="username" name="username">
                    </div>
                    <div class="input-group mb-1">
                        <input type="password" class="form-control form-control-lg bg-light fs-6"
                               placeholder="Password" id="password" name="password">
                    </div>

                    <!-- Checkbox with Show Password -->
                    <div class="input-group mb-5 d-flex justify-content-between">
                        <div class="checkbox-wrapper-49">
                            <div class="block">
                                <small class="word-remember-me">Show password</small>
                                <input data-index="0" id="remember-me" type="checkbox" onclick="togglePasswordVisibility()">
                                <label for="remember-me" class="mo"></label>
                            </div>
                        </div>
                    </div>

                    <div class="input-group mb-3 mt-3">
                        <button type="submit" class="btn btn-LS btn-lg w-100 fs-6">Login</button>
                    </div>
                    <div class="row">
                        <small>Don't have an account? <a id="link-LS" href="signup">Sign Up</a></small>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JavaScript -->
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="bootstrap/js/script.js"></script>
</body>
<jsp:include page="footer.jsp" />
</html>
