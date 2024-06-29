<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap-icons-1.11.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/lightbox.css">
    <link href="bootstrap/fontawsome/fontawsome.css" rel="stylesheet" />

    <title>Home</title>
</head>

<jsp:include page="navbar.jsp" />
<body>


<!-- ads section  -->
<div class="advertisement-container">
    <div class="advertisement">
        <c:forEach var="ads" items="${Ads}" begin="0" end="0">
        <p>

            <img class="me-3" src="bootstrap-icons-1.11.3/ads.svg" width="15">
                    ${ads.description}
            <img class="" src="bootstrap-icons-1.11.3/ads.svg" width="15" >  </p>
        </c:forEach>
    </div>
</div>
<div class="container-all ">
    <div class="container-image " >
        <div class="content-image">
            <h1>Welcome to <span style="color: orangered;">Camp</span>Dz</h1>
            <p>this where you find anything you need for your camping</p>
            <a href="#carouselExampleIndicators"> <button>discover Now </button></a>
        </div>
    </div>
</div>
<jsp:include page="slider.jsp" />
<section class="features-icons text-center">
    <div class="container">
        <div class="row justify-content-md-center">
            <div class="col-12 col-md-10 col-lg-8 col-xl-7 col-xxl-6">
                <h2 class="mb-4 mt-4 display-5 text-center h2-header">
                    <img src="bootstrap-icons-1.11.3/stars-svgrepo-com.svg" id="our-services">
                    Our Services
                </h2>
                <p class="text-secondary mb-5 text-center">Explore our range of services designed to enhance your business. We focus on delivering high-quality services to drive your success.</p>
                <hr class="w-100 mx-auto mb-5 mb-xl-9 orange-line">
            </div>
        </div>
    </div>
    <div class="container service-card" >
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                    <div class="features-icons-icon d-flex">
                        <img src="bootstrap-icons-1.11.3/speed-svgrepo-com.svg" class="features-service">
                    </div>
                    <h3>Fast Delivery</h3>
                    <p class="lead mb-0">Efficient shipping options to ensure swift delivery of your products.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                    <div class="features-icons-icon d-flex">
                        <img src="bootstrap-icons-1.11.3/goods-filled-svgrepo-com.svg" class="features-service">
                    </div>
                    <h3>High Quality </h3>
                    <p class="lead mb-0">Featuring the latest products to meet customer expectations.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                    <div class="features-icons-icon d-flex">
                        <img src="bootstrap-icons-1.11.3/eye-hidden-svgrepo-com.svg" class="features-service">
                    </div>
                    <h3>High Privacy</h3>
                    <p class="lead mb-0">Protecting customer information with strict privacy measures.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                    <div class="features-icons-icon d-flex">
                        <img src="bootstrap-icons-1.11.3/easy-to-use.svg" class="features-service">
                    </div>
                    <h3>Easy to Use</h3>
                    <p class="lead mb-0">User-friendly interface for seamless navigation and shopping experience.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                    <div class="features-icons-icon d-flex">
                        <img src="bootstrap-icons-1.11.3/money-refund.svg" class="features-service">
                    </div>
                    <h3>Refund Money</h3>
                    <p class="lead mb-0">Flexible refund policies to ensure customer satisfaction.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
                    <div class="features-icons-icon d-flex">
                        <img src="bootstrap-icons-1.11.3/contact.svg" class="features-service">
                    </div>
                    <h3>Contact 24/7</h3>
                    <p class="lead mb-0">Continuous support available round-the-clock to assist customers.</p>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="features-icons text-center">
    <div class="container1" id="products-link">
        <h2 class="mb-4 display-5 text-center h2-header">
            <img src="bootstrap-icons-1.11.3/product-management-svgrepo-com.svg" >
            Our Product
        </h2>

        <div class="shop-items-home" id="shop-items">
            <div class="container-fluid">
                <div class="row">
                    <c:choose>
                        <c:when test="${not empty produitsList}">
                            <c:forEach items="${produitsList}" var="unProduit" begin="0" end="3">
                                <div class="col-lg-3 col-md-4 col-sm-6">
                                    <div class="item">
                                        <img class="img-fluid image-product-item" id="produit_image_${unProduit.name}_id" alt="${unProduit.name}"
                                             src="/produit/image/${unProduit.id}"/>
                                        <div class="item-dtls">
                                            <h4>${unProduit.name}</h4>
                                            <span class="price lblue">DZA ${unProduit.prix}</span>
                                            <h6>Description:<br> <span class="description-style">${unProduit.description}</span></h6>
                                        </div>
                                        <div class="ecom bg-lblue">
                                            <a class="btn add-to-cart-btn" data-product-id="${unProduit.id}" href="product">Add to cart</a>
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
            <a href="product"><button class="voir-plus">Voir plus</button></a>
        </div>
    </div>
</section>

<section >
    <div>
        <div class="deal-container">
            <h2>
                <img src="bootstrap-icons-1.11.3/discount.svg" class="features-service" alt="deal-img">
                Deal of the Week</h2>
            <div class="deal-content">
                <c:choose>
                <c:when test="${not empty dealProducts}">
                <c:forEach items="${dealProducts}" var="dealProduct" begin="0" end="0">
                <div class="product-image-deal">
                    <img   id="deal_${dealProduct.name}_id" alt="${dealProduct.name}"
                           src="${pageContext.request.contextPath}/deals/image/${dealProduct.id}" />
                </div>
                <div class="product-info">
                    <h3 class="product-name-deal"> ${dealProduct.name}</h3>
                    <p class="description-deal"><span style="color: black" class="me-3">Description : </span>  ${dealProduct.description}  </p>

                    <div class="price-container">
                        <p class="original-price">$ ${dealProduct.oldPrice}</p>
                        <p class="discounted-price">Now $  ${dealProduct.newPrice} </p>
                    </div>
                    <button class="shop-now" id="hide-shop-now" > See the product</button>
                </div>
            </div>


            <div class="countdown-container" id="countdown_${dealProduct.id}">
                <div class="countdown-box">
                    <div class="days">00</div>
                    <span>Days</span>
                </div>
                <div class="countdown-box">
                    <div class="hours">00</div>
                    <span>Hours</span>
                </div>
                <div class="countdown-box">
                    <div class="minutes">00</div>
                    <span>Minutes</span>
                </div>
                <div class="countdown-box">
                    <div class="seconds">00</div>
                    <span>Seconds</span>
                </div>
            </div>
            </c:forEach>
            </c:when>
            <c:otherwise>
                <p class="text-center mt-5" style="color: grey ;font-size: 25px ;flex: 1" >No deals available</p>

            </c:otherwise>
            </c:choose>
        </div>
    </div>
</section>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        <c:forEach items="${dealProducts}" var="dealProduct">
        setupCountdown('${dealProduct.id}', '${dealProduct.endTime}');
        </c:forEach>
    });
    </script>
    <section>
        <div class="container-gallery" id="Blog">
            <h2><img src="bootstrap-icons-1.11.3/gallery.svg" alt=""> Our Blog</h2>
            <div class="photo-gallery">
                <div class="container">
                    <div class="intro">

                    </div>
                    <div class="row photos">
                        <c:choose>
                            <c:when test="${not empty imagesList}">
                                <c:forEach var="image" items="${imagesList}" begin="0" end="3">
                                    <div class="col-sm-6 col-md-4 col-lg-3 item">
                                        <a href="${pageContext.request.contextPath}/images/image/${image.id}" data-lightbox="photos">
                                            <img id="image_${image.name}_id" alt="${image.name}" src="${pageContext.request.contextPath}/images/image/${image.id}" />
                                        </a>
                                    </div>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>

                                <p class="text-center mt-5" style="color: grey ;font-size: 25px" >No images available</p>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
            <a href="blog"><button>voir plus</button></a>
        </div>
    </section>


    <section>
        <div class="testimonials-clean">
            <div class="container">
                <div class="intro">
                    <h2 class="text-center"><img src="bootstrap-icons-1.11.3/reviews.svg" alt=""> Reviews </h2>

                </div>
                <div class="row people">
                    <c:choose>
                        <c:when test="${not empty comments}">
                            <c:forEach var="comment" items="${comments}">
                                <div class="col-md-6 col-lg-4 item">
                                    <div class="box">
                                        <div class="text-center">
                                        <textarea class="description text-center" readonly rows="4" cols="15"
                                                  style="width: 100%; height: 100%; resize: none; border: none; overflow: hidden">${comment.description}</textarea>
                                        </div>
                                    </div>
                                    <div class="author">
                                        <img class="rounded-circle" src="images/profile.jpg">
                                        <h5 class="name">${comment.name}</h5>
                                        <p class="title">${comment.career}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>

                            <p class="text-center mt-5" style="color: grey ;font-size: 25px" >No reviews available</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </section>


<%--<script src="bootstrap/js/bootstrap.min.js"></script>  <!-- need it for change the slider -->--%>

<script src="bootstrap/js/alert-sweet.js"></script>
<script src="bootstrap/js/script.js"></script>
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="bootstrap/js/jquery.js"></script>
<script src="bootstrap/js/lightbox.js"></script>
<script src="bootstrap/fontawsome/fontawsome.js" ></script>

</body>
<jsp:include page="footer.jsp" />
</html>