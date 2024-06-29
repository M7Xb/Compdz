
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<html lang="en" data-bs-theme="dark">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Admin Dashboard</title>
    <link rel="stylesheet" href="css/card-dashboard.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <script src="bootstrap/fontawsome/fontawsome.js" ></script>
    <script src="bootstrap/js/theme-switch.js" ></script>
    <link href="bootstrap/fontawsome/fontawsome.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/admin-panel.css">
</head>
<body>


<div class="wrapper">
    <aside id="sidebar" class="js-sidebar">
        <!-- Content For Sidebar -->
        <div class="h-100">
            <div class="sidebar-logo">

                <a href="adminpanel" class="me-4">Admin Panel</a>
                <a href="#" class="theme-toggle " onclick="toggleTheme();">
                    <i class="fa-regular fa-moon"> <span>Dark</span></i>
                    <i class="fa-regular fa-sun"> <span>Light</span></i>
                </a>
            </div>



            <ul class="sidebar-nav">
                <li class="sidebar-header">
                    Admin Elements
                </li>


                <li class="sidebar-item">
                    <a href="#" class="sidebar-link fs-5" onclick="showDashboard();">
                        <i class="fa-solid fa-gauge-high pe-2"></i>
                        Dashboard
                    </a>
                </li>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link collapsed fs-5" data-bs-target="#products" data-bs-toggle="collapse" aria-expanded="false">
                        <i class="fa-solid fa-table-list pe-2"></i>
                        Products
                    </a>
                    <ul id="products" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="#" class="sidebar-link fs-6" onclick="showContentSection('productTable');">
                                <i class="fa-solid fa-eye pe-2"></i> View Products
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="#" class="sidebar-link fs-6" onclick="showContentSection('addProductForm');">
                                <i class="fa-solid fa-circle-plus pe-2"></i>Add Product
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link collapsed fs-5" data-bs-target="#category" data-bs-toggle="collapse" aria-expanded="false">
                        <i class="fa-solid fa-sliders pe-2"></i>
                        Category
                    </a>
                    <ul id="category" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="#" class="sidebar-link fs-6" onclick="showContentSection('allCategoriesSection');">
                                <i class="fa-solid fa-eye pe-2"></i>All Categories
                            </a>
                        </li>
                        <li>
                            <a href="#" class="sidebar-link fs-6" onclick="showContentSection('addUpdateCategorySection');">
                                <i class="fa-solid fa-circle-plus pe-2"></i>Add category
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link collapsed fs-5" data-bs-target="#user" data-bs-toggle="collapse" aria-expanded="false">
                        <i class="fa-regular fa-user pe-2"></i>
                        Users
                    </a>
                    <ul id="user" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="#" class="sidebar-link fs-6" onclick="showContentSection('allUsersSection');">
                                <i class="fa-solid fa-eye pe-2"></i> All Users
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link collapsed fs-5" data-bs-target="#orders" data-bs-toggle="collapse" aria-expanded="false">
                        <i class="fa-solid fa-list-check pe-2"></i>Orders
                    </a>
                    <ul id="orders" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="#" class="sidebar-link fs-6" onclick="showContentSection('allorders');">
                                <i class="fa-solid fa-eye pe-2"></i> All Orders
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link collapsed fs-5" data-bs-target="#deals" data-bs-toggle="collapse" aria-expanded="false">
                        <i class="fa-solid fa-hourglass-end pe-2"></i>
                        Deals
                    </a>
                    <ul id="deals" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="#" class="sidebar-link fs-6" onclick="showContentSection('alldeals');">
                                <i class="fa-solid fa-eye pe-2"></i> View all Deals
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="#" class="sidebar-link fs-6" onclick="showContentSection('add-dealproduct');">
                                <i class="fa-solid fa-circle-plus pe-2"></i>Add Deal
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link collapsed fs-5" data-bs-target="#images" data-bs-toggle="collapse" aria-expanded="false">
                        <i class="fa-solid fa-images pe-2"></i>
                        Blog
                    </a>
                    <ul id="images" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="#" class="sidebar-link fs-6" onclick="showContentSection('imageTable');">
                                <i class="fa-solid fa-eye pe-2"></i> View all images
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="#" class="sidebar-link fs-6" onclick="showContentSection('imageform');">
                                <i class="fa-solid fa-circle-plus pe-2"></i> Add image
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link collapsed fs-5" data-bs-target="#comments" data-bs-toggle="collapse" aria-expanded="false">
                        <i class="fa-solid fa-comments pe-2"></i>
                        Comment
                    </a>
                    <ul id="comments" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="#" class="sidebar-link fs-6" onclick="showContentSection('all-comments');">
                                <i class="fa-solid fa-eye pe-2"></i> View all comments
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="#" class="sidebar-link fs-6" onclick="showContentSection('add-comment');">
                                <i class="fa-solid fa-circle-plus pe-2"></i> Add comment
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="sidebar-item">
                    <a href="#" class="sidebar-link collapsed fs-5" data-bs-target="#ads" data-bs-toggle="collapse" aria-expanded="false">
                        <i class="fa-solid fa-bullhorn pe-2"></i>
                        Ads
                    </a>
                    <ul id="ads" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                        <li class="sidebar-item">
                            <a href="#" class="sidebar-link fs-6" onclick="showContentSection('all-ads');">
                                <i class="fa-solid fa-eye pe-2"></i> View all Ads
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a href="#" class="sidebar-link fs-6" onclick="showContentSection('add-ads');">
                                <i class="fa-solid fa-circle-plus pe-2"></i> Add ads
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </aside>

    <div class="main">
        <nav class="navbar navbar-expand px-3 border-bottom">
            <button class="btn" id="sidebar-toggle" type="button"  onclick="toggleSidebar();" >
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="navbar-collapse navbar">
                <ul class="navbar-nav">
                    <c:if test="${pageContext.request.userPrincipal ne null}">
                        <li class="nav-item dropdown">
                            <a href="#" data-bs-toggle="dropdown" class="nav-icon pe-md-0">
                                <img src="images/profile.jpg" class="avatar img-fluid " alt="admin">
                            </a>
                            <div class="dropdown-menu dropdown-menu-end">

                                <b class= "name-user ms-3">${pageContext.request.userPrincipal.name}</b>

                                <a class="dropdown-item" href="home">Go Home</a>

                                <a href="#" class="dropdown-item" onclick="showContentSection('editProfileSection');">Edit Profile</a>

                                <a class="dropdown-item" href="logout">Log out</a>
                            </div>
                        </li>
                    </c:if>
                </ul>
            </div>
        </nav>
        <main class="content px-3 py-2">
            <div class="container-fluid ">
                <div id="dashboard" class="dashboard-visible">
                    <div class="mb-3">
                        <h4>Admin Dashboard</h4>
                    </div>
                    <div class="row">
                        <!-- Welcome Back Admin Card -->
                        <div class="col-12 col-md-12 d-flex">
                            <div class="card flex-fill border-0 illustration">
                                <div class="card-body p-0 d-flex flex-fill">
                                    <div class="row g-0 w-100">
                                        <div class="col-6">
                                            <div class="p-3 m-1">
                                                <h1 >Welcome Back, <span STYLE="color: #713555">${utilisateurConnecte.nom}</span></h1>
                                                <h2 class="mt-5 ms-5"> to  <span STYLE="color: #713555">Admin Panel</span> 🤖</h2>
                                            </div>
                                        </div>
                                        <div class="col-6 align-self-end text-end">
                                            <img src="images/admin.jpg" class="img-fluid illustration-img" alt="">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Dashboard Cards -->
                        <div class="row row-cols-1 row-cols-md-2 row-cols-xl-4">

                            <!-- -------------------Total Products--------------------- -->
                            <div class="col">
                                <div class="card radius-10 border-start border-0 border-3 border-info">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div>
                                                <p class="mb-0 text-secondary fs-5">Total products</p>
                                                <h4 class="my-1 text-info">${produitsList.size()}</h4>
                                            </div>
                                            <div
                                                    class="widgets-icons-2 rounded-circle bg-gradient-scooter text-white ms-auto">
                                                <i class="fa fa-shopping-cart"></i></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- -------------------Total Amount--------------------- -->
                            <div class="col">
                                <div class="card radius-10 border-start border-0 border-3 border-danger">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div>
                                                <p class="mb-0 text-secondary fs-5">Total orders</p>
                                                <h4 class="my-1 text-danger">${commandesList.size()}</h4>
                                            </div>
                                            <div
                                                    class="widgets-icons-2 rounded-circle bg-gradient-bloody text-white ms-auto">
                                                <i class="fa-solid fa-list-check "></i></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- -------------------Total Users--------------------- -->
                            <div class="col">
                                <div class="card radius-10 border-start border-0 border-3 border-warning">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div>
                                                <p class="mb-0 text-secondary fs-5">Total Users</p>
                                                <h4 class="my-1 text-warning ">${utilisateursList.size()}</h4>
                                            </div>
                                            <div
                                                    class="widgets-icons-2 rounded-circle bg-gradient-blooker text-white ms-auto">
                                                <i class="fa fa-users"></i></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- -------------------Total Deals--------------------- -->
                            <div class="col">
                                <div class="card radius-10 border-start border-0 border-3 border-success">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div>
                                                <p class="mb-0 text-secondary fs-5">Total Deals</p>
                                                <h4 class="my-1 text-success">${dealProducts.size()}</h4>
                                            </div>
                                            <div
                                                    class="widgets-icons-2 rounded-circle bg-gradient-green text-white ms-auto">
                                                <i class="fa-solid fa-hourglass-end"></i></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- -------------------Total Images--------------------- -->
                            <div class="col">
                                <div class="card radius-10 border-start border-0 border-3" style="border-left: 5px solid #ff6f61 !important;">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div>
                                                <p class="mb-0 text-secondary fs-5">Total Images</p>
                                                <h4 class="my-1" style="color: #ff6f61;">${imagesList.size()}</h4>
                                            </div>
                                            <div class="widgets-icons-2 rounded-circle bg-gradient-coral text-white ms-auto">
                                                <i class="fa-solid fa-images"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- -------------------Total Comment--------------------- -->
                            <div class="col">
                                <div class="card radius-10 border-start border-0 border-3" style="border-left: 5px solid #008080 !important;">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div>
                                                <p class="mb-0 text-secondary fs-5">Total Comment</p>
                                                <h4 class="my-1" style="color: #008080;">${comments.size()}</h4>
                                            </div>
                                            <div class="widgets-icons-2 rounded-circle bg-gradient-teal text-white ms-auto">
                                                <i class="fa-solid fa-comments"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- -------------------Total Ads--------------------- -->
                            <div class="col">
                                <div class="card radius-10 border-start border-0 border-3" style="border-left: 5px solid #dda0dd !important;">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div>
                                                <p class="mb-0 text-secondary fs-5">Total Ads</p>
                                                <h4 class="my-1" style="color: #dda0dd;">${Ads.size()}</h4>
                                            </div>
                                            <div class="widgets-icons-2 rounded-circle bg-gradient-plum text-white ms-auto">
                                                <i class="fa-solid fa-bullhorn"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- -------------------Total Category--------------------- -->
                            <div class="col">
                                <div class="card radius-10 border-start border-0 border-3" style="border-left: 5px solid #eab676 !important;">
                                    <div class="card-body">
                                        <div class="d-flex align-items-center">
                                            <div>
                                                <p class="mb-0 text-secondary fs-5">Total Category</p>
                                                <!-- Change the color of the h4 text here -->
                                                <h4 class="my-1" style="color: #eab676;">${categoriesList.size()}</h4>
                                            </div>
                                            <div class="widgets-icons-2 rounded-circle bg-gradient-gold text-white ms-auto">
                                                <i class="fa-solid fa-sliders"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>




                        </div>
                    </div>
                </div>

                <!-- -------------------Table Element--------------------- -->
                <div id="productTable" class="card border-0 content-section ">
                    <div class="card-header">
                        <h3 class="card-title text-center">
                            Table Product
                        </h3><br>

                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th scope="col" class="text-center">id</th>
                                <th scope="col" class="text-center">image</th>
                                <th scope="col" class="text-center">name</th>
                                <th scope="col" class="text-center">category</th>
                                <th scope="col" class="text-center">price</th>
                                <th scope="col" class="text-center">description</th>
                                <th scope="col" class="text-center"> action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${produitsList}" var="unProduit">
                                <tr id="produit_${unProduit.id}">
                                    <th scope="row" class="text-center">${unProduit.id}</th>
                                    <td class="text-center">
                                        <img class="produit_image" id="produit_image_${unProduit.name}_id" alt="${unProduit.name}"
                                             src="/produit/image/${unProduit.id}"/>
                                    </td>
                                    <td class="text-center">${unProduit.name}</td>
                                    <td class="text-center">${unProduit.category.nomCategorie}</td>
                                    <td class="text-center">${unProduit.prix}</td>
                                    <td class="text-center">
                                        <label>
                                            <textarea rows="3" cols="30" readonly style=" resize: none; border: none; overflow: hidden">${unProduit.description}</textarea>
                                        </label>
                                    </td>

                                    <td class="text-center">
                                        <button class="btn btn-primary btn-sm me-4 p-2" onclick="EditProductForm(${unProduit.id}, '${unProduit.name}',
                                            ${unProduit.prix}, ${unProduit.category.id}, '${unProduit.description}')">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </button>

                                        <button onclick="Deleteproduit(${unProduit.id})"
                                                class="btn btn-danger btn-sm p-2"><i class="fa-solid fa-trash"></i></button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- ---------------------------------------edit product-------------------------  -->
                <div id="editSection" class="card border-0 content-section form-style"  >
                    <div class="card-header">
                        <h3 class="card-title text-center">Edit Product</h3>
                    </div>
                    <div class="card-body">
                        <form id="editForm" action="" method="post" enctype="multipart/form-data">
                            <input type="hidden" id="productId" name="productId" />
                            <div class="mb-3">
                                <label for="productName" class="form-label">Product Name</label>
                                <input type="text" class="form-control" id="productName" name="productName">
                            </div>
                            <div class="mb-3">
                                <label for="productPrice" class="form-label">Price</label>
                                <input type="text" class="form-control" id="productPrice" name="productPrice">
                            </div>
                            <div class="mb-3">
                                <label for="productCategory" class="form-label">Category</label>
                                <select class="form-select" id="productCategory" name="productCategory">
                                    <c:forEach items="${categoriesList}" var="uneCategorie">
                                        <option value="${uneCategorie.id}">${uneCategorie.nomCategorie}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="productDescription" class="form-label">Description</label>
                                <textarea class="form-control" id="productDescription" rows="3" name="productDescription"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="productImage" class="form-label">Product Image</label>
                                <input type="file" class="form-control" id="productImage" name="productImage" accept="image/*">
                            </div>
                            <div>

                                <div class="d-flex justify-content-center ">
                                    <button type="submit" class="update-btn col-md-12">Update</button>
                                </div>

                            </div>
                        </form>
                    </div>
                </div>



                <!-- ---------------------------------------add product-------------------------  -->
                <div id="addProductForm" class=" card border-0 content-section form-style">

                    <div class="card-header">
                        <h3 class="card-title text-center">Add Product</h3>
                    </div>
                    <div class="card-body">
                        <form method="post" action="addProduit" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="productName" class="form-label">Product Name</label>
                                <input type="text" class="form-control" id="productName"
                                       placeholder="Enter product name" name="productName">
                            </div>
                            <div class="mb-3">
                                <label for="productPrice" class="form-label">Price</label>
                                <input type="number" class="form-control" id="productPrice" name="productPrice" placeholder="Enter price">
                            </div>
                            <div class="mb-3">
                                <label for="productCategory" class="form-label">Category</label>
                                <select class="form-select" id="productCategory" name="productCategory">
                                    <option selected>Choose...</option>
                                    <c:forEach items="${categoriesList}" var="uneCategorie">
                                        <option value="${uneCategorie.id}">${uneCategorie.nomCategorie}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="productImage" class="form-label">Product Image</label>
                                <input type="file" class="form-control" id="productImage" name="productImage" accept="image/*">
                            </div>
                            <div class="mb-3">
                                <label for="productDescription" class="form-label">Description</label>
                                <textarea class="form-control" id="productDescription" rows="3"
                                          placeholder="Enter product description" name="productDescription"></textarea>
                            </div>

                            <div class="d-flex justify-content-center ">
                                <button type="submit" class="submit-btn col-md-12">Submit</button>
                            </div>

                        </form>
                    </div>
                </div>

                <!-- ---------------------------------- Table images  ------------------------>

                <div id="imageTable" class="card border-0 content-section ">
                    <div class="card-header">
                        <h3 class="card-title text-center">
                            Table Images
                        </h3><br>

                    </div>
                    <div class="card-body">

                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th class="text-center">ID</th>
                                <th class="text-center">Name</th>
                                <th class="text-center">Image</th>
                                <th class="text-center">Action</th>

                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="image" items="${imagesList}">
                                <tr id="image_${image.id}">
                                    <td class="text-center">${image.id}</td>
                                    <td class="text-center">${image.name}</td>
                                    <td class="text-center">
                                        <img   class="produit_image"  id="image_${image.name}_id" alt="${image.name}"
                                               src="${pageContext.request.contextPath}/images/image/${image.id}" />
                                    </td>
                                    <td class="text-center" >
                                        <button class="btn btn-danger btn-sm p-2 " onclick="deleteImage(${image.id})">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>

                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>


                <!-- ---------------------------------  Add Image form ------------------------>
                <div id="imageform" class=" card border-0 content-section form-style">

                    <div class="card-header">
                        <h3 class="card-title text-center">Add image</h3>
                    </div>
                    <div class="card-body">

                        <form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath}/upload">
                            <div class="mb-3">
                                <label class="form-label"> Name Image</label>
                                <input type="text" class="form-control"
                                       placeholder="Enter image name" name="name" required >
                            </div>
                            <div class="mb-3">
                                <label class="form-label">  Upload Image</label>
                                <input type="file"  name="file" class="form-control"  accept="image/*" required>
                            </div>

                            <div class="d-flex justify-content-center ">
                                <button type="submit" class="submit-btn col-md-12">Upload</button>
                            </div>


                        </form>

                    </div>
                </div>



                <!-- -------------------------------View All Users Section ------------------------>
                <div id="allUsersSection" class="card border-0 content-section " >
                    <div class="card-header">
                        <h3 class="card-title text-center">All Users</h3>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th scope="col" class="text-center">ID</th>
                                <th scope="col" class="text-center">First Name</th>
                                <th scope="col" class="text-center">Last Name</th>
                                <th scope="col" class="text-center">Email</th>
                                <th scope="col" class="text-center">Type Account</th>
                                <th scope="col" class="text-center">Date inscription</th>
                                <th scope="col" class="text-center">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${utilisateursList}" var="unUtilisateur">
                                <tr>
                                    <th scope="row" class="text-center">${unUtilisateur.idUser}</th>
                                    <td class="text-center">${unUtilisateur.nom}</td>
                                    <td class="text-center">${unUtilisateur.prenom}</td>
                                    <td class="text-center"> ${unUtilisateur.mail}</td>
                                    <td class="text-center"> ${unUtilisateur.role}</td>
                                    <td class="text-center"> ${unUtilisateur.dateInscription}</td>

                                    <td class="text-center">

                                        <button onclick="deleteUser(${unUtilisateur.idUser})" class="btn btn-danger btn-sm p-2">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>

                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <%--------------------------- --------------------    view  all  orders ----------------------------------------------------------%>

                <div id="allorders" class="card border-0 content-section">
                    <div class="card-header">
                        <h3 class="card-title text-center">All orders</h3>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th scope="col" class="text-center">N°</th>
                                <th scope="col" class="text-center">User</th>
                                <th scope="col" class="text-center">Total Product</th>
                                <th scope="col" class="text-center">Total Price</th>
                                <th scope="col" class="text-center">Date command</th>
                                <th scope="col" class="text-center">Status</th>
                                <th scope="col" class="text-center">Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${commandesList}" var="uneCommande" varStatus="status">
                                <tr>
                                    <th scope="row" class="text-center">${status.index + 1}</th>
                                    <td class="text-center">${uneCommande.nom}</td>
                                    <td class="text-center">${uneCommande.articles.size()}</td>
                                    <td class="text-center">${uneCommande.price}</td>
                                    <td class="text-center">${uneCommande.dateCreation}</td>
                                    <td class="text-center status-${uneCommande.libelleStatut.toLowerCase().replace(' ', '-')}">
                                            ${uneCommande.libelleStatut}
                                    </td>
                                    <td class="text-center">

                                            <button onclick="showContentSection('view-orders-${uneCommande.idCommande}')" class="btn btn-primary btn- me-2 p-2">
                                                <i class="fa-solid fa-eye"></i>
                                            </button>
                                            <button onclick="deleteOrder(${uneCommande.idCommande})" class="btn btn-danger btn-sm p-2">
                                                <i class="fa-solid fa-trash"></i>
                                            </button>
                                      
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>


                <!-- -------------------------------View of the orders ------------------------>

                <!-- -------------------------------View the product ------------------------>
                <c:forEach items="${commandesList}"  var="uneCommande" varStatus="status" >
                    <div id="view-orders-${uneCommande.idCommande}" class="card border-0 content-section " >
                        <div class="card-header">
                            <div class="text-end">
                                <button  onclick="showContentSection('allorders')" class="btn btn-danger btn-sm ">
                                    X
                                </button>
                            </div>
                            <h3 class="card-title text-center">The product of the order</h3>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                <tr>
                                    <th scope="col" class="text-center">N°</th>
                                    <th scope="col" class="text-center">image</th>
                                    <th scope="col" class="text-center">Qte</th>
                                    <th scope="col" class="text-center">name</th>
                                    <th scope="col" class="text-center">price</th>
                                    <th scope="col" class="text-center">category</th>

                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${uneCommande.produits}" var="unProduit" varStatus="status">
                                    <tr>
                                        <th scope="row" class="text-center">${status.index + 1}</th>
                                        <td class="text-center">
                                            <img class="produit_image" id="produit_image_${unProduit.name}_id" alt="${unProduit.name}"
                                                 src="/produit/image/${unProduit.id}"/>
                                        </td>
                                        <td class="text-center">${uneCommande.articles[status.index].quantite}</td>
                                        <td class="text-center">${unProduit.name}</td>
                                        <td class="text-center">${unProduit.prix}</td>
                                        <td class="text-center">${unProduit.category.nomCategorie}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- -------------------------------View of the info of user ------------------------>
                        <hr>
                        <div class="card-header">
                            <h3 class="card-title text-center">User Information</h3>
                        </div>
                        <div class="card-body">
                            <table class="table table-bordered">
                                <thead>
                                <tr>


                                    <th scope="col" class="text-center">nom</th>
                                    <th scope="col" class="text-center">prenom</th>
                                    <th scope="col" class="text-center">mail</th>
                                    <th scope="col" class="text-center">address</th>
                                    <th scope="col" class="text-center">wilaya</th>
                                    <th scope="col" class="text-center">code postal</th>
                                    <th scope="col" class="text-center">Actions</th>

                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td class="text-center">${uneCommande.nom}</td>
                                    <td class="text-center">${uneCommande.prenom}</td>
                                    <td class="text-center">${uneCommande.email}</td>
                                    <td class="text-center">${uneCommande.adress}</td>
                                    <td class="text-center">${uneCommande.wilaya}</td>
                                    <td class="text-center">${uneCommande.codePostal}</td>

                                    <td class="text-center">
                                        <!-- Form to update status to "Validée" (2) -->
                                        <form action="/commande/${uneCommande.idCommande}/status" method="POST" style="display:inline;">
                                            <input type="hidden" name="status" value="2">
                                            <button type="submit" class="btn btn-success btn-sm me-4 p-2">
                                                <i class="fa-solid fa-check"></i>
                                            </button>
                                        </form>
                                        <!-- Form to update status to "refuser" (0) -->
                                        <form action="/commande/${uneCommande.idCommande}/status" method="POST" style="display:inline;">
                                            <input type="hidden" name="status" value="0">
                                            <button type="submit" class="btn btn-danger btn-sm p-2">
                                                <i class="fa-solid fa-xmark"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </c:forEach>



                <!------------------- View All Categories Section--------------------- -->

                <div id="allCategoriesSection" class="card border-0 content-section ">
                    <div class="card-header">
                        <h3 class="card-title text-center">All Categories</h3>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th scope="col" class="text-center">ID</th>
                                <th scope="col" class="text-center">Category Name</th>
                                <th scope="col" class="text-center" >Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${categoriesList}" var="uneCategorie">
                                <tr id="categorie_${uneCategorie.id}">
                                    <th scope="row" class="text-center">${uneCategorie.id}</th>
                                    <td class="text-center">${uneCategorie.nomCategorie}</td>
                                    <td class="text-center">

                                        <button onclick="EditCategoryForm(${uneCategorie.id}, '${uneCategorie.nomCategorie}')"
                                                class="btn btn-primary btn-sm me-4 p-2">
                                            <i class="fa-solid fa-pen-to-square"></i></button>

                                        <button onclick="DeleteCategory(${uneCategorie.id})" class="btn btn-danger btn-sm p-2">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>

                <!------------------------------ edit Category Section --------------->
                <div id="editCategorySection" class="card border-0 content-section form-style">
                    <div class="card-header">
                        <h3 class="card-title text-center">Add Category</h3>
                    </div>
                    <div class="card-body">
                        <form id="editCategoryForm" action="${pageContext.request.contextPath}/editCategory" method="post">

                            <div class="mb-3">
                                <input type="hidden" id="categoryId" name="id" value="" />
                                <label for="nomCategorie" class="form-label">Category Name</label>
                                <input type="text" class="form-control" id="nomCategorie" name="nomCategorie" required>
                            </div>

                            <div class="d-flex justify-content-center ">
                                <button type="submit" class="update-btn col-md-12">update</button>
                            </div>

                        </form>
                    </div>
                </div>

                <!------------------------------------ Add Category Section------------------------------ -->
                <div id="addUpdateCategorySection" class="card border-0 content-section form-style">
                    <div class="card-header">
                        <h3 class="card-title text-center">Add Category</h3>
                    </div>
                    <div class="card-body">
                        <form method="post" action="addCategory">
                            <div class="mb-3">
                                <label for="nomCategorie" class="form-label">Category Name</label>
                                <input type="text" class="form-control" id="nomCategorie" name="nomCategorie" placeholder="Enter category name" required>
                            </div>

                            <div class="d-flex justify-content-center ">
                                <button type="submit" class="col-md-12  submit-btn ">Submit</button>
                            </div>

                        </form>
                    </div>
                </div>

                <!-- ------------------------------edit profile admin ------------------------------------->
                <div id="editProfileSection" class="card border-0 content-section form-style" >
                    <div class="card-header">
                        <h3 class="card-title text-center">Edit Profile</h3>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/updateProfileAdmin/${utilisateurConnecte.idUser}" method="post">
                            <div class="mb-3">
                                <label for="adminName" class="form-label">username</label>
                                <input type="text" class="form-control" id="adminName" name="adminName" placeholder="change your username" value="${utilisateurConnecte.login}">
                            </div>
                            <div class="mb-3">
                                <label for="adminName" class="form-label">first name</label>
                                <input type="text" class="form-control" id="adminfirstName" name="firstName" placeholder="change your first name" value="${utilisateurConnecte.nom}">
                            </div>

                            <div class="mb-3">
                                <label for="adminlastName" class="form-label">last name</label>
                                <input type="text" class="form-control" id="adminlastName" name="lastName" placeholder="change your last name" value="${utilisateurConnecte.prenom}">
                            </div>


                            <div class="mb-3">
                                <label for="adminEmail" class="form-label">Email</label>
                                <input type="email" class="form-control" id="adminEmail"  name="email" placeholder="your email address" value="${utilisateurConnecte.mail}">
                            </div>
                            <div class="mb-3">
                                <label  class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="adminPassword"
                                       placeholder="Enter  password" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label"> Repeat Password</label>
                                <input type="password" class="form-control" id="password2" name="adminPassword2"
                                       placeholder="Enter  password" required>
                            </div>
                            <%--                            <div class="mb-3">--%>
                            <%--                                <label for="adminImage" class="form-label">Profile Picture</label>--%>
                            <%--                                <input type="file" class="form-control" id="adminImage" accept="image/*">--%>
                            <%--                                <img id="imagePreview" src="" alt="Profile Preview" class="img-thumbnail mt-2"--%>
                            <%--                                     style="display: none; max-height: 200px;">--%>
                            <%--                            </div>--%>
                            <div class="input-group mb-5 d-flex justify-content-between">
                                <div class="checkbox-wrapper-49">
                                    <div class="block">
                                        <small class="word-remember-me">Show password</small>
                                        <input data-index="0" id="remember-me" type="checkbox" onclick="togglePasswordVisibility()">
                                        <label for="remember-me" class="mo"></label>
                                    </div>
                                </div>
                            </div>
                            <div class="d-flex justify-content-center ">
                                <button type="submit" class="update-btn col-md-12">Update Profile</button>
                            </div>
                        </form>
                    </div>
                </div>


                <!------------------------------  form for deal product--------------->
                <div id="add-dealproduct" class="card border-0 content-section form-style">
                    <div class="card-header">
                        <h3 class="card-title text-center">Add Deal Product</h3>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/dealproducts/save" method="post" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" name="name" id="name" class="form-control" placeholder="Enter product name">
                            </div>
                            <div class="mb-3">
                                <label for="imageFile" class="form-label">Image</label>
                                <input type="file" name="imageFile" id="imageFile" class="form-control">
                            </div>
                            <div class="mb-3">
                                <label for="description" class="form-label">Description</label>
                                <textarea name="description" id="description" class="form-control" placeholder="Enter product description"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="oldPrice" class="form-label">Old Price</label>
                                <input type="number" name="oldPrice" id="oldPrice" class="form-control" step="0.01" placeholder="Enter old price">
                            </div>
                            <div class="mb-3">
                                <label for="newPrice" class="form-label">New Price</label>
                                <input type="number" name="newPrice" id="newPrice" class="form-control" step="0.01" placeholder="Enter new price">
                            </div>

                            <div class="d-flex justify-content-center ">
                                <button type="submit" class="submit-btn col-md-12">Save</button>
                            </div>
                        </form>

                    </div>
                </div>

                <!------------------------  view All the Deals--------------->

                <div id="alldeals" class="card border-0 content-section " >
                    <div class="card-header">
                        <h3 class="card-title text-center">
                            Table Deals
                        </h3>
                        <br>
                    </div>
                    <div class="card-body">

                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th scope="col" class="text-center" >ID</th>
                                <th scope="col" class="text-center">Image</th>
                                <th scope="col" class="text-center">Name</th>
                                <th scope="col" class="text-center">Description</th>
                                <th scope="col" class="text-center">Old Price</th>
                                <th scope="col" class="text-center">New Price</th>
                                <th scope="col" class="text-center">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${dealProducts}" var="dealProduct">
                                <tr id="deal_${dealProduct.id}">
                                    <th scope="row">${dealProduct.id}</th>
                                    <td>
                                        <img  class="produit_image"  id="deal_${dealProduct.name}_id" alt="${dealProduct.name}"
                                              src="${pageContext.request.contextPath}/deals/image/${dealProduct.id}" />
                                    </td>
                                    <td>${dealProduct.name}</td>
                                    <td class="text-center">
                                        <label>
                                            <textarea rows="3" cols="30" readonly style=" resize: none; border: none; overflow: hidden">${dealProduct.description}</textarea>
                                        </label>
                                    </td>
                                    <td class="text-center" >${dealProduct.oldPrice}</td>
                                    <td class="text-center">${dealProduct.newPrice}</td>
                                    <td>
                                        <button  onclick="EditdealtForm(${dealProduct.id}, '${dealProduct.name}',
                                            ${dealProduct.oldPrice}, ${dealProduct.newPrice}, '${dealProduct.description}' )"  class=" btn btn-primary  p-2  ms-4 me-4">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </button>

                                        <button onclick="TimerdealtForm(${dealProduct.id})" class="btn btn-success p-2 me-4">
                                            <i class="fa-solid fa-clock"></i>
                                        </button>

                                        <button onclick="DeleteDeal(${dealProduct.id})" class="btn btn-danger p-2">
                                            <i class="fa-solid fa-trash"></i></button>

                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>


                <!------------------------  form timer for the Deals--------------->
                <div id="dealtimer" class="card border-0 content-section form-style">
                    <div class="card-header">
                        <h3 class="card-title text-center">add timer</h3>
                    </div>
                    <div class="card-body">

                        <form id="add-time-deal" action="" method="post">
                            <input type="hidden" name="timerdeal"  id="timerdeal" />
                            <div class="mb-3">
                                <label for="endTime-deal" class="form-label">End Time:</label>
                                <input type="datetime-local" id="endTime-deal" name="endTime" class="form-control"  required />
                            </div>

                            <div class="d-flex justify-content-center ">
                                <button type="submit" class="update-btn col-md-12">Set End Time</button>
                            </div>

                        </form>


                    </div>
                </div>

                <!----------------------------  form edit the Deals--------------->
                <div id="editdealtimer" class="card border-0 content-section form-style">
                    <div class="card-header">
                        <h3 class="card-title text-center">Edit deal</h3>
                    </div>
                    <div class="card-body">

                        <form id="editdeal" action="" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="dealId"  id="dealId" />
                            <div class="mb-3">
                                <label for="name-deal" class="form-label">Name:</label>
                                <input type="text" id="name-deal" name="name" class="form-control" required />
                            </div>
                            <div class="mb-3">
                                <label for="description-deal" class="form-label">Description:</label>
                                <textarea id="description-deal" name="description" class="form-control" required>}</textarea>
                            </div>
                            <div class="mb-3">
                                <label for="old" class="form-label">Old Price:</label>
                                <input type="number" id="old" name="oldPrice" class="form-control"  step="0.01" required />
                            </div>
                            <div class="mb-3">
                                <label for="new" class="form-label">New Price:</label>
                                <input type="number" id="new" name="newPrice" class="form-control"  step="0.01" required />
                            </div>
                            <div class="mb-3">
                                <label for="imageFile" class="form-label">Image:</label>
                                <input type="file" id="imageFile" name="imageFile" class="form-control"  accept="image/*"  />
                            </div>

                            <div class="mb-3">
                                <label for="endTime-deal" class="form-label">End Time:</label>
                                <input type="datetime-local" id="endTime-deal" name="endTime" class="form-control"  required />
                            </div>

                            <div class="d-flex justify-content-center ">
                                <button type="submit" class="update-btn col-md-12">Upload</button>
                            </div>

                        </form>
                    </div>
                </div>

                <!----------------- -------- Table  comments--------------->

                <div id="all-comments" class="card border-0 content-section ">
                    <div class="card-header">
                        <h3 class="card-title text-center">Table comments</h3>
                    </div>
                    <div class="card-body">

                        <table class="table table-bordered">
                            <thead>
                            <tr>

                                <th class="text-center">ID</th>
                                <th class="text-center">Name</th>
                                <th class="text-center">Career</th>
                                <th class="text-center">Description</th>
                                <th class="text-center">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="comment" items="${comments}">
                                <tr>
                                    <td class="text-center">${comment.id}</td>
                                    <td class="text-center">${comment.name}</td>
                                    <td class="text-center">${comment.career}</td>

                                    <td class="text-center">
                                        <label>
                                            <textarea rows="3" cols="40" readonly style=" resize: none; border: none; overflow: hidden">${comment.description}</textarea>
                                        </label>
                                    </td>

                                    <td class="text-center">
                                        <button onclick="EditCommentForm(${comment.id}, '${comment.name}',
                                                ' ${comment.career}', '${comment.description}')" class="btn btn-primary p-2 me-4">
                                            <i class="fa-solid fa-pen-to-square "></i>
                                        </button>
                                        <button onclick="DeleteComment(${comment.id})" class="btn btn-danger p-2">
                                            <i class="fa-solid fa-trash"></i></button>
                                    </td>

                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-----------------  -------form edit comment--------------->
                <div id="edit-comment" class="card border-0 content-section form-style">
                    <div class="card-header">
                        <h3 class="card-title text-center">Edit comment</h3>
                    </div>
                    <div class="card-body">

                        <form  id="editcomment" action="" method="post">
                            <input type="hidden" name="id" id="comment-update"  />
                            <div class="mb-3">
                                <label  class="form-label">Name:</label>
                                <input type="text"  id="name-comment" name="name" class="form-control"  placeholder="Enter Name" required />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Description:</label>
                                <textarea  name="description" id="description-comment" class="form-control" placeholder="Enter Description" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Career:</label>
                                <input type="text"  name="career"  id="career-comment" class="form-control"  placeholder="Enter  Career" required />
                            </div>
                            <div class="d-flex justify-content-center ">
                                <button type="submit" class="update-btn col-md-12">Upload</button>
                            </div>
                        </form>

                    </div>
                </div>

                <!-----------------  -------form add comment--------------->
                <div id="add-comment" class="card border-0 content-section form-style">
                    <div class="card-header">
                        <h3 class="card-title text-center">Add comment</h3>
                    </div>
                    <div class="card-body">

                        <form action="${pageContext.request.contextPath}/save-comment" method="post">
                            <div class="mb-3">
                                <label  class="form-label">Name:</label>
                                <input type="text"  name="name" class="form-control"  placeholder="Enter Name" required />
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Description:</label>
                                <textarea  name="description" class="form-control" placeholder="Enter Description" required></textarea>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Career:</label>
                                <input type="text"  name="career" class="form-control"  placeholder="Enter  Career" required />
                            </div>
                            <div class="d-flex justify-content-center ">
                                <button type="submit" class="submit-btn col-md-12">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!----------------- -------- Table Ads --------------->
                <div id="all-ads" class="card border-0 content-section">
                    <div class="card-header">
                        <h3 class="card-title text-center">Table Ads</h3>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered">
                            <thead>
                            <tr>
                                <th class="text-center">ID</th>
                                <th class="text-center">Description</th>
                                <th class="text-center">Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="ads" items="${Ads}">
                                <tr>
                                    <td class="text-center">${ads.id}</td>
                                    <td class="text-center">
                                        <label>
                                            <textarea rows="3" cols="40" readonly style="resize: none; border: none; overflow: hidden">${ads.description}</textarea>
                                        </label>
                                    </td>
                                    <td class="text-center">
                                        <button onclick="editAdsForm(${ads.id},'${ads.description}')" class="btn btn-primary p-2 me-4">
                                            <i class="fa-solid fa-pen-to-square"></i>
                                        </button>
                                        <button onclick="DeleteAds(${ads.id})" class="btn btn-danger p-2">
                                            <i class="fa-solid fa-trash"></i>
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!----------------- ------- Form Edit Ads --------------->
                <div id="edit-ads" class="card border-0 content-section form-style" >
                    <div class="card-header">
                        <h3 class="card-title text-center">Edit Ads</h3>
                    </div>
                    <div class="card-body">
                        <form id="edit-ads-form" action="" method="post">
                            <input type="hidden" name="id" id="ads-update" />
                            <div class="mb-3">
                                <label class="form-label">Description:</label>
                                <textarea name="description" id="description-ads" class="form-control" placeholder="Enter the text of the  ads" required></textarea>
                            </div>
                            <div class="d-flex justify-content-center ">
                                <button type="submit" class="update-btn col-md-12">Upload</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!----------------- ------- Form Add Ads --------------->
                <div id="add-ads" class="card border-0 content-section form-style">
                    <div class="card-header">
                        <h3 class="card-title text-center">Add Ads</h3>
                    </div>
                    <div class="card-body">
                        <form action="/save-ads" method="post">
                            <div class="mb-3">
                                <label class="form-label">Description:</label>
                                <textarea name="description" class="form-control" placeholder="Enter ads" required></textarea>
                            </div>
                            <div class="d-flex justify-content-center">
                                <button type="submit" class="submit-btn col-md-12">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>







            </div>
        </main>
        <%--        <a href="#" class="theme-toggle"  onclick="toggleTheme();">--%>
        <%--            <i class="fa-regular fa-moon"></i>--%>
        <%--            <i class="fa-regular fa-sun"></i>--%>
        <%--        </a>--%>

    </div>
</div>
<script src="bootstrap/js/bootstrap.bundle.js"></script>
<script src="bootstrap/js/script.js"></script>
<script src="bootstrap/js/alert-sweet.js"></script>

</body>

</html>
