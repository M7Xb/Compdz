<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
</head>
<body>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- slider images -->
<div id="carouselExampleIndicators" class="carousel slide" >
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
                aria-label="Slide 3"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3"
                aria-label="Slide 4"></button>
    </div>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img src="images/new.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5 class="caption1">New product</h5>
                <p class="caption2">get all new product here </p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="images/pro1.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5 class="caption1">New product</h5>
                <p class="caption2">get all new product here </p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="images/pro2.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5 class="caption1">Promotion</h5>
                <p class="caption2">Be the first to get all the promotion</p>
            </div>
        </div>
        <div class="carousel-item">
            <img src="images/pro2.jpg" class="d-block w-100" alt="...">
            <div class="carousel-caption d-none d-md-block">
                <h5 class="caption1">Promotion</h5>
                <p class="caption2">Be the first to get all the promotion</p>
            </div>
        </div>
    </div>

    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="prev">
        <img src="bootstrap-icons-1.11.3/left-arrow-circle-svgrepo-com.svg" class="LR-arrow">

    </button>

    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
            data-bs-slide="next">
        <img src="bootstrap-icons-1.11.3/right-arrow-svgrepo-com.svg" class="LR-arrow">
    </button>
</div>

</body>
</html>