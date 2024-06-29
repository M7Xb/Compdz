
$("document").ready(
    function() {


        $("#menuSandwichId").click(	function()
        {

        });


    });


/**
     *
     * @param boite : L'element que le client à selectionner via un clique
     * @param idSousMenu : C'est l'ID du container sous menu de boite
     * @param boitesId : Tableau des IDs des l'autres boites du meme menu
     */
function afficherCacherContainer(boite, idSousMenu, boitesId) {
    // 1. selectioner ou deselectioner une boite
    if(boite.is_clicked) {// Il faut la deselectionner ainci que ses sous-menu
        //1. deselectionner et cacher son sosous-menu
        cacherMenu(idSousMenu);

        //2. deselectionner le bouton
        boite.is_clicked = false;
        boite.style.borderColor = "#808080";
        //boite.style.backgroundColor = "#FFFFFF"

    } else {

        //1. deselectionner les autres boites du meme menu
        for(var i=0; i< boitesId.length; i++){
            if(boite.id != boitesId[i]) {
                if(document.getElementById(boitesId[i]) != null){
                    delectionnerBoiteAndSous(boitesId[i]);
                }
            }
        }

        //2. selectionner la boite
        boite.is_clicked = true;
        boite.style.borderColor = "red";
        //boite.style.backgroundColor = "#DD9E20"

        //3. afficher la sous-menu de la boite
        afficherMenu(idSousMenu)
    }
}

function deselectionnerBoite(boite){
    boite.is_clicked = false;
    boite.style.borderColor = "#808080";
    //boite.style.backgroundColor = "#FFFFFF"
}

function delectionnerBoiteAndSous(boiteId) {
    let enfant = document.getElementById(boiteId);
    if(enfant.getAttribute("is_clicked")) {
        deselectionnerBoite(enfant);
        let sousMenuEnfant = enfant.getAttribute("my_sub_menu");
        if(sousMenuEnfant != null &&  sousMenuEnfant !== "") {
            cacherMenu(sousMenuEnfant);
        }
    }
}

function cacherMenu(menuId) {
    let menuElm = document.getElementById(menuId);
    if(menuElm == null) {
        return;
    }
    //1. deselectionner tous ses boites de tous les sous menu
    if(menuElm.getAttribute("my_menu_enfants") != null) {
        let enfantsId = menuElm.getAttribute("my_menu_enfants").split(",");
        if(enfantsId != null){
            for(let i = 0; i < enfantsId.length; i++) {
                delectionnerBoiteAndSous(enfantsId[i]);
            }
        }
    }

    //2.cacher menu
    menuElm.style.display = "none";

}

function afficherMenu(menuId) {
    let elm = document.getElementById(menuId);
    if(elm != null) {
        elm.style.display = "block";
    }
}

function ajouterProduitDansPanier(boite, cathegorie, autreboitesId) {

    let id = boite.id;
    if(id.endsWith("_id")) {
       id = id.substring(0,id.length-3);
    }

    let monImage = document.getElementById(cathegorie+"_image_"+ id +"_id");

    if(cathegorie == "classique" || cathegorie == "surmesure") {
        // ajouter cathegorie (classique ou sur mesure) produit dans le panier
        document.getElementById("panier_sandwich_cathegorie").value = cathegorie;
        cathegorie = "sandwich";
    }

    // ajouter ID produit dans le panier
    document.getElementById("panier_" + cathegorie + "_id").value = id;

    // masquer l'image plus (qui représente le Panier vide)
   document.getElementById(cathegorie+"_vide_id").style.display = "none";

   // affichier l'image du produit selectioné
    let imageProduit = document.getElementById(cathegorie+"_image_produit");
    imageProduit.style.display = "block";
    imageProduit.src = monImage.src;

    // Selectionner ma boite produit
    boite.style.borderColor = "red";

    // deselectionner les autres boites produits
    for(let i=0; i< autreboitesId.length; i++){
        if(boite.id != autreboitesId[i]) {
            let autreBoite = document.getElementById(autreboitesId[i]);
            if(autreBoite!= null){
                deselectionnerBoite(autreBoite);
            }
        }
    }

}

function ajouterCruditeDansSandwich(boite) {
    if (boite.is_clicked) {
        // deselectionner
        boite.is_clicked = false;
        boite.style.borderColor = "#808080"
        // TODO ??? enlever du pannier

    } else {
        let crudite = document.getElementById("panier_crudites_id");
        crudite.value = crudite.value + ',' + boite.id;

        // Selectionner ma boite produit
        boite.style.borderColor = "red";
        boite.is_clicked = true;
    }
}
    function ajouterViandeDansSandwich(boite){
        if(boite.is_clicked ) {
            // deselectionner
            boite.is_clicked = false;
            boite.style.borderColor = "#808080"
            // TODO ??? enlever du pannier

        } else {
            let viande = document.getElementById("panier_viandes_id");
            viande.value = viande.value + ',' + boite.id;

            // Selectionner ma boite produit
            boite.style.borderColor = "red";
            boite.is_clicked = true;
        }

    }

function ajouterSauceDansSandwich(boite){
    if(boite.is_clicked ) {
        // deselectionner
        boite.is_clicked = false;
        boite.style.borderColor = "#808080"
        // TODO ??? enlever du pannier

    } else {
        let sauce = document.getElementById("panier_sauces_id");
        sauce.value = sauce.value + ',' + boite.id;

        // Selectionner ma boite produit
        boite.style.borderColor = "red";
        boite.is_clicked = true;
    }

}

function EnvoyerCommande(){
    //1. recuperer les information du panier
    let panier = collecterInformationPanier();

    //2. envoyer au serveur pour l'enregistrer en bdd
    envoyerVersServeur(panier);
}


function collecterInformationPanier(){
    var panier = {};
    // sandwitch
    let sandwichPanierVariables = document.getElementById("panier_sandwich_variables");
    panier.sandwich = {};
    panier.sandwich.id = sandwichPanierVariables.idSandwich.value;
    panier.sandwich.cathegorie = sandwichPanierVariables.cathegorie.value;
    panier.sandwich.crudites = sandwichPanierVariables.crudites.value;
    panier.sandwich.viandes = sandwichPanierVariables.viandes.value;
    panier.sandwich.sauces = sandwichPanierVariables.sauces.value;

    // frite
    panier.frites = {};
    panier.frites.id = document.getElementById("panier_frites_id").value;

    // dessert
    panier.dessert = {};
    panier.dessert.id = document.getElementById("panier_dessert_id").value;

    // boisson
    panier.boisson = {};
    panier.boisson.id = document.getElementById("panier_boisson_id").value;

    return panier;
}

function envoyerVersServeur(monPanier) {
    $.ajax({
        url : "ajouterCommandeClient",
        type: 'POST',
        datatype:'json',
        contentType: 'application/json',
        data: JSON.stringify(monPanier),
        success : function(data){
            // TODO ... recupérer le numero de la commande
        },
        error: function(xhr, status, error) {
            var err = JSON.parse(xhr.responseText);
            alert(err.Message);
        }

    });
}





