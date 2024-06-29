<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="modal fade" id="AjouterProduitModal" tabindex="-1" role="dialog" aria-labelledby="fenetreTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="fenetreTitle">Ajouter un Produit</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group row" hidden="true">
                    <label for="categorieProduitId" class=" col-sm-3 col-form-label">Categorie</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="categorieProduitId" value="${categorieProduit}">
                    </div>
                </div>
                <div class="form-group row" hidden="true">
                    <label for="id_produit" class=" col-sm-3 col-form-label">ID</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="id_produit">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="Nom" class=" col-sm-3 col-form-label">Nom</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="Nom" name="txtNom">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="Prix" class="col-sm-3 col-form-label">Prix</label>
                    <div class="col-sm-4">
                        <input type="number" class="form-control" id="Prix" name="txtPrix">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="Quantite" class=" col-sm-3 col-form-label">Quantite </label>
                    <div class="col-sm-4">
                        <input type="number" class="form-control" id="Quantite" name="txtQuantite">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="Description" class=" col-sm-3 col-form-label">Description</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="Description" name="txtDescription">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="Image" class=" col-sm-3 col-form-label">Image</label>
                    <div class="col-sm-4">
                        <input type="file" class="form-control" id="Image" name="txtImage"/>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                    <button type="button" class="btn btn-primary" id="cmdEnvoi">Enregistrer</button>
                </div>
            </div>
        </div>
    </div>
</div>