<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="images/campdz.png" />
<%--    <link rel="stylesheet" href="css/style.css">--%>

    <title></title>

</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid">
        <a href="home" class="navbar-logo"> <span>Camp</span>Dz</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-center" id="navbarNav">
            <ul class="navbar-nav ms-auto me-auto mb-2 mb-lg-0 ms-5 ">
                <%--                <li class="nav-item close-button">--%>
                <%--                    <button class="btn-closeNavbar" onclick="closeNavbar()">--%>
                <%--                        <img src="bootstrap-icons-1.11.3/x-circle-fill.svg" alt="Close">--%>
                <%--                    </button>--%>
                <%--                </li>--%>
                <li class="nav-item me-5 ul-nav-hov">
                    <a class="nav-link active" aria-current="page" href="home">Home</a>
                </li>
                <li class="nav-item me-5 ul-nav-hov">
                    <a class="nav-link active" aria-current="page" href="product">Product</a>
                </li>




                <li class="nav-item me-5 ul-nav-hov">
                    <a class="nav-link active" aria-current="page" href="blog">Blog</a>
                </li>
                <li class="nav-item me-5 ul-nav-hov">
                    <a class="nav-link active" aria-current="page" href="contact">Contact Us</a>
                </li>



                <c:if test="${pageContext.request.userPrincipal ne null}">
                    <%--   icon user pour logout et edit profile--%>
                    <li class="nav-item dropdown user-icon me-5 ">
                        <a class="nav-link dropdown-toggle " href="#" id="navbarDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">

                            <img src="images/profile.jpg" alt="profile" class="icon-user-2">
                        </a>
                        <ul class="dropdown-menu dropdown-menu-start" aria-labelledby="navbarDropdown" style="left: 50%; transform: translateX(-50%);">
                            <li class= "name-user ms-3">
                                <b>${pageContext.request.userPrincipal.name}</b>
                            </li>



                            <c:if test="${pageContext.request.isUserInRole('ADMIN')}">
                                <li>
                                    <a class="dropdown-item" href="admin">Admin Panel</a>
                                </li>
                            </c:if>
                            <li>
                                <a class="dropdown-item" href="profile">Edit Profile</a>
                            </li>
                            <li>
                                <a class="dropdown-item" href="logout">Log out</a>
                            </li>
                        </ul>
                    </li>

                </c:if>
                <c:if test="${pageContext.request.userPrincipal eq null}">
                    <!-- //Icon profile -->
                    <li class="nav-item dropdown user-icon me-5 ">
                        <a class="nav-link dropdown-toggle " href="#" id="navbarDropdown" role="button"
                           data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="bootstrap-icons-1.11.3/person-circle.svg" alt="profile" class="icon-user">
                        </a>
                        <ul class="dropdown-menu dropdown-menu-start" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="login">Login</a></li>
                            <li><a class="dropdown-item" href="signup">Sign Up</a></li>
                        </ul>
                    </li>
                </c:if>
                <c:if test="${pageContext.request.userPrincipal ne null}">
                    <c:if test="${not empty requestScope.showCartIcon}">
                        <!-- Cart Icon -->
                        <div class="Cart-product mt-2" onclick="showCart();">
                            <img src="bootstrap-icons-1.11.3/cart-1.svg" alt="Cart Icon" width="25">
                            <span id="cartItemCount"></span>
                        </div>
                    </c:if>
                </c:if>

                <!-- Notification Icon -->
                <c:if test="${pageContext.request.userPrincipal ne null}">
                    <!-- Calculate the count of commands for the connected user -->
                    <c:set var="userCommandCount" value="0" />
                    <c:forEach var="commande" items="${commandesList}">
                        <c:if test="${commande.idUtilisateur == utilisateurConnecte.idUser}">
                            <c:set var="userCommandCount" value="${userCommandCount + 1}" />
                        </c:if>
                    </c:forEach>

                    <div class="notification position-relative mt-2">
                        <a class="icon-notification position-relative" id="notificationDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="bootstrap-icons-1.11.3/bell-fill.svg" alt="notification" style="width: 21px;">
                            <!-- Conditionally display the badge -->
                            <c:if test="${userCommandCount > 0}">
                                <span class="badge bg-danger position-absolute top-0 start-100 translate-middle">${userCommandCount}</span>
                            </c:if>
                        </a>
                        <ul class="dropdown-menu dropdown-notify" aria-labelledby="notificationDropdown" style="left: 50%; transform: translateX(-50%);">
                            <!-- Display Command Status in Notifications -->
                            <c:set var="notificationNumber" value="1" />
                            <c:if test="${userCommandCount > 0}">
                                <c:forEach var="commande" items="${commandesList}">
                                    <c:if test="${commande.idUtilisateur == utilisateurConnecte.idUser}">
                                        <li class="dropdown-item d-flex justify-content-between align-items-center">
                            <span>
                                ${notificationNumber}. ${commande.nom} - Your command is: ${commande.libelleStatut}
                            </span>
                                            <button onclick="deleteOrder(${commande.idCommande})" class="btn btn-danger btn-sm ms-2">
                                                <i class="fa-solid fa-trash"></i>
                                            </button>
                                        </li>
                                        <c:set var="notificationNumber" value="${notificationNumber + 1}" />
                                        <hr>
                                    </c:if>
                                </c:forEach>
                            </c:if>
                            <c:if test="${userCommandCount == 0}">
                                <p class="text-center mt-5" style="color: grey ;font-size: 25px" >No commande available</p>
                            </c:if>
                        </ul>
                    </div>
                </c:if>


            </ul>

        </div>
    </div>
</nav>
<!-- Navbar End -->