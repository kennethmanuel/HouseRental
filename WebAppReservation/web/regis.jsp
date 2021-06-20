<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous" />
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/css.css" />
    <title>Hello, world!</title>
  </head>
  <body class="bg-gradient-warning d-flex align-items-center">
    <div class="container-fluid row justify-content-center">
      <div class="card o-hidden border-0 shadow-lg my-5 col-lg-6">
        <div class="card-body p-0">
          <!-- Nested Row within Card Body -->
          <div class="row">
            <div class="col-md">
              <div class="p-5">
                <div class="text-center">
                  <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                </div>
                <form class="user" method="POST" action="register_process.jsp">
                    <% 
                        if (session.getAttribute("Register") != null) 
                        {
                            String status = session.getAttribute("Register").toString();
                            if (status.equals("sukses")) 
                            {
                                out.println("<div class='alert alert-success' role='alert'>Registration Success!<a href='login.jsp' class='alert-link'>Login Now!</a></div>");
                            }
                            else if (status.equals("gagal"))
                            {
                                out.println("<div class='alert alert-danger' role='alert'>Registation Failed!</div>");
                            }
                            else if(status.equals("notMatch"))
                            {
                                out.println("<div class='alert alert-danger' role='alert'>Please enter the password correctly!</div>");
                            }
                        }
                    %>
                  
                  
                  
                  <div class="form-group">
                    <input type="text" class="form-control form-control-user" name="fullname" placeholder="Full Name" />
                  </div>
                  <div class="form-group">
                    <input type="text" class="form-control form-control-user" name="username" placeholder="Username" />
                  </div>
                  <div class="form-group">
                    <input type="number" class="form-control form-control-user" name="notelp" placeholder="Phone Number" />
                  </div>
                  <div class="form-group row">
                    <div class="col-sm-6 mb-3 mb-sm-0">
                      <input type="password" class="form-control form-control-user" name="password" placeholder="Password" />
                    </div>
                    <div class="col-sm-6">
                      <input type="password" class="form-control form-control-user" name="repassword" placeholder="Repeat Password" />
                    </div>
                  </div>
                  <input type="submit" name="btnregis" class="btn btn-success btn-user btn-block" value="Register Now!" />
                </form>
                <div class="text-center mt-md-5">
                  <a class="small" href="login.jsp">Already have an account? Login!</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Modal -->

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
    <script src="js/jquery.js"></script>
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    -->
  </body>
</html>
