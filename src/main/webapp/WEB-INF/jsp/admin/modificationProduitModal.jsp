<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="modal fade" id="modificationProduitModal" tabindex="-1" role="dialog" aria-labelledby="fenetreTitle"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="fenetreTitle">Modification Catalogue Produits</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-group row" hidden="true">
                    <label for="id" class=" col-sm-3 col-form-label">ID Boisson</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="id">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="name" class=" col-sm-3 col-form-label">Nom</label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="name" name="txtNom">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="prix" class="col-sm-3 col-form-label">Prix</label>
                    <div class="col-sm-4">
                        <input type="number" class="form-control" id="prix" name="txtPrix">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="quantite" class=" col-sm-3 col-form-label">Quantite </label>
                    <div class="col-sm-4">
                        <input type="number" class="form-control" id="quantite" name="txtQuantite">
                    </div>
                </div>

                <div class="form-group row">
                    <label for="image" class=" col-sm-3 col-form-label">Image</label>
                    <div class="col-sm-4">
                        <input type="file" class="form-control" id="image" name="txtImage"/>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
                    <button type="button" class="btn btn-primary" id="cmdEnvoi" operation="Update">Mettre à jour</button>
                </div>
            </div>
        </div>
    </div>
</div>