<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--Votre produit a été
supprimé avec succès--%>

<%--<div class="container">
<div class="alert alert-danger" role="alert" id="messageSupprProduit">
    Confirmer la suppression
</div>--%>

<input type="hidden" id="categorieProduitHiddenId" value="${categorieProduit}"/>
<table class="table table-hover table-responsive" height="">
    <thead>
    <tr>
        <th scope="col">ID</th>
        <th scope="col">Nom</th>
        <th scope="col">Description</th>
        <th scope="col">Prix</th>
        <th scope="col">Quantité</th>
        <th scope="col">Image</th>
        <th colspan="2">
            <button id="ajouterProduitButton" class="btn btn-block btn-outline-primary">Nouveau</button>
        </th>
    </tr>
    </thead>
    <tbody id="tblProduitBody">

    <c:forEach items="${ProduitBoucle}" var="unProduit">
        <tr id="produit_${unProduit.id}">
            <td>${unProduit.id}</td>
            <td>${unProduit.name}</td>
            <td>${unProduit.description}</td>
            <td> ${unProduit.prix} </td>
            <td>${unProduit.quantite}</td>
            <td><img class="produit_image" id="produit_image_${unProduit.name}_id" alt="${unProduit.name}"
                     src="${unProduit.image}"/></td>
            <td>
                <button class="btn btn-link update" id="modificationProduitButton" data-idProduit="${unProduit.id}"
                        onclick="ModifierProduit(this, ${unProduit.id}, 'modifier${categorieProduit}')">Modifier
                </button>
            </td>
            <td>
                <a class="btn btn-link delete submit" data-idpersonne="1"
                   onclick="SupprimerProduit(${unProduit.id}, 'supprimer${categorieProduit}')">Supprimer</a>
            </td>
        </tr>
    </c:forEach>

    </tbody>
</table>

</div>


</div>

</body>
</html>