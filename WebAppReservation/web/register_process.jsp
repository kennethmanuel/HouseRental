
    <%
    try {
	com.servies.HouseRentalServices_Service service = new com.servies.HouseRentalServices_Service();
	com.servies.HouseRentalServices port = service.getHouseRentalServicesPort();
	 // TODO initialize WS operation arguments here
         
	java.lang.String username = request.getParameter("username");
	java.lang.String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
	java.lang.String nama = request.getParameter("fullname");
	java.lang.String noTelp = request.getParameter("notelp");
	// TODO process result here
        if(password.equals(repassword))
        {
            java.lang.Boolean result = port.register(username, password, nama, noTelp);
            if (result) 
            {
                    session.setAttribute("Register", "sukses");
                    response.sendRedirect("regis.jsp");
            }
            else
            {
                session.setAttribute("Register", "gagal");
                response.sendRedirect("regis.jsp");
            }
        }
        else
        {
            session.setAttribute("Register", "notmatch");
            response.sendRedirect("regis.jsp");
        }
    } 
        catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%><hr/>


