<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="bootstrap-icons-1.11.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/lightbox.css">
    <title>Blog</title>
    <jsp:include page="navbar.jsp" />
</head>

<body>

<section>
    <div class="container-gallery" id="Blog">
        <h2><img src="bootstrap-icons-1.11.3/gallery.svg" alt=""> Our Blog</h2>
        <div class="photo-gallery">
            <div class="container">
                <div class="intro">
                    <p class="text-center">
                        Our customers share their photos of camping with our products.
                    </p>
                </div>
                <div class="row photos">
                    <c:choose>
                        <c:when test="${not empty imagesList}">
                            <c:forEach var="image" items="${imagesList}">
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
    </div>
</section>

<script src="bootstrap/js/jquery.js"></script>
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="bootstrap/js/lightbox.js"></script>
<jsp:include page="footer.jsp" />

</body>

</html>