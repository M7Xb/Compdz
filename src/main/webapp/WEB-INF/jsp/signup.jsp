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
   <script src="bootstrap/js/alert-sweet.js"></script>

    <title>signup</title>
</head>
<jsp:include page="navbar.jsp" />
<body>

<!----------------------- Main Container -------------------------->
<div class="container d-flex justify-content-center align-items-center pt-3 mb-3 min-vh-95">

    <!----------------------- Login Container -------------------------->

    <div class="row border rounded-5 p-1 bg-white shadow-lg box-area">

        <!--------------------------- Left Box ----------------------------->

        <div class="col-md-6 rounded-4 d-flex justify-content-center align-items-center flex-column left-box"  >
            <!-- here  ( style="background: #f0933b;") -->
            <div class="featured-image mb-3">
                <img src="images/signup.png" class="img-fluid" style="width: 450px;">
            </div>
        </div>

        <!-------------------- ------ Right Box ---------------------------->

        <div class="col-md-6 right-box">
            <div class="row align-items-center">
                <div class="header-text mb-4">
                    <h2>Hello user welcome to our website</h2>
                    <p>We are happy to have you come here.</p>
                </div>
                <form  action="${pageContext.request.contextPath}/signup" method="post">
                    <div class="input-group mb-3">
                        <input type="text"  id="name" class="form-control form-control-lg bg-light fs-6" placeholder="your first name" name="name" required>
                    </div>
                    <div class="input-group mb-3">
                        <input type="text"  id="prenom" class="form-control form-control-lg bg-light fs-6" placeholder="your last name" name="prenom" required>
                    </div>
                    <div class="input-group mb-3">
                        <input type="text"  id="address" class="form-control form-control-lg bg-light fs-6" placeholder="address" name="adresse" required>
                    </div>
                    <div class="input-group mb-3">
                        <input type="email"  id="email" class="form-control form-control-lg bg-light fs-6"
                               placeholder="Email address" name="email" required>
                    </div>
                    <div class="input-group mb-3">
                        <input type="password" id="password" class="form-control form-control-lg bg-light fs-6" placeholder="Password" name="password" required>
                    </div>
                    <div class="input-group mb-1">
                        <input type="password" id="password2" class="form-control form-control-lg bg-light fs-6" placeholder="Repeat Password" name="reapetPassword" required>
                    </div>

                    <div class="input-group mb-5 d-flex justify-content-between">
                        <div class="checkbox-wrapper-49">
                            <div class="block">
                                <small class="word-remember-me">Show password</small>
                                <input data-index="0" id="remember-me" type="checkbox" onclick="togglePasswordVisibility()">
                                <label for="remember-me" class="mo"></label>
                            </div>
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <button type="submit" class="btn btn-LS btn-lg  w-100 fs-6" onclick="sendVerificationEmail();">Sign Up</button>
                    </div>
                </form>
            </div>

                <div class="row">
                    <small>you alredy have account? <a id="link-LS" href="login"> Log in</a></small>
                </div>
            </div>
        </div>

    </div>

<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="bootstrap/js/script.js"></script>
</body>
<jsp:include page="footer.jsp" />
</html>