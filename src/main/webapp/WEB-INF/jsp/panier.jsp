
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Panier</title>
</head>
<body>
<h1>Votre panier</h1>
<table>
    <thead>
    <tr>
        <th>Article</th>
        <th>Quantité</th>
        <th>Prix unitaire</th>
        <th>Total</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="article" items="${panier.articles}">
        <tr>
            <td>${article.nom}</td>
            <td>${article.quantite}</td>
            <td>${article.prix}</td>
            <td>${article.quantite * article.prix}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>