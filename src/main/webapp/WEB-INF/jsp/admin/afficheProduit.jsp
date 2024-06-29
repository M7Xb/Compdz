<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Menu</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet"  href="styles.css">
        <link rel="stylesheet" href="responsive.css">
        <script src="js/sources.js"></script>
    </head>

    <body>
        <div class="container">
            <div class="alert alert-info">
                <h1 class="text-center">Ajout Catalogue <c:out value="${title}" /></h1>
            </div>
            <jsp:include page="listProduits.jsp" />
            <jsp:include page="ajoutProduitModal.jsp" />
            <jsp:include page="modificationProduitModal.jsp" />

            <%--
            <c:choose>

                <c:when test="${sandwichSurMesure eq sandwichSurMesure}">
                    <jsp:include page="listProduits.jsp" />
                    <jsp:include page="ajoutProduitModal.jsp" />
                </c:when>
                <c:when test="${crudite eq crudite}">
                    <jsp:include page="listProduits.jsp" />
                    <jsp:include page="ajoutProduitModal.jsp" />
                </c:when>
                <c:otherwise>

                </c:otherwise>

            </c:choose>
            --%>

        </div>

    </body>
</html>