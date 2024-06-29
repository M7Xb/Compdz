<% request.setAttribute("showCartIcon", true); %>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap-icons-1.11.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/product.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="bootstrap/fontawsome/fontawsome.js" ></script>
    <link href="bootstrap/fontawsome/fontawsome.css" rel="stylesheet"/>
    <title>Products</title>
</head>
<jsp:include page="navbar.jsp" />
<body>
<!-- --------------------------------------form of purchase-------------------- -->

<div class="container-form mt-5" id="purchaseContainer" style="display:none;">

    <form id="purchaseForm">
        <h1 class="mb-4 text-center">Product Purchase Form</h1>
        <div class="mb-3">

            <input type="text" class="form-control" id="nom" name="nom"  value="${utilisateurConnecte.nom}" placeholder="le nome" required />
        </div>

        <div class="mb-3">
            <input type="text" class="form-control" id="prenom" name="prenom" value="${utilisateurConnecte.prenom}" placeholder="le prenom" required />
        </div>

        <div class="mb-3">
            <input type="email" class="form-control" id="email" name="email" value="${utilisateurConnecte.mail}" placeholder="email" required />
        </div>

        <div class="mb-3">
            <input type="text" class="form-control" id="wilaya" name="wilaya" value="${utilisateurConnecte.adress}" placeholder="willaya" required />
        </div>

        <div class="mb-3">
            <input type="text" class="form-control" id="codePostal" name="codePostal" placeholder="codePostal" required />
        </div>

        <div class="mb-3">
            <input type="text" class="form-control" id="address" name="address" placeholder="adress" required />
        </div>

        <div class="mb-3">
            <input type="text" class="form-control" id="price" name="price" required readonly  />
        </div>
        <div class="mb-3">
            <label for="optionSelect" class="form-label">Select method de payment :</label>
            <select id="optionSelect" name="optionSelect" class="form-control">
                <option value="1">Paiement  a reception</option>
                <option value="2" disabled>baridi mob (non disponible)</option>
                <option value="3" disabled>visa card (non disponible)</option>
            </select>
        </div>
        <button type="submit" id="acheteButton" class="btn ">
            Achete
        </button>
    </form>
</div>

<!-- --------------------alert success ----------------->
<div id="alertContainer" class="alert-overlay" style="display: none;">
    <div class="alert alert-success" role="alert">
        The receipt Download Successfully ! check it in your downloads folder
    </div>
</div>

<%-------------------  the  ---------------------recipet---------------------%>
<div id="receipt" class="receipt-style" style="display: none;">
    <h1 class="text-center">Receipt</h1>
    <div id="receiptContent" class="receipt-content"></div>
    <div class="button-container">
        <button id="returnButton" class="modify-btn">return</button>
        <button id="downloadPDF" class="download-btn">Download</button>
    </div>
</div>



<!-- cart model -->
<div class="cart-modal" id="cartModal">
    <div class="cart-content" id="cartContent">
        <div class="cart-header">Cart</div>  <!-- Static Header -->
        <div class="cart-items">  <!-- Dynamic content goes here -->
            <!-- Cart items will be dynamically added here -->
        </div>
        <div class="cart-controls">
            <button class="cancel-button" onclick="showCart()">Close</button>
            <button class="bought-button">Buy</button>
            <div class="total-price">Total Price: <span id="total-price">0</span>DZA</div>
        </div>
    </div>


</div>

<div class="container-all-products" id="container-all">
    <div class="container mt-2 mb-2" >
        <div class="row" id="mouad">
            <div class="col-md-12">
                <div class="p-4 border border-2 rounded-5 border-warning form-header-product">
                    <div class="header-container">
                        <h1 class="mb-3">Product</h1>

                        <%--                        <!-- Cart Icon -->--%>
                        <%--                        <div class="Cart-product" onclick="showCart();">--%>
                        <%--                            <img src="bootstrap-icons-1.11.3/cart-1.svg" alt="Cart Icon" width="30">--%>
                        <%--                            <span id="cartItemCount"></span>--%>
                        <%--                        </div>--%>


                    </div>
                    <form class="form-search mb-3">
                        <input class="input-search" type="search"  id="searchInput" required>
                        <img src="bootstrap-icons-1.11.3/search-alt-1-svgrepo-com.svg" alt="search-img" class="fa-search ">

                    </form>

                    <!-- Select dropdown menu for options with custom styles -->

                    <select id="categorySelect" class="form-select form-select-lg custom-select" aria-label=".form-select-lg example">
                        <option value="0">All Category</option> <!-- Set value as 0 for default selection -->
                        <c:forEach items="${categoriesList}" var="uneCategorie">
                            <option value="${uneCategorie.id}">${uneCategorie.nomCategorie}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
    </div>

    <div class="shop-items " id="shop-items">
        <div class="container-fluid">
            <div class="row">
                <c:choose>
                    <c:when test="${not empty produitsList}">
                        <c:forEach items="${produitsList}" var="unProduit">
                            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" data-category="${unProduit.category.id}">
                                <div class="product" data-name="${unProduit.name.toLowerCase()}">
                                    <div class="item">
                                        <img class="img-responsive" id="produit_image_${unProduit.name}_id" alt="${unProduit.name}" src="/produit/image/${unProduit.id}"/>
                                        <div class="item-dtls">
                                            <h4> ${unProduit.name} </h4>
                                            <span class="price lblue"> DZA ${unProduit.prix} </span>
                                            <h6> Description :<br> <span class="description-style"> ${unProduit.description}</span>  </h6>
                                        </div>
                                        <div class="ecom bg-lblue">
                                            <a class="btn buy-btn" data-product-id="${unProduit.id}" href="#">add to cart</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <p class="text-center mt-5" style="color: grey ;font-size: 25px" >No products available</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>



<script src="bootstrap/js/script.js"></script>
<script src="bootstrap/js/product.js"></script>
<script src="bootstrap/js/alert-sweet.js"></script>
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="bootstrap/js/jquery.js"></script>

<!-- Include jsPDF for PDF generation -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.4.0/jspdf.umd.min.js"></script>
<!-- Include QRCode.js from a reliable CDN -->
<script src="https://cdn.jsdelivr.net/gh/davidshimjs/qrcodejs/qrcode.js"></script>



</body>
<jsp:include page="footer.jsp" />

</html>