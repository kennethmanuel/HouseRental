
<%@page import="com.servies.Penyewa"%>
<%@page import="com.servies.Rumah"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Disprog Village</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
  </head>
  <body id="page-top">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
      <div class="container">
        <a class="navbar-brand" href="#page-top">Disprog Village</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars ms-1"></i>
        </button>    <%-- start web service invocation --%><hr/>
    <%
    try {
	
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>

        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav text-uppercase ms-auto py-4 py-lg-0">
            <li class="nav-item"><a class="nav-link" href="#portfolio">Products</a></li>
            <li class="nav-item"><a class="nav-link" href="#about">About</a></li>
            <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
            <% 
                if (session.getAttribute("username") == null) {
                    out.println("<li class='nav-item'><a class='nav-link' href='login.jsp'>Login</a></li>");
                     // TODO initialize WS operation arguments here
                    
                    // TODO process result here
                    
                    }
                else{
                    out.println("<li class='nav-item dropdown'>");
                    out.println("<a class='nav-link dropdown-toggle' href='#' id='navbarDropdownMenuLink' role='button' data-bs-toggle='dropdown' aria-expanded='false'>Hi," + session.getAttribute("username")+"</a>");
                    out.println("<ul class='dropdown-menu' aria-labelledby='navbarDropdownMenuLink'>");
                    out.println("<li><a class='dropdown-item' href='logout.jsp'>Logout</a></li>");
                    out.println("</ul>");
                    out.println("</li>");
                    java.lang.String username = session.getAttribute("username").toString();
                }
            %>
          </ul>
        </div>
      </div>
    </nav>
    <!-- Masthead-->
    <header class="masthead">
      <div class="container">
        <div class="masthead-subheading">Welcome To Our Village!</div>
        <div class="masthead-heading text-uppercase">It's Nice To Meet You</div>
        <a class="btn btn-primary btn-xl text-uppercase" href="#services">Tell Me More</a>
      </div>
    </header>

    <!-- Portfolio Grid-->
    <section class="page-section bg-light" id="portfolio">
      <div class="container">
        <div class="text-center">
          <h2 class="section-heading text-uppercase">Latest Products</h2>
        </div>
        <div class="row">

    <%
    try {
        com.servies.HouseRentalServices_Service service = new com.servies.HouseRentalServices_Service();
	com.servies.HouseRentalServices port = service.getHouseRentalServicesPort();
	// TODO process result here
	java.util.List<com.servies.Rumah> result = port.getRumah();
	// TODO process result here
        for (int i = 0; i < result.size(); i++) {
                out.println("<div class='col-lg-4 col-sm-6 mb-4'>");
                out.println("<div class='portfolio-item'>");
                out.println("<a class='portfolio-link' data-bs-toggle='modal' href='#portfolioModal"+ result.get(i).getId() + "'>");
                out.println("<div class='portfolio-hover'>");
                out.println("<div class='portfolio-hover-content'><i class='fas fa-plus fa-3x'></i></div>");
                out.println("</div>");
                out.println("<img class='img-fluid' src='assets/img/portfolio/"+ result.get(i).getFoto() +".jpg'/>");
                out.println("</a>");
                out.println("<div class='portfolio-caption'>");
                out.println("<div class='portfolio-caption-heading'>" + result.get(i).getNama() + "</div>");
                out.println("</div>");
                out.println("</div>");
                out.println("</div>");
            }
    } catch (Exception ex) {
	// TODO handle custom exceptions here
        out.println(ex);
    }
    %>
          <!-- end -->
        </div>
      </div>
    </section>
    <!-- About-->
    <section class="page-section" id="about">
      <div class="container">
        <div class="text-center">
          <h2 class="section-heading text-uppercase">About</h2>
          <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
        </div>
        <ul class="timeline">
          <li>
            <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/1.jpg" alt="..." /></div>
            <div class="timeline-panel">
              <div class="timeline-heading">
                <h4>2009-2011</h4>
                <h4 class="subheading">Our Humble Beginnings</h4>
              </div>
              <div class="timeline-body">
                <p class="text-muted">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!
                </p>
              </div>
            </div>
          </li>
          <li class="">
            <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/2.jpg" alt="..." /></div>
            <div class="timeline-panel">
              <div class="timeline-heading">
                <h4>March 2011</h4>
                <h4 class="subheading">An Agency is Born</h4>
              </div>
              <div class="timeline-body">
                <p class="text-muted">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!
                </p>
              </div>
            </div>
          </li>
          <li>
            <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/3.jpg" alt="..." /></div>
            <div class="timeline-panel">
              <div class="timeline-heading">
                <h4>December 2015</h4>
                <h4 class="subheading">Transition to Full Service</h4>
              </div>
              <div class="timeline-body">
                <p class="text-muted">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!
                </p>
              </div>
            </div>
          </li>
          <li class="timeline-inverted">
            <div class="timeline-image"><img class="rounded-circle img-fluid" src="assets/img/about/4.jpg" alt="..." /></div>
            <div class="timeline-panel">
              <div class="timeline-heading">
                <h4>July 2020</h4>
                <h4 class="subheading">Phase Two Expansion</h4>
              </div>
              <div class="timeline-body">
                <p class="text-muted">
                  Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!
                </p>
              </div>
            </div>
          </li>
          <li class="timeline-inverted">
            <div class="timeline-image">
              <h4>
                Be Part
                <br />
                Of Our
                <br />
                Story!
              </h4>
            </div>
          </li>
        </ul>
      </div>
    </section>

    <!-- Contact-->
    <section class="page-section" id="contact">
      <div class="container">
        <div class="text-center">
          <h2 class="section-heading text-uppercase">Contact Us</h2>
          <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
        </div>
        <!-- * * * * * * * * * * * * * * *-->
        <!-- * * SB Forms Contact Form * *-->
        <!-- * * * * * * * * * * * * * * *-->
        <!-- This form is pre-integrated with SB Forms.-->
        <!-- To make this form functional, sign up at-->
        <!-- https://startbootstrap.com/solution/contact-forms-->
        <!-- to get an API token!-->
        <form id="contactForm" data-sb-form-api-token="API_TOKEN">
          <div class="row align-items-stretch mb-5">
            <div class="col-md-6">
              <div class="form-group">
                <!-- Name input-->
                <input class="form-control" id="name" type="text" placeholder="Your Name *" data-sb-validations="required" />
                <div class="invalid-feedback" data-sb-feedback="name:required">A name is required.</div>
              </div>
              <div class="form-group">
                <!-- Email address input-->
                <input class="form-control" id="email" type="email" placeholder="Your Email *" data-sb-validations="required,email" />
                <div class="invalid-feedback" data-sb-feedback="email:required">An email is required.</div>
                <div class="invalid-feedback" data-sb-feedback="email:email">Email is not valid.</div>
              </div>
              <div class="form-group mb-md-0">
                <!-- Phone number input-->
                <input class="form-control" id="phone" type="tel" placeholder="Your Phone *" data-sb-validations="required" />
                <div class="invalid-feedback" data-sb-feedback="phone:required">A phone number is required.</div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="form-group form-group-textarea mb-md-0">
                <!-- Message input-->
                <textarea class="form-control" id="message" placeholder="Your Message *" data-sb-validations="required"></textarea>
                <div class="invalid-feedback" data-sb-feedback="message:required">A message is required.</div>
              </div>
            </div>
          </div>
          <!-- Submit success message-->
          <!---->
          <!-- This is what your users will see when the form-->
          <!-- has successfully submitted-->
          <div class="d-none" id="submitSuccessMessage">
            <div class="text-center text-white mb-3">
              <div class="fw-bolder">Form submission successful!</div>
              To activate this form, sign up at
              <br />
              <a href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
            </div>
          </div>
          <!-- Submit error message-->
          <!---->
          <!-- This is what your users will see when there is-->
          <!-- an error submitting the form-->
          <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
          <!-- Submit Button-->
          <div class="text-center"><button class="btn btn-primary btn-xl text-uppercase disabled" id="submitButton" type="submit">Send Message</button></div>
        </form>
      </div>
    </section>
    <!-- Footer-->
    <footer class="footer py-4">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-4 text-lg-start">Copyright &copy; Your Website 2021</div>
          <div class="col-lg-4 my-3 my-lg-0">
            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
            <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
          </div>
          <div class="col-lg-4 text-lg-end">
            <a class="link-dark text-decoration-none me-3" href="#!">Privacy Policy</a>
            <a class="link-dark text-decoration-none" href="#!">Terms of Use</a>
          </div>
        </div>
      </div>
    </footer>
    <!-- Portfolio Modals-->  
    <%
    try {
	com.servies.HouseRentalServices_Service service = new com.servies.HouseRentalServices_Service();
	com.servies.HouseRentalServices port = service.getHouseRentalServicesPort();
	// TODO process result here
	java.util.List<com.servies.Rumah> result = port.getRumah();
        
        Penyewa p = port.getPenyewa(session.getAttribute("username").toString());
        for (int i = 0; i < result.size(); i++) {
                out.println("<div class='portfolio-modal modal fade' id='portfolioModal"+ result.get(i).getId() +"' tabindex='-1' role='dialog' aria-hidden='true'>");
                out.println("<div class='modal-dialog'>");
                out.println("<div class='modal-content'>");
                out.println("<div class='close-modal' data-bs-dismiss='modal'><img src='assets/img/close-icon.svg' alt='Close modal' /></div>");
                out.println("<div class='container'>");
                out.println("<div class='row justify-content-center'>");
                out.println("<div class='col-lg-8'>");
                out.println("<div class='modal-body'>");
                out.println("<h2 class='text-uppercase'>"+result.get(i).getNama()+"</h2>");
                out.println("<img class='img-fluid d-block mx-auto' src='assets/img/portfolio/"+result.get(i).getFoto()+".jpg'/>");
                out.println("<ul class='list-inline'>");
                out.println("<li><strong>Bedrooms : </strong>"+result.get(i).getKamar()+" bedrooms</li>");
                out.println("<li><strong>Facility : </strong>"+result.get(i).getFasilitas()+"</li>");
                out.println("<li><strong>Price : </strong>"+result.get(i).getHarga()+" $/night</li>");
                out.println("</ul>");
                out.println("<a href='book.jsp?idrumah="+ result.get(i).getId() +"&idpenyewa="+p.getId()+"' class='btn btn-primary btn-xl text-uppercase'> Book Now! </a>");
                out.println("</div></div></div></div></div></div></div>");
            }
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>

    
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
  </body>
</html>
