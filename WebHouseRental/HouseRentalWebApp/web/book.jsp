<%@page import="java.time.format.DateTimeFormatterBuilder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.YearMonth"%>
<%@page import="java.time.Clock"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.time.Month"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.*" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous" />

    <!-- my css -->
    <link rel="stylesheet" href="css/css.css" />
    <title>Hello, world!</title>
  </head    
    <%-- start web service invocation --%><hr/>
    <%
	com.ubaya.houserental.HouseRentalWebService_Service service = new com.ubaya.houserental.HouseRentalWebService_Service();
	com.ubaya.houserental.HouseRentalWebService port = service.getHouseRentalWebServicePort();
	 // TODO initialize WS operation arguments here
	
	// TODO process result here
	
    
	
        LocalDate today = LocalDate.now();
        String ym;
        YearMonth yem = YearMonth.of(2021, 1);
        if (session.getAttribute("username") == null) {
             response.sendRedirect("login.html");
            }
        int idrumah =0;
        if (request.getParameterMap().containsKey("idrumah")) {
                idrumah = Integer.valueOf(request.getParameter("idrumah"));
            }
        else{
            response.sendRedirect("index.html");
        }
        if (request.getParameterMap().containsKey("ym")) 
        {
          String[] yearmonth = request.getParameter("ym").split("-");
          int year = Integer.parseInt(yearmonth[0]);
          int month = Integer.parseInt(yearmonth[1]);
          yem = YearMonth.of(year, month);
        }
        else
        {
          yem = YearMonth.now();
        }
        ym = yem.toString();
        java.util.List<java.lang.String> result = port.getTanggalSewaPerBulan(ym, idrumah);
        int totalDate = yem.lengthOfMonth();
        ArrayList<String> weeks = new ArrayList<String>();
        String week="";
        int str = yem.atDay(1).getDayOfWeek().getValue();
        String prev = yem.minusMonths(1).toString();
        String next = yem.plusMonths(1).toString();
        for (int i = 0; i < str-1; i++) {
                week += "<td></td>";
            }
        for (int day = 1; day <= totalDate; day++, str++) 
        {
            String date = ym + "-"+day;
            if (day <= result.size()) {
                week += "<td class ='bg-danger'>";
            }
            else if (today.toString().equals(date)) 
            {
                week += "<td class ='available bg-primary cursor-pointer'>";
            }
            else
            {
                week += "<td class='available bg-success cursor-pointer'>";
            }
            week+= day+"</td>";
            
            if (str % 7 == 0 || day == totalDate) 
            {
                if (day == totalDate && str % 7 != 0) 
                {
                    for (int i = 0; i < (7 - (str % 7)) ; i++) {
                        week += "<td></td>";  
                    }
                }
                weeks.add("<tr>" + week+"</tr>");
                week = "";
            }
        }
      
  %>
  <body class="d-flex flex-column align-items-center bg-body bg-gradient-light">
    <div class="container">
      <ul class="list-inline text-center">
        <li class="list-inline-item"><a class="btn btn-link" href="?ym=<%=prev%>">Prev</a></li>
        <li class="list-inline-item fw-bold title fs-3"><%= ym %></li>
        <li class="list-inline-item"><a class="btn btn-link" href="?ym=<%=next%>">Next</a></li>
      </ul>
      <p class="text-center fw-bold fs-3">Choose your day</p>
      <div class="row">
      <div class="col-md-2 d-flex align-items-center">
        <div class="d-flex flex-column" role="group">
          <button type="button" class="btn btn-danger mb-5">Not Available</button>
          <button type="button" class="btn btn-warning mb-5">Your Choose</button>
          <button type="button" class="btn btn-success mb-5">Available</button>
          <button type="button" class="btn btn-info mb-5" id="btnreset">Reset</button>
        </div>
      </div>
      <div class="col-md-10">
          <table class="table table-bordered shadow p-3 mb-5 bg-body rounded">
            <thead>
              <tr>
                <th>M</th>
                <th>T</th>
                <th>W</th>
                <th>T</th>
                <th>F</th>
                <th>S</th>
                <th>S</th>
              </tr>
            </thead>
            <tbody>
                <%
                    for (int i = 0; i < weeks.size(); i++) {
                            out.println(weeks.get(i));
                        }
                %>
            </tbody>
          </table>
        </div>
      
      </div>
      <div class="row">
        <div class="col-md-6 p-2">
          <p class="fs-1 text-primary text-start">Total Order : Rp 0</p>
        </div>
        <div class="col-md-6 p-2">
          <p class="fs-1 text-primary text-start">Book schdeule :</p>
        </div>
      </div>
      <div class="d-grid gap-2">
        <button class="btn btn-primary mb-3" type="button">Order Now!</button>
      </div>
    </div>

    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <%-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous">
    </script> --%>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js" integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT" crossorigin="anonymous"></script>
    -->
    <script src="js/skrip.js">
    </script>
  </body>
</html>
