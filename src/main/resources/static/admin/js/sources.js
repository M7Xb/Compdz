

$("document").ready(
    function()
    {

        $("#ajouterProduitButton").click(	function()
        {
            $("#cmdEnvoi").text("Enregistrer");
            $("#cmdEnvoi").attr("Operation","Add");
            $("#AjouterProduitModal").modal("show");

        });

        $("#modificationProduitButton").click(	function()
        {
            courant = RecupereMonProduitDepuisLaBdd($(this).attr("data-idProduit"), $("#categorieProduitHiddenId").val());
            $("#id").val($(this).attr("data-idProduit")).removeAttr("readonly");
            $("#name").val(courant.name).removeAttr("readonly");
            $("#prix").val(courant.prix).removeAttr("readonly");
            $("#quantite").val(courant.quantite).removeAttr("readonly");
            //$("#image").val(courant.image).removeAttr("readonly");

            $("#cmdEnvoi").text("Mettre à jour");
            $("#cmdEnvoi").attr("Operation","Update");
            $("#modificationProduitModal").modal("show");
        });



        $('.modal').on("click" ,"#cmdEnvoi", function(e)
        {

            e.preventDefault();
            let monObjetProduit = null;
            let categorie = $("#categorieProduitId").val();

            let expr = $(this).attr("Operation");

            switch (expr)
            {
                case 'Add':
                    monObjetProduit = CollecteInfos();
                    categorie = "Produit";
                    AjoutNouveauProduit(monObjetProduit, "addModal" + categorie);
                    break;
                case 'Update':
                    monObjetProduit = CollecteModifInfos();
                    ModifieProduit(monObjetProduit, categorie);
                    break;
                case 'Delete':
                    //monObjetProduit = CollecteInfos();
                    //supprimerProduit("id" + categorie);
                    break;

                default:
                    console.log("Oups je ne comprends pas votre demande");
            }
            $("#AjouterProduitModal").modal("hide");
        });



    }
 );




    function CollecteInfos()
    {
        var objResultat = {};
        //objResultat.id_personne    = $("#id_personne").val();
        objResultat.name          = $("#Nom").val();
        objResultat.prix          = $("#Prix").val();
        objResultat.quantite      = $("#Quantite").val();

        return objResultat ;
    }

    function CollecteModifInfos()
    {
        var objResultat = {};
        objResultat.id       = $("#id").val();
        objResultat.name     = $("#name").val();
        objResultat.prix     = $("#prix").val();
        objResultat.quantite = $("#quantite").val();

        return objResultat ;
    }





/*
function getBase64(file) {
    return new Promise((resolve, reject) => {
        const reader = new FileReader();
        reader.readAsDataURL(file);
        reader.onload = () => resolve(reader.result);
        reader.onerror = error => reject(error);
    });
}
*/

function ModifInTableau(data, cible) {
    // Supprimer la ligne du tableau existante
    $('#produit_' + data.id).remove();

    // Ajouter une nouvelle ligne avec les bonnes valeurs
    AddInTableau(data, cible);
}


function AddInTableau(data, cible) {

    //cible.empty(); // supprime le corps précédent

    var ligne = $("<tr id=produit_"  + data.id + "></tr>");

    var colonne = $("<td></td>");
    colonne.html(data.id);
    ligne.append(colonne);

    colonne = $("<td></td>");
    colonne.html(data.name);
    ligne.append(colonne);

    colonne = $("<td></td>");
    colonne.html(data.prix);
    ligne.append(colonne);

    colonne = $("<td></td>");
    colonne.html(data.quantite);
    ligne.append(colonne);

    colonne = $("<td></td>");

    colonne.html('<img class="produit_image" id="produit_image_"' + data.name + '"_id alt="' + data.name + '" src="' + data.image + '"/>');
    ligne.append(colonne);

    colonne = $("<td></td>");
    bouton1 = $("<button></button>");
    bouton1.addClass("btn  btn-link update");
    bouton1.attr("data-idproduit", data.id);
    bouton1.text("Modifier");
    colonne.append(bouton1);
    ligne.append(colonne);

    colonne = $("<td></td>");
    bouton1 = $("<button></button>");
    bouton1.addClass("btn  btn-link delete");
    bouton1.attr({"data-idproduit": data.id,  onclick:"SupprimerProduit(" + data.id + "," + "'supprimer" + $('#categorieProduitHiddenId').val() +"'" + ")"});
    bouton1.text("Supprimer");
    colonne.append(bouton1);
    ligne.append(colonne);


    cible.append(ligne);
}

function AjoutNouveauProduit(produit, url)
{   //Convert image to base64
    var reader = new FileReader();
    var file = $('#Image')[0].files[0];
    reader.onload = function(e) {
        var blob = new Blob([new Uint8Array(e.target.result)], {type: file.type });
    };
    reader.readAsDataURL(file);
    var base64data;
    reader.onloadend = function () {
        base64data = reader.result;
        produit.image = base64data;
        var dataToSend = JSON.stringify(produit);

        $.ajax(
            {
                url: url,
                type:'post',
                datatype:'json',
                contentType: 'application/json',
                data:dataToSend,
                success:function(data)
                {
                    AddInTableau(data , $("#tblProduitBody"));
                },
                error:function (resultat, statut, error) {
                    alert(error);
                }
            }
        );
    }
}

function ModifierProduit(object, idProduitAModifier, url){
        courant = RecupereMonProduitDepuisLaBdd(idProduitAModifier, $("#categorieProduitHiddenId").val());
}

function SupprimerProduit(idProduitASupprimer, url){
    if (window.confirm("Voulez vous supprimer ce produit?")) {
        $.ajax({
            url : url + "/" + idProduitASupprimer,
            type: 'DELETE',
            //data: "id=" + idProduitASupprimer,
            success : function(data){
                $('#produit_' + idProduitASupprimer).remove();
                // $('#messageSupprProduit').show();
            },
            error: function(xhr, status, error) {
                var err = JSON.parse(xhr.responseText);
                alert(err.Message);
            }

        });
    }
}

function RecupereMonProduitDepuisLaBdd(idProduit, categorieProduit)
{

        $.ajax({
            url : "get" + categorieProduit + "/" + idProduit,
            type: 'GET',
            success : function(courant){
                $("#id").val(courant.id).removeAttr("readonly");
                $("#name").val(courant.name).removeAttr("readonly");
                $("#prix").val(courant.prix).removeAttr("readonly");
                $("#quantite").val(courant.quantite).removeAttr("readonly");
                //$("#image").val(courant.image).removeAttr("readonly");

                $("#cmdEnvoi").text("Mettre à jour");
                $("#cmdEnvoi").attr("Operation","Update");
                $("#modificationProduitModal").modal("show");
                return courant;
            },
            error: function(xhr, status, error) {
                return null;
            }

        });
}


function ModifieProduit(produit, categorieProduit)
{
    //Convert image to base64
    var reader = new FileReader();
    var file = $('#image')[0].files[0];
    reader.onload = function(e) {
        var blob = new Blob([new Uint8Array(e.target.result)], {type: file.type });
    };
    reader.readAsDataURL(file);
    var base64data;
    reader.onloadend = function () {
        base64data = reader.result;
        produit.image = base64data;

        $.ajax({
            url: "modifier" + categorieProduit + "/" + produit.id,
            type: 'PUT',
            dataType: "json",
            contentType: 'application/json',
            data: JSON.stringify(produit),
            success: function (data) {
                $("#modificationProduitModal").modal("hide");
                ModifInTableau(data, $("#tblProduitBody"));
            },
            error: function (xhr, status, error) {
                return null;
            }

        });
    }
}



