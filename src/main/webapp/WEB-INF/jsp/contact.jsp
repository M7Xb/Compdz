<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="bootstrap-icons-1.11.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/contact.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>

    <title>Contact</title>
</head>
<jsp:include page="navbar.jsp" />

<body>
<!-- Info Alert -->
<div class="alert alert-warning border-3 mt-3" role="alert" style="width: 80%; margin: 0 auto;">
    <h4 class="alert-heading text-center">Note!</h4>
    <hr>
    <p class="mb-0 text-center">In this form you can ask any question you need to, and you can send your image
        accompanying our products to be featured on the blog page.</p>
</div>

<!-- Contact Form Section -->
<section class="ftco-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="wrapper">
                    <div class="row no-gutters container-contact">
                        <div class="col-lg-8 col-md-7 order-md-last d-flex align-items-stretch">
                            <div class="contact-wrap w-100 p-md-4 p-4">
                                <h1 class="mb-4 text-center">Contact Us</h1>
                                <form id="contactForm" name="contactForm" class="contactForm" action="${pageContext.request.contextPath}/sendMail"
                                      method="post" enctype="multipart/form-data">
                                    <div class="row">
                                        <div class="col-md-6 pb-3">
                                            <div class="form-group">
                                                <label for="fullName">Full Name</label>
                                                <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Name" required />
                                            </div>
                                        </div>
                                        <div class="col-md-6 pb-3">
                                            <div class="form-group">
                                                <label for="userEmail">Email Address</label>
                                                <input type="email" class="form-control" id="userEmail" name="userEmail" placeholder="Email" required />
                                            </div>
                                        </div>
                                        <div class="col-md-12 pb-3">
                                            <div class="form-group">
                                                <label for="subject">Subject</label>
                                                <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject" required />
                                            </div>
                                        </div>
                                        <div class="col-md-12 pb-3">
                                            <div class="form-group">
                                                <label for="message">Message</label>
                                                <textarea class="form-control" id="message" name="message" cols="30" rows="4" placeholder="Message" required></textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-12 pb-3">
                                            <div class="form-group">
                                                <label for="imageFile">Image (optional)</label>
                                                <input type="file" class="form-control p-2" id="imageFile" name="imageFile" />
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-contact">Send Message</button>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-5 d-flex align-items-stretch fuild-left-con">
                            <div class="info-wrap w-100 p-md-5 p-4 left-con">
                                <img src="images/contact.png" alt="Contact Image" class="img-fluid mt-5">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

        <!---------------------- Alert Modal ----------------------->
<div class="modal fade" id="formoo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content py-md-5 px-md-4 p-sm-3 p-4 text-center">
            <h2>Message Sent</h2>
            <img src="bootstrap-icons-1.11.3/verify-1.svg" width="40" alt="sent">
            <p class="px-md-5 px-sm-1">Your message is sent directly to our email.</p>
            <div class="text-center mb-3">
                <a href="home"><button class="btn btn-go-home">Go Home</button></a>
            </div>
            <a class="link-cancel" href="contact">Return</a>
        </div>
    </div>
</div>


<script>
    $(document).ready(function() {

        const message = '<%= request.getAttribute("message") %>';
        if (message && message !== "") {
            $('#formoo').modal('show');
        }
    });
</script>

</body>
<script src="bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="bootstrap/js/jquery.js"></script>
<jsp:include page="footer.jsp" />
</html>
