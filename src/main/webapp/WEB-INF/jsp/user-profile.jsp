<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Profile</title>
    <link rel="stylesheet" href="css/userprofile.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap-icons-1.11.3/font/bootstrap-icons.css">

    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<jsp:include page="navbar.jsp" />
<body>
<div class="container-xl px-4 mt-4">
    <h1 class=" text-center text-warning">Edit Profile</h1>
    <hr class="mt-0 mb-4 border-5 text-warning border-5 text-warning">
    <div class="row">

        <div class="col-xl-12">
            <!-- Account details card-->
            <div class="card mb-4">
                <div class="card-header">Account Details</div>
                <div class="card-body">
                    <form action="${pageContext.request.contextPath}/updateProfile/${utilisateurConnecte.idUser}" method="post">
                        <div class="mb-3">
                            <label class="small mb-1" for="inputUsername">Username</label>
                            <input class="form-control" id="inputUsername" type="text" name="username" placeholder="change your username" value="${utilisateurConnecte.login}">
                        </div>
                        <div class="mb-3">
                            <label class="small mb-1" for="inputFirstName"> First Name</label>
                            <input class="form-control" id="inputFirstName" type="text" name="firstName" placeholder="change your first name" value="${utilisateurConnecte.nom}">
                        </div>
                        <div class="mb-3">
                            <label class="small mb-1" for="inputLastName"> Last Name</label>
                            <input class="form-control" id="inputLastName" type="text" name="lastName" placeholder="change your last name" value="${utilisateurConnecte.prenom}">
                        </div>
                        <div class="mb-3">
                            <label class="small mb-1" for="inputEmailAddress">Email address</label>
                            <input class="form-control" id="inputEmailAddress" type="email" name="email" placeholder="your email address" value="${utilisateurConnecte.mail}">
                        </div>
                        <div class="row gx-3 mb-3">
                            <div class="col-md-6">
                                <label class="small mb-1">Password</label>
                                <input class="form-control" id="password" type="password" name="password" placeholder="change your password" required>
                            </div>
                            <div class="col-md-6">
                                <label class="small mb-1" >Repeat password</label>
                                <input class="form-control" id="password2" type="password" name="Password2" placeholder="Repeat password" required>
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
                        </div>
                        <button class="btn-user-style" type="submit">Save changes</button>
                    </form>


                </div>
            </div>
        </div>
    </div>
</div>

</body>
<script src="bootstrap/js/bootstrap.min.js"></script>
<script src="bootstrap/js/bootstrap.bundle.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="bootstrap/js/jquery.js"></script>
<script src="bootstrap/js/script.js"></script>
<jsp:include page="footer.jsp" />
</html>