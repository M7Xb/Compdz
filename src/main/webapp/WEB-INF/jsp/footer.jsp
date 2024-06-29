
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<footer class="footer-section mt-2">
    <div class="container">
        <div class="footer-cta pt-5 pb-5">
            <div class="row">
                <div class="col-xl-4 col-md-4 mb-30">
                    <div class="single-cta">
                        <a href="https://maps.app.goo.gl/wnbtbdnhYDKwrAsQ9"><img src="bootstrap-icons-1.11.3/map-marker-multiple-svgrepo-com.svg"
                                        class="icons-footer-contact" ></a>
                        <div class="cta-text">
                            <h4>Find us</h4>
                            <span>skikda</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-md-4 mb-30">
                    <div class="single-cta">
                        <img src="bootstrap-icons-1.11.3/call-chat-svgrepo-com.svg" class="icons-footer-contact">
                        <div class="cta-text">
                            <h4 id="contact">Call us</h4>
                            <span>213122223334</span>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-md-4 mb-30">
                    <div class="single-cta">
                        <img src="bootstrap-icons-1.11.3/mail-svgrepo-com.svg" class="icons-footer-contact">
                        <div class="cta-text">
                            <h4>Mail us</h4>
                            <span>compdz.help@gmail.com</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-content pt-5 pb-5">
            <div class="row">
                <div class="col-xl-4 col-lg-4 mb-50">
                    <div class="footer-widget">

                        <div class="footer-text">
                            <p> <span class="fw-bold">CampsDz</span> : vise à fournir une plateforme moderne et accessible pour l'achat d'équipements de camping.</p>
                        </div>
                        <div class="footer-social-icon">
                            <span>Follow us</span>
                            <a href="#"><img src="bootstrap-icons-1.11.3/facebook-svgrepo-com.svg" class="social-media-icons" id="bg-face"></a>
                            <a href="#"><img src="bootstrap-icons-1.11.3/google-plus-svgrepo-com.svg" class="social-media-icons" id="bg-google"></a>
                            <a href="#"><img src="bootstrap-icons-1.11.3/tiktok-svgrepo-com.svg" class="social-media-icons" id="bg-tik"></a>

                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 mb-30">
                    <div class="footer-widget">
                        <div class="footer-widget-heading">
                            <h3>Useful Links</h3>
                        </div>
                        <ul>
                            <li><a href="home">Home</a></li>
                            <li><a href="product">Product</a></li>
                            <li><a href="contact">Contact</a></li>
                            <li><a href="blog">Our Blog</a></li>
                           
                        </ul>
                    </div>
                </div>
                <div class="col-xl-4 col-lg-4 col-md-6 mb-50">
                    <div class="footer-widget">
                        <div class="footer-widget-heading">
                            <h3>Subscribe</h3>
                        </div>
                        <div class="footer-text mb-25">
                            <p>Don’t miss to subscribe to our new feeds, kindly fill the form below.</p>
                        </div>
                        <div class="subscribe-form">
                            <!-- Update the form action to point to your Spring controller's endpoint -->
                            <form action="${pageContext.request.contextPath}/subscribe" method="POST" >
                                <input type="email" name="email" placeholder="Email Address" required>
                                <button type="submit"><img src="bootstrap-icons-1.11.3/telegram-svgrepo-com.svg" class="ooo" alt="telegram-icon"></button>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="copyright-area">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <div class="copyright-text">
                        <p>Copyright &copy; 2024, All Right Reserved By CampDz Admins.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</footer>